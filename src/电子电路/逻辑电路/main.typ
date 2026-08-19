#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style

== 逻辑电路

逻辑电路指的是可以使用逻辑函数进行描述的电路，描述该电路系统的表达式被称作逻辑表达式。

=== 逻辑代数
要设计一个逻辑电路，首先需要确定该电路的功能需求，然后根据需求设计出对应的逻辑表达式，这其中逻辑代数是一个重要的工具。

在逻辑代数中，逻辑变量 $A, B, C, ...$ 只能取值 0 或 1；逻辑函数 $f(A, B, C, ...)$ 的输出也只能取值 0 或 1；逻辑函数的运算符包括 AND（与）、OR（或）、NOT（非）等。

对于这三种逻辑函数，对应的真值表如下所示
#align(center)[
  #block(
    table(
      columns: (1fr, 1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[A]],
        [#text(weight: "bold")[B]],
        [#text(weight: "bold")[A AND B]]
      ),
      [1], [0], [0],
      [1], [1], [1],
      [0], [0], [0],
      [0], [1], [0],
    )
  )
]

#align(center)[
  #block(
    table(
      columns: (1fr, 1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[A]],
        [#text(weight: "bold")[B]],
        [#text(weight: "bold")[A OR B]]
      ),
      [1], [0], [1],
      [1], [1], [1],
      [0], [0], [0],
      [0], [1], [1],
    )
  )
]

#align(center)[
  #block(
    table(
      columns: (1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[A]],
        [#text(weight: "bold")[NOT A]]
      ),
      [1], [0],
      [0], [1],
    )
  )
]

AND, OR, NOT 也可以由 $dot.op, +, not$ 算符表示，以构建逻辑表达式。同时具有运算优先级，NOT > AND > OR，括号可以用来改变运算优先级。

在三种基本逻辑函数的基础上，有一些常见的复合逻辑函数
#align(center)[
  A NAND B = not (A AND B)

  A NOR B = not (A OR B)

  A XOR B = (A AND not B) OR (not A AND B)
]

逻辑代数中，有一些基本运算定律，用以简化逻辑表达式

#align(center)[
  #block(
    table(
      columns: (1fr, 2fr),
      align: center,
      table.header(
        [#text(weight: "bold")[名称]],
        [#text(weight: "bold")[表达式描述]]
      ),
      [重叠律], [$A + A = A, A dot A = A$],

      [分配律], [$A dot (B + C) = A dot B + A dot C, \ A + (B dot C) = (A + B) dot (A + C)$],

      [德摩根定律], [$not (A dot B) = not A + not B, not (A + B) = not A dot not B$],

      [双重否定律], [$not (not A) = A$],

      [恒等律], [$A + 0 = A, A dot 1 = A, A + 1 = 1, A dot 0 = 0$]
    )
  )
]

=== 析取范式与合取范式
析取范式与合取范式指的是仅包含两级逻辑的逻辑表达式
#definition("析取范式与合取范式")[

析取范式指的是形为若干个合取项（与项）之间再做析取（或）的逻辑表达式，形如
$
  (A_1 dot A_2 dot ... dot A_n) + (B_1 dot B_2 dot ... dot B_m) + ...
$

合取范式指的是形为若干个析取项（或项）之间再做合取（与）的逻辑表达式，形如
$
  (A_1 + A_2 + ... + A_n) dot (B_1 + B_2 + ... + B_m) dot ...
$

表达式中的 $A_i, B_j$ 等项可以是逻辑变量，也可以是逻辑变量的否定项，例如 $A_i$ 可以是 $A$ 或 $not A$。
]

特殊的，任何逻辑命题都可以被表示为析取范式或合取范式。

#theorem("任何逻辑命题都可以被表示为析取范式或合取范式")[

  观察真值表，对于每一个输出为 1 的输入，都可以构造唯一一个合取式 $A_1 dot A_2 dot ... dot A_n$ ，使得仅对于该组输入，该合取式的输出为 1；
  将所有输出为 1 的输入对应的合取式进行析取，就得到了一个析取范式；

  同理，将上述析取范式取反为 $not(B_1 + B_2 + ... + B_n)$，其中 $B_n$ 是合取式，可以构造仅当输入为特定值时输出为 0 的合取式；

  而依照德摩根定律，$not(B_1 + B_2 + ... + B_n) = not B_1 dot not B_2 dot ... dot not B_n$；而又对于每个取反合取式 $not B_i$，又依照德摩根定律，$not B_i = not (C_1 dot C_2 dot ... dot C_m) = not C_1 + not C_2 + ... + not C_m$，其中 $C_m$ 是析取式。

  所以，取反析取范式完全可以表达为合取范式。

  这意味着可以构造一个合取范式，使得仅在特定的输入下输出为 0，这和析取范式仅在特定输入下输出为 1 的情况是对称的，所以任何逻辑命题也都可以被表示为合取范式。

  综上所述，任何逻辑命题都可以被表示为析取范式或合取范式。
]

析取范式和合取范式的价值在于其表明任何逻辑命题都可以被表示为仅包含两级逻辑的逻辑表达式，这是可编程逻辑阵列（PLA）设计的基础。

=== 卡诺图

卡诺图是一种以表格方式表示逻辑函数的工具，可以用来简化逻辑表达式。卡诺图的行和列分别对应逻辑变量的不同取值组合，表格中的每个单元格对应一个特定的输入组合，其值为该输入组合下逻辑函数的输出。

例如，一个全加器的卡诺图如下所示

#align(center)[
  #block(
    inset: 8pt,
    radius: 6pt,
    table(
      columns: (1.4fr, 1fr, 1fr, 1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[$C_"in" slash "AB"$]],
        [#text(weight: "bold")[00]],
        [#text(weight: "bold")[01]],
        [#text(weight: "bold")[11]],
        [#text(weight: "bold")[10]],
      ),
      [#text(weight: "bold")[0]], [0], [1], [0], [1],
      [#text(weight: "bold")[1]], [1], [0], [1], [0],
    )
  )

  $S = A xor B xor C_"in"$

  #block(
    inset: 8pt,
    radius: 6pt,
    table(
      columns: (1.4fr, 1fr, 1fr, 1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[$C_"in" slash "AB"$]],
        [#text(weight: "bold")[00]],
        [#text(weight: "bold")[01]],
        [#text(weight: "bold")[11]],
        [#text(weight: "bold")[10]],
      ),
      [#text(weight: "bold")[0]], [0], [0], [1], [0],
      [#text(weight: "bold")[1]], [0], [1], [1], [1],
    )
  )

  $C_("out") = A B + A C_"in" + B C_"in"$
]

此处，$C_"in"$ 是全加器的输入进位，$A, B$ 是全加器的两个输入数位，$S$ 是全加器的和输出，$C_("out")$ 是全加器的输出进位。

卡诺图作为表格，其行和列是逻辑变量的格雷编码而非单独的逻辑变量，这使得两个相邻的表格项仅有一处逻辑变量相异。

=== 晶体管逻辑电路

==== TTL NAND

TTL NAND 指的是用一种多发射极三极管构成的逻辑门电路，如下所示
#figure(image("images/TTLNAND.png", width: 75%),
  caption: [
    TTL NAND 电路图
  ]
)

回顾 BJT 的半导体特性，以 NPN 三极管为例，其基极为 P 型半导体，集电极和发射极为 N 型半导体；在讨论三极管的开关特性时，可以将三极管看作两个二极管，分别是基极到集电极的二极管和基极到发射极的二极管。

二极管可以被视为一种开关模型，当二极管两端电压小于其截止电压，二极管电阻无穷大，表现为开路；当二极管两端电压大于其截止电压，二极管电阻很小，表现为短路。

