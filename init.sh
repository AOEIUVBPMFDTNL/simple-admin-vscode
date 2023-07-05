#!/usr/bin/env bash

# 初始化脚本
# 自动拉取前后端以及作者提供的官方模块
rm -rf web
rm -rf dev

begin=$(date +%s)
echo "正在下载 simple-admin-backend-ui..."
git clone https://github.com/suyuan32/simple-admin-backend-ui.git
mv simple-admin-backend-ui web
echo "下载 simple-admin-backend-ui -> web 耗时$[$(date +%s) - $begin]秒"

mkdir dev
cd dev
go work init
echo "使用 Go work 创建工作区管理多模块依赖"

begin=$(date +%s)
echo "正在下载 simple-admin-core..."
git clone https://github.com/suyuan32/simple-admin-core.git
echo "下载 simple-admin-core -> dev/core 耗时$[$(date +%s) - $begin]秒"
mv simple-admin-core core
go work use core
cd core
go mod tidy
cd ..

begin=$(date +%s)
echo "正在下载 simple-admin-job..."
git clone https://github.com/suyuan32/simple-admin-job.git
echo "下载 simple-admin-job -> dev/job-rpc 耗时$[$(date +%s) - $begin]秒"
mv simple-admin-job job-rpc
go work use job-rpc
cd job-rpc
go mod tidy
cd ..

begin=$(date +%s)
echo "正在下载 simple-admin-file..."
git clone https://github.com/suyuan32/simple-admin-file.git
echo "下载 simple-admin-file -> dev/file-api 耗时$[$(date +%s) - $begin]秒"
mv simple-admin-file file-api
go work use file-api
cd file-api
go mod tidy
cd ..

begin=$(date +%s)
echo "正在下载 simple-admin-member-rpc..."
git clone https://github.com/suyuan32/simple-admin-member-rpc.git
echo "下载 simple-admin-member-rpc -> dev/member-rpc 耗时$[$(date +%s) - $begin]秒"
mv simple-admin-member-rpc member-rpc
go work use member-rpc
cd member-rpc
go mod tidy
cd ..

begin=$(date +%s)
echo "正在下载 simple-admin-member-api..."
git clone https://github.com/suyuan32/simple-admin-member-api.git
echo "下载 simple-admin-member-api -> dev/member-api 耗时$[$(date +%s) - $begin]秒"
mv simple-admin-member-api member-api
go work use member-api
cd member-api
go mod tidy
cd ../..
tree -d -L 2
