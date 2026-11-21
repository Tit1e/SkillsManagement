# SkillsManagement - 个人 Skill 管理中心

按技术领域分类保存外部与自维护 Skill，并通过逐个软链接安装到不同 Agent 的全局 Skill 目录。

## 目录

- `agent/` - Agent 通用工作流相关 Skill（8 个：think、ui、check、hunt、write、learn、read、health）
- `animation/` - 代码动画相关（代码动画 Skill fy-code-animation，及 341 风格库）
- `business/` - 商业诊断与内容生产相关（dbskill 工具箱，37 个 Skill）
- `cloud/` - 云存储相关 Skill（1 个：quarkclouddrive）
- `content/` - 内容与自媒体运营相关（小红书运营手册·AI工作台，7 个 Skill；AIHOT 资讯查询，1 个 Skill）
- `doc/` - 文档相关（约束文档 GEB.md，排版 Skill kami）
- `ios/` - iOS/App Store 发布上架相关（App Store Connect CLI Skills，26 个 Skill）
- `swift/` - Swift 与 SwiftUI 相关 Skill（1 个：swiftui-pro）

## 安装约定

- 各 Agent 全局目录中的 Skill 名称指向本目录中的具体 Skill，不复制内容。
- Waza：`~/.agents/skills/` 下的 8 个 Skill 逐个软链接到 `agent/waza/skills/<name>/`，供 Codex、Pi 共用。
- Waza 更新：在 `agent/waza/` 中用 Git 更新，不再通过全局 skills 安装器或 Codex 插件维护副本。
- Kami：`~/.agents/skills/kami` 软链接到 `doc/kami/plugins/kami/skills/kami/`，更新时在 `doc/kami/` 用 Git。
- 夸克网盘：`~/.agents/skills/quarkclouddrive` 软链接到 `cloud/quarkclouddrive/`，更新时在该目录执行 `bash scripts/install.sh`。
- 代码动画：不装全局。当前只在 `/Users/tit1e/Movies/自媒体视频输出/.agents/skills/fy-code-animation` 建项目级软链，指向 `animation/fy-code-animation/`（Pi 需信任该项目后才加载；Codex 不读项目级）；画风库独立放在 `animation/341-style-library/`，由该 Skill 的 `adapters/style-library.config.json` 以相对路径引用。更新 Skill 用 Git，更新画风库后重建索引。
- 小红书：上游仓库在 `content/xiaohongshu-ai-workbench/`，7 个 Skill 位于仓库根目录；默认不安装到全局，需要时把 `~/.agents/skills/<name>` 软链接到 `content/xiaohongshu-ai-workbench/<name>`。更新时在该仓库用 Git。
- App Store Connect：上游仓库在 `ios/app-store-connect-cli-skills/`，26 个 Skill 位于 `skills/<name>/`；默认不安装到全局，需要时把 `~/.agents/skills/<name>` 软链接到 `ios/app-store-connect-cli-skills/skills/<name>`。更新时在该仓库用 Git。
- dbskill：上游仓库在 `business/dbskill/`，37 个 Skill 位于 `skills/<name>/`；默认不安装到全局，需要时只软链接入口 `~/.agents/skills/dbs` 到 `business/dbskill/skills/dbs`，其余由入口的同级目录发现。不要装 `dbs-update`（会执行 `npx skills add -g --all` 写实体副本）；更新时在 `business/dbskill/` 用 Git。许可禁止再分发。
- GEB 文档协议：正文唯一存放于 `doc/geb/GEB.md`；需要启用的项目在根目录软链接为 `GEB.md`，全局 AGENTS.md 只保留启用门禁。

## 原则

源文件唯一，按领域分类，逐个引用，更新可回滚。
