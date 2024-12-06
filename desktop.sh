#!/bin/bash

# 更新和升级系统
echo "Updating and upgrading the system..."
sudo apt-get update
sudo apt-get upgrade -y

# 安装桌面环境和必要软件
echo "Installing ubuntu-desktop and related tools..."
sudo apt-get install ubuntu-desktop -y
sudo apt install gnome-software -y
sudo apt-get install xrdp htop -y

# 删除烦人的颜色设备提示
echo "Removing color policy to avoid frequent password prompts..."
sudo rm -f /usr/share/polkit-1/actions/org.freedesktop.color.policy

# 添加用户并自动设置密码
echo "Creating a new user 'remote'..."

# 用户名
USERNAME="remote"
# 自动生成强密码（可自定义）
PASSWORD="se7ye9l6#6hLP912x"

# 使用 --gecos "" 跳过额外提示
sudo adduser --gecos "" --disabled-password $USERNAME

# 设置用户密码
echo "$USERNAME:$PASSWORD" | sudo chpasswd

# 将用户添加到 sudo 和 adm 组
echo "Adding $USERNAME to sudo and adm groups..."
sudo usermod -aG sudo,adm $USERNAME

# 提示密码
echo "User '$USERNAME' created successfully!"
echo "Password for '$USERNAME': $PASSWORD"

# 重启系统
echo "System will reboot now to apply changes..."
sudo reboot