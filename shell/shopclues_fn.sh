#!/bin/bash

ICON_SUCCESS="\uf00c"
ICON_FAILED="\uf00d"

BLINK_START="\e[5m"
BLINK_END="\e[25m"

function goto() {
    expect -f $HOME/bin/ssh_connect.exp $1
}

function rmcartcache() {
    rm -f var/compiled/admin/*
    chmod -R 777 var/compiled/admin
}

function cpicon() {
    echo -ne "\u$1" | xclip -selection clipboard
}

function check_conflict() {
    cd /var/www/html/la.shopclues.com
    BRANCH=$(get_current_svn_branch)
    svn merge --dry-run -r $1:$2 $BRANCH 2> /tmp/conflict
    cd -
    cat /tmp/conflict
}

function get_current_svn_branch() {
    svn info | grep URL | head -1 | cut -d " " -f 2
}

function get_commit_files() {
    filelist=""
    for f in $(svn st | cut -d " " -f8 | tr '\n' ' '); do
        [ $f = "config.local.php" ] && continue
        [ $f = ".htaccess" ] && continue
        [ $f = ".idea" ] && continue

        if [[ $1 = "commit" ]]; then
            filelist="$filelist\n$f"
        else
            filelist="$filelist $f"
        fi
    done
    echo $filelist
}

function commit_check() {
    check_phpse
}

function check_phpse() {
    for f in $(svn st | grep php | cut -d " " -f8 | tr '\n' ' '); do
        [ $f = "config.local.php" ] && continue
        php -l $f
    done
}

function commit_mdiff() {
    if [ -z "$1" ]; then
        echo "TODOS: \n"
        svn diff | rg -Hn "TODO"
        if [ $? -eq 0 ]; then
            echo -ne "${IRed} ${ICON_FAILED} ${BLINK_START}TODOs are left${BLINK_END}${RColor}"
            return 1
        fi

        echo "FIXME: \n"
        svn diff | rg -Hn "FIXME"
        if [ $? -eq 0 ]; then
            echo "\n${IRed} ${ICON_FAILED} ${BLINK_START}FIXMEs are left${BLINK_END}${RColor}"
            return 1
        fi

        echo "Dump/Die/PrintR: \n"
        svn diff | rg -Hn "var_dump|die|print_r"
        if [ $? -eq 0 ]; then
            echo "\n${IRed}${ICON_FAILED} ${BLINK_START}Please remove all dump, print_r and dies${BLINK_END}${RColor}"
            return 1
        fi
    else
        echo "skipping commit checks..."
    fi

    for f in $(svn st | cut -d " " -f8 | tr '\n' ' '); do
        [ $f = "config.local.php" ] && continue
        [ $f = "db_connection.php" ] && continue
        [ $f = "init.php" ] && continue
        [ $f = "fusion_prepare.php" ] && continue
        [ $f = "amqplib/clues/config.php" ] && continue
        [ $f = ".htaccess" ] && continue
        [ $f = ".idea" ] && continue
        php -l $f
        if [ $? -ne 0 ]; then
            echo "\n${IRed}${ICON_FAILED} ${BLINK_START}Syntax error detected${BLINK_END} in $f. Exiting...\n${RColor}"
            return 1
        fi
        svn diff --diff-cmd=meld $f
    done

    echo -ne "\nDone...${IGreen}${ICON_SUCCESS}${RColor}\n"
}

function commit_cdiff() {
    echo "TODOS: \n"
    svn diff | rg -n "TODO"
    if [ $? -eq 0 ]; then
        echo "TODOs are left"
        return 1
    fi

    echo "FIXME: \n"
    svn diff | rg -n "FIXME"
    if [ $? -eq 0 ]; then
        echo "\n${Red}FIXMEs are left${RColor}"
        return 1
    fi

    for f in $(svn st | cut -d " " -f8 | tr '\n' ' '); do
        [ $f = "config.local.php" ] && continue
        [ $f = "amqplib/clues/config.php" ] && continue
        [ $f = ".htaccess" ] && continue
        [ $f = ".idea" ] && continue
        php -l $f
        if [ $? -ne 0 ]; then
            echo "\n${Red}Syntax error detected in $f. Exiting...\n${RColor}"
            return 1
        fi
        svn diff $f
    done
}

function cmake_clean() {
    rm -rf CMakeFiles CMakeCache.txt cmake_install.cmake Makefile lib bin $*
}

# Load Neovim config easily
function nvconf() {
    nvim $HOME/.config/nvim/init.vim
}

# Load vim config
function vconf() {
    vim $HOME/.vimrc
}

function listmemc() {
    for i in `seq 10`; do echo "stats cachedump $i 0" | nc localhost 11211; done
}

function getmemkey() {
    echo "get $*" | nc 192.168.8.38 11211
}

function initpants() {
    mkdir $1
    cd $1
    curl -L -O https://pantsbuild.github.io/setup/pants
    chmod +x pants
    touch pants.ini
    # echo "[GLOBAL]" >> pants.ini
    # echo "pants_version: "$(./pants -V) >> pants.ini
    pants_version=$(./pants -V)
    cat <<EOT >> pants.ini
[GLOBAL]
pants_version: $pants_version

plugins: [
    'pantsbuild.pants.contrib.go==%(pants_version)s'
  ]

[buildgen.go]
# We always want buildgen to materialize BUILD files on disk as well as
# handle seeding remotes when new ones are encountered.
# We also never want to allow FLOATING revs, they should be pinned right away.
materialize: True
remote: True
fail_floating: True
EOT
    mkdir -p src/{go/src/hello,python/src/world}
    mkdir -p 3rdparty/{go,python}
    touch 3rdparty/python/{BUILD,requirements.txt}
    echo "python_requirements()" >> 3rdparty/python/BUILD
	echo "flask==0.12.0" >> 3rdparty/python/requirements.txt

    cat <<EOT > src/python/src/world/main.py
from flask import Flask


app = Flask(__name__)

@app.route("/")
def home():
    """
    Home Route
    """
    return "Welcome to Flask app"

if __name__ == "__main__":
    app.run(debug=True)
EOT

    cat <<EOT > src/python/src/world/BUILD
python_binary(
    name="world",
    source='main.py',
    dependencies=[
        '3rdparty/python:flask'
    ],
)
EOT

    cat <<EOT > src/go/src/hello/main.go
package main

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

// HomeHandler handles the incoming requests to home route
func HomeHandler(resp http.ResponseWriter, req *http.Request) {
	resp.Write([]byte("Welcome to Golang From Twitter's Pants Build System"))
}

func main() {
	rtr := mux.NewRouter()
	rtr.HandleFunc("/", HomeHandler)

	log.Fatal(http.ListenAndServe(":8080", rtr))
}
EOT

    echo "go_binary()" > src/go/src/hello/BUILD
}

function myip() {
    echo $(ip add show $1 | grep inet | grep $1 | cut -d " " -f6 | cut -d "/" -f1)
}

function pfsize() {
    echo "Name,Size"
    for d in $(/bin/ls -1Ad */); do
        # Add escape for spaces (converts " " to "\ ")
        d=$(echo $d | awk '{gsub(/ /,"\\ ")}8')
        # Get size of directory
        size=$(du -sch $d 2> /dev/null | head -1 | tr "\t" "," | cut -d "," -f1)
        echo "\"$d\",\"$size\""
    done
}

function prompt_svn_branch {
    if [ -d $PWD/.svn ]; then
        echo $(svn info | grep "URL: http" | cut -d "/" -f5)
    fi
}
