# @taruri-plugin-mips/dockerfile

存放了多个 dockerfile 在这里我们编译出了**可能**适合大部分的 项目 的 dockerfile

## 环境

- 确保机器安装了 docker
- 确保机器 CPU 架构是 x86_64

## 使用

### install.sh

在检查机器环境后，可以运行 `install.sh` 将 dockerfile 编译成 docker 镜像

```bash
./install.sh
```

### start.sh

在编译完成后，可以运行 `start.sh` 启动 docker 镜像

```bash
./start.sh
```
