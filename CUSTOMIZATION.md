# MacDown 定制版本 - 修改说明

## 修改内容

本版本基于 MacDown SE 进行的定制，进行了以下修改：

### 1. 删除的功能
- ✅ **检查更新 (Check for Updates)** - 已从菜单中删除
- ✅ **插件菜单 (Plug-ins)** - 已完全移除
- ✅ **帮助菜单 (Help)** - 已完全移除  
- ✅ **MCP 功能** - 已移除 IPC 服务器

### 2. 名称修改
- ✅ **应用名称** - 从 "MacDown SE" 改为 "MacDown"
  - 更新了 Info.plist 中的 CFBundleDisplayName
  - 更新了主菜单中的应用名称标题
  - 更新了菜单项中的应用名称引用

### 3. 代码修改

#### MacDown-Info.plist
- `CFBundleDisplayName`: MacDown SE → MacDown

#### MainMenu.xib
- 删除了"Check for Updates…"菜单项
- 删除了"Plug-ins"整个菜单
- 删除了"Help"整个菜单
- 移除了 SUUpdater 对象和 plugInController
- 更新了"About"菜单项标题
- 更新了"Hide/Quit"菜单项标题

#### MPMainController.m
- 移除了 Sparkle 更新框架的导入
- 移除了 ipcServer 属性和初始化
- 移除了 plugInController 属性
- 移除了 applicationDidFinishLaunching 中的 MCP 初始化代码
- 移除了 applicationWillTerminate 中的 IPC 关闭代码
- 删除了 showHelp 和 showContributing 方法
- 删除了 SUUpdaterDelegate 的实现
- 删除了 showFirstLaunchTips 通知处理器

## 保留的功能
- 核心 Markdown 编辑功能
- 所有编辑和视图功能
- 偏好设置
- 代码高亮和预览
- 主题和样式支持

## 编译说明
该定制版本可直接使用 Xcode 编译。构建命令：
```bash
xcodebuild -workspace MacDown.xcworkspace -scheme MacDown -configuration Release
```
