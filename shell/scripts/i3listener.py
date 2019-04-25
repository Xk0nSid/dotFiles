#!/usr/bin/env python3

from i3ipc import Connection
from subprocess import call


def window_notify(i3, event):
    if event.container.fullscreen_mode == 0:
        call ('polybar-msg cmd show'.split())
    else:
        call ('polybar-msg cmd hide'.split())

    if event.change in ["focus", "title"]:
        call("polybar-msg hook titlehook 1".split(" "))


if __name__ == "__main__":
    i3 = Connection()
    i3.on('window', window_notify)
    i3.main()
