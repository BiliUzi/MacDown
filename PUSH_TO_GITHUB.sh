#!/bin/bash

# MacDown 定制版 - 推送到 GitHub 脚本
# 使用方法：./PUSH_TO_GITHUB.sh YOUR_GITHUB_USERNAME

set -e

if [ -z "$1" ]; then
    echo "❌ 错误：需要提供 GitHub 用户名"
    echo ""
    echo "使用方法："
    echo "  ./PUSH_TO_GITHUB.sh YOUR_GITHUB_USERNAME"
    echo ""
    echo "示例："
    echo "  ./PUSH_TO_GITHUB.sh john-doe"
    exit 1
fi

USERNAME=$1
REPO_NAME="macdown-custom"
REPO_URL="https://github.com/${USERNAME}/${REPO_NAME}.git"

echo "🔧 MacDown 定制版 - GitHub 推送配置"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📝 配置信息："
echo "  用户名: $USERNAME"
echo "  仓库名: $REPO_NAME"
echo "  仓库地址: $REPO_URL"
echo ""

# 检查是否已经有 git 仓库
if [ ! -d ".git" ]; then
    echo "📦 初始化 Git 仓库..."
    git init
    git config user.email "you@example.com"
    git config user.name "Your Name"
else
    echo "✅ Git 仓库已存在"
fi

echo ""
echo "📄 添加所有文件..."
git add .

# 检查是否有未提交的更改
if git diff-index --quiet HEAD --; then
    echo "ℹ️  没有新的更改需要提交"
else
    echo "✅ 提交更改..."
    git commit -m "Initial commit: MacDown custom version without updates, plugins, and MCP" || true
fi

echo ""
echo "🌳 设置主分支..."
if git rev-parse --verify main >/dev/null 2>&1; then
    echo "✅ main 分支已存在"
else
    git branch -M main
fi

echo ""
echo "🔗 连接到远程仓库..."

# 检查是否已有 origin
if git remote | grep -q "^origin$"; then
    echo "ℹ️  远程仓库已存在，更新地址..."
    git remote set-url origin "$REPO_URL"
else
    echo "✅ 添加远程仓库..."
    git remote add origin "$REPO_URL"
fi

echo ""
echo "📤 推送到 GitHub..."
git push -u origin main

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ 完成！"
echo ""
echo "📌 后续步骤："
echo "  1. 访问: https://github.com/${USERNAME}/${REPO_NAME}"
echo "  2. 进入 Actions 标签查看编译进度"
echo "  3. 编译完成后下载 MacDown.app"
echo ""
echo "💡 提示："
echo "  - 编译通常需要 10-15 分钟"
echo "  - 可以在 Artifacts 部分下载已编译的应用"
echo "  - 创建 Release 发布正式版本（可选）"
echo ""
