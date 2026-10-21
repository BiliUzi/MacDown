# MacDown 定制版编译指南

## 系统要求
- macOS 10.12 或更高版本
- Xcode 13.0 或更高版本
- CocoaPods 1.10.0 或更高版本

## 编译步骤

### 1. 安装依赖
```bash
cd ~/Documents/Codex\ Claude/macdown-custom
pod install
```

### 2. 使用 Xcode 编译
```bash
# 打开工作区
open MacDown.xcworkspace

# 或使用命令行编译
xcodebuild -workspace MacDown.xcworkspace -scheme MacDown -configuration Release
```

### 3. 编译后的应用位置
编译完成后，应用会生成在：
`~/Library/Developer/Xcode/DerivedData/MacDown-xxxxx/Build/Products/Release/MacDown.app`

## 主要修改清单

### 已删除
- ✅ 检查更新功能（Sparkle 框架集成已移除）
- ✅ Plug-ins 菜单及插件系统
- ✅ Help 菜单及相关文档链接
- ✅ MCP 本地 IPC 服务器功能

### 已修改
- ✅ 应用名称：MacDown SE → MacDown
- ✅ 所有菜单项引用已更新

### 保留
- ✅ 核心 Markdown 编辑功能
- ✅ HTML 预览
- ✅ 代码高亮
- ✅ 主题支持
- ✅ 所有编辑和查看工具

## 验证修改

编译成功后，可以验证以下几点：
1. 应用菜单中没有"Plug-ins"菜单
2. 应用菜单中没有"Help"菜单
3. MacDown 菜单项中没有"Check for Updates…"选项
4. 关于对话框显示"MacDown"而非"MacDown SE"

## 文件列表
修改过的主要文件：
- `MacDown/MacDown-Info.plist` - 应用配置
- `MacDown/Localization/Base.lproj/MainMenu.xib` - 菜单定义
- `MacDown/Code/Application/MPMainController.m` - 主控制器逻辑

