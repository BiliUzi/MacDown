# 快速开始

## 编译

推送代码后，GitHub Actions 会构建仅支持 Apple 芯片、最低 macOS 12 的 MacDown，并提供 `MacDown-build` artifact。

正式发布时创建并推送版本标签：

```bash
git tag v1.0.0
git push origin v1.0.0
```

工作流会构建 DMG 和 ZIP，并将它们附加到 GitHub Release。把 `v1.0.0` 换成实际版本号。

## 安装

从 GitHub Release 下载 `MacDown.dmg`，打开磁盘映像，再将 MacDown 拖到“应用程序”文件夹。项目当前构建未签名和公证，macOS 可能提示无法验证开发者；公开发布前应配置 Developer ID 签名与 Apple 公证。

## 本地调试

```bash
pod install
open MacDown.xcworkspace
```

完整构建步骤见 [BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)。
