# 安全说明

## 配置文件安全

**重要提示**：请勿将包含真实节点信息的配置文件提交到 Git 仓库！

### 保护你的节点信息

1. **使用示例配置**：
   ```bash
   cp config.example.yaml ~/.config/clash/config.yaml
   # 然后编辑 ~/.config/clash/config.yaml 填入真实节点信息
   ```

2. **检查 .gitignore**：
   确保 `config.yaml` 已在 `.gitignore` 中

3. **检查提交内容**：
   ```bash
   git status
   git diff
   ```
   确认没有敏感信息后再提交

### 如果不小心泄漏了节点信息

1. **立即更换节点**：联系服务提供商更换 UUID 和服务器
2. **清理 Git 历史**：
   ```bash
   git filter-branch --force --index-filter \
     "git rm --cached --ignore-unmatch config.yaml" \
     --prune-empty --tag-name-filter cat -- --all
   ```
3. **强制推送**：
   ```bash
   git push origin --force --all
   ```

## 报告安全问题

如果发现安全漏洞，请通过 GitHub Issues 私密报告。
