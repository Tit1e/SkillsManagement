# content/

内容与自媒体运营相关的 Skill。

- `xiaohongshu-ai-workbench/` - mengke-wang/xiaohongshu-ai-workbench 上游仓库（《小红书运营手册 · AI工作台》，MIT，622 stars），实际 Skill 为仓库根目录下的 7 个目录：`xiaohongshu-suite`、`xiaohongshu-title`、`xiaohongshu-profile`、`xiaohongshu-magazine`、`xiaohongshu-topic-planner`、`xiaohongshu-comment-reply`、`xiaohongshu-conversion-path`；使用 Git 更新。

- `aihot/` - AIHOT 官方安装包（2.0.0），查询实时 AI 资讯、热点、关键词动态和日报；来源为 https://aihot.news/aihot-skill/README.md，GitHub 镜像为 https://github.com/KKKKhazix/khazix-skills/tree/main/aihot。Skill 文件为 MIT 许可，服务与数据另遵循 AIHOT 使用规则。

## 安装状态

- AIHOT 仅安装在项目的 `aihot/` 目录，不创建任何全局或项目级软链，也不加入 `install-links.sh`；已关闭可选 Actor 统计。官方目前说明此版本以后无需更新；如需重装，先下载并审阅官方 `install.sh`，再执行 `bash <已审阅脚本路径> --dir "$PWD/content/aihot" --no-actor`（在管理仓库根目录运行）。安装器会核对官方清单的 SHA-256。本地 Actor 状态由 Skill 内的 `.gitignore` 排除。

- 默认不安装到全局 `~/.agents/skills/`。需要时把 `~/.agents/skills/<name>` 逐个软链接到 `xiaohongshu-ai-workbench/<name>`，不复制内容。
- 该仓库由 Codex Skill 安装器手工放入全局目录的历史副本已删除，安装器无对应记录。
- 仓库另含 `packages/`（可直接导入 Codex 的 `.skill` 打包文件）与 `scripts/package_all.py`、`scripts/validate_all.py`。
