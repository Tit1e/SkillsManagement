# content/

内容与自媒体运营相关的 Skill。

- `xiaohongshu-ai-workbench/` - mengke-wang/xiaohongshu-ai-workbench 上游仓库（《小红书运营手册 · AI工作台》，MIT，622 stars），实际 Skill 为仓库根目录下的 7 个目录：`xiaohongshu-suite`、`xiaohongshu-title`、`xiaohongshu-profile`、`xiaohongshu-magazine`、`xiaohongshu-topic-planner`、`xiaohongshu-comment-reply`、`xiaohongshu-conversion-path`；使用 Git 更新。

## 安装状态

- 默认不安装到全局 `~/.agents/skills/`。需要时把 `~/.agents/skills/<name>` 逐个软链接到 `xiaohongshu-ai-workbench/<name>`，不复制内容。
- 该仓库由 Codex Skill 安装器手工放入全局目录的历史副本已删除，安装器无对应记录。
- 仓库另含 `packages/`（可直接导入 Codex 的 `.skill` 打包文件）与 `scripts/package_all.py`、`scripts/validate_all.py`。
