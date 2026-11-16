# animation/

代码动画相关的 Skill 与素材。

- `fy-code-animation/` - Akillll-DuoHe/fy-code-animation 上游仓库，代码动画 Skill（Remotion / Canvas / HTML）；实际入口为 `SKILL.md`，全局目录软链接到该路径，使用 Git 更新。
- `341-style-library/` - 《代码动画 341 种风格提示词》免费画风库（341 个提示词、193 张静帧，约 76 MB）；作为 fy-code-animation 的外部风格库，不复制进技能仓库。库根下为 `风格提示词/`、`示例/` 等。

## 安装状态

- `~/.agents/skills/fy-code-animation` 软链接到 `animation/fy-code-animation/`，DSH 已能识别该 Skill。
- `animation/fy-code-animation/adapters/style-library.config.json` 的 `root` 设为 `../341-style-library`，相对技能根解析。
- 更新技能：在 `fy-code-animation/` 中 `git pull`；更新画风库：整体替换 `341-style-library/` 后，在技能根运行 `python3.11 scripts/style_library.py build`。
- 完整测试需 Python 3.10+（本机默认 `python3` 是 3.9，建议用 `/opt/homebrew/bin/python3.11`）与 Node 20+。

## 验证

- `python3.11 scripts/doctor.py` → `verdict: ready`，库 341 条，索引与库一致。
- `python3.11 tests/test_contracts.py` 13/13；`node tests/test_logic.mjs` 12/12；`node tests/test_canvas_contract.mjs` 通过。
