# SkillsManagement

管理外部 Skill 源仓库、项目级规则和全局软链。

## 初始化其他机器

先克隆本管理仓库，再同步外部 GitHub 仓库：

```bash
git clone <SkillsManagement 仓库地址>
cd SkillsManagement
bash scripts/sync-sources.sh
bash scripts/install-links.sh
```

`sync-sources.sh` 读取 [sources.tsv](sources.tsv)，对每个来源执行以下操作：

- 目录不存在时按清单中的分支执行 `git clone`；
- 目录已存在且工作区干净时执行 `git pull --ff-only`；
- 目录有本地修改时跳过，避免覆盖本地工作；
- 远程地址不一致时停止该来源并报告错误。

## 来源管理

从 GitHub 安装的 Skill 只在 [sources.tsv](sources.tsv) 中记录路径、仓库地址和分支。源码目录被根仓库的 [.gitignore](.gitignore) 忽略，由各自的 Git 仓库管理。

非 GitHub 来源不放入 GitHub 仓库清单。当前的夸克网盘 Skill 使用自身的安装脚本更新：

```bash
bash cloud/quarkclouddrive/scripts/install.sh
```

## 软链

`install-links.sh` 根据当前机器的项目路径创建软链，不写入固定的用户目录绝对路径。它会安装：

- `AGENTS.global.md` 到 `~/.agents/AGENTS.md` 和 `~/.claude/AGENTS.md`；
- Waza 的 8 个 Skill 到 `~/.agents/skills/` 和 `~/.claude/skills/`；
- Kami 和夸克网盘 Skill 到 `~/.agents/skills/`（来源目录存在时）。
