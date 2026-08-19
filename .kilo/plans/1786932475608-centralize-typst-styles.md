# 集中管理 Typst 样式：lib.typ 导出 chapter-style / book-style

## 背景与目标

- 仓库已由单文件拆为「根 `main.typ`（preamble + 31 个 `#include`）+ `src/<一级>/<二级>/main.typ`（纯内容）」，**拆分尚未提交**（`src/`、`lib.typ` 未跟踪，`main.typ` 已修改），`main.pdf` 为排版基线（约 440 页）。
- 问题：分文件单独预览时缺少根文件的 `set text`（zh / Microsoft YaHei UI）、`set math.vec`、`thmrules` 等样式。
- Typst 语义：`set`/`show` 只沿 `#include` 向下流动，`#import` 只取绑定不携带样式；分文件单独成文必须有入口激活。
- 目标：`lib.typ` 成为唯一样式源；章节 `main.typ` 仅含 1 行词汇 import + 1 行 `#show: chapter-style` + 纯内容；根 `main.typ` 变纯装配器；**主文档输出与基线逐页一致**。

## 已定决策

1. 激活方式：**方案 A**——章节 `main.typ` 内加 `#show: chapter-style`（用户选定）。
2. `chapter-style` **不含 zebraw**（整文档模板双重应用会改页面几何，破坏基线）。独立预览时不出现 zebraw 页面框架，属已知且接受的取舍。
3. 保留文件名 `lib.typ`（31 处 `#import "../../../lib.typ"` 路径不变）。
4. `book-style` 参数化：书级元数据（title/authors/bib/索引开关）由根传入，lib 不含书籍数据。
5. `show: thmrules` 进入 `chapter-style`（预览需要定理样式；书内双重应用预期幂等，由验证门禁把关）。

## 文件变更

### 1. `lib.typ`（重写，唯一新增逻辑）

```typst
#import "@preview/ctheorems:1.1.3": thmbox, thmrules
#import "@preview/zebraw:0.6.1": zebraw
#import "@preview/ilm:2.0.0": ilm

#let theorem = thmbox("theorem", "定理", fill: rgb("#eeffee"), breakable: true)
#let definition = thmbox("definition", "定义", fill: rgb("#eefaff"), breakable: true)
#let example = thmbox("example", "例题", fill: rgb("#ffffee"), breakable: true)

#let chapter-style(body) = {
  set text(lang: "zh", font: "Microsoft YaHei UI")
  set math.vec(delim: "[")
  show: thmrules
  body
}

#let book-style(
  body,
  title: [笔记本],
  authors: (),
  abstract: [],
  bibliography-src: none,
  figure-index: (enabled: false),
  table-index: (enabled: false),
  listing-index: (enabled: false),
) = {
  set text(lang: "zh", font: "Microsoft YaHei UI")
  set math.vec(delim: "[")
  show: zebraw
  show: ilm.with(
    title: title,
    authors: authors,
    abstract: abstract,
    bibliography: bibliography-src,
    figure-index: figure-index,
    table-index: table-index,
    listing-index: listing-index,
  )
  show: thmrules
  body
}
```

注意：`book-style` 内部顺序必须与现根 preamble 完全一致（set text → set vec → zebraw → ilm → thmrules），不得调换。

### 2. 根 `main.typ`（重写头部，include 区原样保留）

```typst
#import "lib.typ": book-style
#show: book-style.with(
  title: [笔记本],
  authors: "half-tree",
  abstract: [],
  bibliography-src: bibliography("refs.bib"),
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true),
)

= 工科数学
#include "src/工科数学/微积分/main.typ"
…（其余 30 行 #include 与各级标题原样保留）
```

### 3. 31 个 `src/**/main.typ`（每个文件改 2 处）

- 第 1 行：`#import "../../../lib.typ": theorem, definition, example` → 追加 `, chapter-style`
- 新增第 2 行：`#show: chapter-style`（其后空一行再接正文，保持现状布局）

## 实施顺序（试点 → 门禁 → 批量）

1. **试点**：完成变更 1、2 + 仅对最小章节 `src/计算机与工程知识/三维建模/main.typ` 做变更 3。
2. **门禁验证（试点）**：
   - `typst compile main.typ`（输出到临时目录）成功；页数 == `main.pdf` 基线页数。
   - 若有 `pdftotext`/`pdfinfo`（`Get-Command` 探测）：对基线与新输出做文本层逐页 diff；否则用 PDF 查看器人工抽查：各章交界页、含定理/定义的页、含 `math.vec` 的数学页、含代码块的页（如 `src/计算机与工程知识/计算机操作系统基本知识/main.typ` ~108 行）。
   - `typst compile src/计算机与工程知识/三维建模/main.typ` 成功，且字体/数学定界符/定理盒样式正确（无 zebraw 页面框架属预期）。
3. **批量**：对其余 30 个文件做变更 3。
   - 优先用逐文件编辑工具；若用 PowerShell 脚本批处理，必须以 UTF-8 无 BOM 写回（`[System.IO.File]::WriteAllText($p, $s, [System.Text.UTF8Encoding]::new($false))`），**禁止** `Set-Content` 默认编码，防止中文乱码。批量后抽查 1–2 个文件内容完好。
4. **终验**：
   - 重编译根文档，页数与抽样比对同步骤 2。
   - PowerShell 循环独立编译全部 31 个章节文件（输出到临时目录），全部成功无报错。

## 风险与回退

| 风险 | 表现 | 回退 |
|---|---|---|
| `thmrules` 双重应用 | 书内定理编号/样式变化 | 从 `chapter-style` 移除 `show: thmrules`（预览定理盒仍有填色，仅缺编号装饰） |
| 字体 set 覆盖 ilm 内部字体 | 书内正文字体变化 | 从 `chapter-style` 移除 font 参数（预览字体退化为默认，书恢复） |
| 编码损坏 | 批量改写后中文乱码 | 从 git/备份恢复，改用逐文件编辑工具 |

任何回退后必须重跑步骤 2 门禁。

## 范围外（明确不做）

- zebraw 出现在章节独立预览中（未来可选：`sys.inputs` 守卫，受限于 Typstify 是否支持注入 input，未证实）。
- `lib.typ` 改名或重构为本地 package。
- git 提交操作（工作区当前有未提交改动，保持原样，除非用户另行要求）。

## 参照

- 历史拆分计划：`.kilo/plans/1784256458619-typst-split-by-headings.md`（作用域结论：`#let` 不跨 `#include`，`set`/`show` 可下传）。
