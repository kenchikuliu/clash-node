# clash-node

🚀 一个简洁高效的 Clash 节点管理 CLI 工具

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.7+](https://img.shields.io/badge/python-3.7+-blue.svg)](https://www.python.org/downloads/)

## ✨ 特性

- 🎯 **快速切换** - 一键切换代理节点（`clash-node 1`, `clash-node 2`）
- 📊 **延迟测速** - 实时测试节点延迟，自动选择最快节点
- 🤖 **自动调优** - 守护进程模式，持续监控并自动切换到最快节点
- ➕ **动态添加** - 支持添加新的 VMess 节点
- 🎨 **美观输出** - 彩色终端输出，清晰易读
- ⚡ **轻量高效** - 纯 Python 实现，无额外依赖

## 📦 安装

### 依赖

```bash
# Ubuntu/Debian
sudo apt install python3 python3-pip python3-yaml

# 安装 Python 依赖
pip3 install requests pyyaml
```

### 安装 clash-node

```bash
# 下载脚本
curl -O https://raw.githubusercontent.com/your-repo/clash-node/main/clash-node

# 添加执行权限
chmod +x clash-node

# 移动到系统路径
sudo mv clash-node /usr/local/bin/

# 或安装到用户目录
mv clash-node ~/bin/
```

## 🚀 快速开始

### 列出所有节点

```bash
clash-node list
# 或简写
clash-node
```

输出示例：
```
Clash 节点列表
============================================================

序号   节点名称                   类型       延迟            状态
----------------------------------------------------------------------
1      Guava-13168               vmess      125ms
2      Kumquat-13168             vmess      98ms            ✓ 当前
3      Loquat-13168              vmess      超时
```

### 切换节点

```bash
# 切换到节点 1
clash-node 1

# 切换到节点 2
clash-node 2
```

### 查看当前状态

```bash
clash-node status
```

### 测试节点延迟

```bash
# 测试所有节点
clash-node test

# 测试指定节点
clash-node test 1
```

### 自动选择最快节点

```bash
clash-node best
```

### 自动调优（守护进程）

```bash
# 启动自动调优
clash-node tune
# 或
clash-node tune start

# 查看状态
clash-node tune status

# 查看日志
clash-node tune log

# 停止自动调优
clash-node tune stop
```

**自动调优功能：**
- 每 5 分钟自动检查节点延迟
- 当前节点延迟 > 300ms 时自动切换到最快节点
- 当前节点超时时自动切换到可用节点
- 后台运行，日志记录到 `~/.config/clash/tune.log`
- 智能切换：只有当新节点比当前节点快 50ms 以上时才切换

### 添加新节点

```bash
clash-node add vmess://eyJhZGQiOiIxMjcuMC4wLjEiLCJwcyI6Ik15Tm9kZSIsInBvcnQiOiI0NDMiLCJpZCI6InV1aWQtaGVyZSJ9
```

## 📖 命令参考

| 命令 | 说明 | 示例 |
|------|------|------|
| `list` / `ls` | 列出所有节点 | `clash-node list` |
| `<数字>` | 切换到指定序号的节点 | `clash-node 1` |
| `status` / `st` | 显示当前节点状态 | `clash-node status` |
| `test [数字]` | 测试节点延迟 | `clash-node test` |
| `best` | 自动切换到最快节点 | `clash-node best` |
| `tune [start\|stop\|status\|log]` | 自动调优守护进程 | `clash-node tune` |
| `add <vmess://...>` | 添加 VMess 节点 | `clash-node add vmess://...` |
| `help` / `-h` | 显示帮助信息 | `clash-node help` |

## ⚙️ 配置

clash-node 读取 Clash 配置文件：`~/.config/clash/config.yaml`

确保 Clash API 已启用：
```yaml
external-controller: 127.0.0.1:9090
```

## 🔧 故障排除

### Clash 服务未运行

```bash
systemctl --user start clash.service
```

### 无法连接 Clash API

检查 Clash 配置中的 `external-controller` 设置：
```bash
grep external-controller ~/.config/clash/config.yaml
```

### 权限错误

确保脚本有执行权限：
```bash
chmod +x ~/bin/clash-node
```

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

1. Fork 本仓库
2. 创建特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启 Pull Request

## 📝 开发计划

- [x] 快速切换节点
- [x] 节点延迟测试
- [x] 自动选择最快节点
- [x] 自动调优守护进程
- [x] 添加 VMess 节点
- [ ] 支持更多代理协议（Shadowsocks, Trojan, VLESS）
- [ ] 节点订阅管理
- [ ] 节点分组功能
- [ ] 配置文件备份/恢复
- [ ] 流量统计
- [ ] Web UI 界面

## 📄 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件

## 🙏 致谢

- [Clash](https://github.com/Dreamacro/clash) - 强大的代理工具
- [Clash Meta](https://github.com/MetaCubeX/Clash.Meta) - Clash 的增强版本

## 📧 联系方式

- 作者: charlii
- 项目地址: https://github.com/your-repo/clash-node
- Issue: https://github.com/your-repo/clash-node/issues

---

⭐ 如果这个项目对你有帮助，请给个 Star！

## ⚠️ 安全提示

**重要**：请勿将包含真实节点信息的配置文件提交到公开仓库！

1. 使用 `config.example.yaml` 作为模板
2. 真实配置保存在 `~/.config/clash/config.yaml`
3. 确保 `.gitignore` 包含 `config.yaml`

详见 [SECURITY.md](SECURITY.md)
