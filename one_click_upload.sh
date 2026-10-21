#!/bin/bash

# MacDown 一键上传脚本
# 使用方法: ./one_click_upload.sh YOUR_GITHUB_TOKEN

set -e

if [ -z "$1" ]; then
    echo "❌ 需要提供 GitHub Token"
    echo ""
    echo "获取 Token："
    echo "  1. 访问 https://github.com/settings/tokens/new"
    echo "  2. 创建 token，选择 'repo' 权限"
    echo "  3. 复制 token"
    echo ""
    echo "使用方法："
    echo "  ./one_click_upload.sh ghp_xxxxxxxxxxxxx"
    exit 1
fi

TOKEN=$1
USERNAME="BiliUzi"
REPO="macdown-custom"

echo "🚀 开始上传到 GitHub..."
echo ""

# 初始化
git init
git config user.email "biliuzi@users.noreply.github.com"
git config user.name "BiliUzi"

# 添加文件
git add .
git commit -m "Initial: MacDown custom without updates/plugins/MCP"

# 推送
git remote add origin https://${TOKEN}@github.com/${USERNAME}/${REPO}.git
git branch -M main
git push -u origin main

echo ""
echo "✅ 完成！"
echo ""
echo "🎉 查看仓库: https://github.com/${USERNAME}/${REPO}"
echo "📦 查看编译: https://github.com/${USERNAME}/${REPO}/actions"
