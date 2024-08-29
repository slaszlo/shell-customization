#!/usr/bin/env bash

function s_terminal() {
    tmux attach -t Terminal || \
    tmux new -s Terminal
}