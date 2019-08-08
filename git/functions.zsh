#!/bin/sh

# Current branch name
gbn() {
    git rev-parse --abbrev-ref HEAD
}
