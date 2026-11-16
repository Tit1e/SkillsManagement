# ios/

iOS / App Store 发布上架相关的 Skill。

- `app-store-connect-cli-skills/` - rorkai/app-store-connect-cli-skills 上游仓库（用 asc CLI 自动化 App Store 发布及周边流程，MIT，1125 stars），实际 Skill 位于 `skills/<name>/`，共 26 个：asc-ad-hoc-distribution、asc-analytics-reports、asc-app-create-ui、asc-apple-ads、asc-aso-audit、asc-build-lifecycle、asc-cli-usage、asc-crash-triage、asc-id-resolver、asc-in-app-events、asc-localize-metadata、asc-metadata-sync、asc-notarization、asc-ppp-pricing、asc-release-flow、asc-revenuecat-catalog-sync、asc-screenshot-resize、asc-shots-pipeline、asc-signing-setup、asc-submission-health、asc-subscription-localization、asc-testflight-orchestration、asc-wall-submit、asc-whats-new-writer、asc-workflow、asc-xcode-build；使用 Git 更新。

## 安装状态

- 默认不安装到全局 `~/.agents/skills/`。需要时把 `~/.agents/skills/<name>` 逐个软链接到 `app-store-connect-cli-skills/skills/<name>`，不复制内容。
- 原先由 rorkai/app-store-connect-cli-skills 安装到全局的 25 个副本已删除，`.skill-lock.json` 中对应的 25 条记录也已清除。
- 仓库另含 `.claude-plugin/`、`.codex-plugin/`、`scripts/`、`tests/`。
