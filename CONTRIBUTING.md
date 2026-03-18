# 贡献指南

感谢你对 clash-node 项目的关注！

## 如何贡献

### 报告 Bug

如果你发现了 Bug，请：

1. 检查 [Issues](https://github.com/your-repo/clash-node/issues) 是否已有相关报告
2. 如果没有，创建新 Issue，包含：
   - 详细的问题描述
   - 复现步骤
   - 预期行为 vs 实际行为
   - 系统环境（OS、Python 版本、Clash 版本）
   - 相关日志

### 提交功能请求

1. 在 Issues 中描述你的想法
2. 说明为什么这个功能有用
3. 如果可能，提供实现思路

### 提交代码

1. Fork 本仓库
2. 创建特性分支：`git checkout -b feature/your-feature`
3. 编写代码并测试
4. 提交更改：`git commit -m 'Add some feature'`
5. 推送到分支：`git push origin feature/your-feature`
6. 创建 Pull Request

## 代码规范

- 遵循 PEP 8 Python 代码风格
- 添加必要的注释和文档字符串
- 保持代码简洁易读
- 测试你的更改

## 开发环境设置

```bash
# 克隆仓库
git clone https://github.com/your-repo/clash-node.git
cd clash-node

# 安装依赖
pip3 install requests pyyaml

# 测试
./clash-node help
```

## 提交信息规范

使用清晰的提交信息：

- `feat: 添加新功能`
- `fix: 修复 Bug`
- `docs: 更新文档`
- `style: 代码格式调整`
- `refactor: 代码重构`
- `test: 添加测试`
- `chore: 构建/工具链更新`

## 问题？

如有任何问题，欢迎在 Issues 中提问！
