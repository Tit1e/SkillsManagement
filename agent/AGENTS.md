# agent/

Agent 通用工作流相关的 Skill 集合。

- `waza/` - tw93/Waza 官方上游仓库，包含 think、ui、check、hunt、write、learn、read、health 共 8 个 Skill，实际入口为 `skills/<name>/`，使用 Git 更新。

## 安装状态

- `~/.agents/skills/` 下的 8 个同名 Skill 均为软链接，指向 `waza/skills/<name>/`，供 Codex、Pi 共用。
- Codex 不再单独安装 Waza 插件。
- 全局 skills 安装器不再追踪这 8 个 Skill，更新时直接在 `waza/` 里用 Git。
