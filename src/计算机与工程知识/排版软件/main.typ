#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style

== 排版软件

=== Typst

Typst 是一个可编程标记语言，相当适合用来排版。在 Typst 中，可以使用类 Markdown 的算法引入排版格式。

Typst 作为标记语言，一切内容都是元素。例如一段文本是一个 `text` 元素实例，一段使用 `=` 声明的标题是一个 `heading` 元素实例。一段 `$ vec(a, b) $ ` 是一个 `math.equation` 元素实例。

要创建元素，可以使用元素函数，如使用 `heading()` 函数创建 `heading` 元素，以下的两段代码是等价的

```typ
= 你好
#heading([你好], level: 1)
```

==== Typst 重要关键字

除基本标记符号以外，以下关键字和语句在排版中有重要作用。

- `let`

```typ
#let theorem = thmbox("theorem", "定理", fill: rgb("#eeffee"), breakable: true)
#let custom-style(body) = {
  body
}
```

`let` 可以将某个数值、函数或内容等元素声明别名。

- `set`

```typ
#set text(lang: "zh", font: "Microsoft YaHei UI")
```

`set` 指定某类元素在当前作用域下，构造的所有同类实例的默认参数。
例如上述语句，所有接下来创建 `text` 实例的 `lang` 字段默认值将是 `zh`，除非另有指定。

- `show`

```typ
#show heading: it => it.body
#show: thmrules
```

`show` 有两种使用方法，替换或打包执行

`#show [函数] : [表达式]` 将会令下文使用该函数构造的元素实例替换为表达式的值；

`#show : [函数]` 将会将所有下文打包为函数的 body 参数，并执行该函数。

- `import`

```typ
#import "../../../lib.typ": theorem, definition, example
```

`import` 从指定文件中，提取某些模块，并不携带其它规则。

- `include`

```typ
#include "src/工科数学/微积分/main.typ"
```

`include` 将将所有位于文件中的内容原地展开到当前文件。

==== Typst 第三方库

以下介绍一些 Typst 第三方库及其作用原理。

- ctheorems

thmbox 是一个函数，根据传入的文本内容，其返回一个 figure，具备定理框的样式，将用户文本置放到对应框内。故调用 thmbox 可以制造定理环境。

thmrules 是一个函数，将调用 show 根据设置替换 thmbox 文本打造特定样式，启用之使用 show 的打包执行功能，将下文输入该函数
```typ
#show: thmrules
```

- codly

codly-init 是一个函数，该函数将调用 show 根据设置替换 raw 代码块打造特定样式，因此，调用时使用 show 的打包执行功能，将下文输入该函数
```typ
#let code-style(body) = {
  show: codly-init.with()
  body
}
```

==== 本手册的排版策略

```typ
#import "@preview/ctheorems:1.1.3": thmbox, thmrules
#import "@preview/codly:1.3.0": codly-init
#import "@preview/ilm:2.0.0": ilm

#let theorem = thmbox("theorem", "定理", fill: rgb("#eeffee"), breakable: true)
#let definition = thmbox("definition", "定义", fill: rgb("#eefaff"), breakable: true)
#let example = thmbox("example", "例题", fill: rgb("#ffffee"), breakable: true)

// 代码块美化
#let code-style(body) = {
  show: codly-init.with()
  body
}

// 章节级样式
#let chapter-style(body) = {
  set text(lang: "zh", font: "Microsoft YaHei UI")
  set math.vec(delim: "[")
  show: code-style
  show: thmrules
  body
}

// 书级样式
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
  show: code-style
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

首先，使用 `let` 定义 `thmbox` 的别名，为不同的用途定义不同的函数；然后，定义两个样式函数，接受整个下文作为参数；对于单独分立文件而言，针对其预览需求，对文件单独使用 chapter-style 样式，应用 code-style 和 thmrules 即可；对于整个笔记本而言，使用 book-style 样式，在先前的基础上再加入 ilm 的应用。

主要的 main.typ 的样式引用

```typ
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

#include ".../main.typ"
```

每分立文档 main.typ 的样式引用

```typ
#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style
```

在分立文档预览中，其受到 chapter-style 的影响；在总文档预览中，其同时受到 chapter-style 和 book-style 的影响。但由于后者和前者除 ilm 外设置均一致，所以没有影响，总文档仍然可以正常排版。