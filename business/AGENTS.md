# business/

商业诊断与内容生产相关的 Skill。

- `dbskill/` - dontbesilent2025/dbskill 上游仓库（dontbesilent 的商业与内容工具箱，37 个 Skill，v3.5.0，HEAD 72252b2），实际 Skill 位于 `skills/<name>/`；使用 Git 更新。

## 结构

- 入口是 `dbs`，一个调度台/路由器：根据问题和现状挑选、组合、按顺序执行其余 Skill，并识别视频里的「三位编号」与隐藏款目录。
- 每个 Skill 目录含 `SKILL.md` + `agents/openai.yaml`（子 agent 定义）+ 可选 `references/`、`scripts/`。`skills/` 合计约 1.6 MB。
- 仓库另含 `books/`（dontbesilent 推文集，11 MB，**适用单独的 `books/LICENSE`**）、`知识库/`（6.3 MB，含 `原子库/atoms.jsonl` 4176 条，可用于检索/RAG）、`docs/`、`tools/`（上游自用的校验与发布脚本）、`shared/`、`site/`。

## Skill 清单（37 个，按用途分组）

- 入口（1）：`dbs`
- 商业判断与问题澄清（8）：`dbs-diagnosis`、`dbs-benchmark`、`dbs-jtbd`、`dbs-goal`、`dbs-good-question`、`dbs-deconstruct`、`dbs-theory-grounding`、`dbs-standard-answer`
- 内容创作与发布（11）：`dbs-content`、`dbs-title-cover-intro`、`dbs-resonate`、`dbs-script-flow`、`dbs-content-value`、`dbs-spread`、`dbs-ai-check`、`dbs-content-risk-check`、`dbs-plain-writing`、`dbs-speak-human`、`dbs-wechat-html`
- 视频处理（2）：`dbs-video-extract`、`dbs-video-navigation`
- 行动、学习与决策（3）：`dbs-action`、`dbs-learning`、`dbs-decision`
- 存档与报告（3）：`dbs-save`、`dbs-restore`、`dbs-report`
- 多视角讨论（2）：`dbs-chatroom`、`dbs-chatroom-austrian`
- 资料与工具（5）：`dbs-knowledge`、`dbs-content-system`、`dbs-human-dispatch`、`dbs-skill-maker`、`dbs-install-skill`
- 同步与更新（2）：`dbs-sync-to-dondon`、`dbs-update`

## 安装状态

- 默认不安装到全局 `~/.agents/skills/`。
- 需要时只软链接入口一个：`~/.agents/skills/dbs` -> `business/dbskill/skills/dbs`。`dbs` 的发现脚本按「完整项目的 `.claude-plugin/marketplace.json` → 与入口同级目录 → 各 Agent 用户目录」的顺序查找其余 36 个 Skill，入口软链的真实目录是 `skills/dbs`，其同级目录即其余 Skill，因此装入口即可全套可用。
- **不要安装 `dbs-update`**：它检测到 `~/.agents/skills/dbs` 后会执行 `npx skills add -g --all`，向各 Agent 目录写入实体副本，破坏「源文件唯一」。更新统一在本仓库 `git pull`。

## 依赖与运行

- 多数 Skill 为纯文本提示词；`dbs`、`dbs-update`、`dbs-skill-maker`、`dbs-human-dispatch`、`dbs-sync-to-dondon`、`dbs-video-extract`、`dbs-video-navigation` 需要 `python3`。
- `dbs-video-extract` 需配置 TikHub 与轻抖凭证；`dbs-sync-to-dondon` 需 dondon bot（未配置时降级为给用户可粘贴文字）。
- 存档与报告默认写入 `~/.dbs/`（跨项目的用户级目录），可用 `dbs-save` 修改位置。
- `dbs` 进入时会执行 `skills/dbs/scripts/check-update.sh`，24 小时内最多联网一次检查版本。

## 许可

- 版权归 dontbesilent，条款允许阅读、安装、个人/自营业务使用、向自己的客户交付产出物、本地修改自用；**禁止再分发**、打包进其他合集或课程、公开发布修改版、去除署名、用于训练模型。
- `books/` 内容适用单独的 `books/LICENSE`。
- 因此本仓库仅作本机自用保存，不得把 SkillsManagement 公开或再分发其中的内容。
