# [X-CMD](https://x-cmd.com/zh)

在云上 施展 弹指神通 ～

现在仍处于内测阶段: v0.1.0 版本

## Install

使用curl安装:

```bash
eval "$(curl https://get.x-cmd.com)"
```

使用wget安装:

```bash
eval "$(wget -O- https://get.x-cmd.com)"
```

## 应用模块列表

| 模块 | 功能 | 类似项目 |
| --- | --- | --- |
| theme | 设置shell的主题  | oh-my-zsh/oh-my-bash |
| tldr | 可浏览命令的使用案例  | tldr客户端工具 |
| proxy | 快速配置apt,pip,npm等下载源 | 未知 |
| z/uz | 根据后缀实现多种格式的压缩和解压  | 未知 |
| pick | 交互式选择 | [percol](https://github.com/mooz/percol) 与 [pick](https://github.com/wong2/pick) |
| gh | github交互客户端  | 官方的go版gh |
| gt | gitee交互客户端 | ? |
| ws | 项目脚本管理 | ? |
| env | 安装脚本运行/开发环境  | asdf/nvm/sdkman/pyenv/rbenv/... |
| hub | 脚本发布服务 | ? |

## 封装模块列表

| 模块 | 封装目标 | 功能 |
| -- | -- | -- |
| ssl/openssl | openssl | 安全密码学工具 |
| p7zip | 7zip | 加解压工具 |
| ff | ffmpeg | 音视频工具工具 |
| pandoc | pandoc | 文档格式转换工具 |
| nmap | nmap | 安全扫描工具 |
| fd | fd | find的高效替代 |
| grep | ag | grep的高效替代 |
| smartmontools | smartmontools | 硬盘监控工具 |
| bat | bat | cat的rust实现 |
| jq/yq | jq/yq | json/yml处理 |


## 介绍

1. 可在主流posix shell(bash/zsh/dash/ash，更多将在后续支持)系统环境下(即便在非scratch轻量容器镜像内，如busybox，alpine等镜像)，一键运行托管脚本
2. 可安装主流开发语言运行时（现支持node，python，java等等），在此之上，可让用户在装有x环境下的环境上一键运行托管脚本
3. 增强posix shell的用户体验：主题，路径快速跳转，后面会加入更好的shell智能补全和提示功能
4. 提供一系列的交互式cli工具（github, gitee，更多的工具模块将在最近半年发布）
5. 极轻极快: 安装包体积小于500KB，里面已经包括上述的功能模块
