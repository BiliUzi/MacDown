# 推送项目并发布

先在 GitHub 创建仓库，再在项目目录使用已配置的 GitHub 登录方式推送：

```bash
git add .
git commit -m "Update MacDown"
git push origin main
```

如果仓库尚未连接远程地址，在 GitHub 仓库页面复制仓库地址后运行：

```bash
git remote add origin <repository-url>
git branch -M main
git push -u origin main
```

推送后 GitHub Actions 自动构建 arm64 测试 artifact。正式发布时推送版本标签：

```bash
git tag v1.0.0
git push origin v1.0.0
```

工作流会将 DMG 和 ZIP 附加到 GitHub Release。发布包目前未签名和公证，公开分发前需要配置 Apple Developer ID 签名与公证；不要通过关闭系统保护或移除隔离属性绕过 macOS 提示。
