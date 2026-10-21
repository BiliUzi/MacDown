# MacDown - 定制版本

基于 [MacDown SE](https://github.com/eldris-io/macdown-se) 的精简定制版本，针对 Apple Silicon Mac 优化。

## 特性

✅ **核心功能保留**
- Markdown 编辑和实时预览
- 代码高亮和主题支持
- HTML 导出功能

🗑️ **已移除**
- 自动更新检查（Sparkle）
- 插件系统和 Plug-ins 菜单
- Help 菜单
- MCP 本地通讯功能

## 快速开始

### 方式 1：下载编译好的应用（推荐）

1. 进入 [Releases](../../releases) 页面
2. 下载最新的 `MacDown.app` 或 `MacDown.dmg`
3. 解压并移到应用程序文件夹
4. 运行！

### 方式 2：从源代码编译

需要：
- macOS 12+
- Xcode 13+
- CocoaPods

```bash
git clone https://github.com/BiliUzi/MacDown.git
cd MacDown
pod install
open MacDown.xcworkspace
# 在 Xcode 中按 Cmd+B 编译
```

## 文件说明

- `QUICK_START.txt` - 快速参考
- `BUILD_INSTRUCTIONS.md` - 详细编译步骤
- `CUSTOMIZATION.md` - 修改详情
- `GITHUB_SETUP.md` - GitHub 仓库配置指南

## 自动编译

每次推送到 `main` 分支时，GitHub Actions 会自动：
1. 编译应用（Apple Silicon）
2. 生成 DMG 安装文件
3. 上传到 Artifacts

查看编译进度：点击 **Actions** 标签

## 原项目

- 原项目：[MacDown SE](https://github.com/eldris-io/macdown-se)
- 许可证：MIT

## 安装后验证

打开应用后检查：
- ✓ 菜单中不显示 "Plug-ins"
- ✓ 菜单中不显示 "Help"
- ✓ 没有 "Check for Updates…" 选项
- ✓ 菜单中不显示 "About MacDown"

## 支持的系统

- macOS 12+ (Monterey)
- Apple Silicon (M1, M2, M3, M4 等)

---

**有问题？** 查看 [Issues](../../issues) 或 [Discussions](../../discussions)
