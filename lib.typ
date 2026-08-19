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
