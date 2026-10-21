# GitHub 仓库设置指南

## 步骤 1：创建 GitHub 仓库

1. 访问 [GitHub 新仓库页面](https://github.com/new)
2. 填写信息：
   - **Repository name**: `macdown-custom`
   - **Description**: MacDown custom version without updates, plugins, and MCP
   - **Public** ✓（保持公开）
3. 点击 **Create repository**

## 步骤 2：上传项目代码到 GitHub

在你的 Mac 上运行：

```bash
# 进入项目目录
cd ~/Documents/Codex\ Claude/macdown-custom

# 初始化 git（如果还没有）
git init
git add .
git commit -m "Initial commit: MacDown custom version"

# 添加远程仓库（将 YOUR_USERNAME 替换为你的 GitHub 用户名）
git remote add origin https://github.com/YOUR_USERNAME/macdown-custom.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

## 步骤 3：GitHub Actions 会自动编译

推送后，GitHub 会自动：
1. 检出代码
2. 安装依赖
3. 编译 MacDown.app（Apple Silicon 版本）
4. 创建 DMG 安装文件

**查看编译进度：**
- 打开你的仓库
- 点击 **Actions** 标签
- 查看最新的工作流运行

## 步骤 4：下载编译好的应用

### 方式 A：直接下载 (每次编译后可用)

1. 进入仓库的 **Actions** 标签
2. 点击最新的工作流运行（绿色 ✓）
3. 向下滚动到 **Artifacts** 部分
4. 下载 `MacDown-build` 文件夹
5. 解压后得到 `MacDown.app`

### 方式 B：创建 Release 版本 (官方发布)

如果你想创建正式版本：

```bash
# 创建标签
git tag v1.0.0
git push origin v1.0.0
```

然后：
1. GitHub 会自动生成一个 Release
2. DMG 文件会自动上传到 Release 页面
3. 用户可以从 Release 页面下载

## 步骤 5：安装 MacDown.app

**从 Artifacts 下载后：**

```bash
# 1. 解压文件
unzip MacDown-build.zip

# 2. 移到应用程序文件夹
mv MacDown.app ~/Applications/MacDown.app

# 3. 标记为可执行
chmod +x ~/Applications/MacDown.app/Contents/MacOS/MacDown

# 4. 运行应用
open ~/Applications/MacDown.app
```

或者直接在 Finder 中：
- 右键点击 `MacDown.app`
- 选择 **打开**

## 故障排除

### 编译失败？
- 检查 **Actions** 标签中的错误日志
- 常见原因：依赖问题或 macOS 版本不兼容
- 点击 **Re-run failed jobs** 重新尝试

### 下载不了 Artifacts？
- 确保你已登录 GitHub
- 可能需要等待编译完成（通常 10-15 分钟）

### 应用无法打开？
```bash
# 允许应用运行
sudo xattr -rd com.apple.quarantine ~/Applications/MacDown.app
```

## 之后的更新

如果你想修改代码：

```bash
# 本地修改代码后
git add .
git commit -m "描述你的修改"
git push origin main

# GitHub Actions 会自动重新编译
```

## 分享给其他人

一旦设置完成，其他人可以：
1. 访问你的仓库
2. 进入 **Releases** 页面
3. 下载最新的 DMG 或 app 文件
4. 安装使用

---

**需要帮助？** 提问时提供：
- 你的 GitHub 用户名（可选）
- 遇到的具体错误信息
