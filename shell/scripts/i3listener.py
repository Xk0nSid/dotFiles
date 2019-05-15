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


def window_ws_notify(i3, event):
    if event.change in ["title", "focus"]:
        call('polybar-msg hook wshook 1'.split())


def ws_notify(i3, event):
    if event.change == "focus":
        if event.old.num != -1:
            call('polybar-msg hook wshook 1'.split())


if __name__ == "__main__":
    i3 = Connection()
    i3.on('window', window_ws_notify)
    i3.on('workspace', window_ws_notify)
    i3.main()
