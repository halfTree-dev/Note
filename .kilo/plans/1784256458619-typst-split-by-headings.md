# 将 main.typ 按一级/二级标题拆分为 src/ 多文件结构

## 目标
将单一 16026 行的 `main.typ`（CRLF）拆分为 `src/<一级标题>/<二级标题>/main.typ` 结构，每节配独立 `images/` 目录；根 `main.typ` 改为装配器（preamble + `#include`）。**排版/页数必须与现状一致（基线 440 页）。**

## 已核实事实（实测 + 代码核对）
- **Typst 作用域**（已用 typst 实测）：`#set`/`#show`/`#import @preview` 在根 main.typ 中会作用于被 `#include` 的内容；但 `#let` **不**跨 `#include` 传递（报 `unknown variable`）。→ `theorem/definition/example` 必须抽到根 `lib.typ`，每个子文件 `#import`。
- 无 `#cite`；`refs.bib` 仅配置未使用 → 留根目录，路径不变。
- 所有一级/二级标题文本**合法**，可作 Windows 文件夹名（无 `:/*?"<>|`）。
- 图片：251 张被引用（0 缺失）/33 张孤立/2 张跨章节共享。已确认任一章节内**无**同名 basename 冲突 → 统一 basename 改写安全。
- typst.exe 已安装；`.gitignore` 忽略 `/refs` 与 `main.pdf`；`refs/` 是参考资料目录（与编译无关，保持不动）。

## 已确认决策
1. **一级标题 `=` 放根 main.typ**（作为装配器/索引）；每个二级子文件 main.typ 仅含 `== 二级标题` + 正文。
2. **33 张孤立图片**：按当前 `images/一级/二级` 归属移入最匹配的章节 `images/`（见下方映射表）。

## 目标结构
```
Note/
├── main.typ              # 装配器：preamble + = 一级 + #include
├── lib.typ               # 共享：theorem/definition/example（NEW）
├── refs.bib              # 不动
├── src/
│   ├── 工科数学/
│   │   ├── 微积分/{main.typ, images/}
│   │   ├── 级数/{main.typ, images/}
│   │   ├── 微分方程/{main.typ, images/}
│   │   ├── 复变函数/{main.typ, images/}
│   │   ├── 概率与统计/{main.typ, images/}
│   │   ├── 系统的介绍/{main.typ, images/}
│   │   ├── 三大变换与系统的频域、复频域、Z域分析方法/{main.typ, images/}
│   │   ├── 状态变量法/{main.typ, images/}
│   │   ├── 采样信号的分析/{main.typ, images/}
│   │   └── 系统的图表示方法/{main.typ, images/}
│   ├── 工科物理/{ 经典力学, 电磁学, 光学, 现代物理, 物理实验方法 }（各含 main.typ+images）
│   ├── 电子电路/{ 电路的基本定律, 电路的基本分析方法, 电路的复频域分析, 半导体器件, 放大电路, 信号调制, 传输线变压器, 振荡器, 逻辑电路, 电力电子 }
│   └── 计算机与工程知识/{ 计算机的基本结构与运行原理, 计算机操作系统基本知识, 计算机高级编程语言, 通信协议与时序逻辑汇总 }
└── (旧 images/ 目录在验证通过后删除)
```

## 根 lib.typ（新建，内容固定）
```typst
#import "@preview/ctheorems:1.1.3": thmbox

#let theorem = thmbox("theorem", "定理", fill: rgb("#eeffee"), breakable: true)
#let definition = thmbox("definition", "定义", fill: rgb("#eefaff"), breakable: true)
#let example = thmbox("example", "例题", fill: rgb("#ffffee"), breakable: true)
```

## 根 main.typ（重写为装配器）
保留现有 preamble 的全部 import/set/show；删除原 3 行 `#let theorem/definition/example`（已迁 lib.typ）；删除全部正文。结构：
```typst
#import "@preview/ilm:2.0.0": *
#import "@preview/zebraw:0.6.1": *
#import "@preview/ctheorems:1.1.3": *
#import "lib.typ": *

#set text(lang: "zh")
#set text(font: "Microsoft YaHei UI")
#set math.vec(delim: "[")

#show: zebraw
#show: thmrules
#show: ilm.with(
  title: [笔记本],
  authors: "half-tree",
  abstract: [],
  bibliography: bibliography("refs.bib"),
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true),
)

= 工科数学
#include "src/工科数学/微积分/main.typ"
#include "src/工科数学/级数/main.typ"
#include "src/工科数学/微分方程/main.typ"
#include "src/工科数学/复变函数/main.typ"
#include "src/工科数学/概率与统计/main.typ"
#include "src/工科数学/系统的介绍/main.typ"
#include "src/工科数学/三大变换与系统的频域、复频域、Z域分析方法/main.typ"
#include "src/工科数学/状态变量法/main.typ"
#include "src/工科数学/采样信号的分析/main.typ"
#include "src/工科数学/系统的图表示方法/main.typ"

= 工科物理
#include "src/工科物理/经典力学/main.typ"
#include "src/工科物理/电磁学/main.typ"
#include "src/工科物理/光学/main.typ"
#include "src/工科物理/现代物理/main.typ"
#include "src/工科物理/物理实验方法/main.typ"

= 电子电路
#include "src/电子电路/电路的基本定律/main.typ"
#include "src/电子电路/电路的基本分析方法/main.typ"
#include "src/电子电路/电路的复频域分析/main.typ"
#include "src/电子电路/半导体器件/main.typ"
#include "src/电子电路/放大电路/main.typ"
#include "src/电子电路/信号调制/main.typ"
#include "src/电子电路/传输线变压器/main.typ"
#include "src/电子电路/振荡器/main.typ"
#include "src/电子电路/逻辑电路/main.typ"
#include "src/电子电路/电力电子/main.typ"

= 计算机与工程知识
#include "src/计算机与工程知识/计算机的基本结构与运行原理/main.typ"
#include "src/计算机与工程知识/计算机操作系统基本知识/main.typ"
#include "src/计算机与工程知识/计算机高级编程语言/main.typ"
#include "src/计算机与工程知识/通信协议与时序逻辑汇总/main.typ"
```

## 每个子文件 main.typ 头部（统一）
```typst
#import "../../../lib.typ": theorem, definition, example

<原 [a,b) 行范围内的内容，== 二级标题 为首行，image 路径已改写>
```
> import 路径恒为 3 层 `../../../`（嵌套深度统一为 src/一级/二级）。

## 节→行范围映射（提取区间 [a, b)，b 为下一标题行号）
| 一级 | 二级 | 行 [a, b) |
|---|---|---|
| 工科数学 | 微积分 | [30, 543) |
| | 级数 | [543, 915) |
| | 微分方程 | [915, 1427) |
| | 复变函数 | [1427, 2450) |
| | 概率与统计 | [2450, 3351) |
| | 系统的介绍 | [3351, 3978) |
| | 三大变换与系统的频域、复频域、Z域分析方法 | [3978, 5528) |
| | 状态变量法 | [5528, 5964) |
| | 采样信号的分析 | [5964, 6342) |
| | 系统的图表示方法 | [6342, 6735) |
| 工科物理 | 经典力学 | [6737, 7068) |
| | 电磁学 | [7068, 8410) |
| | 光学 | [8410, 9595) |
| | 现代物理 | [9595, 10127) |
| | 物理实验方法 | [10127, 10235) |
| 电子电路 | 电路的基本定律 | [10237, 10381) |
| | 电路的基本分析方法 | [10381, 10625) |
| | 电路的复频域分析 | [10625, 10689) |
| | 半导体器件 | [10689, 10873) |
| | 放大电路 | [10873, 11784) |
| | 信号调制 | [11784, 12345) |
| | 传输线变压器 | [12345, 12488) |
| | 振荡器 | [12488, 12853) |
| | 逻辑电路 | [12853, 13053) |
| | 电力电子 | [13053, 13371) |
| 计算机与工程知识 | 计算机的基本结构与运行原理 | [13375, 15086) |
| | 计算机操作系统基本知识 | [15086, 15566) |
| | 计算机高级编程语言 | [15566, 15870) |
| | 通信协议与时序逻辑汇总 | [15870, 16027) |

> 根 main.typ 的 4 个 `=` 标题对应原行：L28 工科数学 / L6735 工科物理 / L10235 电子电路 / L13371 计算机与工程知识（这些行不进入任何子文件）。

## 图片迁移算法
1. **改写规则（统一、安全）**：对每个子文件正文，正则替换
   `image\("images/[^"]*/([^"/]+)"` → `image("images/$1"`
   （仅保留 basename，前缀改为本节 `images/`）。
2. **被引用图片（251）**：按"引用出现所在章节"决定目标。对每条引用 `(原路径 P, 所在节 S)`：
   源 = `images/<P 中的一级>/<二级>/<basename>`；目标 = `src/<S.一级>/<S.二级>/images/<basename>`。**复制**（先复制不删除原文件，便于回滚）。
3. **2 张跨章节共享图片**（各被 2 节引用）→ 分别复制到两个目标节；同名 basename 落不同文件夹，无冲突：
   - `电子电路/半导体器件/半导体器件-8.png` → 半导体器件 + 放大电路
   - `电子电路/半导体器件/开关管与其驱动与半桥-5.png` → 半导体器件 + 电力电子
4. **孤立图片（33）按下表归入最匹配节**（复制；遇目标已存在同名且字节相同则跳过去重）：

| 孤立图片（相对 images/） | → 目标节 |
|---|---|
| 工科数学/三大变换/conv.png | 工科数学/三大变换与系统的频域、复频域、Z域分析方法 |
| 工科数学/微积分/similar-matrix.png | 工科数学/微积分 |
| 工科数学/微积分/vector-field.png | 工科数学/微积分 |
| 工科数学/系统分析方法/连续信号的频域分析.png | 工科数学/三大变换与系统的频域、复频域、Z域分析方法 ⚠️归属模糊，标注待人工复核 |
| 工科物理/物理实验方法/young-modulus-1..4.png | 工科物理/物理实验方法 |
| 电子电路/信号调制/信号调理技术-7.png、信号调理技术-8.png | 电子电路/信号调制 |
| 电子电路/信号调制/振幅调制、解调与混频-1.png、振幅调制、解调与混频-2.png | 电子电路/信号调制 |
| 电子电路/放大电路/半导体器件-8.png | 电子电路/放大电路 |
| 电子电路/电源转换/lm317.png、lm317-2/3/4.png | 电子电路/电力电子 |
| 电子电路/电源转换/开关管与其驱动与半桥-1/2/3/5.png | 电子电路/电力电子（其中 -5 与被引用副本字节相同→去重） |
| 电子电路/电路的基本分析方法/二端口网络.png、电压采样电路-1..5.png | 电子电路/电路的基本分析方法 |
| 计算机与工程知识/计算机的基本结构与运行原理/MSTATUS寄存器.png | 同名节 |
| 计算机与工程知识/通信协议/BLDC半桥驱动电路.png、BLDC控制流程线.png、BLDC线圈效果.png、BLDC结构示意图.png、BLDC驱动电路.png | 计算机与工程知识/通信协议与时序逻辑汇总 |

> 去重凭据：`开关管与其驱动与半桥-5.png` 两源 MD5=`F7A6194D...` 相同；`半导体器件-8.png` 两源 MD5=`671CE0E9...` 相同（落不同节文件夹，不冲突）。

## 任务清单（顺序执行）
1. 新建 `lib.typ`（内容见上）。
2. 按映射表创建全部 `src/<一级>/<二级>/` 与各自 `images/` 子目录（共 29 节）。
3. 逐节：抽取原 main.typ 行 [a,b) → 写入 `src/.../main.typ`，前置 import 头部，并对该段执行图片路径改写。
4. 逐引用：把源图片**复制**到对应节 `images/<basename>`；2 张共享图复制到两个节。
5. 按上表把 33 张孤立图复制到目标节 `images/`（去重）。
6. 重写根 `main.typ` 为装配器（内容见上）。
7. **验证**（见下）；通过后再 `Remove-Item images/ -Recurse` 删除旧目录。

## 验证（验收标准，全部须过）
- `typst compile main.typ` **exit 0**，无 `unknown variable`、无 missing image 错误。
- 输出 PDF **页数 == 440**（与基线 main.pdf 一致）。
- 抽检：随机 5 节各打开，确认图、定理框（theorem/definition/example 着色与编号）、目录/索引正常。
- 用 git diff 复核：根 main.typ 仅含 preamble+include；正文已全部迁出。

## 风险与注意
- **不可改写 `===/====/=====` 等更深标题**：它们在节内，跟随节内容原样迁移；标题层级不受影响。
- 行号体系：以 Read/grep 的 1..16026 为准（早先 `Measure-Object` 的 11094 为其管线计数 bug，勿用）。
- 文件为 CRLF；写入子文件时保持 CRLF，避免无关 diff。
- 单个子文件单独编译会显示"裸"样式（无 ilm 包裹），属预期；只通过根 main.typ 验收。
- 个别超大节（三大变换 1550 行、计算机的基本结构 1711 行、电磁学 1342、光学 1185、复变函数 1023）按用户要求维持二级粒度不进一步拆分；如需后续可再按 `===` 细分（本次范围外）。
