#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style

== 计算机高级编程语言

计算机高级编程语言是指那些抽象程度较高、接近人类语言的编程语言，相较于先前讨论的汇编语言，计算机高级编程语言提供了更丰富的语法和功能，使得程序员能够更高效地编写代码。

高级编程语言要转化为计算机能够理解和执行的机器码，有两种主流的实现方式：编译和解释；编译是将高级语言代码一次性翻译成机器码，生成一个可执行文件；解释则是逐行读取高级语言代码，并在运行时将其翻译成机器码并执行。

- 编译

  要将高级语言代码编译成机器码，通常需要一个编译器（Compiler），它是一个专门的软件工具，用于将高级语言代码翻译成机器码。简言之，编译器获取源代码，产生一个二进制文件。

  // 在此叙述一些关于编译的基本细节

- 解释

  解释器（Interpreter）是一种软件工具，用于逐行读取，解释并直接执行高级语言代码；

  // 在此叙述一些关于解释的基本细节

=== C

C 语言是一种通用的、面向过程式的计算机程序设计语言，其具有高可靠、高性能、可移植的特点。广泛用于系统编程、嵌入式开发、操作系统内核开发等领域；C 语言的设计原则是“信任程序员、保持简洁、贴近硬件、追求高效”。



=== Python

=== Javascript & TypeScript

=== CSharp


=== HTML, CSS 和 Vue.js

HTML 是一种用于创建网页的标记语言，CSS 是一种用于描述网页样式的样式表语言；HTML 定义了网页的结构和内容，而 CSS 则定义了网页的外观和布局。在此基础上，Vue.js 是将 HTML 和 CSS 结合起来的一个流行的 JavaScript/TypeScript 框架，用于构建用户界面和单页应用程序，是 Web 前端开发的主流工具之一。

==== HTML 和 CSS 的基本组织

接下来的文章将介绍笔者认为的 HTML 和 CSS 的基本设计理念、原则和范式，而不具体讨论各类标签和属性的使用细节。

===== HTML 与元素

HTML 本质是一门标记语言，其设计原则是语义化，即通过使用具有特定语义的标签来描述网页的结构和内容，以便于浏览器和搜索引擎能够更好地理解网页的意义，例如对于以下 HTML 代码

```html
<div class="article">
  <h1>这是一个标题</h1>
  <p>这是一个段落。</p>
</div>
```

基于标签 `<h1>` 和 `<p>` 的语义，浏览器能够理解这是一个标题和一个段落，并据此进行适当的渲染。

几乎所有的标签都成对出现#footnote[也有单标签，如 `<br/>`]，每对标签及其内容可以构成一个元素。*一个 HTML 文档总是由若干个元素构成的树状结构。*
```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" type="image/svg+xml" href="/logo.png" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>无人船控制平台</title>
  </head>
  <body>
    <div id="app"></div>
    <script type="module" src="/src/main.ts"></script>
  </body>
  <footer>
    <p>无人船控制平台 西北工业大学 航海学院</p>
    <p>Made By half-tree | 2026</p>
  </footer>
</html>
```
上面的 HTML 代码展示了一个基本的 HTML 文档结构，其中 `<html>` 是根元素，包含了 `<head>` 和 `<body>` 两个子元素；`<head>` 元素包含了文档的元数据和链接资源，而 `<body>` 元素则包含了网页的主要内容；此外，`<footer>` 元素用于定义网页的页脚信息。

HTML 包含许多不同类型的元素，以承担其在版式设计中的不同职责，实现不同功能；一般而言，常用的元素可以分为以下几类：

- 页面分区元素

  用于定义网页的不同区域，例如 `<header>`、`<nav>`、`<main>`、`<footer>`

  不同的分区元素具有不同的语义，尤其是浏览器和搜索引擎可以根据这些语义来理解网页的结构和内容，从而进行适当的渲染和索引。

- 内容分区元素

  用于定义内容的不同部分，常用的标签有

    - `<div>`, `<span>`：这些标签创建一个容器，容器中可以布局其他元素，令其共享一块整体空间和样式。这两个标签的不同之处在于前者将创建一个块级元素，而后者将创建一个行内元素；详见后文 CSS 中对应概念的介绍。

    - `<section>`, `<article>`：这些标签用于定义文档中的独立部分，`<section>` 用于定义一个主题相关的内容区域，而 `<article>` 用于定义一个独立的、完整的内容块。

- 文本修饰元素

  用于定义文本的不同部分，常用的标签有 `<h1>`-`<h6>`（标题元素）、`<p>`（段落元素）、`<a>`（链接元素）、`<li>`（列表项元素）；浏览器将根据这些标签的语义来渲染文本，并为文本赋予特定的行为。

- 表单元素

  用于创建交互式表单，常用的标签有 `<form>`（表单元素）、`<input>`（输入元素）、`<button>`（按钮元素）；这些标签允许用户输入数据并提交到服务器进行处理。

- 图片、视频和多媒体

  用于嵌入图片、视频和其他多媒体内容，常用的标签有 `<img>`（图片元素）、`<video>`（视频元素）、`<audio>`（音频元素）；这些标签允许网页展示丰富的媒体内容。

通过合理组织本部分元素，即可构建出具有清晰结构和良好语义的 HTML 文档。

===== CSS 的修饰能力

CSS 使得网页设计者能够通过定义样式规则来控制网页的外观和布局。

尽管大模型已经具有强大的前端代码生成能力，了解基础排版设计也是有帮助的。

====== 行内元素和块级元素

行内元素是无需在排版上转移到下一行，和其它行内元素共享一行并自动换行的元素，如 `<span>` 和 `<a>`；块级元素则是会独占一行的元素，其宽度总是和父容器宽度一致，迫使其他元素换行，例如 `<div>`。

块级元素 `display: block` 可以设置其占用块的大小，使用
```css
.box {
    width: 300px;
    height: 200px;
    min-width: 200px;
    max-width: 100%;
}
```

使用 margin 可以设置外边距，padding 可以设置内边距
```css
.card {
    margin: 20px 15px 20px 15px;  /* 上 右 下 左 */
    padding: 10px 20px;           /* 上下10 左右20 */
}
```

对于行内元素 `display: inline`，元素大小的设置、margin 和 padding 的上下设置部分将被忽略。可以采用将元素设置为 `display: inline-block` 来将元素作为行内元素的同时保留块的特性。

使用 `align` 标签可以对齐元素
```css
.text-with-icon .icon {
    vertical-align: middle;     /* 图标与文字中线对齐 */
}
```

使用 `transform` 标签可以微调元素位置
```css
.icon {
    display: inline-block;
    transform: translateY(2px);   /* 下移 2px */
}
```

使用 `justify-items`，`align-items` 来规定容器内元素的对齐方式
```css
.container {
    display: grid;
    /* 子元素在自己格子内的水平对齐 */
    justify-items: center;    /* start | end | center | stretch(默认) */
    /* 子元素在自己格子内的垂直对齐 */
    align-items: center;      /* start | end | center | stretch(默认) */
}
```

使用 `justify-self`，`align-self` 来规定自己在容器内的对齐方式
```css
.container {
    /* 仅此元素在格子内的水平对齐 */
    justify-self: end;        /* 靠右 */
    align-self: start;        /* 顶部对齐 */
}
```


====== 使用 CSS Grid 进行二维元素排布

CSS Grid 可以将若干个块级元素以表格的形式分区分布到网页的各个部分#footnote[可以进一步参考 https://ruanyifeng.com/blog/2019/03/grid-layout-tutorial.html]

指明一个容器为 `grid` 网格，可以使用
```css
.container {
  display: grid;
  grid-template-columns: 100px 100px 100px;
  grid-template-rows: 100px 100px 100px;
  grid-template-areas: "header header header"
                      "main main sidebar"
                      "footer footer footer";
}
```
使用不同字符指明表格的不同区域。

接下来，为子元素引用区域名来排版
```css
.header  { grid-area: header; }
.main    { grid-area: main; }
.sidebar { grid-area: sidebar; }
.footer  { grid-area: footer; }
```

```html
<div class="container">
    <div class="header">页头</div>
    <div class="main">主内容</div>
    <div class="sidebar">侧栏</div>
    <div class="footer">页脚</div>
</div>
```

====== 使用 Flexbox 对指定子块区域进行排布

Grid 将内容在平面上展开，而具体到 Grid 的一个表格项，若要在一个格子内将元素按照一个方向展开，可以利用 Flexbox 实现。

指明一个容器为 `flex` 类型，该容器被认为为 Flexbox
```css
.flex-container {
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    justify-content: center;
    align-items: center;
}
```

Flexbox 中的元素将按照 `flex-direction` 的方向排列，按照 `flex-wrap` 决定是否换行，并遵守对齐模式。


====== 使用其它修饰符为 UI 添加独特风格和渐入动画

现代大模型已经很擅长生成特定视觉风格的 UI，此处仅记录笔者使用过的特性

- `background`

要构建图片与蒙版，应当使用 `background` 系列标签。
```css
.glass-card {
    background-image:
        linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.6)), /* 半透明遮罩 */
        url("photo.jpg");                                   /* 底图 */
    background-size: cover;
    background-position: center;
}
```

- `color`

要编辑颜色和透明度，采用
```css
.badge {
    background-color: rgba(255, 255, 255, 0.15);
    color: #fff;
}
```

- `border-radius`

圆角
```css
.frosted-panel {
    border-radius: 16px;
}
```

- `box-shadow`

阴影
```css
.frosted-panel {
    box-shadow: 0 8px 32px rgba(0,0,0,0.3);
}
```

- `:hover` `:active`

交互伪类，在交互时触发指定样式
```css
.btn {
    background: linear-gradient(135deg, #667eea, #764ba2);
    transition: all 0.3s ease;
}
.btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px rgba(102,126,234,0.5);
    filter: brightness(1.1);
}
.btn:active { transform: translateY(0); }
```

===== HTML 的标准编程接口：DOM

DOM 指代 Document Object Model，即文档对象模型，是 HTML 文档的标准编程接口。

DOM 将 HTML 文档标准化，令如 Javascript 一类的脚本语言能够通过 API 读取和修改文档的结构

```js
document.getElementById('app');
el.textContent = 'hello';
el.setAttribute('class', 'active');
el.appendChild(child);
```

==== Vue.js

Vue.js 是流行的前端 Javascript 框架（也支持 Typescript），其通过响应式设计侦测数据变化，并产出 VNode（一种对于真实 DOM 的轻量表示），通过新旧 VNode 的对比，差分数据将被应用到真实 DOM 上。

Vue.js 项目由 Vue 组件和组织它们的脚本构成。

Vue 组件由 `template` `script` 和 `style` 构成，分别写有带 Vue 模板语法的 HTML、Javascript / Typescript脚本、CSS 样式文件。

