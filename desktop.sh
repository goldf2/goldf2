#!/bin/bash

# 更新系统包索引
echo "正在更新系统包索引..."
sudo apt-get update

# 升级系统包
echo "正在升级系统包..."
sudo apt-get upgrade -y

# 安装 Ubuntu 桌面环境
echo "正在安装 Ubuntu 桌面环境..."
sudo apt-get install -y ubuntu-desktop 

# 安装 GNOME 软件
echo "正在安装 GNOME 软件..."
sudo apt install -y gnome-software 

# 安装 xrdp 和 Htop
echo "正在安装 xrdp 和 Htop..."
sudo apt-get install -y xrdp htop

# 删除无用的 PolicyKit 文件
echo "正在删除不需要的 PolicyKit 文件..."
sudo rm -f /usr/share/polkit-1/actions/org.freedesktop.color.policy

# 添加用户组
echo "正在添加用户组..."
sudo adduser remote
sudo usermod -aG sudo,adm remote

# 重启系统提示
echo "配置完成，系统将在 10 秒后重启..."
sleep 10
sudo reboot