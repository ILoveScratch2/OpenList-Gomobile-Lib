#!/bin/bash

# 编译OpenList脚本

set -e

echo "Building OpenList..."

# 进入openlist-lib目录
cd ../openlist-lib

# 检查是否存在go.mod文件
if [ ! -f "go.mod" ]; then
    echo "Error: go.mod not found. Please run init_openlist.sh first."
    exit 1
fi

# 设置Go环境变量
export CGO_ENABLED=1
export GOOS=linux

# 创建构建输出目录
mkdir -p ../build

# 编译主程序
echo "Building main binary..."
go build -o ../build/openlist ./cmd/openlist

# 编译库文件（如果存在）
if [ -d "internal" ]; then
    echo "Building library..."
    go build -buildmode=c-archive -o ../build/libopenlist.a ./internal
fi

# 复制必要的文件
echo "Copying necessary files..."
if [ -f "README.md" ]; then
    cp README.md ../build/
fi

if [ -f "LICENSE" ]; then
    cp LICENSE ../build/
fi

# 创建版本信息文件
echo "Creating version info..."
VERSION=$(git describe --tags --always 2>/dev/null || echo "unknown")
echo "$VERSION" > ../build/VERSION

echo "Build completed successfully!"
echo "Output directory: ../build"
ls -la ../build/
