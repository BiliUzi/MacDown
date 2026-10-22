# GitHub 构建与发布

将项目代码推送至仓库后，GitHub Actions 会自动构建仅支持 Apple 芯片、最低 macOS 12 的版本。普通分支构建可从 Actions 的 `MacDown-build` artifact 下载。

## 发布版本

在项目目录创建并推送版本标签：

```bash
git tag v1.0.0
git push origin v1.0.0
```

工作流会创建 GitHub Release 并上传 `MacDown.dmg` 和 `MacDown.zip`。将标签替换为实际版本号。发布包目前未签名和公证；公开分发前需要配置 Developer ID 证书和 Apple 公证凭据。

## 安装

从 Release 下载 `MacDown.dmg`，打开后将 MacDown 拖到“应用程序”文件夹。该版本仅面向 Apple 芯片，最低系统为 macOS 12。

详细本机构建步骤见 [BUILD_INSTRUCTIONS.md](BUILD_INSTRUCTIONS.md)。
