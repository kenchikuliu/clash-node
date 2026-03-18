# 安装测试指南

## 测试一键安装

在一个**全新的 Ubuntu 系统**上测试：

```bash
# 1. 一键安装
curl -fsSL https://raw.githubusercontent.com/kenchikuliu/clash-node/master/install.sh | bash

# 2. 验证安装
clash-node --version || clash-node help

# 3. 配置 Clash（如果还没有）
mkdir -p ~/.config/clash
curl -fsSL https://raw.githubusercontent.com/kenchikuliu/clash-node/master/config.example.yaml -o ~/.config/clash/config.yaml
nano ~/.config/clash/config.yaml  # 填入真实节点信息

# 4. 测试功能
clash-node list
clash-node 1
clash-node test
clash-node best
```

## 测试手动安装

```bash
# 1. 安装依赖
sudo apt update
sudo apt install -y python3 python3-pip
pip3 install requests pyyaml

# 2. 下载脚本
mkdir -p ~/bin
curl -fsSL https://raw.githubusercontent.com/kenchikuliu/clash-node/master/clash-node -o ~/bin/clash-node
chmod +x ~/bin/clash-node

# 3. 配置 PATH
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

# 4. 验证
clash-node help
```

## 预期结果

### 安装成功标志
- ✅ `clash-node help` 显示帮助信息
- ✅ `clash-node list` 列出节点（需要先配置 Clash）
- ✅ 所有命令正常工作

### 常见问题

**问题 1**: `clash-node: command not found`
- 解决: 确保 `~/bin` 在 PATH 中
  ```bash
  echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
  source ~/.bashrc
  ```

**问题 2**: `ModuleNotFoundError: No module named 'requests'`
- 解决: 安装 Python 依赖
  ```bash
  pip3 install requests pyyaml
  ```

**问题 3**: `无法连接 Clash API`
- 解决: 确保 Clash 服务正在运行
  ```bash
  systemctl --user status clash.service
  systemctl --user start clash.service
  ```

## 测试清单

- [ ] 一键安装脚本可访问
- [ ] 主程序可下载
- [ ] 示例配置可下载
- [ ] 依赖安装正常
- [ ] 所有命令正常工作
- [ ] 自动调优功能正常
- [ ] 文档链接正确

## 反馈

如有问题，请在 GitHub 提交 Issue:
https://github.com/kenchikuliu/clash-node/issues
