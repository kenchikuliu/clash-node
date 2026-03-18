#!/bin/bash
# clash-node 一键安装脚本

set -e

echo "=========================================="
echo "clash-node 安装脚本"
echo "=========================================="
echo ""

# 检查依赖
echo "📦 检查依赖..."

# 检查 Python
if ! command -v python3 &> /dev/null; then
    echo "❌ 未找到 Python 3"
    echo "请先安装: sudo apt install python3"
    exit 1
fi
echo "✓ Python 3: $(python3 --version)"

# 检查 pip
if ! command -v pip3 &> /dev/null; then
    echo "⚠️  未找到 pip3，正在安装..."
    sudo apt update && sudo apt install -y python3-pip
fi
echo "✓ pip3: $(pip3 --version | cut -d' ' -f1-2)"

# 安装 Python 依赖
echo ""
echo "📦 安装 Python 依赖..."
pip3 install --user requests pyyaml 2>&1 | grep -v "already satisfied" || true
echo "✓ requests 和 pyyaml 已安装"

# 下载 clash-node
echo ""
echo "⬇️  下载 clash-node..."
INSTALL_DIR="$HOME/bin"
mkdir -p "$INSTALL_DIR"

curl -fsSL https://raw.githubusercontent.com/kenchikuliu/clash-node/master/clash-node -o "$INSTALL_DIR/clash-node"
chmod +x "$INSTALL_DIR/clash-node"

echo "✓ clash-node 已安装到: $INSTALL_DIR/clash-node"

# 检查 PATH
echo ""
if [[ ":$PATH:" != *":$HOME/bin:"* ]]; then
    echo "⚠️  $HOME/bin 不在 PATH 中"
    echo ""
    echo "请将以下内容添加到 ~/.bashrc 或 ~/.zshrc:"
    echo ""
    echo "    export PATH=\"\$HOME/bin:\$PATH\""
    echo ""
    echo "然后执行: source ~/.bashrc"
else
    echo "✓ PATH 配置正确"
fi

# 检查 Clash
echo ""
echo "🔍 检查 Clash 配置..."
if [ -f "$HOME/.config/clash/config.yaml" ]; then
    echo "✓ 找到 Clash 配置文件"
else
    echo "⚠️  未找到 Clash 配置文件"
    echo ""
    echo "请先配置 Clash:"
    echo "1. 下载示例配置:"
    echo "   curl -fsSL https://raw.githubusercontent.com/kenchikuliu/clash-node/master/config.example.yaml -o ~/.config/clash/config.yaml"
    echo ""
    echo "2. 编辑配置文件，填入真实节点信息:"
    echo "   nano ~/.config/clash/config.yaml"
    echo ""
    echo "3. 启动 Clash 服务:"
    echo "   systemctl --user start clash.service"
fi

echo ""
echo "=========================================="
echo "✅ 安装完成！"
echo "=========================================="
echo ""
echo "使用方法:"
echo "  clash-node              # 列出所有节点"
echo "  clash-node 1            # 切换到节点 1"
echo "  clash-node test         # 测试所有节点延迟"
echo "  clash-node best         # 自动选择最快节点"
echo "  clash-node tune         # 启动自动调优"
echo "  clash-node help         # 查看帮助"
echo ""
echo "文档: https://github.com/kenchikuliu/clash-node"
echo ""
