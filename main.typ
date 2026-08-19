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
#include "src/计算机与工程知识/三维建模/main.typ"
#include "src/计算机与工程知识/排版软件/main.typ"