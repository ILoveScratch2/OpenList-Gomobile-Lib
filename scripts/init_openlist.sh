#!/bin/bash

# 下载OpenList源码脚本
# 参考OpenListFlutter的实现

GIT_REPO="https://github.com/OpenListTeam/OpenList.git"

# 获取最新标签版本
TAG_NAME=$(git -c 'versionsort.suffix=-' ls-remote --exit-code --refs --sort='version:refname' --tags $GIT_REPO | tail --lines=1 | cut --delimiter='/' --fields=3)

echo "OpenList - ${TAG_NAME}"

# 清理旧的源码目录
rm -rf ./openlist-src
unset GIT_WORK_TREE

# 克隆指定版本的源码
git clone --branch "$TAG_NAME" https://github.com/OpenListTeam/OpenList.git ./openlist-src
rm -rf ./openlist-src/.git

# 移动源码到openlist-lib目录
mkdir -p ../openlist-lib
rm -rf ../openlist-lib/*
mv -f ./openlist-src/* ../openlist-lib/
rm -rf ./openlist-src

# 进入openlist-lib目录进行必要的配置
cd ../openlist-lib

# 修复依赖问题（参考OpenListFlutter的做法）
if [ -f "go.mod" ]; then
    go mod edit -replace github.com/djherbis/times@v1.6.0=github.com/jing332/times@latest
    go mod tidy
fi

echo "OpenList source code downloaded and configured successfully: ${TAG_NAME}"
