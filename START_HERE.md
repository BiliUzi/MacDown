# 🚀 5 分钟快速开始

## 第 1 步：准备 GitHub

1. 访问 https://github.com/new
2. 创建新仓库：
   - 仓库名称：`macdown-custom`
   - 选择 **Public**
   - **Create repository**
3. 复制你的用户名（从 GitHub 页面 URL 中或右上角账户菜单）

## 第 2 步：上传代码到 GitHub

在 Mac 终端运行（将 `YOUR_USERNAME` 替换为你的 GitHub 用户名）：

```bash
cd ~/Documents/Codex\ Claude/macdown-custom
./PUSH_TO_GITHUB.sh YOUR_USERNAME
```

**例如：**
```bash
./PUSH_TO_GITHUB.sh john-doe
```

✅ 等待脚本完成

## 第 3 步：等待自动编译

1. 打开 https://github.com/YOUR_USERNAME/macdown-custom
2. 点击 **Actions** 标签
3. 看到绿色 ✓ 和 "Build MacDown" 任务完成

⏱️ 通常需要 10-15 分钟

## 第 4 步：下载应用

编译完成后：

1. 在 **Actions** 页面找到最新的工作流
2. 点击进去，向下滚动
3. 在 **Artifacts** 部分找到 `MacDown-build`
4. 点击下载

## 第 5 步：安装和运行

```bash
# 1. 假设下载到了 ~/Downloads
unzip ~/Downloads/MacDown-build.zip

# 2. 移到应用程序文件夹
mv MacDown.app ~/Applications/MacDown.app

# 3. 允许运行（可能需要）
chmod +x ~/Applications/MacDown.app/Contents/MacOS/MacDown

# 4. 打开应用
open ~/Applications/MacDown.app
```

## ✅ 验证成功

打开应用后查看菜单，应该没有：
- ❌ Plug-ins 菜单
- ❌ Help 菜单
- ❌ Check for Updates

---

## 🆘 遇到问题？

### 脚本执行失败
```bash
# 确保你在正确的目录
cd ~/Documents/Codex\ Claude/macdown-custom

# 尝试手动执行
chmod +x ./PUSH_TO_GITHUB.sh
./PUSH_TO_GITHUB.sh YOUR_USERNAME
```

### 找不到 Actions
- 确保代码已推送到 GitHub
- 刷新页面
- 可能需要等待几秒钟才会显示

### 编译失败
- 在 Actions 页面查看错误日志
- 检查是否有红色 ✗ 标记
- 点击工作流查看详细错误

### 应用无法打开
```bash
# 移除安全隔离标记
sudo xattr -rd com.apple.quarantine ~/Applications/MacDown.app
```

---

**就这么简单！** 如有问题随时问我。

还需要什么帮助吗？
