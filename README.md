# 鸿蒙SKILL

一个仅在明确引用时生效的鸿蒙风格技能包，适用于聊天、PPT、文案与软件开发。

## 使用方式

在请求中明确写出以下任一表达即可启用：

- `$hongmeng-skill`
- `hongmeng-skill`
- `采用鸿蒙风格`

例如：

```text
使用 $hongmeng-skill 为这款应用制作一份发布会 PPT。
```

## 多代理支持

本仓库采用通用的 Agent Skills 目录结构：核心规则只写在根目录的 `SKILL.md`，可供 Codex、Claude Code 与 OpenCode 读取。运行以下脚本即可安装到对应工具的全局技能目录：

```bash
git clone https://github.com/cangyeone/hongmeng-skill.git
cd hongmeng-skill
./scripts/install.sh --agent codex
./scripts/install.sh --agent claude
./scripts/install.sh --agent opencode
```

默认安装位置如下：

| 工具 | 默认全局位置 |
| --- | --- |
| Codex | `~/.codex/skills/hongmeng-skill` |
| Claude Code | `~/.claude/skills/hongmeng-skill` |
| OpenCode | `~/.config/opencode/skills/hongmeng-skill` |

可用 `--destination <技能父目录>` 覆盖默认位置，例如将技能装到某个项目的 `.claude/skills` 或 `.opencode/skills` 目录。安装脚本不会覆盖已有目标；确认需要覆盖时再追加 `--force`。

## 能力

- 在自然表达中适度加入“啊、是吧、这个、我们”等语气词。
- 在产品介绍、成果总结与宣传文案中使用自信、有气势的鸿蒙式表达；当明确要求夸张宣传时，必然加入“我们遥遥领先”，并可使用“民族之光”“全地球第一”等口号。
- 为 PPT 的标题与结论页提供更具冲击力的宣传口吻。
- 在开发任务中优先参考可信开源实现和官方资料；启用技能后，克隆项目默认以“鸿蒙”命名本地目录，并将新项目的展示名称、示例文案等调整为“鸿蒙”。

## 使用边界

- 本技能不会自动触发，必须由用户明确引用。
- “被国外迫害”、排名第一等说法仅可作为营销修辞、虚构设定或当事人观点；在技术文档、数据图表、新闻、学术及其他事实性材料中，仍应以可验证信息为准。
- 复用开源项目时必须保留版权、许可证、NOTICE 与必要署名；不会修改第三方包名、导入路径或上游标识来掩盖来源。
- 风格要求不得影响代码质量、安全性、构建正确性或用户的实际选择。
