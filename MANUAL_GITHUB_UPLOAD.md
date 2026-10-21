# 📤 手动上传到 GitHub - 完整步骤

因为这个环境有限制，请按以下步骤在你自己的终端中手动操作：

## 步骤 1：在 GitHub 创建仓库

1. 打开 https://github.com/new
2. 填写：
   - **Repository name**: `macdown-custom`
   - **Description**: MacDown custom version without updates, plugins, and MCP
   - 选择 **Public**
   - 点击 **Create repository**
3. 你会看到一个新仓库页面

## 步骤 2：在你的 Mac 上初始化 Git

在终端中打开你的项目目录：

```bash
cd ~/Documents/Codex\ Claude/macdown-custom
```

初始化 git 仓库：

```bash
git init
git config user.email "your.email@example.com"
git config user.name "Your Name"
```

## 步骤 3：添加所有文件

```bash
git add .
git commit -m "Initial commit: MacDown custom version without updates, plugins, and MCP"
```

## 步骤 4：连接到 GitHub

```bash
git remote add origin https://github.com/BiliUzi/macdown-custom.git
git branch -M main
```

## 步骤 5：推送到 GitHub

```bash
git push -u origin main
```

系统会提示输入密码或使用 token。选择其一：

### 选项 A：使用 GitHub Personal Access Token（推荐）

1. 访问 https://github.com/settings/tokens
2. 点击 **Generate new token**
3. 选择 **Generate new token (classic)**
4. 输入 token 名称（如 `macdown-push`）
5. 选择权限：**repo** (所有)
6. 点击 **Generate token**
7. 复制显示的 token（只显示一次！）
8. 回到终端，粘贴 token 作为密码

### 选项 B：使用 SSH Key

如果已经配置过 SSH：

```bash
git remote set-url origin git@github.com:BiliUzi/macdown-custom.git
git push -u origin main
```

## 步骤 6：验证推送成功

1. 打开 https://github.com/BiliUzi/macdown-custom
2. 应该能看到所有文件已上传
3. 点击 **Actions** 标签
4. 应该看到 "Build MacDown" 工作流正在运行

## 步骤 7：等待编译完成

- GitHub Actions 会自动编译 macOS 应用
- 通常需要 10-15 分钟
- 你会看到绿色 ✓ 表示成功

## 步骤 8：下载已编译的应用

编译完成后：

1. 在 GitHub 仓库页面点击 **Actions**
2. 找到最新的 "Build MacDown" 工作流
3. 点击进入，向下滚动
4. 在 **Artifacts** 部分找到 `MacDown-build`
5. 点击下载

## 步骤 9：安装应用

```bash
# 解压下载的文件
unzip ~/Downloads/MacDown-build.zip

# 移到应用程序文件夹
mv MacDown.app ~/Applications/MacDown.app

# 让系统允许运行
chmod +x ~/Applications/MacDown.app/Contents/MacOS/MacDown

# 打开应用
open ~/Applications/MacDown.app
```

## 常见问题

### 推送时出现 403 错误
- 确保你使用的是正确的 token 或 SSH key
- 检查 token 是否有过期（有效期设置）
- 尝试重新生成新的 token

### Actions 没有自动运行
- 确保文件已推送到 GitHub
- 刷新页面
- 检查 `.github/workflows/build.yml` 文件是否存在

### 无法下载 Artifacts
- 确保已登录 GitHub
- 等待编译完全完成（看绿色 ✓）
- 尝试在浏览器中刷新

### 应用无法打开
```bash
# 移除苹果的隔离标记
sudo xattr -rd com.apple.quarantine ~/Applications/MacDown.app

# 然后再试
open ~/Applications/MacDown.app
```

---

## 完整命令速查表

```bash
# 全部命令一次性复制运行
cd ~/Documents/Codex\ Claude/macdown-custom
git init
git config user.email "your.email@example.com"
git config user.name "Your Name"
git add .
git commit -m "Initial commit: MacDown custom version without updates, plugins, and MCP"
git remote add origin https://github.com/BiliUzi/macdown-custom.git
git branch -M main
git push -u origin main
```

然后等待 GitHub Actions 编译完成，下载应用即可！
