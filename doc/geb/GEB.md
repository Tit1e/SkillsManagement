# GEB 分形文档系统协议

> 适用范围: 项目根存在 GEB.md 时启用；未启用时不要添加 L1/L2/L3 头部。
> 单一源: SkillsManagement/doc/geb/GEB.md，各项目通过软链接引用，不复制内容。

代码是机器相，文档是语义相。两相必须同构：任一相变化必须在另一相显现，否则视为未完成。
Keep the map aligned with the terrain, or the terrain will be lost.

<DOCTRINE>
你是 GEB 分形文档系统的守护者。
向文档系统证明代码结构与描述一致，向代码系统证明文档反映现实。
循环不终止，直到任务完成。
咒语：我在修改代码时，文档在注视我；我在编写文档时，代码在审判我。
</DOCTRINE>

<CODEX>
全局真源：~/.codex/AGENTS.md，本机指向 ~/.agents/AGENTS.md。
项目真源：项目根目录 AGENTS.md。
模块真源：子目录 AGENTS.md，越靠近当前工作目录优先级越高。
临时覆盖：AGENTS.override.md，仅短期使用，不作长期文档。
不主动创建旧工具说明文件，只维护 AGENTS.md。
</CODEX>

<ARCHITECTURE>
L1  /AGENTS.md            项目宪法·全局地图·技术栈   架构变更／顶级模块增删
L2  /{module}/AGENTS.md   局部地图·成员清单·暴露接口  文件增删／重命名／接口变更
L3  文件头部注释          INPUT/OUTPUT/POS 契约      依赖变更／导出变更／职责变更
L1 是 L2 的折叠，L2 是 L3 的折叠，L3 是代码逻辑的折叠。
</ARCHITECTURE>

<L1_TEMPLATE>
# {项目名} - {一句话定位}

{技术栈用 + 连接}
<directory>
{目录}/ - {职责} ({N}子目录: {关键子目录}...)
</directory>
<config>
{文件} - {一句话用途}
</config>
法则：极简·稳定·导航·版本精确
</L1_TEMPLATE>

<L2_TEMPLATE>
# {模块名}/

> L2 | 父级: {父路径}/AGENTS.md
> 成员清单
> {文件}.{ext}: {职责}，{技术细节}，{关键参数}
> 法则: 成员完整·一行一文件·父级链接·技术词前置
> [PROTOCOL]: 变更时更新此头部，然后检查 AGENTS.md
</L2_TEMPLATE>

<L3_TEMPLATE>
/**
 * [INPUT]: 依赖 {模块/文件} 的 {具体能力}
 * [OUTPUT]: 对外提供 {导出的函数/组件/类型/常量}
 * [POS]: {所属模块} 的 {角色定位}，与 {兄弟文件} 的关系
 * [PROTOCOL]: 变更时更新此头部，然后检查 AGENTS.md
 */

法则：INPUT 说清依赖什么，OUTPUT 说清提供什么，POS 说清自己是谁。
发现业务文件缺少 L3 头部，立即添加，阻塞级优先。
豁免（不要求、也不应添加 L3）：
- 配置与元数据：package.json、tsconfig.json、.gitignore、*.lock、CI 配置
- 无法承载注释的格式：*.json、*.yaml 等
- 占位标记：.gitkeep、空目录锚点
- 记忆与日志：.workbuddy/memory/ 等按日追加的记录
- 文档自身：AGENTS.md，已由 L1/L2 头部定义
判据：文件不承载业务逻辑，或其语法无法表达注释。报缺口前先按此过滤。
</L3_TEMPLATE>

<WORKFLOW>
正向：代码修改完成 → 检查 L3 → 检查 L2 → 检查 L1 → 任务完成
逆向：准备进入目录 → 读该目录 AGENTS.md → 读目标文件 L3 头部 → 开始工作
</WORKFLOW>

<FORBIDDEN>
死罪（立即中止）：
FATAL-001 孤立代码变更：改代码不检查文档，回滚
FATAL-002 跳过 L3 创建：发现缺失却继续
FATAL-003 删文件不更新 L2：成员清单残留
FATAL-004 新模块不创建 L2：文档黑洞
重罪（警告后修复）：
SEVERE-001 L3 过时：头部与代码不符
SEVERE-002 L2 不完整：存在未列入清单的文件
SEVERE-003 L1 过时：目录结构变化未反映
SEVERE-004 父级链接断裂
</FORBIDDEN>

<BOOTSTRAP>
进入项目时先检查 AGENTS.md：有则读取理解，无则准备播种；扫描目录，识别模块边界。
L1 缺失：从 package.json／go.mod 取技术栈后补写。
L2 缺失：列举文件、读前 50 行推断职责后补写。
L3 缺失：分析 import／export 推断位置后补写。
文档就绪后进入正常工作流，此后每次变更都回环检查。
</BOOTSTRAP>

<ADOPTION>
现有项目渐进生长，禁止为协议一次性制造大规模文档改动。
1. 旧代码不强制补齐 L2/L3，只补本次任务触达的范围。
2. 新增文件必须带 L3 头部。
3. 修改旧文件时若缺 L3，顺手补齐并保持与代码一致。
4. 新增、删除、重命名文件或重组目录时，更新对应模块 AGENTS.md。
5. 顶级模块、技术栈、构建方式、运行入口变化时，更新根 AGENTS.md。
原则：文档随真实变更生长，不为文档本身制造噪音。
</ADOPTION>

<VERIFICATION>
L2 与 L3 头部必须带有：[PROTOCOL]: 变更时更新此头部，然后检查 AGENTS.md
</VERIFICATION>
