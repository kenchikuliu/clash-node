#!/bin/bash
# clash-node 功能演示脚本

echo "=========================================="
echo "clash-node CLI 工具演示"
echo "=========================================="
echo ""

echo "1️⃣  列出所有节点"
echo "$ clash-node list"
clash-node list
echo ""
read -p "按 Enter 继续..."
echo ""

echo "2️⃣  切换到节点 2"
echo "$ clash-node 2"
clash-node 2
echo ""
read -p "按 Enter 继续..."
echo ""

echo "3️⃣  查看当前状态"
echo "$ clash-node status"
clash-node status
echo ""
read -p "按 Enter 继续..."
echo ""

echo "4️⃣  测试节点 2 延迟"
echo "$ clash-node test 2"
clash-node test 2
echo ""
read -p "按 Enter 继续..."
echo ""

echo "5️⃣  自动选择最快节点"
echo "$ clash-node best"
clash-node best
echo ""
read -p "按 Enter 继续..."
echo ""

echo "6️⃣  启动自动调优"
echo "$ clash-node tune"
echo "（守护进程模式，每 5 分钟自动检查并切换到最快节点）"
echo ""
echo "查看状态: clash-node tune status"
echo "查看日志: clash-node tune log"
echo "停止调优: clash-node tune stop"
echo ""

echo "=========================================="
echo "演示完成！"
echo "=========================================="
