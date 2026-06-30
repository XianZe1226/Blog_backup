# Blog_backup

籼泽的个人博客 · Hexo 源码仓库 & 备份站

🔗 备份站地址：[https://xianze1226.github.io/Blog_backup/](https://xianze1226.github.io/Blog_backup/)

## 这是什么

这是博客的 **Hexo 源码仓库**，同时承担两个职责：

1. **源码管理**：所有博客文章（Markdown）、主题配置、插件依赖都在这里
2. **备份站发布**：`push` 到 `main` 分支后，GitHub Actions 自动构建并部署到 `gh-pages` 分支，作为备份站

## 如何使用

### 环境准备

```bash
# 安装 Node.js（需要 nvm）
nvm use 20

# 安装依赖
npm install
```

### 写文章

文章放在 `source/_posts/` 目录下，格式为 Markdown。

### 发布到正式站

```bash
hexo clean && hexo generate && hexo deploy
```

### 发布到备份站

```bash
git add . && git commit -m "更新说明" && git push origin main
```

push 后 GitHub Actions 自动构建部署，无需其他操作。

### 同时发布到两站

```bash
# 1. 正式站
hexo clean && hexo generate && hexo deploy

# 2. 备份站
git add . && git commit -m "更新说明" && git push origin main
```

## 目录结构

```
├── source/_posts/          # 文章（Markdown）
├── themes/butterfly/       # Butterfly 主题
├── _config.yml             # Hexo 主配置
├── _config.butterfly.yml   # Butterfly 主题配置
├── .github/workflows/      # GitHub Actions 自动部署
└── package.json            # 依赖管理
```

## 注意事项

- `.gitignore` 不要添加 `css/`、`js/` 等排除规则，会影响 Actions 部署
- `themes/butterfly/source/` 目录必须提交到 git，否则备份站 CSS/JS 会丢失
- 每次部署前建议执行 `hexo clean`，避免缓存导致内容不更新

## 技术栈

- [Hexo](https://hexo.io/) - 静态博客框架
- [Butterfly](https://github.com/jerryc127/hexo-theme-butterfly) - 主题
- GitHub Actions - 自动部署
- GitHub Pages - 托管
