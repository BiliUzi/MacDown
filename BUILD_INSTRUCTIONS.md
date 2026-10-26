# MacDown 构建指南

## 支持范围

- 仅支持 Apple 芯片（arm64）。
- 最低系统版本为 macOS 12。
- 本机构建需要 Xcode、CocoaPods 和项目里的构建工具。

## 本机构建

先按 GitHub Actions 中固定的版本获取 Prism 到 `Dependency/prism`，再在项目目录执行：

```bash
pod install
make -C Dependency/peg-markdown-highlight -j"$(sysctl -n hw.ncpu)"
xcodebuild -workspace MacDown.xcworkspace -scheme MacDown \
  -configuration Release -arch arm64 CODE_SIGNING_ALLOWED=NO build
```

正式 DMG 由 GitHub Actions 在推送 `v*` 标签时创建并附加到 GitHub Release；普通分支构建只生成 Actions artifact。

## 发布签名

当前工作流使用 ad-hoc 签名并验证应用完整性，尚未配置 Developer ID 签名和 Apple 公证。公开分发前建议配置 Developer ID 签名和 Apple 公证；这需要开发者证书、团队 ID 及 Apple 公证凭据，仓库当前没有这些凭据，因此工作流不会尝试伪造签名或公证状态。

## 项目功能

保留 Markdown 编辑、HTML 预览、代码高亮和主题。预览只加载本地资源，不访问远程资源或打开外部链接。

## 安装和发布

从 [Releases](https://github.com/BiliUzi/MacDown/releases/latest) 下载 `MacDown.dmg`，打开后把 MacDown 拖入应用程序文件夹。

发布前先更新 `MacDown/MacDown-Info.plist` 中的版本号和构建号，再创建并推送对应的 `v*` 标签。构建、检查和安装包生成步骤以 `.github/workflows/build.yml` 为准。
