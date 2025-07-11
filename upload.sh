#!/bin/bash

echo "Upload script start to execute ..."

SCRIPT_DIR="$(dirname "$(realpath "$0")")"

if [[ -n "$(git status --porcelain)" ]]; then
    echo "有文件变化（修改、新增或删除）"
else
    echo "没有文件变化"
    exit 0
fi


$SCRIPT_DIR/config/file_list.sh

WORKDIR=$(pwd)

echo "WORKDIR = $WORKDIR"

REMOTE_URL=$(git remote get-url origin)

echo "REMOTE_URL = $REMOTE_URL"

echo "WEB_PAGE = https://padsdk.github.io"

BRANCH=$(git branch)

echo "BRANCH = $BRANCH"

git status --porcelain

git add .

git commit -m "1. upload maven files"

echo "push $BRANCH -> $REMOTE_URL"

git push -u origin HEAD

echo "Upload script execute over ..."