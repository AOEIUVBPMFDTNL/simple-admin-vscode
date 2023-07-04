# simple-admin-vscode
因为作者将 core ui 以及其他几个模块都放在了单独的仓库中，使用起来很不方便，因此创建了这个仓库。

此项目的目标很简单，通过脚本一键拉取分布在不同仓库的官方项目放入一个工作区，并通过vscode的工作区功能进行项目管理，后端则是通过用go work直接管理项目模块。

## 项目初始化
``` shell
./init.sh
```
## 执行结果
```
./init.sh
.
├── dev
│   ├── core
│   ├── file-api
│   ├── job-rpc
│   ├── member-api
│   └── member-rpc
└── web
    ├── apps
    ├── deploy
    ├── internal
    ├── mock
    ├── packages
    ├── public
    ├── src
    └── types

15 directories
```
