#!/bin/bash

# 清理脚本

echo "Cleaning build artifacts and temporary files..."

# 清理构建目录
if [ -d "../build" ]; then
    echo "Removing build directory..."
    rm -rf ../build
fi

# 清理openlist-lib目录
if [ -d "../openlist-lib" ]; then
    echo "Removing openlist-lib directory..."
    rm -rf ../openlist-lib
fi

# 清理临时文件
if [ -d "./openlist-src" ]; then
    echo "Removing temporary source directory..."
    rm -rf ./openlist-src
fi

echo "Clean completed!"
