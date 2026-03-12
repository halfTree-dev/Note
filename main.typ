#import "@preview/ilm:2.0.0": *

#set text(lang: "zh")
#set text(font: "Microsoft YaHei UI")

#set math.vec(delim: "[")

#import "@preview/zebraw:0.6.1": *
#show: zebraw

#show: ilm.with(
  title: [笔记本],
  authors: "half-tree",
  abstract: [
  ],
  bibliography: bibliography("refs.bib"),
  figure-index: (enabled: true),
  table-index: (enabled: true),
  listing-index: (enabled: true),
)

#import "@preview/ctheorems:1.1.3": *
#show: thmrules
#let theorem = thmbox("theorem", "定理", fill: rgb("#eeffee"), breakable: true)
#let definition = thmbox("definition", "定义", fill: rgb("#eefaff"), breakable: true)
#let example = thmbox("example", "例题", fill: rgb("#ffffee"), breakable: true)

= 工科数学

== 微积分

微积分是一种数学工具，用于研究连续变化的函数；包含微分学和积分学两个部分，对极限、微分、积分等概念进行系统的研究。

=== 一元函数

=== 多元函数
多元函数指的是一个函数有多个自变量，例如说 $f \( x \, y \)$ 就是一个二元函数，$f \( x \, y \, z \)$ 是一个三元函数。

多元函数的微分学和积分学与一元函数有很多相似之处，但也有一些重要的区别。

==== 多元函数的类型

多元函数除了可以通过自变量的数量来分类之外，还可以根据函数的值域来分类；主要分为标量多元函数和矢量多元函数两类。

标量多元函数指的是函数的值域是实数集的函数，例如说 $z = f \( x \, y \); x, y, z in bb(R)$ 就是一个标量二元函数。

矢量多元函数指的是函数的值域是向量空间的函数，例如说 $F \( x \, y \) = P \( x \, y \) hat(i) + Q \( x \, y \) hat(j)$ 就是一个矢量二元函数。其中 $hat(i)$ 和 $hat(j)$ 分别是 $x$ 和 $y$ 方向上的单位向量。

多元函数用于表示一个“场”，描述某个量针对多个自变量对应区域的分布关系。前者用于表示一个标量场，例如说区域内的温度场、压力场等；后者用于表示一个向量场，例如说速度场、力场等。

==== 标量场的微分

===== 多元函数的可微
对于多元函数，若对其各个自变量取一个极小增量，那么函数值也会有一个小增量，以二元函数举例
$
Delta z = f \( x + Delta x \, y + Delta y \) - f \( x \, y \)
$

对于这个增量做线性近似，如果说存在线性函数，使得对于任意的增量 $Delta x$ 和 $Delta y$，都有
$
d z = A Delta x + B Delta y
$

使得两者之差为增量距离的高阶无穷小

$ lim_(rho arrow.r 0) frac(Delta z - d z, rho) = 0 $

那么我们能称函数可微。

直观来说，函数在某点可微意味着在该点附近，函数的增量可以被一个线性函数良好近似。这意味着函数的变化趋势可以被一个平面（对二元函数）所表现，就像一元函数的切线一样。

===== 多元函数的偏导数
出于多元函数包含多个自变量，故其因变量值受到多个自变量的影响，因此我们可以对每个自变量分别求导，得到偏导数。

仍然以二元函数举例，多元函数的偏导数被定义为
$
  frac(partial f,partial x) = lim_(Delta x arrow.r 0) frac(f(x + Delta x, y) - f(x, y), Delta x) \
  frac(partial f,partial y) = lim_(Delta y arrow.r 0) frac(f(x, y + Delta y) - f(x, y), Delta y)
$

即在求偏导数时，我们将其他自变量视为常数，仅对一个自变量进行求导，得到的结果就是该自变量的偏导数。

偏导数反映了函数在某个自变量方向上的变化率，描述了函数在该方向上的局部线性近似，在这个方向上，我们还是可以以研究一元函数切线的方式来分析函数在该方向上的变化趋势。

偏导数存在的函数不一定可微，但函数可微一定存在偏导数。参考如下的证明

#theorem("偏导数存在与可微性的关系")[
  如果 $z = f \( x \, y \)$ 在点
  $\( x \, y \)$ 可微，那么函数在该点的偏导数 $f_x \( x \, y \)$ 和
  $f_y \( x \, y \)$ 存在，则 $d z = f_x(x, y) d x + f_y(x, y) d y$

  由可微的定义，存在常数 $A$ 和 $B$，$rho = sqrt((Delta x)^2 + (Delta y)^2)$，使得

  $ lim_(rho -> 0) frac(Delta z - (A Delta x + B Delta y), rho) = 0 $

  首先证明 $f_x(x, y)$ 存在且等于 $A$：
  令 $Delta y = 0$，则 $rho = abs(Delta x)$，此时有

  $ lim_(Delta x -> 0) frac(f(x + Delta x, y) - f(x, y) - A Delta x, abs(Delta x)) = 0 $

  这等价于

  $ lim_(Delta x -> 0) frac(f(x + Delta x, y) - f(x, y), Delta x) = A $

  由偏导数的定义 $f_x(x, y) = A$，类似地，令 $Delta x = 0$，可证 $f_y(x, y) = B$。

  因此，当函数在点 $(x, y)$ 可微时，有

  $ d z = f_x(x, y) d x + f_y(x, y) d y $

  由此，我们知道当函数可微时，线性函数的常数值等于偏导数的值，这也说明偏导数存在是函数可微的必要条件。
]

===== 多元函数的全微分

全微分指的是函数在某点的增量可以被一个线性函数良好近似，并且这个线性函数的常数值等于该点的偏导数值。

对于二元函数 $f \( x \, y \)$，如果函数在点 $\( x \, y \)$ 可微，那么函数在该点的全微分为
$
d z = f_x(x, y) d x + f_y(x, y) d y
$

===== 连续的偏导数与可微性

若函数 $f \( x \, y \)$ 在点
$\( x_0 \, y_0 \)$ 的某个邻域内有偏导数，且这些偏导数在点
$\( x_0 \, y_0 \)$ 处连续，则 $f \( x \, y \)$ 在点 $\( x_0 \, y_0 \)$
可微，证明如下

#theorem("连续的偏导数与可微性")[

  设函数 $f \( x \, y \)$ 在点 $\( x_0 \, y_0 \)$
  的某个邻域内有偏导数，且这些偏导数在点 $\( x_0 \, y_0 \)$ 处连续

  考虑函数的增量
  $ Delta z = f(x_0 + Delta x, y_0 + Delta y) - f(x_0, y_0) $

  利用中值定理，存在 $theta_1, theta_2 in (0, 1)$ 使得
  $ Delta z = f_x(x_0 + theta_1 Delta x, y_0 + Delta y) Delta x + f_y(x_0, y_0 + theta_2 Delta y) Delta y $

  令 $d z = f_x(x_0, y_0) Delta x + f_y(x_0, y_0) Delta y$，则
  $ Delta z - d z = [f_x(x_0 + theta_1 Delta x, y_0 + Delta y) - f_x(x_0, y_0)] Delta x + [f_y(x_0, y_0 + theta_2 Delta y) - f_y(x_0, y_0)] Delta y $

  由于偏导数在 $(x_0, y_0)$ 处连续，当 $(Delta x, Delta y) -> (0, 0)$ 时
  $ f_x(x_0 + theta_1 Delta x, y_0 + Delta y) - f_x(x_0, y_0) -> 0 $

  $ f_y(x_0, y_0 + theta_2 Delta y) - f_y(x_0, y_0) -> 0 $

  设 $rho = sqrt((Delta x)^2 + (Delta y)^2)$，则

  $ frac(abs(Delta z - d z), rho) <= frac(abs(f_x(x_0 + theta_1 Delta x, y_0 + Delta y) - f_x(x_0, y_0)) abs(Delta x), rho) + frac(abs(f_y(x_0, y_0 + theta_2 Delta y) - f_y(x_0, y_0)) abs(Delta y), rho) $

  由于 $frac(abs(Delta x), rho) <= 1$ 且 $frac(abs(Delta y), rho) <= 1$，当 $rho -> 0$ 时上式趋向于零，因此

  $ lim_(rho -> 0) frac(Delta z - d z, rho) = 0 $

  这表明 $f(x, y)$ 在点 $(x_0, y_0)$ 可微。

  所以，偏导数的存在是函数可微的必要条件，而偏导数的连续则又是函数可微的充分条件。
]

根据上述内容，我们可以总结出如下关系图。

#figure(image("images/工科数学/微积分/differential-connection.png"),
  caption: [
    关系图
  ]
)

// 以后学到了在补充矢量场的微分，这涉及到 Jacobian 矩阵

==== 场的积分

在一元函数的概念中，积分指的是函数在一个区间上的累积量，或者说是函数图像与 $x$ 轴之间的有向面积。多元函数的积分概念与一元函数类似，其也与累积量有关

// 在此补充微分元和累加的内容

// 拉梅系数

==== 回顾点乘和叉乘

点乘又称标量积，对于两个空间#footnote[下列讨论在三维空间中。]中的向量，点乘的结果是一个标量，定义为
$
a dot.op b = abs(a) abs(b) cos theta
$
其中 $theta$ 是两个向量之间的夹角，$abs(a)$ 和 $abs(b)$ 分别是向量 $a$ 和 $b$ 的模长。

特别的，在直角坐标系中，$a = a_x hat(i) + a_y hat(j) + a_z hat(k)$ 和 $b = b_x hat(i) + b_y hat(j) + b_z hat(k)$，且由于任何一个基底和另外两个基底都是垂直的，所以有 $hat(i) dot.op hat(j) = hat(i) dot.op hat(k) = hat(j) dot.op hat(k) = 0$，又有 $hat(i) dot.op hat(i) = hat(j) dot.op hat(j) = hat(k) dot.op hat(k) = 1$，因此此时的点乘可以被写作
$
a dot.op b = a_x b_x + a_y b_y + a_z b_z
$

叉乘又称向量积，对于两个空间中的向量，叉乘的结果是一个向量，定义为
$
a times b = abs(a) abs(b) sin theta hat(n)
$
其中 $theta$ 是两个向量之间的夹角，$abs(a)$ 和 $abs(b)$ 分别是向量 $a$ 和 $b$ 的模长，$hat(n)$ 是一个单位向量，垂直于 $a$ 和 $b$ 所在的平面，并且按照右手定则#footnote[右手从 $a$ 绕向 $b$，大拇指即指向 $n$。]确定其方向。

特别的，在直角坐标系（右手系）中，$a = a_x hat(i) + a_y hat(j) + a_z hat(k)$ 和 $b = b_x hat(i) + b_y hat(j) + b_z hat(k)$，且由于任何一个基底和另外两个基底都是垂直的，所以有 $hat(i) times hat(j) = hat(k)$，$hat(j) times hat(k) = hat(i)$，$hat(k) times hat(i) = hat(j)$，又有 $hat(i) times hat(i) = hat(j) times hat(j) = hat(k) times hat(k) = 0$，因此此时的叉乘可以被写作
$
a times b = (a_y b_z - a_z b_y) hat(i) + (a_z b_x - a_x b_z) hat(j) + (a_x b_y - a_y b_x) hat(k)
$

用行列式来表示会更好记忆
$
  a times b =
  vec(
    hat(i) quad & hat(j) quad & hat(k) &,
    a_x quad & a_y quad & a_z &,
    b_x quad & b_y quad & b_z &
  )
$

==== 标量场的梯度
对于标量场，梯度是一个描述场在空间中变化率的向量场。以三元函数举例，对于标量场 $f \( x \, y \, z \)$，其梯度定义为
$
"grad" f = frac(partial f, partial x) hat(i) + frac(partial f, partial y) hat(j) + frac(partial f, partial z) hat(k)
$

一个标量场的梯度是一个矢量场，它的每个分量都是标量场在对应方向上的偏导数，矢量场在一个位置的值表示了标量场在该位置最大变化率的方向和大小，这也被称作该点的梯度向量。

如果在空间中沿着与梯度向量的点积为 `0` 的方向移动，那么标量场的值将保持不变，如果沿着这些方向运动，运动轨迹构成一个封闭曲线/面，那么这个封闭曲线/面上的标量场值都是相同的，这被称作等值线/面，在等值线/面上函数的值保持不变。#footnote[也可以推断，对应不同函数值的等值线/面永不相交，否则在交点处函数值就不唯一了。]

在此引入 nabla 算子，写作 $nabla$，梯度也可以记作
$ "grad" f = nabla f $


==== 矢量场的散度、旋度和相关公式

对于标量场，有梯度可以描述其场强在空间中的变化率；对于矢量场，有散度和旋度来描述其场强在空间中的性质。#footnote[注意，下面的所有讨论都基于三元函数的矢量场，对于非三元函数的矢量场，旋度无法定义，因为叉积的定义需要三个分量。]

===== 通量、散度和高斯公式

通量指的是某种事物在单位时间内流过单位面积的属性量，例如风流过窗户，水流过阀门。一种事物的通量可以表示它的输送强度。对于三维矢量场而言，通量指的是在指定的曲面上，各处流体场强度 $F$ 和曲面法向量 $hat(n)$ 的内积进行积分，积分区域是曲面。

$ W = integral.double_Sigma F \( x \, y \, z \) dot.op hat(n) \( x \, y \, z \) med d S $

这个积分的计算可以使用有向投影来完成，设 $hat(n) = \( c o s alpha \, c o s beta \, c o s gamma \)$

那么对于指定的面积微元 $d S$，将其近似为平面，则它和 $y O z$，$x O z$，$x O y$ 三个平面的夹角分别为 $alpha \, beta \, gamma$，这可以用两平面夹角公式推出。

所以说，面积微元和夹角余弦值的乘积是其在对应面上投影的面积微元，如下所示

$ d S cos alpha = \| d y thin d z \| \, quad d S cos beta = \| d x thin d z \| \, quad d S cos gamma = \| d x thin d y \| $

所以，通量积分可以改写为：

$ W = integral.double_Sigma F dot.op hat(n) med d S \

= integral.double_Sigma \( F_x cos alpha + F_y cos beta + F_z cos gamma \) med d S \

= integral.double_(D_(y z)) F_x med d y d z + integral.double_(D_(x z)) F_y med d x d z + integral.double_(D_(x y)) F_z med d x d y $

$D_(y z)$, $D_(x z)$, $D_(x y)$ 分别表示曲面 $Sigma$ 在 $y O z$, $x O z$, $x O y$ 坐标平面上的有向投影，当投影角 $theta in \[ 0 \, pi \/ 2 \)$，投影面积为正，否则为负。

直接计算该积分略显复杂，为了更好地研究矢量场的通量，我们引入了散度的概念，散度是一个标量场，定义为

$ upright("div") F = frac(partial P, partial x) + frac(partial Q, partial y) + frac(partial R, partial z) $

也可以被写作 $ upright("div") F = nabla dot.op F $

矢量场的通量和散度之间的关系可以被高斯公式所描述：若向量场 $F \( x \, y \, z \) = F_x \( x \, y \, z \) hat(i) + F_y \( x \, y \, z \) hat(j) + F_z \( x \, y \, z \) hat(k)$ 在区域 $V$ 内具有连续的一阶偏导数，且 $S$ 为包围该区域的闭合曲面（取外法向），则

$ integral.double_S F dot.op hat(n) thin d S = integral.triple_V nabla dot.op F thin d V $

上式的证明如下

#theorem("高斯公式")[
  通过分别证明三个分量的情况来完成对高斯公式的证明。首先考虑 $F = F_x hat(i)$，即只有 $x$ 分量的情况。根据前面的投影公式，我们有

  $ integral.double_S F_x cos alpha med d S = integral.double_(D_(y z)) F_x med d y d z $

  将 $D_(y z)$ 投影区域看作 $y O z$ 平面上的区域，我们可以将这个积分变为

  $ integral.double_(D_(y z)) F_x \( x \, y \, z \) d y d z = integral_(y_1)^(y_2) integral_(z_1)^(z_2) \( F_x \( x_2 \, y \, z \) - F_x \( x_1 \, y \, z \) \) d z d y $

  其中 $F_x \( x_2 \, y \, z \)$ 和 $F_x \( x_1 \, y \, z \)$ 是该闭合曲面的上面和下面分别的投影，由于两者法向量方向相反，所以是相减的关系。

  又有右边的式子实际上是

  $ integral_(y_1)^(y_2) integral_(z_1)^(z_2) \( F_x \( x_2 \, y \, z \) - F_x \( x_1 \, y \, z \) \) d z d y = \ integral_(y_1)^(y_2) integral_(z_1)^(z_2) integral_(x_1)^(x_2) frac(partial F_x, partial x) d x d z d y = integral.triple_V frac(partial F_x, partial x) d x d y d z $

  因此

  $ integral.double_S F_x cos alpha d S = integral.triple_V frac(partial F_x, partial x) d x d y d z $

  类似地，对 $F_y$ 和 $F_z$ 也可以得到相应的等式

  $ integral.double_S F_y cos beta d S = integral.triple_V frac(partial F_y, partial y) d x d y d z $

  $ integral.double_S F_z cos gamma d S = integral.triple_V frac(partial F_z, partial z) d x d y d z $

  将三个等式相加，得到

  $ integral.double_S \( F_x cos alpha + F_y cos beta + F_z cos gamma \) d S = integral.triple_V \( frac(partial F_x, partial x) + frac(partial F_y, partial y) + frac(partial F_z, partial z) \) d x d y d z $

  即

  $ integral.double_S F dot.op hat(n) d S = integral.triple_V nabla dot.op F d V $
]

高斯公式是有方向的，若定义闭合曲面的法向量为内法向，则高斯公式的右边需要加一个负号。

对于向量场 $F \( x \, y \, z \) = F_x \( x \, y \, z \) hat(i) + F_y \( x \, y \, z \) hat(j) + F_z \( x \, y \, z \) hat(k)$ 而言，散度表明了在向量场中流体的发散强度。对于一个点 $P$ 而言，考虑一个包裹它的无穷小的体积元素，那么这一点的发散强度可以理解为

$ W = integral.triple_Sigma upright("div") F \( P \) d V $

对于这个点而言，若其 $upright("div") F \( P \) > 0$，那么我们知道这个点相当于一个"源"，流体总的来说正在向外流出；$upright("div") F \( P \) < 0$时，这个点相当于一个"洞"，流体总的来说正在向内流入。

$upright("div") F \( P \) = 0$，说明对于该点，流体的收支平衡。特别的，如果对于一整个区域，$upright("div") F = 0$ 都成立，那么称这个区域的向量场是无源场。

===== 环量、旋度和斯托克斯公式

环量指的是力场沿着封闭曲线的积分。如果在向量场 $F$ 中，有一封闭曲线 $Gamma$，那么称

$ integral.cont_Gamma F d r = integral.cont_Gamma P d x + Q d y + R d z $

为向量场 $F$ 沿着 $Gamma$ 的环量。

直接计算该积分略显复杂，为了更好地研究矢量场的环量，我们引入了旋度的概念，旋度是一个矢量场，定义为

$ upright("rot") F = arrow(i) (frac(partial R, partial y) - frac(partial Q, partial z)) + arrow(j) (frac(partial P, partial z) - frac(partial R, partial x)) + arrow(k) (frac(partial Q, partial x) - frac(partial P, partial y)) $

也可以被写作 $ upright("rot") F = nabla times F $

矢量场的旋度和环量之间的关系可以被斯托克斯公式所描述：设 $S$ 是一个定向光滑曲面，其边界是一个闭合曲线 $Gamma$（按照右手法则给定方向，四指绕向边缘线积分的方向，大拇指即指向曲面法向量正方向），如果向量场 $F \( x \, y \, z \)$ 在包含 $S$ 和 $Gamma$ 的区域内具有连续的一阶偏导数，则有

$ integral.cont_Gamma F dot.op d r = integral.double_S upright("rot") F dot.op d S $

斯托克斯公式表明了区域的旋度和区域边界上的环量的关系，沿着闭合曲线 $Gamma$ 的环量等于穿过由该曲线围成的曲面 $S$ 的旋度通量。

#theorem("斯托克斯公式")[

  接下来我们证明斯托克斯公式，和证明高斯公式时一样，我们分开证明这个式子，先证明
  $ integral.double_Sigma frac(partial P, partial z) d z d x - frac(partial P, partial y) d z d y = integral.cont_(partial Sigma^+) P d x $

  右边的式子仅仅与 $d x$ 有关，故可将 $partial Sigma^+$ 投影到 $x O y$ 平面，得到投影的曲线 $partial D_(x y)^+$，有$integral.cont_(partial Sigma^+) P d x = integral.cont_(partial D_(x y)^+) P d x$

  对这个在 $x O y$ 平面上的曲线运用格林公式，设 $D_(x y)$ 是曲面在 $x O y$ 上的投影，那么有 $integral.cont_(partial D_(x y)^+) P d x = integral.double_D_(x y) -frac(partial P, partial y) - frac(partial P, partial z) frac(partial z, partial y) d x d y$

  接下来证明 $integral.double_Sigma frac(partial P, partial z) d z d x - frac(partial P, partial y) d z d y$ 也等于 $frac(partial P, partial z) frac(partial z, partial y) d x d y$，有对于曲面 $Sigma$，设其方程为 $z = z(x, y)$，那么曲面上的微元可以表示为 $d S = (-frac(partial z, partial x), -frac(partial z, partial y), 1) d x d y$

  所以有

  $ integral.double_Sigma frac(partial P, partial z) d z d x - frac(partial P, partial y) d z d y = integral.double_D_(x y) frac(partial P, partial z) dot 1 dot d x d y - frac(partial P, partial y) dot 1 dot d x d y \ = integral.double_D_(x y) (frac(partial P, partial z) - frac(partial P, partial y)) d x d y $

  由于 $z = z(x, y)$，函数 $P(x, y, z)$ 在曲面上实际上是 $P(x, y, z(x, y))$，应用链式法则 $frac(partial P, partial y) = frac(partial P, partial y) |_(z) + frac(partial P, partial z) frac(partial z, partial y)$，将此代入上式

  $ integral.double_Sigma frac(partial P, partial z) d z d x - frac(partial P, partial y) d z d y = integral.double_D_(x y) (frac(partial P, partial z) - frac(partial P, partial y) |_(z) - frac(partial P, partial z) frac(partial z, partial y)) d x d y $

  $ = integral.double_D_(x y) (-frac(partial P, partial y) |_(z) - frac(partial P, partial z) frac(partial z, partial y)) d x d y $

  这与我们前面得到的 $integral.cont_(partial D_(x y)^+) P d x$ 的表达式一致，所以等式成立。

  接下来对另外两个平面 $y O z$ 和 $x O z$ 上的投影也做同样的运算，将算式相加，即有

  $ integral.double_Sigma upright("rot") F dot.op d S = integral.double_Sigma (frac(partial R, partial y) - frac(partial Q, partial z)) d y d z + (frac(partial P, partial z) - frac(partial R, partial x)) d z d x + (frac(partial Q, partial x) - frac(partial P, partial y)) d x d y \ = integral.cont_(partial Sigma) P d x + Q d y + R d z = integral.cont_(partial Sigma) F dot.op d r $

  所以，斯托克斯公式成立。

]

斯托克斯公式的正方向依靠右手定则所确定，将手掌摊开为一个平面，大拇指和四指成直角，令四指指向曲线环绕方向，大拇指垂直于平面，则大拇指所指方向为法向量正向。

旋度反映了矢量场的旋转性质，描述了矢量场在空间中的旋转趋势和强度。对于一个点 $P$ 而言，考虑一个包裹它的无穷小的环面元素，那么这一点的旋转强度可以理解为

$ W = integral.double_Sigma upright("rot") F \( P \) dot.op d S $

对于这个点而言，若其 $upright("rot") F \( P \) != 0$，那么我们知道这个点相当于一个"旋转中心"，流体总的来说正在绕着这个点旋转；$upright("rot") F \( P \) = 0$，说明对于该点，流体没有旋转趋势。特别的，如果对于一整个区域，$upright("rot") F = 0$ 都成立，那么称这个区域的向量场是无旋场。

==== 关于场性质的恒等式

#theorem("标量场梯度的旋度为零")[
任何标量场梯度的旋度为 0
$ upright("rot") (nabla f) = 0 $
因为若沿着一个标量场中的闭合曲线 $Gamma$ 积分，那么从一点出发回到原点后，标量场函数值不改变，即
$
integral.cont_l nabla phi dot.op d l = d phi = 0
$
表明沿着闭合曲线作用的梯度场没有环量，所以它的旋度为零。
]

#theorem("矢量场旋度的散度为零")[
任何矢量场旋度的散度为 0
$ upright("div") (nabla times F) = 0 $
首先应当明确，若一曲面完全闭合，那么它没有边界，可视作旋度为 $0$。所以对该曲面上各点的旋度进行积分时，积分结果为 $0$。
$
  integral.double_S upright("rot") F dot.op d S = 0
$
又因为曲面闭合，所以将其利用高斯公式转化为体积积分时，得到
$
  integral.triple_V upright("div") (nabla times F) d V = 0
$
该体积积分总为 $0$，所以有原定理成立。
]


== 级数
=== 无穷级数
给定数列 $a_n$，称由该数列构成的表达式 $S = sum_(n = 1)^oo a_n$
为无穷级数。即无穷级数指的是一个数列所有项的和。

无穷级数是一个重要的工具，它可以用来表示各类函数，将函数化为多项式的和，例如一些常见的初等函数

$ sin \( x \) = sum_(n = 0)^oo frac(\( - 1 \)^n, \( 2 n + 1 \) !) x^(2 n + 1) $

还有很多常用的非初等函数，通常是一些解无法用初等函数表示的微分方程的解，例如#link("https://zhuanlan.zhihu.com/p/164894362")[高斯误差函数];，用来描述正态分布的累积分布函数

$ upright("erf") \( x \) = 2 / sqrt(pi) integral_0^x e^(- t^2) d t = sum_(n = 0)^oo frac(\( - 1 \)^n, n ! \( 2 n + 1 \)) x^(2 n + 1) $

借助无穷级数，我们还可以对一些函数进行近似计算与分析，如近似计算 $pi$

$ 1 / pi = frac(2 sqrt(2), 9801) sum_(n = 0)^oo frac(\( 4 n \) ! \( 1103 + 26390 n \), \( n ! \)^4 396^(4 n)) $

#quote(block: true)[
此为 Ramanujan 提出的 $pi$ 近似计算公式，收敛速度极快，几乎就是魔法。
]

总之，无穷级数的应用非常广泛，表示函数、近似计算、数值分析等都离不开无穷级数。

==== 收敛与发散
如果无穷级数 $S = sum_(n = 1)^oo a_n$ 的部分和 $S_n = sum_(k = 1)^n a_k$ 有极限

$ lim_(n arrow.r oo) S_n = S $

则称该无穷级数收敛，$S$ 称为该无穷级数的和。否则称该无穷级数发散。

不难看出，数列收敛的必要条件是其一般项收敛于 $0$，即

$ lim_(n arrow.r oo) a_n = 0 $

收敛的无穷级数还具有可加、数乘的性质

$ sum_(n = 1)^oo a_n + sum_(n = 1)^oo b_n = sum_(n = 1)^oo \( a_n + b_n \) $

$ sum_(n = 1)^oo c a_n = c sum_(n = 1)^oo a_n $

==== 正项级数收敛定理
如果无穷级数 $S = sum_(n = 1)^oo a_n$ 中的每一项
$a_n gt.eq 0$，则称其为正项级数；对于这类级数，我们有判定其收敛的基本定理。

如果对于级数的部分和 $S_n = sum_(k = 1)^n a_k$，存在正数 $M$ 使得

$ S_n lt.eq M \, forall n in bb(N)^(+) $

则该级数收敛。

注意，正项级数的部分和 $S_n$
是单调递增的，且有上界 $M$，根据数列的单调有界准则，数列一定收敛，所以其极限存在。

接下来介绍一些常用的判定正项级数收敛性的审敛法

===== 比较审敛法
对于两个正项级数 $sum_(n = 1)^oo a_n$ 和 $sum_(n = 1)^oo b_n$，如果有

$ lim_(n arrow.r oo) a_n / b_n = L $

+ 当 $L = C \( C eq.not 0 \)$ 时，则 $sum_(n = 1)^oo a_n$ 和
  $sum_(n = 1)^oo b_n$ 敛散性相同；

+ 当 $L = 0$ 时，则当 $sum_(n = 1)^oo b_n$ 收敛时，$sum_(n = 1)^oo a_n$
  也收敛。

+ 当 $L = oo$ 时，则当 $sum_(n = 1)^oo b_n$ 发散时，$sum_(n = 1)^oo a_n$
  也发散。

===== 比值审敛法
若 $sum_(n = 1)^oo a_n$ 为正项级数，有

$ lim_(n arrow.r oo) a_(n + 1) / a_n = L $

+ 当 $L < 1$ 时，则该级数收敛；
+ 当 $L > 1$ 时，则该级数发散；

#quote(block: true)[
$L = 1$ 时级数的收敛与否不能由此确定。
]

我们来证明比值审敛法，设 $L < 1$，则取一个适当小的 $epsilon.alt$，使得 $L + epsilon.alt < 1$，则存在正整数 $N$，使得当
$n > N$ 时，有

$ a_(n + 1) / a_n < L + epsilon.alt < 1 $

令 $r = L + epsilon.alt$，$r < 1$，则有

$ a_(n + 1) < r a_n -> a_(n + 2) < r^2 a_n -> dots.h -> a_(n + k) < r^k a_n $

这意味着数列 $\{ a_(n + 1), a_(n + 2), a_(n + 3), dots.h \}$ 的数列和应当小于 $\{ r a_n, r^2 a_n, r^3 a_n, dots.h \}$，而对于 $r < 1$ 的情况，后者的数列和是收敛的，因此前者也必定收敛。

$\{ a_(n + 1), a_(n + 2), a_(n + 3), dots.h \}$ 加上 $a_1, a_2, dots.h, a_N$ 之后，仍然是收敛的（有限项不影响数列的敛散性），因此 $sum_(n = 1)^oo a_n$ 收敛。

当 $L > 1$ 时，类似的可以得到该比值数列是发散的，因此 $sum_(n = 1)^oo a_n$ 也发散。

当 $L = 1$ 时，无法确定该级数的收敛性，调和级数就是一个例子。

===== 根值审敛法
若 $sum_(n = 1)^oo a_n$ 为正项级数，有

$ lim_(n arrow.r oo) root(n, a_n) = L $

+ 当 $L < 1$ 时，则该级数收敛；
+ 当 $L > 1$ 时，则该级数发散；

#quote(block: true)[
$L = 1$ 时级数的收敛与否不能由此确定。
]

根值审敛法的证明思路类似于比值审敛法，设
$L < 1$，则取一个适当小的 $epsilon.alt$，使得
$L + epsilon.alt < 1$，则存在正整数 $N$，使得当 $n > N$ 时，有

$ root(n, a_n) < L + epsilon.alt < 1 $

令 $r = L + epsilon.alt$，$r < 1$，则有

$ a_n < r^n -> a_(n + 1) < r^(n + 1) -> dots.h -> a_(n + k) < r^(n + k) $

这意味着数列 $\{ a_(n + 1), a_(n + 2), a_(n + 3), dots.h \}$ 的数列和应当小于 $\{ r^n, r^(n + 1), r^(n + 2), dots.h \}$，而对于 $r < 1$ 的情况，后者的数列和是收敛的，因此前者也必定收敛。

$\{ a_(n + 1), a_(n + 2), a_(n + 3), dots.h \}$ 加上 $a_1, a_2, dots.h, a_N$ 之后，仍然是收敛的（有限项不影响数列的敛散性），因此 $sum_(n = 1)^oo a_n$ 收敛。

当 $L > 1$ 时，类似的可以得到该比值数列是发散的，因此 $sum_(n = 1)^oo a_n$ 也发散。

当 $L = 1$ 时，无法确定该级数的收敛性。

===== 放缩与夹逼定理
要证明一个正项级数收敛，可以证明一个比它大的正项级数收敛；要证明一个正项级数发散，可以证明一个比它小的正项级数发散。

例如，对于 $p$ 级数 $sum_(n = 1)^oo 1 / n^p$，讨论其敛散性。

1. $p = 1$ 时，$sum_(n = 1)^oo 1 / n$ 是调和级数，发散；

2. $p < 1$ 时，$sum_(n = 1)^oo 1 / n^p >= sum_(n = 1)^oo 1 / n$，后者发散，故前者必定发散；

3. $p > 1$ 时的情况略为复杂，这里我们要用到积分将离散情况化为连续情况，出于

$ 1 / k^p = integral_k^(k + 1) k^(-p) d x <= integral_k^(k + 1) x^(-p) d x $

所以

$ S_n = 1 + sum_(k = 1)^n 1 / k^p <= 1 + integral_1^(n + 1) x^(-p) d x $

计算该积分，容易知道 $p > 1$ 时，$S_n$ 有上界，收敛。

==== 绝对收敛与条件收敛
不是所有级数都是正项级数，对于一个既有正项也有负项的级数，其收敛情况可分为绝对收敛与条件收敛。

若级数所对应的每一项的绝对值之和组成的级数 $sum_(n = 1)^oo \| a_n \|$
收敛，则称该级数绝对收敛；

而当 $sum_(n = 1)^oo \| a_n \|$ 发散但 $sum_(n = 1)^oo a_n$
收敛时，则称该级数条件收敛。

绝对收敛是比条件收敛更加严格的条件，绝对收敛的级数一定收敛。

为了从绝对收敛数列构造出原数列，不妨设

$ v_n = frac(\| u_n \| - u_n, 2) $

那么就有原数列可以被表示为

$ sum_(n = 1)^oo u_n = sum_(n = 1)^oo \| u_n \| - sum_(n = 1)^oo 2 v_n $

好在右边的两个级数都是收敛的，因此它们的差也是收敛的，所以绝对级数收敛的级数是收敛的。

由上面的证明，我们同时也可以得到绝对收敛级数的正项级数和负项级数
（$v_n$） 都是收敛的。同时，发散级数的正项级数和负项级数一定都是发散的。

==== 交错级数的特别审敛法
交错级数是指正负项交替的级数，形式为

$ sum_(n = 1)^oo \( - 1 \)^(n + 1) a_n $

其中 $a_n gt.eq 0$。

如果对于这样的一个交错级数，有

+ $a_n$ 单调递减，即 $a_(n + 1) lt.eq a_n$，
+ $lim_(n arrow.r oo) a_n = 0$

那么该级数一定收敛，这个审敛方法被称作莱布尼茨审敛法。

对于这样的一个级数，讨论其部分和
$S_(2 n)$，有

$ S_{2n} = a_1 - a_2 + a_3 - a_4 + dots.h + a_{2n-1} - a_{2n} $

适当添加括号，得到

$ S_{2n} = a_1 - (a_2 - a_3) - (a_4 - a_5) - dots.h - (a_{2n-2} - a_{2n-1}) - a_{2n} <= a_1 $

所以其部分和 $S_{2n}$ 有上界，又有

$ S_{2n} = S_{2n - 2} + (a_{2n-1} - a_{2n}) >= S_{2n - 2} $

所以其部分和 $S_{2n}$ 是单调递增的，因此 $S_{2n}$ 是收敛的。

与此同时，$S_{2n + 1} = S_{2n} + a_{2n + 1}$，而 $a_{2n + 1} arrow.r 0$，故 $S_{2n + 1}$ 与 $S_{2n}$ 收敛于同一处，所以 $S_{2n + 1}$ 也是收敛的。

综上所述，$S_{n}$ 是收敛的。

==== 黎曼重排定理
对于一个条件收敛的级数
$sum_(n = 1)^oo a_n$，可以通过重新排列其项的顺序来改变其和。

这里有一个黎曼重排定理的例子，对于交错调和级数，有

$ S = 1 - frac(1, 2) + frac(1, 3) - frac(1, 4) + frac(1, 5) - frac(1, 6) + frac(1, 7) - frac(1, 8) + dots.h = ln(2) $

$ frac(S, 2) = 0 + frac(1, 2) + 0 - frac(1, 4) + 0 + frac(1, 6) + 0 - frac(1, 8) + dots.h = frac(ln(2), 2) $

将两者按照对应位置交错相加，得到
$ frac(3 S, 2) = 1 + frac(1, 3) - frac(1, 2) + frac(1, 5) + frac(1, 7) - frac(1, 4) + frac(1, 9) + frac(1, 11) - frac(1, 6) + dots.h = frac(3 ln(2), 2) $

最下方的算式仅仅是对原级数的重新排列，然而它的和却是 $frac(3 ln(2), 2)$，而不是 $ln(2)$。

而对于绝对收敛的级数，重新排列其项的顺序#strong[一定];不会改变其和（读者大可以自己举几个例子），这也便是绝对收敛数列的交换律。

好了，现在定理摆在这里，下一个难题便是说明其正确性，我们引入一种特殊的重排方式：

+ 设 $S = sum_(n = 1)^oo a_n$
  是一个条件收敛的级数，分别将其所有正项和负项提取出来，得到两个级数
  $S_(+) = sum_(n = 1)^oo a_n^(+)$ 和 $S_(-) = sum_(n = 1)^oo a_n^(-)$。

以交错级数为例子，有

$ S = 1 - frac(1, 2) + frac(1, 3) - frac(1, 4) + frac(1, 5) - frac(1, 6) + dots.h $

那么

$ S_(+) = 1 + frac(1, 3) + frac(1, 5) + dots.h $

$ S_(-) = - frac(1, 2) - frac(1, 4) - frac(1, 6) - dots.h $

#block[
+ 接下来执行以下流程，从 $S_(+)$ 和 $S_(-)$ 中提取项目构建一个重排列
  $j$。
]

#figure(image("images/工科数学/级数/infinite-series.png", width: 60%),
  caption: [
    构建流程
  ]
)

#block[
+ 经过该流程，重排列 $j$ 一定会收敛到指定的常数 $A$。
]

为什么一定可以？因为在条件收敛时，$S_(+)$ 和 $S_(-)$ 都是发散的，若
$S_(+)$ 当前被提取的所有项的总和为 $B$，那么因为 $S_(-)$
是无界的，总存在 $S_(-)$ 的项使得其和趋近于
$A - B$，所以这种排列一定存在。

不过，对于绝对收敛的数列来说，收敛目标就不能指向任意值了，因为 $S_(+)$
和 $S_(-)$ 都是收敛的，所以两者都有界，使得 $S_(-)$ 的项使得其和趋近于
$A - B$ 的部分和数列也就不一定存在了。

这就是对于黎曼重排定理的原理的一种简单叙述。

==== 幂级数
形如

$ f \( x \) = c_0 + c_1 \( x - x_0 \)^1 + dots.h = sum_(n = 0)^oo c_n \( x - x_0 \)^n $

的函数为幂级数，$c_n$ 为常数数列，$x_0$ 为常数，此处规定即便
$x = x_0$，也有 $\( x - x_0 \)^0 = 1$。

这个级数不一定是收敛的，其敛散性主要由 $c_n \, x \, x_0$
的值决定，于是我们规定若是右式的幂级数在 $x = x_1$
的极限存在，则称该幂级数在该点收敛，否则称该幂级数该点发散；由所有的收敛点组成的集合称为该幂级数的#strong[收敛域];，同理也有发散域。

===== 阿贝尔定理
直觉告诉我们，一个幂级数的收敛域按道理是连续的，阿贝尔定理说明了这一点的正确性。

给定一个幂级数 $f \( x \) = sum_(n = 0)^oo c_n x^n$，如果该级数在
$x = x_0$ 收敛，则对于
$forall \| x \| lt.eq \| x_0 \|$，该级数也收敛；如果该级数在 $x = x_1$
发散，则对于 $forall \| x \| gt.eq \| x_1 \|$，该级数也发散。

由于

$ f \( x_0 \) = sum_(n = 0)^oo c_n \( x_0 \)^n $

收敛，故数列是有界的，设有 $M > 0$，使得 $| c_n \( x_0 \)^n | < M $

那么就有

$ | c_n x^n | < M \cdot | frac(x, x_0) |^n $

对于 $| x | < | x_0 |$，有 $| frac(x, x_0) | < 1$，故对于等比级数 $sum_(n = 0)^oo M \cdot | frac(x, x_0) |^n$，它是收敛的，所以该正项级数 $sum_(n = 0)^oo | c_n x^n |$ 也是收敛的。

所以 $sum_(n = 0)^oo c_n x^n$ 绝对收敛，该数列确实收敛。

要证明发散的情况，可以用反证法，若是有 $| x | > | x_1 |$ 令数列收敛，则按照之前证明的定理，则 $x = x_1$ 按道理也收敛，这与 $x = x_1$ 处发散是矛盾的。

所以说，幂级数 $f \( x \) = sum_(n = 0)^oo c_n x^n$ 的收敛域应当是一个以
$x = 0$ 为中心的连续区域，在该区域内，$f \( x \)$
是收敛的；在该区域外，$f \( x \)$ 是发散的，存在一个临界点
$x_0$，规定了这个区域的边界。

#box(image("images/工科数学/级数/infinite-series-2.png", width: 100%))

===== 收敛半径
我们称这个临界点 $x_0$ 为该幂级数的收敛半径，记为 $R$，那么有

+ $forall x in \( - R \, R \)$，$f \( x \)$ 收敛；
+ $forall x in \( - oo \, - R \) union \( R \, + oo \)$，$f \( x \)$
  发散；
+ $\| x \| = R$ 时，$f \( x \)$ 有可能收敛，也有可能发散。

对于幂级数 $sum_(n = 0)^oo c_n x^n$ 来说，其收敛半径 $R$
可以通过以下公式计算

$ R = lim_(n arrow.r oo) \| c_n / c_(n + 1) \| $

我们现在来说明其正确性，设 $R$ 为收敛半径，$\| x \| < R$，则有

$ lim_(n arrow.r oo) frac(\| c_(n + 1) x^(n + 1) \|, \| c_n x^n \|) = lim_(n arrow.r oo) frac(\| c_(n + 1) \|, \| c_n \|) \| x \| = frac(\| x \|, R) < 1 $

根据比值审敛法，该级数绝对收敛，所以该级数收敛。

同理，当 $\| x \| > R$，则有 $frac(\| x \|, R) > 1$，所以该级数发散。

此外，收敛半径的计算公式也可以写作

$ R = lim_(n arrow.r oo) 1 / root(n, \| c_n \|) $

证明过程同上，使用根值审敛法证明即可。

===== 泰勒级数
幂级数的形式长得就很像泰勒级数，好吧，确实，泰勒级数就是非常常见的一种幂级数。

根据泰勒公式，若 $f \( x \)$ 在 $x = x_0$ 处有 $k$ 阶导数，则有

$ f \( x \) = sum_(n = 0)^k frac(f^(\( n \)) \( x_0 \), n !) \( x - x_0 \)^n + R_k \( x \) $

其中 $R_k \( x \)$ 为余项，表示为

$ R_k \( x \) = frac(f^(\( k + 1 \)) \( eta \), \( k + 1 \) !) \( x - x_0 \)^(k + 1) $

其中 $eta$ 为 $x$ 和 $x_0$ 之间的某个点。

根据上述泰勒公式的启发，我们可以定义一个函数 $f \( x \)$ 的泰勒级数为

$ f \( x \) = sum_(n = 0)^oo frac(f^(\( n \)) \( x_0 \), n !) \( x - x_0 \)^n $

然而，泰勒级数是根据泰勒公式定义的，泰勒公式的成立是有条件的，为了让该幂级数能够收敛，我们应当保证

$ R_n \( x \) = frac(f^(\( n + 1 \)) \( eta \), \( n + 1 \) !) \( x - x_0 \)^(n + 1) $

$ lim_(n arrow.r oo) R_n \( x \) = 0 $

这是显然的，该条件即为泰勒级数收敛的条件，这也就意味着，函数可以表示为泰勒级数的充要条件是它可以进行泰勒展开。

有一些函数的任意 $n$
阶导数都存在，但是它的泰勒级数却不收敛，这种函数被称为#strong[非解析函数];，例如

$ f \( x \) = cases(delim: "{", e^(- 1 / x^2) & (x eq.not 0), 0 & (x = 0)) $

你会发现，$f \( x \)$ 在 $x = 0$ 处的任意阶导数都存在且都为
$0$（这是因为它的导函数必然是多项式和 $e^(- 1 / x^2)$
的乘积，而多项式的变化速度远比不上指数函数），但是如果按照泰勒级数展开，则有

$ f \( x \) = sum_(n = 0)^oo frac(f^(\( n \)) \( 0 \), n !) x^n = 0 $

显然 $f \( x \) equiv 0$
的结论是不成立的，这个函数的泰勒展开是无效的，所以说，任意 $n$
阶导数都存在仅仅是泰勒级数存在的必要条件，而不是充分条件。
== 微分方程

=== 常见微分方程的解法
含有未知函数导数或者微分的方程称为微分方程，满足相应条件的函数定义为微分方程的解。

这篇文章将介绍常见的微分方程及其通解求法。

==== 可分离变量的微分方程
$ frac(d y, d x) = h \( x \) g \( y \) $

形如这样的方程，可以通过移项来分离变量，分别积分求解。

$ integral frac(d y, g \( y \)) = integral h \( x \) d x $

需要注意的是，有些题目并不是直接运用分离变量法求解，而是先通过代换简化题目方程再代换。

例题1：先用代换再分离变量，求下列微分方程的通解

$
x (d y) / (d x) + x = cos(x + y)
$

首先令 $x + y = u$，则 $(d u) / (d x) = 1 + (d y) / (d x)$，那么原式化为

$
x (d u) / (d x) = cos(u)
$

此时可以分离变量求解

$
sec(u) dot d u = 1 / x dot d x
$

两边积分，所以通解为

$
| sec(x + y) + tan(x + y) | = | C x |
$

==== 一阶线性微分方程
形如这样的方程被称为一阶线性微分方程

$ frac(d y, d x) + P \( x \) y = Q \( x \) $

其中 $P \( x \)$ 和 $Q \( x \)$ 是关于 $x$
的函数，此类方程有通解，形式如下

$ y = \( integral Q \( x \) e^(integral P \( x \) d x) d x + C \) dot.op e^(- integral P \( x \) d x) $

关于上述公式的证明过程，可以参考#link("https://frp-arm.com:19964/%E7%BA%B8%E8%B4%A8%E7%AC%94%E8%AE%B0%E6%A0%8F%E7%9B%AE/%E7%AC%AC54%E9%A1%B5/#_2")[纸质笔记栏目];54页。

一个常用的计算小技巧是在计算 $e^(integral P \( x \) d x)$ 和
$integral Q \( x \) e^(integral P \( x \) d x) d x$
时不在得到的原函数上加常数，你可以尝试加上，最后你会发现它们会和原式中的常数
$C$ 融合。

一阶线性微分方程在物理上的动力学、电路上的一阶时域分析以及等等领域都有广泛应用，非常重要。

==== 伯努利方程
伯努利方程是一阶线性微分方程的推广，形如下方的这种方程被称为伯努利方程

$ frac(d y, d x) + P \( x \) y = Q \( x \) y^n $

其中 $P \( x \)$ 和 $Q \( x \)$ 是关于 $x$ 的函数，$n$ 是常数。当
$n = 0$ 时，伯努利方程退化为一阶线性微分方程；当 $n = 1$
时，方程可以通过分离变量法求解。

对于 $n eq.not 0 \, 1$
的情况，可以通过变量替换将伯努利方程转化为线性方程。令
$z = y^(1 - n)$，则

$ frac(d z, d x) = \( 1 - n \) y^(- n) frac(d y, d x) $

所以对方程两边同时除以 $y^n$，就有

$ y^(- n) frac(d y, d x) + P \( x \) z = Q \( x \) $

也就是

$ frac(1, 1 - n) frac(d z, d x) + P \( x \) z = Q \( x \) $

此时可以进一步将其化为一阶线性微分方程。

例题2：伯努利方程的例题，求下列微分方程的通解

$ frac(d y, d x) + frac(2, x) y = x y^3 $

令 $z = y^{-2}$，则 $frac(d z, d x) = -2 y^{-3} frac(d y, d x)$

整理得一阶线性微分方程

$ frac(d z, d x) - frac(4, x) z = -2 x $

应用一阶线性微分方程求解公式，得到通解

$ z = y^{-2} = frac(x^4, 6) + C x^4 $

所以原方程的通解为

$ y = sqrt(frac(1, frac(x^4, 6) + C x^4)) = frac(1, sqrt(frac(x^4, 6) + C x^4)) $

==== 齐次方程
满足该形式的方程称为齐次方程

$ frac(d y, d x) = f \( y / x \) $

一般来说，一个齐次方程并不会一开始就长成只有 $frac(d y, d x)$ 和 $y / x$
项的形式，如果你观察到方程各项的次数一致，那么你可以尝试通过移项将方程化为这种形式。

$ \( x^2 + y^2 \) d x - 2 x y d y = 0 arrow.r.double frac(d y, d x) = 1 / 2 dot.op frac(1 + \( frac(d y, d x) \)^2, frac(d y, d x)) $

我们假设 $u \( x \) = y / x$，那么有

$ frac(d y, d x) = frac(d \( u x \), d x) = frac(d u, d x) x + u $

所以，$y$ 和 $x$ 的导数关系可以化为 $u$ 和 $x$
的，继续此时方程将化为仅含有 $u$ 和 $x$ 的微分方程，且可以分离变量求解。

例题3：齐次方程的求解，求下列微分方程的通解
$ \( x^2 + y^2 \) d x - 2 x y d y = 0 $
将方程变形

$ frac(d y, d x) = frac(x^2 + y^2, 2 x y) = frac(1, 2) dot.op frac(x^2 + y^2, x y) $

令 $u = frac(y, x)$，则 $y = u x$，$frac(d y, d x) = u + x frac(d u, d x)$

代入原方程

$ u + x frac(d u, d x) = frac(1, 2) dot.op frac(1 + u^2, u) $

整理并分离变量

$ frac(2u, 1 - u^2) d u = frac(d x, x) $

两边积分

$ |1 - u^2| = frac(1, |C x|) $

将 $u = frac(y, x)$ 代回最终得到通解

$ |x^2 - y^2| = frac(x, |C|) $

==== 含有二阶导的微分方程
在一些特定形式下，我们可以通过变量代换来求解含有二阶导的微分方程。

对于这种形式的方程

$ frac(d^2 y, d x^2) = f \( x \, frac(d y, d x) \) $

若我们令 $y' = p$，则有 $y'' = frac(d p, d x)$，所以我们可以将含有
$x \, y' \, y''$ 的微分方程化为仅有 $p \, x$ 的方程

$ frac(d p, d x) = f \( x \, p \) $


又对于这种形式的方程

$ frac(d^2 y, d x^2) = f \( y \, frac(d y, d x) \) $

若我们令 $y' = p$，则有
$y'' = frac(d p, d x) = frac(d p, d y) frac(d y, d x) = p frac(d p, d y)$，所以我们可以将含有
$y \, y' \, y''$ 的微分方程化为仅有 $p \, y$ 的方程

$ p frac(d p, d y) = f \( y \, p \) $

例题4：二阶导微分方程求解，求解微分方程 $y'' - 2 y'^2 = 0$

令 $y' = p$，则 $y'' = frac(d p, d x)$

代入原方程
$ frac(d p, d x) - 2 p^2 = 0 $

分离变量
$ frac(d p, p^2) = 2 d x $

两边积分
$ - frac(1, p) = 2 x + C_1 $

解得
$ p = - frac(1, 2 x + C_1) $

又因为 $p = y'$，所以
$ y' = - frac(1, 2 x + C_1) $

再次积分
$ y = - frac(1, 2) ln(|2 x + C_1|) + C_2 $

因此原方程的通解为
$ y = - frac(1, 2) ln(|2 x + C_1|) + C_2 $

==== 全微分方程
考虑一个二元函数 $u = u \( x \, y \)$，如果说该函数可微，则它的全微分为

$ d u = P \( x \, y \) d x + Q \( x \, y \) d y $

其中
$P \( x \, y \) = frac(partial u, partial x)$，$Q \( x \, y \) = frac(partial u, partial y)$。

而如果说 $u \( x \, y \) = C$ 恒成立，那么就有
$ d u = P \( x \, y \) d x + Q \( x \, y \) d y = 0 $

现在，不妨考虑 $P \( x \, y \) d x + Q \( x \, y \) d y = 0$
是一个微分方程，那么 $u \( x \, y \) = C$
就是该微分方程的通解，我们称这样的方程为全微分方程。

当然了，并非所有形如 $P \( x \, y \) d x + Q \( x \, y \) d y = 0$
的方程都是全微分方程，因为 $P$ 和 $Q$ 并不一定是同一个函数
$u \( x \, y \)$ 的两个偏导数。仅当 $P$ 和 $Q$ 满足

$ frac(partial P, partial y) = frac(partial Q, partial x) $

$P \( x \, y \) d x + Q \( x \, y \) d y = 0$ 才是一个微分方程。

$P \( x \, y \) d x + Q \( x \, y \) d y = 0$ 的左式可以看作是一个向量场
$F \( x \, y \) = P \( x \, y \) hat(i) + Q \( x \, y \) hat(j)$
在指定流线上的流量。

出于对于任何一条流线上的流量都相等的要求，根据格林公式，我们可以知道 $F \( x \, y \)$ 的旋度为 $0$，也就是 $frac(partial Q, partial x) - frac(partial P, partial y) = 0$。

所以我们可以知道，$P \( x \, y \) d x + Q \( x \, y \) d y = 0$ 是一个全微分方程的充分必要条件是 $P$ 和 $Q$ 的偏导数满足 $frac(partial Q, partial x) - frac(partial P, partial y) = 0$。

所以，在求解全微分方程时，我们可以先判断 $P$ 和 $Q$ 的偏导数是否满足
$frac(partial Q, partial x) - frac(partial P, partial y) = 0$，如果满足，那么我们就可以通过全微分形式不变性推导原函数
$u$。

例题5：全微分方程的求解，求下列微分方程的通解

$ (cos(x) - y) d x - (x - 4 y^3) d y = 0 $

由于 $frac(partial Q, partial x) = frac(partial P, partial y) = -1$，因此该方程是全微分方程，展开算式为
$ cos(x) d x + 4 y^3 d y - (x d y + y d x) = 0 $

即为
$ d(\sin(x)) + d(y^4) - d(x y) = 0 $

所以
$ d(\sin(x) + y^4 - x y) = 0 $

通解即为
$ C = \sin(x) + y^4 - x y $

不幸的是，当
$frac(partial Q, partial x) - frac(partial P, partial y) eq.not 0$，那么我们就不能直接通过全微分方程的形式来求方程解了。不过，如果说存在一个函数
$mu \( x \, y \)$，使得

$ mu P \( x \, y \) d x + mu Q \( x \, y \) d y = 0 $

是一个全微分方程，那么我们就可以通过求解 $mu$ 来求解原方程，此时称 $mu$
为方程的积分因子。


我们知道，积分因子 $mu$ 满足下面的条件

$ frac(partial, partial y) \( mu P \) = frac(partial, partial x) \( mu Q \) $

展开为

$ frac(partial mu, partial y) P - frac(partial mu, partial x) Q = mu (frac(partial Q, partial x) - frac(partial P, partial y)) $

解这个方程还真不比直接解原方程容易，不过好在 $mu$
是我们人为规定的函数，所以说对于某些情况，不妨做以下假设。 设 $mu$
只依赖于 $x$ ，即为 $mu = mu \( x \)$，那么我们就有

$ - frac(d mu, d x) = frac(mu (frac(partial Q, partial x) - frac(partial P, partial y)), Q) $

出于左边的式子仅仅和 $x$
有关，所以如果在运算中，我们发现右边的式子也仅仅和 $x$
有关，那么我们就可以直接将其积分得到 $mu$，$mu$ 的一个解为

$ mu = e^(integral frac(d mu, d x) d x) = e^(- integral (frac(partial Q, partial x) - frac(partial P, partial y)) / Q d x) $

同理，如果我们假设 $mu$ 只依赖于 $y$，我们也可以根据相应的公式求解
$mu$。


=== 线性微分方程的概述
我们称像这样

$ y^(\( n \)) + p_1 \( x \) y^(\( n - 1 \)) + p_2 \( x \) y^(\( n - 2 \)) + dots.h.c + p_n \( x \) y = f \( x \) $

的关于未知函数和各阶导数均为一次的微分方程为线性微分方程。

其中，若
$f \( x \) equiv 0$，则称为齐次线性微分方程；否则称为非齐次线性微分方程。

==== 齐次线性微分方程解的结构
===== 解的叠加性质
对于一个 $n$ 阶线性微分方程，如果 $y_1 \( x \)$ 和 $y_2 \( x \)$
是方程的两个解，则它们的线性组合 $y = C_1 y_1 \( x \) + C_2 y_2 \( x \)$
也是方程的解。

假设 $y_1 \( x \)$ 和
$y_2 \( x \)$ 是齐次线性微分方程的解

$ y^(\( n \)) + p_1 \( x \) y^(\( n - 1 \)) + p_2 \( x \) y^(\( n - 2 \)) + dots.h.c + p_n \( x \) y = 0 $

那么

$
  y_1^(\( n \)) + p_1 \( x \) y_1^(\( n - 1 \)) + p_2 \( x \) y_1^(\( n - 2 \)) + dots.h.c + p_n \( x \) y_1 = 0 \
  y_2^(\( n \)) + p_1 \( x \) y_2^(\( n - 1 \)) + p_2 \( x \) y_2^(\( n - 2 \)) + dots.h.c + p_n \( x \) y_2 = 0
$

现在考虑线性组合 $y = C_1 y_1 \( x \) + C_2 y_2 \( x \)$，将其代入原方程

$
  y^(\( n \)) + p_1 \( x \) y^(\( n - 1 \)) + p_2 \( x \) y^(\( n - 2 \)) + dots.h.c + p_n \( x \) y \
  = \( C_1 y_1 \( x \) + C_2 y_2 \( x \) )^(\( n \)) + p_1 \( x \) \( C_1 y_1 \( x \) + C_2 y_2 \( x \) )^(\( n - 1 \)) + dots.h.c + p_n \( x \) \( C_1 y_1 \( x \) + C_2 y_2 \( x \)) \
  = C_1 y_1^(\( n \)) + C_2 y_2^(\( n \)) + p_1 \( x \) \( C_1 y_1^(\( n - 1 \)) + C_2 y_2^(\( n - 1 \)) \) + dots.h.c + p_n \( x \) \( C_1 y_1 + C_2 y_2 \) \
  = C_1 \( y_1^(\( n \)) + p_1 \( x \) y_1^(\( n - 1 \)) + dots.h.c + p_n \( x \) y_1 \) + C_2 \( y_2^(\( n \)) + p_1 \( x \) y_2^(\( n - 1 \)) + dots.h.c + p_n \( x \) y_2 \) \
  = C_1 * 0 + C_2 * 0 = 0
$

因此，线性组合 $y = C_1 y_1 \( x \) + C_2 y_2 \( x \)$ 也是原方程的解。

===== 解空间的维数和 Wronskian 行列式
接下来介绍一个重要的推论：对于一个 $n$
阶线性微分方程，齐次线性微分方程有 $n$ 个线性无关的解
$y_1 \( x \) \, y_2 \( x \) \, dots.h.c \, y_n \( x \)$。

线性无关是指对于方程

$
C_(1)y_(1)(x) + C_(2)y_(2)(x) + dots + C_(n)y_(n)(x) = 0
$

当方程仅存在唯一解 $C_{1} = C_{2} = \cdots = C_{n} = 0$ 时，称 $y_{1}(x), y_{2}(x), \cdots, y_{n}(x)$ 线性无关。

线性无关相当于一个函数不能由其他函数线性组合而成，即无法通过初等变换相互表示。

我们在此基础上引入 Wronskian（朗斯基）行列式的概念，对于 $n$ 个函数
$y_1 \( x \) \, y_2 \( x \) \, dots.h.c \, y_n \( x \)$，它们的
Wronskian 行列式定义为：

$ W \( y_1 \, y_2 \, dots.h.c \, y_n \) = mat(delim: "|", y_1, y_2, dots.h.c, y_n; y_(1'), y_(2'), dots.h.c, y_(n'); dots.v, dots.v, dots.down, dots.v; y_1^(\( n - 1 \)), y_2^(\( n - 1 \)), dots.h.c, y_n^(\( n - 1 \))) $

对于定义在 $x in \[ a \, b \]$ 上的 $y_1 \, y_2 \, dots.h.c \, y_n$
如果在区间内的某点 $x_0$ 处，Wronskian 行列式不为零，则这 $n$
个函数在该区间是线性无关的。

为了说明其正确性，我们可以证明其逆否命题：如果 $n$ 个函数 $y_1 \, y_2 \, dots.h.c \, y_n$
在区间 $\[ a \, b \]$ 上线性相关，则这些函数的 Wronskian 行列式
$W \( y_1 \, y_2 \, dots.h.c \, y_n \)$ 在整个区间上恒等于零。

若 $y_1, y_2, dots.h.c, y_n$ 线性相关，则存在不全为零的常数 $C_1, C_2, dots.h.c, C_n$，使得

$ C_1 y_1(x) + C_2 y_2(x) + dots.h.c + C_n y_n(x) = 0, quad forall x in [a, b] $

对上式求导，得到

$ C_1 y_1'(x) + C_2 y_2'(x) + dots.h.c + C_n y_n'(x) = 0 $

继续求导直到 $(n-1)$ 阶导数

$ C_1 y_1^(\( n-1 \))(x) + C_2 y_2^(\( n-1 \))(x) + dots.h.c + C_n y_n^(\( n-1 \))(x) = 0 $

上述 $n$ 个方程构成了一个关于 $C_1, C_2, dots.h.c, C_n$ 的齐次线性方程组。不难看出下方的这个行列式构成方程组即为上方所述方程组，且其存在一组非零解 $(C_1, C_2, dots.h.c, C_n)$。

$ mat(
  y_1, y_2, dots.h.c, y_n;
  y_1', y_2', dots.h.c, y_n';
  dots.v, dots.v, dots.down, dots.v;
  y_1^(\( n-1 \)), y_2^(\( n-1 \)), dots.h.c, y_n^(\( n-1 \))
) *
mat(
  C_1;
  C_2;
  dots.v;
  C_n
) = 0 $

这说明 Wronskian 行列式 $W(y_1, y_2, dots.h.c, y_n) = 0$。

因此，如果 Wronskian 行列式在某点 $x_0$ 不为零，根据逆否命题，函数 $y_1, y_2, dots.h.c, y_n$ 在区间上必定线性无关。

上述的条件还不够强，因为其逆命题：函数在区间上线性无关 $arrow.r.double$
Wronskian 行列式在区间存在某点不为零，并不成立。

这里有一个函数在区间上线性无关 $arrow.r.double.not$ Wronskian
行列式在区间存在某点不为零的例子"

$ y_1 \( x \) = \| x^3 \| $

$ y_2(x) = x^3 $

不过，如果我们加上一个条件：$y_1 \, y_2 \, dots.h.c \, y_n$ 是一组 $n$
阶齐次线性微分方程的解，就可以把它们变为等价的了。

我们已经证明了如果Wronskian不为零，则函数线性无关。现在证明反方向的命题：如果
$y_1 \, y_2 \, dots.h.c \, y_n$ 是n阶齐次线性微分方程的线性无关解，则它们的Wronskian行列式
$W \( y_1 \, y_2 \, dots.h.c \, y_n \) \( x \) eq.not 0$，$forall x in \[ a \, b \]$。

采用反证法：假设存在某点 $x_0 \in [a, b]$，使得 $W(y_1, y_2, \cdots, y_n)(x_0) = 0$，那么

$
  C_1 y_1(x_0) + C_2 y_2(x_0) + dots.h.c + C_n y_n(x_0) = 0 \
  C_1 y_1'(x_0) + C_2 y_2'(x_0) + dots.h.c + C_n y_n'(x_0) = 0 \
  dots.v \
  C_1 y_1^(\( n-1 \))(x_0) + C_2 y_2^(\( n-1 \))(x_0) + dots.h.c + C_n y_n^(\( n-1 \))(x_0) = 0
$

存在非零解 $(C_1, C_2, dots.h.c, C_n)$，那么

现在构造函数 $phi(x) = C_1 y_1(x) + C_2 y_2(x) + dots.h.c + C_n y_n(x)$。由于 $y_1, y_2, dots.h.c, y_n$ 都是齐次线性微分方程的解，$phi(x)$ 也是该方程的解。

根据上述方程组，我们有
$
  phi(x_0) = phi'(x_0) = dots.h.c = phi^{(n-1)}(x_0) = 0
$

这意味着 $phi(x)$ 满足初始条件 $phi(x_0) = phi'(x_0) = dots.h.c = phi^{(n-1)}(x_0) = 0$。根据微分方程的唯一性定理，满足这一初始条件的解只有零解 $phi(x) equiv 0$。

因此，$C_1 y_1(x) + C_2 y_2(x) + dots.h.c + C_n y_n(x) equiv 0$，方程存在非全 $0$ 解，这与 $y_1, y_2, dots.h.c, y_n$ 线性无关的假设矛盾。

所以，假设不成立，对于 $n$ 阶齐次线性微分方程的线性无关解，其 Wronskian 行列式在整个区间上都不为零。

根据齐次线性微分方程解的线性无关 $arrow.l.r.double$ Wronskian
行列式存在非零点，我们可以知道，一个 $n$ 阶齐次线性微分方程的解空间是
$n$ 维的，即其必然存在 $n$ 个线性无关的解。

证明 $n$ 阶齐次线性微分方程解空间的维数为 $n$：

考虑 $n$ 阶齐次线性微分方程

$
  y^{(n)} + p_{1}(x)y^{(n-1)} + p_{2}(x)y^{(n-2)} + dots.h.c + p_{n}(x)y = 0
$

为了凑出 $n$ 个线性无关的基底，我们选取 $n$ 组不同的初始条件，对第 $i$ 组初始条件 $(i = 1,2,dots.h.c,n)$，在点 $x_0$ 处有

$ y^((j-1))(x_0) = delta(i, j) = cases(
  1 & (j = i),
  0 & (j != i)
), j = 1, 2, dots.h.c, n $

根据微分方程解的存在唯一性定理，对每组初始条件，方程存在唯一解 $y_i(x)$。

现在证明这 $n$ 个解是线性无关的。计算它们在 $x_0$ 处的 Wronskian 行列式：

$
  W(y_1, y_2, dots.h.c, y_n)(x_0) =
  mat(
    y_1(x_0), y_2(x_0), dots.h.c, y_n(x_0);
    y_1'(x_0), y_2'(x_0), dots.h.c, y_n'(x_0);
    dots.v, dots.v, dots.down, dots.v;
    y_1^{(n-1)}(x_0), y_2^{(n-1)}(x_0), dots.h.c, y_n^{(n-1)}(x_0)
  )
$

根据我们的初始条件设置，这个行列式实际上是一个单位矩阵的行列式，因此

$
  W(y_1, y_2, dots.h.c, y_n)(x_0) = |E| = 1 \neq 0
$

所以这 $n$ 个解是线性无关的，即它们张成的解空间的维数为 $n$。这表明 $n$ 阶齐次线性微分方程的解是具有可加性和数乘性的，且包含 $n$ 个线性无关的解。

==== 非齐次线性微分方程解的结构
对于一个 $n$ 阶非齐次线性微分方程

$ y^(\( n \)) + p_1 \( x \) y^(\( n - 1 \)) + p_2 \( x \) y^(\( n - 2 \)) + dots.h.c + p_n \( x \) y = f \( x \) $

它的通解结构是其对应的齐次线性微分方程的通解加上一个特解，即

$ y \( x \) = y_h \( x \) + y_p \( x \) $

其中 $y_h \( x \)$ 是齐次线性微分方程
$y^(\( n \)) + p_1 \( x \) y^(\( n - 1 \)) + p_2 \( x \) y^(\( n - 2 \)) + dots.h.c + p_n \( x \) y = 0$
的通解，$y_p \( x \)$ 是该非齐次线性微分方程的一个特解。

首先，我们证明如果
$y_1 \( x \)$ 和 $y_2 \( x \)$ 都是非齐次线性微分方程的解，那么它们的差
$y_1 \( x \) - y_2 \( x \)$ 是对应齐次线性微分方程的解。

对于非齐次线性微分方程

$
  y^{(n)} + p_{1}(x)y^{(n-1)} + p_{2}(x)y^{(n-2)} + dots.h.c + p_{n}(x)y = f(x)
$

如果 $y_1(x)$ 和 $y_2(x)$ 都是其解，则有

$
  y_1^{(n)} + p_{1}(x)y_1^{(n-1)} + p_{2}(x)y_1^{(n-2)} + dots.h.c + p_{n}(x)y_1 = f(x) \
  y_2^{(n)} + p_{1}(x)y_2^{(n-1)} + p_{2}(x)y_2^{(n-2)} + dots.h.c + p_{n}(x)y_2 = f(x)
$

相减得

$
  (y_1 - y_2)^{(n)} + p_{1}(x)(y_1 - y_2)^{(n-1)} + dots.h.c + p_{n}(x)(y_1 - y_2) = 0
$

因此，$y_1(x) - y_2(x)$ 是对应齐次线性微分方程的解。所以对于 $y_p(x)$ 是非齐次线性微分方程的一个特解，$y(x)$ 是该方程的任意解。根据上面的证明，$y(x) - y_p(x)$ 是对应齐次线性微分方程的解，即存在常数 $C_1, C_2, dots.h.c, C_n$ 使得

$
  y(x) - y_p(x) = C_1 y_1(x) + C_2 y_2(x) + dots.h.c + C_n y_n(x)
$

其中 $y_1(x), y_2(x), dots.h.c, y_n(x)$ 是齐次线性微分方程的 $n$ 个线性无关解。

因此

$
  y(x) = y_p(x) + C_1 y_1(x) + C_2 y_2(x) + dots.h.c + C_n y_n(x) = y_p(x) + y_h(x)
$

其中 $y_h(x) = C_1 y_1(x) + C_2 y_2(x) + dots.h.c + C_n y_n(x)$ 是齐次线性微分方程的通解。

所以，非齐次线性微分方程的通解可以表示为其对应齐次线性微分方程的通解加上一个特解。

== 复变函数

// 复可微指的是在某个点 $lim_(nabla z -> 0) (f(z + nabla z) - f(z)) / (nabla z)$ 的极限存在

// 这*等价*于函数的一阶导数存在。

// 解析指的是函数在某个点处，存在一该点的领域，使得该函数在该区域内任意点都可微

// 在一点处解析可以导出函数在该点处的各阶导数都存在，且可以展开成泰勒级数；该命题反之不成立。（记得补充证明，正向证明和柯西积分公式有关）

// 复变函数的可微和解析与实变函数性质有所不同，例如实变函数的解析不一定能导出其各阶导数都存在。（需要调查，证明）

=== 复变函数的相关定义

#definition("复数")[
形如

$
  C = x + y i
$

的数被称为复数，其中 $x in R, y in R$，$i$ 是虚数单位。
]


任何一个复数都有其三角函数表达形式，令一个不为 $0$ 的复数 $z$ 的幅角主值 $theta$ 为

$
  theta = arg z = cases(
    arctan(y/x) quad (x > 0),
    ±pi / 2 quad (x = 0),
    arctan(y/x) ± pi quad (x < 0),
    pi quad (x < 0 且 y = 0)
  ), quad theta in (-pi, pi]
$

那么复数就可以被表达为

$
  z = r(cos theta + i sin theta) quad r = sqrt(x^2 + y^2)
$

特别的，对于 $z = 0$，定义 $r = 0$，那么 $0$ 也可以被表达为对应形式了。

同时，有欧拉公式，所以复数也可以被表示为指数形式

$
  z = r e^(i theta)
$

有了该指数形式表达式，可以从另外一个视角来理解复数的乘除与共轭运算。

$
  z_1 z_2 = r_1 r_2 e^(i (theta_1 + theta_2)) \
  z_1 / z_2 = (r_1 / r_2) e^(i (theta_1 - theta_2)) \
  overline(z) = r e^(-i theta)
$

故复数的乘法可以通过模的乘法和幅角的加法来实现，复数的除法可以通过模的除法和幅角的减法来实现；而共轭则是对幅角取反。

#example("等边三角形构成的充要条件")[
  证明在复平面上，三点 $z_1, z_2, z_3$ 构成等边三角形的充要条件是
  $
    z_1^2 + z_2^2 + z_3^2 = z_1 z_2 + z_2 z_3 + z_3 z_1
  $

  可以知道，构成等边三角形的充要条件是等边三角形的一边绕其某个端点旋转 $± pi/3$ 后与另一边重合，所以有充要条件表达式

  $
    (z_3 - z_1) / (z_2 - z_1) = 1/2 ± sqrt(3)/2 i
  $

  对两边平方，并整理，即可得到所需结论。
]

#example("比较以下两表达式的大小")[
  $z_1, z_2$ 为复数且为复平面单位圆内的点，比较表达式 $abs(z_1 - z_2)^2$ 和 $abs(1 - z_1 overline(z_2))$。

  #highlight[引入技巧 $|z|^2 = z overline(z)$，我们可以拆解两个表达式为]
  $
    abs(z_1 - z_2)^2 = (z_1 - z_2)(overline(z_1) - overline(z_2)) = |z_1|^2 + |z_2|^2 - z_1 overline(z_2) - overline(z_1) z_2 \
    abs(1 - z_1 overline(z_2))^2 = (1 - z_1 overline(z_2))(1 - overline(z_1) z_2) = 1 + |z_1|^2 |z_2|^2 - z_1 overline(z_2) - overline(z_1) z_2
  $

  用作差法比较两个表达式的大小，有
  $
    abs(z_1 - z_2)^2 - abs(1 - z_1 overline(z_2))^2 = |z_1|^2 + |z_2|^2 - 1 - |z_1|^2 |z_2|^2 = \ (|z_1|^2 - 1)(1 - |z_2|^2) < 0
  $

  所以有 $abs(z_1 - z_2)^2 < abs(1 - z_1 overline(z_2))^2$。
]

#line(length: 100%)

复数具有它的几何表示，定义一个平面直角坐标系，任何复数 $z = x + y i$ 都可以被表示为平面上由 $(0, 0)$ 到 $(x, y)$ 的向量。这个平面被称为复平面，横轴被称为实轴，纵轴被称为虚轴。

称 $r = |z| = sqrt(x^2 + y^2)$ 为复数的模，这指复平面上该复数所表示的向量的长度。

在复平面的基础上，可以引入一个有趣的概念，称为复球面

#definition("复球面")[
  在三维空间中，令 $z = 0$ 为复平面，过原点作 $z$ 轴，取单位半径 $r$，构建圆心在 $(0, 0, r)$，半径为 $r$ 的球壳 $C$，令球的顶点 $(0, 0, 2r)$ 为 $N$。

  那么可以发现，作复平面上的每一个点 $Z$ 到 $N$ 的连线，该连线与球壳都一定存在一个交点 $P$，且该交点与 $Z$ 一一对应。

  // 绘图：复球面

  所以，定义映射 $F: Z mapsto P$，该映射按照上述规律将复平面上的每一个点映射到球壳 $C$ 上的一个点，称此具有表示复数能力的球壳为复球面。
]

观察该映射，我们发现复平面上的每一个点 $Z$ 都可以被映射到复球面上，但反之则不成立。因为任何一条连线都不可能是球体的切线，$N$ 点是无法在复平面上找到对应点的。我们称 $N$ 点为复球面的北极。

为了弥补这一缺憾，定义复平面上的抽象概念“无穷远点”，它与一个“无穷大”复数 $oo$ 对应，且在映射 $F$ 中，$oo mapsto N$。

该模型可用于解释一些数学现象，例如对于复球面而言，复平面上的任意一条直线都将被投射为复球面上的一个圆，而圆本质上是一个环，故复平面上的任意一条直线都可以被认为是一个经过了“无穷远点”后绕成的环。

#line(length: 100%)

#definition("复变函数")[
  复变函数指的是以复数为变量的函数#footnote[与传统的函数不同，复变函数包括“多值”函数，允许一个自变量 $z$ 对应多个因变量 $w$；下面的公式只展示了一对一的情景，被称为“单值”函数，但并不代表复变函数只能是单值的。]。

  $
    f(z) = f(x + y i) = u(x, y) + v(x, y) i
  $
]

复变函数的本质是从复数到复数的映射，接受复数作为输入，经过变换输出复数。

对于一般的标量函数而言，例如 $y = f(x)$，函数可以用平面直角坐标系 $y-x$ 表示。而对于复变函数而言，函数 $w = f(z)$ 的输入输出均为复数，其图像表示不同于标量函数，有以下理解方式。

1. 向量场

若认为 $w = f(z)$ 为复平面上一点 $z$ 到一个向量 $w$ 的映射，那么可以在复平面上每一个点 $z$ 处画出一个向量 $w$，那么整个复平面上就形成了一个向量场。电磁场即为一个典型的例子。

2. 空间变换

若认为 $w = f(z)$ 为复平面上一点 $z$ 到另一复平面上点 $w$ 的映射，那么可以将两个复平面分别放置在三维空间中，函数 $f$ 即为一个将第一个复平面上的点映射到第二个复平面上的点的空间变换。矩阵变换即为一个特殊的线性变换例子。

复变函数也有极限与连续的概念，其定义与实变函数类似。

#definition("复变函数的极限")[
  若 $f(z)$ 在其去心邻域 ${z | |z - z_0| < rho}$ 内的任意点 $z$ 处都有定义；且对于任意给定的 $epsilon > 0$，都存在 $N > 0$，使得当 $0 < |z - z_0| < epsilon$ 时，都有 $|f(z) - w_0| < N$，那么就称复变函数 $f(z)$ 在点 $z_0$ 处的极限为 $w_0$，记作
  $
    lim_(z arrow z_0) f(z) = w_0
  $
]

复变函数的极限也有四则运算原则，和实变函数一致。

#definition("复变函数的连续性")[
  若复变函数 $f(z)$ 在点 $z_0$ 处有定义，且
  $
    lim_(z arrow z_0) f(z) = f(z_0)
  $
  那么就称 $f(z)$ 在点 $z_0$ 处是连续的。
]

=== 复变函数的导数

==== 导数的存在性和柯西-黎曼条件

根据以上极限与连续的定义，可以如此定义复变函数的导数

#definition("复变函数的导数")[
  若复变函数 $f(z)$ 在点 $z_0$ 处的极限7
  $
    lim_(z arrow z_0) (f(z) - f(z_0)) / (z - z_0) = A
  $
  存在，那么就称 $f(z)$ 在点 $z_0$ 处可导，$A$ 为该函数在点 $z_0$ 处的导数，记作
  $
    f'(z_0) = A
  $
]

复变函数的导数反映函数在复平面上某点处的函数值变化趋势，和实变函数的导数意义类似，例如对于函数 $w = z^3$，可以得到其导函数为 $w' = 3z^2$

$
  lim_(laplace z -> 0) ((z+laplace z)^3 - z^3) / (laplace z) = lim_(laplace z -> 0) (3z^2 + 3z laplace z + (laplace z)^2) = 3z^2
$

并非所有连续的复变函数都是可导的，例如 $w = 3x + 4y i$ 在点 $(0, 0)$ 处是连续的，但其导数不存在。

$
  lim_(laplace z -> 0) ((3(x + laplace x) + 4(y + laplace y) i) - (3x + 4y i)) / (laplace x + laplace y i) =
  lim_(laplace z -> 0) (3 laplace x + 4 laplace y i) / (laplace x + laplace y i)
$

当 $laplace z$ 的方向不同时，上述公式的值也不同，故该极限不存在。根据该情况，也可以推断出在讨论复变函数的导数时，$laplace z$ 的方向是任意的。

换句话说，无论 $laplace z$ 的变化方向如何，引起函数值的变化程度都应当相同。于是可以做以下推断：

- 当 $laplace z$ 沿实轴方向变化时，有

$
  f'(z) = lim_(laplace x -> 0) (u(x + laplace x, y) + v(x + laplace x, y) i - (u(x, y) + v(x, y) i)) / (laplace x) = u_x + v_x i
$

- 当 $laplace z$ 沿虚轴方向变化时，有

$
  f'(z) = lim_(laplace y -> 0) (u(x, y + laplace y) + v(x, y + laplace y) i - (u(x, y) + v(x, y) i)) / (laplace y i) = v_y - u_y i
$

可导的复变函数的上述两个公式应当相等，所以应当有可导的必要条件

$
  u_x = v_y \
  u_y = -v_x
$

可以进一步证明，该条件实际上为充分必要条件。

#theorem("柯西-黎曼条件")[
  设复变函数 $w = f(z) = u(x, y) + v(x, y) i$ 在点 $z_0 = x_0 + y_0 i$ 的某邻域内有定义，且其偏导数 $u_x, u_y, v_x, v_y$ 在该点处均存在。

  那么 $f(z)$ 在 点 $z_0$ 处可导的充分必要条件是在该点处满足柯西-黎曼条件
  $
    u_x = v_y \
    u_y = -v_x
  $
]

所以，只要一个复变函数满足柯西-黎曼条件，就可以断言其可导，且其导函数为

$
  f'(z) = u_x + v_x i = v_y - u_y i \
  = u_x - u_y i = v_y + v_x i
$

#line(length: 100%)

复变函数的常见形式除了 $f(z) = u(x, y) + v(x, y) i$ 以外，更常见的形式为 $w = f(z)$

$
  f(z) = e^z, quad f(z) = z^n, quad f(z) = sin z, quad f(z) = cos z
$

==== 常见的复变初等函数及其导数

像这样由形如实变数初等函数 $f(x)$ 直接推广到复数域 $f(z)$ 的函数被称为复变数初等函数，以下讨论一些常见的复变数初等函数的性质及其导数。

1. 复变指数函数

$
  w = f(z) = e^z = e^(x + y i) = e^x (cos y + i sin y)
$

根据前文内容，我们知道一个指数函数实际唯一对应复平面上一个向量。

相较于实变指数函数，其最大的不同点在于其周期性质，可以推导

$
  f(z + 2n pi i) = e^(z + 2n pi i) = e^z e^(2n pi i) = e^z = f(z), quad n in Z
$

可以推导，与实变函数的导数形式一致，也有

$
  f'(z) = e^z
$

2. 复变对数函数

满足方程 $e^w = z$ 的 $w = f(z)$ 被称为复变对数函数。由于上文所提到的周期性质，故复变对数函数是一个多值函数，记作 $"Ln" z$。

$
  w = ln |z| + i "Arg"z
$

其中 $"Arg"z$ 表示 $z$ 的幅角的所有可能取值，为 $arg z + 2 k pi$。

当然也可以定义仅取幅角主值的对数函数

$
  w = ln |z| + i arg z, quad arg z in (-pi, pi]
$

可以通过指数函数导数公式推导出，复变对数函数的导数为

$
  f'(z) = 1 / z, quad z != 0 and arg z != pi
$

3. 复变幂函数

定义复变幂函数为

$
  w = z^b = e^(b "Ln"z)
$

当 $b in bb(N)$ 时，有

$
  e^(b "Ln"z) = e^(b(ln|z| + i arg z) + 2k b pi i) = e^(b(ln|z| + i arg z))
$

可以发现，复变幂函数在 $b in bb(N)$ 时为单值函数，可以推断当前状态下的导数。

$
  f'(z) = b z^(b-1), quad b in bb(N)
$

而在其它情况下，复变幂函数为多值函数，因为 $2 k b pi i$ 项的取值不再是 $2 pi$ 的整数倍，依据 $k$ 的变化而变化。

例如 $w = i^(-i) = e^(-i "Ln" i) = e^(-i (pi/2 i + 2k pi i)) = e^(pi/2 + 2k pi)$，其中 $k in bb(Z)$，于是该式有无数个值。

还是可以推导，即便 $b$ 并非自然数，复变幂函数的导数公式依然成立

$
  f'(z) = b z^(b-1)
$

4. 复变三角函数

复变三角函数可以通过欧拉公式定义

$
  sin z = (e^(i z) - e^(-i z)) / (2 i), quad cos z = (e^(i z) + e^(-i z)) / 2
$

其它三角函数族也可以通过三角函数定义

$
  tan z = (sin z) / (cos z), quad cot z = (cos z) / (sin z), quad sec z = 1 / (cos z), quad csc z = 1 / (sin z)
$

可以推导，复变三角函数的导数公式与实变三角函数一致

$
  (sin z)' = cos z, quad (cos z)' = -sin z, \ quad (tan z)' = sec^2 z, quad (cot z)' = -csc^2 z, \ quad (sec z)' = sec z tan z, quad (csc z)' = -csc z cot z
$

除去所有使得分母为 $0$ 的点，复变三角函数在其定义域内均可导。

==== 可微与解析

复变函数这样定义它的微分

#definition("复可微")[
  设函数 $w = f(z)$ 定义在点 $z_0$ 的某个邻域内，若以给定点 $z_0$ 为中心，任意取增量 $Delta z$，当 $Delta z -> 0$ 时，对于极限
  $
    Delta w = lim_(Delta z -> 0) (f(z_0 + Delta z) - f(z_0))
  $

  若存在常数 $A$ 可以使得该极限被表达为
  $
    Delta w = A * Delta z + o(|Delta z|)
  $

  那么我们就说函数 $f(z)$ 在点 $z_0$ 处*复可微*。
]

复变函数也有其导数的定义

#definition("复变函数的导数")[
  设函数 $w = f(z)$ 定义在点 $z_0$ 的某个邻域内，若极限
  $
    f'(z_0) = lim_(Delta z -> 0) (f(z_0 + Delta z) - f(z_0)) / (Delta z)
  $
  存在，那么我们就说函数 $f(z)$ 在点 $z_0$ 处*可导*，并称该极限为函数 $f(z)$ 在点 $z_0$ 处的*导数*。
]

复变函数的可导和可微是完全等价的，无论对于一点处，还是在某个区域内。这是因为复变函数的导数中增量 $Delta z$ 可以从任意方向趋近于 $0$，这就要求函数在各个方向上的变化率都相等，从而保证了函数的微分可以被唯一确定。#footnote[这就使得复变函数具有多元实变函数不具有的性质，后者所关于导数的定义是不具有任意方向趋近的要求的，所以对此可微是可导的充分非必要条件。]

函数在 $D$ 内一点 $z_0 = x_0 + i y_0$ 可导的充要条件是它的实部 $u(x, y)$ 和虚部 $v(x, y)$ 在点 $(x_0, y_0)$ 处对 $x$ 和 $y$ 偏导数存在，且满足柯西-黎曼方程组#footnote[一般认为，既然能够写出柯西-黎曼方程组，那么就已经假设了偏导数的存在性和连续性]。

$
  cases(u_x = v_y, u_y = -v_x)
$

我们已经讨论过该方程组的意义，它实际上是依据函数在实轴和虚轴方向上的导数相等所导出的。

最后一个要讨论的性质是解析，解析有如下定义

#definition("解析")[
  设函数 $w = f(z)$ $z_0$ 是函数定义域内一点，若存在一 $z_0$ 的邻域 $U(z_0)$，使得函数 $f(z)$ 在该邻域内的每一点都可导，那么则称函数 $f(z)$ 在点 $z_0$ 处解析。
]

函数在一个区域内处处解析和它在一个区域内处处可导是等价的。但是对于独立的一点而言这一结论就不成立，因为解析的定义要求函数在该点的某个邻域内都可导，而不仅仅是该点处可导。

利用上述判定方案，可以导出判断函数解析的充要条件

#theorem("解析的判定条件")[
  设函数 $w = f(z)$ 在区域 $D$ 内的每一点 $z = x + i y$ 处都可微，且其对应的实部 $u(x, y)$ 和虚部 $v(x, y)$ 在区域 $D$ 内的每一点都满足柯西-黎曼方程组，那么函数 $f(z)$ 在区域 $D$ 内解析。
]

解析性还可以引来如下性质
#theorem("解析函数的性质")[
  设函数 $w = f(z)$ 在区域 $D$ 内解析，那么对于区域 $D$ 内的任意一点 $z_0$，函数 $f(z)$ 在该点处存在任意阶导数，且可以展开成泰勒级数
  $
    f(z) = sum_(n=0)^oo (f^(n)(z_0) / n!) * (z - z_0)^n
  $
  其中 $f^(n)(z_0)$ 表示函数 $f(z)$ 在点 $z_0$ 处的第 $n$ 阶导数。

  这是因为对于解析函数 $f(z)$，有柯西积分公式的推广形式
  $
    f^(n)(z_0) = (n! / (2 pi i)) * integral.cont_C (f(z) / (z - z_0)^(n+1)) d z
  $

  这为解析函数可以在其定义域内展开成泰勒级数提供了理论基础。
]

综上所述，可以画出复变函数的上述性质之间的关系图

#figure(image("images/工科数学/复变函数/复变函数的性质.png", width: 90%),
  caption: [
    复变函数的性质之间的关系图
  ]
)

=== 复变函数的奇点及其性质

对于 $f(z)$ 而言，若其在环域 $R_1 < abs(z - z_0) < R_2$ 内解析，则可以在 $z_0$ 处，将其展开为双边幂级数，我们就称这种幂级数为洛朗级数。

$
  f(z) = sum_(n=-oo)^(oo) a_n (z - z_0)^n
$

洛朗级数的一个特性在于 $z_0$ 点处函数可以不解析，即 $z_0$ 可以是奇点。

在洛朗级数的相关习题中，可以发现从这些奇点处展开的幂级数，有些级数没有负数次项，有些则有有限个负数次项，有些则有无限个负数次项。实际上，负数次项的个数和奇点的性质有关，由此可以对复变函数中的奇点分类。

#line(length: 100%)

首先定义孤立奇点，若 $f(z)$ 在点 $z_0$ 的某个去心邻域内解析，但在 $z_0$ 点不解析，则称 $z_0$ 为 $f(z)$ 的孤立奇点。

由洛朗定理，可以从孤立奇点处展开洛朗级数

$
  f(z) = ... + a_(-2) (z - z_0)^(-2) + a_(-1) (z - z_0)^(-1) + a_0 + a_1 (z - z_0) + ...
$

#example("例题1")[
  将 $f(z) = "Ln"(1 + z) / z$ 在 $z_0 = 0$ 处展开为 $0 < abs(z) < 1$ 范围内的洛朗级数

  由于 $"Ln"(1 + z)$ 在 $z = 0$ 处解析，可以展开为幂级数
  $
    "Ln"(1 + z) = sum_(n=1)^(oo) (-1)^(n-1) z^n / n
  $

  所以说原式等于
  $
    f(z) = (sum_(n=1)^(oo) (-1)^(n-1) z^n / n) / z = sum_(n=1)^(oo) (-1)^(n-1) z^(n-1) / n
  $

  该双边幂级数不含负数次项，即 $a_n = 0$ (对于 $n < 0$)。
]

我们称在孤立奇点处展开的洛朗级数中不含负数次项的孤立奇点为可去奇点。

对于可去奇点而言，其洛朗级数和幂级数在形式上是相同的，若我们定义上式中的 $f(z_0) = C_0$，其中 $C_0$ 是将 $z_0$ 代入上述幂级数得到的值，则函数 $f(z)$ 有

$
  f(z_0) = lim_(z -> z_0) f(z) = C_0
$

发现加上该定义后，函数在 $z_0$ 处也解析。这就是“可去”奇点的含义，可以通过简单的定义使得函数在该点解析。

上述过程也揭示了可去奇点的一大性质：若 $z_0$ 是 $f(z)$ 的可去奇点，则 $f(z)$ 在 $z_0$ 处的极限存在且有限。

$
  lim_(z -> z_0) f(z) = C_0
$

#line(length: 100%)

#example("例题2")[
  将 $f(z) = 1 / ((z + 1)^2 (z - i))$ 在 $z_0 = -1$ 处展开为 $0 < abs(z + 1) < sqrt(2)$ 范围内的洛朗级数

  代换 $t = z + 1$，通过运算将原式化为
  $
    f(t) = 1 / t^2 dot 1 / (t - (i + 1))
  $

  将后项在 $abs(t) < sqrt(2)$ 范围内展开为幂级数
  $
    1 / (t - (i + 1)) = sum_(n=0)^(oo) -t^n / (i + 1)^(n + 1)
  $

  所以原式等于
  $
    f(z) = sum_(n=0)^(oo) - (z + 1)^(n - 2) / (i + 1)^(n + 1)
  $

  该双边幂级数含有有限个负数次项，即 $a_(-2) = -1 / (i + 1)$，$a_(-1) = -1 / (i + 1)^2$，其余 $a_n = 0$ (对于 $n < -2$)。
]

像这样，若在孤立奇点处展开的洛朗级数含有 $m$ 个负数次项（有限个），则称该孤立奇点为 $m$ 阶极点。上面的例子就是一个二阶极点。

#theorem("极点的判定条件")[
  $z_0$ 为函数 $f(z)$ 的 $m$ 阶极点的充要条件为：

  1.  函数 $phi(z) = (z - z_0)^m f(z)$ 在 $z_0$ 处解析，且 $phi(z_0) != 0$；
  2.  函数 $phi(z) = (z - z_0)^(m-1) f(z)$ 在 $z_0$ 处不解析。
]

以及，对于函数 $f(z)$，若 $z_0$ 是它的极点，那么有 $f(z)$ 在此处的极限为无穷大

$
  lim_(z -> z_0) f(z) -> oo
$

#line(length: 100%)

#example("例题3")[
  将 $f(z) = e^(1/z)$ 在 $z_0 = 0$ 处展开为 $0 < abs(z) < oo$ 范围内的洛朗级；因为有泰勒级数 $e^z = sum_(n=0)^(oo) z^n / n!$，进行变量代换，所以有
  $
    e^(1/z) = sum_(n=0)^(oo) (1/z)^n / n! = sum_(n=0)^(oo) 1 / (n!) z^(-n)
  $

  该双边幂级数含有无限个负数次项，即对于任意 $m in N^+$，都有 $a_(-m) = 1 / (m!)$ 不为零。
]

称这类在孤立奇点处展开的洛朗级数含有无限个负数次项的孤立奇点为本性奇点。

对于本性奇点而言，函数在该点的极限不存在，即
$
  lim_(z -> z_0) f(z) "不存在"
$

这是因为当函数趋近于本性奇点 $z_0$ 的方式不同时，函数值可以趋近于不同的值，甚至可以趋近于无穷大。该性质被称为魏尔斯特拉斯-卡索拉蒂定理。

#theorem("魏尔斯特拉斯-卡索拉蒂定理")[
  若 $f(z)$ 在点 $z_0$ 处有本性奇点，则对于*任意复数* $w_0 in C$，在去心邻域 $0 < abs(z - z_0) < R$ 内，均存在一列点 ${z_n}$，使得 $lim_(n -> oo) z_n = z_0$，且 $lim_(n -> oo) f(z_n) = w_0$。

  以上方 $f(z) = e^(1/z)$ 为例，当序列 ${z_n}$ 为

  1. $z_n = 1 / n$ 时，有 $f(z_n) = +oo$；

  2. $z_n = -1 / n$ 时，有 $f(z_n) = 0$；

  3. $z_n = 1 / (ln(w) + 2 pi n i)$ 时，有 $f(z_n) = e^(ln(w) + 2 pi n i) = w$。

  可以看出当趋近序列不同时，函数值的极限也不同。

]

// 综合性判断极点类型的方法

=== 复变函数的零点

若 $f(z)$ 在 $z_0$ 的邻域 $abs(z - z_0) < R$ 内解析，且在邻域内存在有 $phi(z)$ 在 $z_0$ 处解析且 $phi(z_0) != 0$，使得 $f(z) = (z - z_0)^m phi(z)$，则称 $f(z)$ 在 $z_0$ 处有一个 $m$ 阶零点。

// 零点有 n 阶导数为 0 的性质

// 零点和极点的关系

// ---


=== 复变函数的积分

复变函数的积分类似于实变函数中的线积分

#definition("复变函数的积分")[
  设 $w = f(z)$ 定义在区域 $D$ 内，$C$ 为区域 $D$ 内一条光滑有向曲线，起点为 $z_s$，终点为 $z_e$，在其上有若干个点 $z_i$ 将曲线任意分为 $n$ 个小弧段，且令 $delta = max_(1 <= i <= n) overparen(z_(i-1) z_i)$；

  当 $n -> +oo, delta -> 0$，在每个弧段上任意取一点 $zeta_i$，做以下和式
  $
    S = sum_(i=1)^n f(zeta_i) (z_i - z_(i-1))
  $

  若该式的极限存在，则称该极限为复变函数 $f(z)$ 沿曲线 $C$ 从 $z_s$ 到 $z_e$ 的积分，记为
  $
    integral_C f(z) d z = lim_(delta -> 0) S
  $
]

根据上述定义，可以看出积分是对小段弧的偏移量和函数值的乘积求和的极限。类似于实变函数中的线积分，可以采用以下计算策略

对于函数 $f(z) = u(x, y) + i v(x, y)$，那么在 $d z = (d x + i d y)$ 时，取微分表达式

$
  f(z) d z = (u + i v)(d x + i d y) = (u d x - v d y) + i (v d x + u d y)
$

则复变函数的积分可以被表达为

$
  integral_C f(z) d z = integral_C (u d x - v d y) + i integral_C (v d x + u d y)
$

设曲线方程为

$
  z(t) = x(t) + i y(t), quad t in [t_s, t_e]
$

那么将该曲线方程代入积分式

$
  integral_C f(z) d z = integral_(t_s)^(t_e) u(x(t), y(t)) x'(t) d t - v(x(t), y(t)) y'(t) d t + \ i integral_(t_s)^(t_e) v(x(t), y(t)) x'(t) d t + u(x(t), y(t)) y'(t) d t \ = integral_(t_s)^(t_e) (u(x(t), y(t)) + i v(x(t), y(t))) (x'(t) + i y'(t)) d t \ = integral_(t_s)^(t_e) f(z(t)) z'(t) d t
$

所以，复变函数的积分还可以通过将曲线方程展开来计算得到，这和计算定积分是类似的

#theorem("复变函数的线积分计算公式")[
  $
    integral_C f(z) d z = integral_(t_s)^(t_e) f(z(t)) z'(t) d t
  $
]

复变函数有估值不等式

#definition("复变函数的估值不等式")[
  设 $f(z)$ 在曲线 $C$ 上连续，且 $|f(z)| <= M$，那么有
  $
    |integral_C f(z) d z| <= integral_C |f(z)| |d z| <= M L
  $
  其中 $L$ 是曲线 $C$ 的长度。#footnote[容易根据复数乘法的性质和定积分的估值不等式证明该结论。]
]

#example("复变函数积分计算")[
  $C$ 为以 $z_0$ 为圆心，$r$ 为半径的正向圆周，$n in bb(N)$，求 $integral.cont_C (d z)/(z-z_0)^n$ 的值

  可以令 $z = z_0 + r e^(i theta)$，则有原式化为
  $
    integral.cont_C (i r e^(i theta)) / (r^n e^(i n theta)) d theta = (i)/(r^(n-1)) integral_0^(2 pi) e^(i (1-n) theta) d theta
  $

  观察发现，若 $n != 1$，则积分项恒为 $0$，因此本题答案为
  $
    cases(
      0 quad (n != 1),
      2 pi i quad (n = 1)
    )
  $
]

#line(length: 100%)

在实变函数中，我们知道对于旋度为 $0$ 的向量场，其线积分与路径无关，只与路径的起点和终点有关。而在复变函数中，也存在类似的结论

观察复变函数的积分方程

$
  integral_C f(z) d z = integral_C (u d x - v d y) + i integral_C (v d x + u d y)
$

稍作整理

$
  integral_C f(z) d z = integral_C P d x + Q d y = integral_C (u + v i) d x + (-v + u i) d y
$

我们知道对于连续可导复变函数，有柯西-黎曼条件

$
  u_x = v_y, quad u_y = -v_x
$

故上方公式的旋度为

$
  (partial Q)/(partial x) - (partial P)/(partial y) = (u_y + v_x) - (-v_y + u_x) = 0
$

这也就意味着对于复变函数的定义域若处处满足柯西-黎曼条件，则其积分与路径无关

#theorem("柯西积分定理")[
  设 $f(z)$ 在单连通区域 $D$ 内解析#footnote[解析指的是函数在该区域内处处可导]，$C$ 为 $D$ 内一条光滑闭曲线，那么有
  $
    integral_C f(z) d z = 0
  $
]

需要注意的是，若要得到复变函数在某区域内解析，必须要保证这个区域内的*所有点*都解析以满足柯西-黎曼条件，才能保证处处旋度为 $0$，以导出最终结论。

这也就是为什么例题 1中，$n = 1$ 时积分值不为 $0$ 的原因，因为此时圆内部存在不满足上述条件的奇点 $z = z_0$。

#line(length: 100%)

假设 $B$ 是复平面上的一个单连通区域，$C$ 是完全在 $B$ 内部的一条光滑闭曲线，$f(z)$ 是在 $B$ 内解析的复变函数，那么有

$
  integral.cont_C f(z) d z = 0
$

根据柯西积分定理，这是显而易见的，但是如果我们对上式稍微修改

$
  integral.cont_C (f(z))/(z - z_0) d z
$

其中 $z_0$ 落在是 $C$ 内部的一个点，那么该式的值就不再是 $0$ 了，因为 $z_0$ 是被积函数的奇异点。不过由于 $B$ 的处处解析性质，我们知道对于除了 $z_0$ 以外的所有点，$f(z)$ 都是解析的，所以我们可以构造一个小闭曲线 $C_0$，使得 $C_0$ 完全在 $C$ 内部，并且 $C_0$ 包含 $z_0$，那么根据柯西积分定理，有

$
  integral.cont_C f(z)/(z - z_0) d z = integral.cont_(C_0) f(z)/(z - z_0) d z
$

这能够成立是因为所有解析点处的旋度都为 $0$，所以这些点对积分值没有贡献。

为了能够计算得到上式的值，我们取 $C_0$ 为以 $z_0$ 为圆心，$r$ 为半径的正向圆周，那么有

$
  integral.cont_(C_0) f(z)/(z - z_0) d z = integral.cont_(C_0) (f(z) - f(z_0))/(z - z_0) d z + f(z_0) integral.cont_(C_0) 1/(z - z_0) d z = \ integral.cont_(C_0) (f(z) - f(z_0))/(z - z_0) d z + 2 pi i f(z_0)
$

不妨认为当 $r -> 0$ 时，$f(z)$ 在 $z_0$ 处解析，所以 $(f(z) - f(z_0))/(z - z_0)$ 在 $C_0$ 上有界，且 $C_0$ 的长度趋于 $0$，所以根据复变函数的估值不等式，有

$
  integral.cont_(C_0) (f(z) - f(z_0))/(z - z_0) d z < overbracket(2 pi r, "圆的周长") dot overbracket(|(f(z) - f(z_0))/(z - z_0)|_(C_0), "函数在该点的导数，有界") -> 0
$

故上式的最终答案为

#definition("柯西积分公式")[
  $
    integral.cont_C f(z)/(z - z_0) d z = 2 pi i f(z_0)
  $
  该公式表明了复变函数在某点的值可以通过该点附近的积分来表示。

  作为该公式的推广，柯西高阶积分公式也可以被用于描述复变函数在某点的高阶导数和积分的关系#footnote[要证明下列公式成立，首先将上方柯西积分公式中的 $f(z)$ 替换为 $f^(\(n\)) (z)$，然后对公式的积分式作 $n$ 次分部积分法变换，即可得到该公式。]

  $
    f^(n)(z_0) = (n!)/(2 pi i) integral.cont_C f(z)/(z - z_0)^(n+1) d z
  $
]

柯西积分公式展示了复变函数的解析性质和积分性质之间的紧密联系，这在复分析中有大用，亦可帮助我们计算复杂解析函数的积分值。

#line(length: 100%)

接下来介绍复变函数的不定积分，若函数 $f(z)$ 在单连通区域 $B$ 内处处解析，且有有向曲线 $C$ 完全包括在 $B$ 内部，那么可以知道积分 $integral_C f(z) d z$ 的值和路径无关，只与路径的起点和终点有关。

所以不妨令 $C$ 的起点为 $z_0$，那么对于 $B$ 内任意一点 $z$，都可以找到一条有向曲线 $C$ 连接 $z_0$ 和 $z$，那么我们定义

$
  F(z) = integral_(z_0)^z f(w) d w
$

为对曲线 $C$ 的积分结果，称之为该积分的变上限函数。

和实变函数中的不定积分类似，变上限函数也具有微分性质#footnote[依靠定义就可以证明该结论]

$
  F'(z) = f(z)
$

同时，也有复变函数中的牛顿-莱布尼兹公式

$
  integral_(z_1)^(z_2) f(z) d z = F(z_2) - F(z_1)
$

依靠这些公式，就可以像实变函数中那样，计算复变函数的不定积分。

=== 复数项级数

#definition("复数项级数及其极限")[
  复数项级数的定义和实数项级数类似，若对于一个数列 $alpha_n = a_n + i b_n$ 是数列的第 $n$ 项，则称该数列为复数列。

  若其部分和 $sum_(n=0)^(N) alpha_n$ 收敛于某个复数 $S$，即

  $
    lim_(N -> oo) sum_(n=0)^(N) alpha_n = S
  $

  则称该复数项级数 $sum_(n=0)^(oo) alpha_n$ 收敛于 $S$；若该极限不存在，则称该级数发散。
]

复数项级数收敛的一个充分必要条件是其实部和虚部分别收敛，即当 $alpha = a + b i$ 时

$
  lim_(n -> oo) a_n = a, lim_(n -> oo) b_n = b <=> lim_(N -> oo) sum_(n=0)^(N) alpha_n = a + b i
$

由此也可以推出复数项级数收敛的必要条件为#footnote[这是因为若级数的部分和就收敛，数列的实部和虚部都必须收敛于 $0$，所以总的复数项也必须收敛于 $0$。]

$
  lim_(n -> oo) alpha_n = 0
$

#definition("绝对收敛和条件收敛")[
  与实数项级数类似，若复数项级数 $sum_(n=0)^(oo) alpha_n$ 的绝对值级数 $sum_(n=0)^(oo) |alpha_n|$ 收敛，则称该复数项级数绝对收敛；若绝对值级数发散但原级数收敛，则称该级数条件收敛。
]

如果一个级数绝对收敛，那么它一定收敛#footnote[这是因为当 $sum_(n->0)^(oo) |a_n + b_n i|$ 收敛时，这表明实数列 $sqrt(a_n^2 + b_n^2)$ 也收敛；由均值不等式可知 $|a_n| + |b_n|$ 也收敛，这可以推出 $a_n$ 和 $b_n$ 分别都绝对收敛。所以根据前文提到的充要条件，该复数列也收敛。]。由于复数的模是实数，所以要判断一个复数列是否绝对收敛，又可以采用适用于实数项级数的根值审敛法和比值审敛法。

#theorem("复数项级数的绝对收敛判别法")[
  设 $sum_(n=0)^(oo) alpha_n$ 是复数项级数，则有

  - 根值审敛法：
    若 $lim_(n -> oo) root(n, |alpha_n|) = rho$，则当 $rho < 1$ 时级数绝对收敛，当 $rho > 1$ 时级数发散，当 $rho = 1$ 时该方法不确定。

  - 比值审敛法：
    若 $lim_(n -> oo) abs(alpha_(n+1)) / abs(alpha_n) = rho$，则当 $rho < 1$ 时级数绝对收敛，当 $rho > 1$ 时级数发散，当 $rho = 1$ 时该方法不确定。
]

同样的，在绝对收敛的判定中还可以应用夹逼定理。

==== 复数幂级数

若区域 $D$ 上有复级数 $sum_(n=0)^(oo) a_n z^n$ 或 $sum_(n=0)^(oo) a_n (z - z_0)^n$，其中 $z$ 是复变量，则称该级数为复数幂级数。

复数幂级数具有阿贝尔定理

#theorem("复数幂级数的阿贝尔定理")[
  设 $sum_(n=0)^(oo) a_n z^n$ 是复数幂级数，若该级数在某点 $z_1$ 收敛，则它在 $|z| < |z_1|$ 内绝对收敛；若该级数在某点 $z_2$ 发散，则它在 $|z| > |z_2|$ 内发散。#footnote[其证明与实数幂级数的阿贝尔定理类似。]

  这就意味着，存在一个临界值 $R$，使得当 $|z| < R$ 时级数绝对收敛，当 $|z| > R$ 时级数发散，而当 $|z| = R$ 时则可能收敛也可能发散。这个临界值 $R$ 称为该复数幂级数的收敛半径。
]

收敛的复数落在一个以 $0$ 或 $z_0$ 为圆心的圆内，称为收敛圆，收敛圆的半径称为收敛半径 $R$。复数幂级数在收敛圆内绝对收敛，在收敛圆外发散，在收敛圆上则可能收敛也可能发散。

收敛半径可以通过根值审敛法或比值审敛法来计算

$
  R = 1 / ( lim_(n -> oo) root(n, |a_n|) ) = lim_(n -> oo) abs(a_n) / abs(a_(n+1))
$

==== 复数泰勒级数

若复数函数 $f(z)$ 在以 $z_0$ 为圆心，$R$ 为半径的圆盘区域 $D$ 上解析，则它在 $z_0 in D$ 处展开的泰勒级数为

$
  sum_(n=0)^(oo) c_n (z - z_0)^n
$

其中 $c_n$ 是泰勒展开的系数，有 $c_n = (f^((n)) (z_0)) / n!$；$z$ 是复变量，且 $abs(z - z_0) < R$。#footnote[之所以具有该 $z$ 的取值范围限制，是因为若将泰勒级数看作幂级数，则根据复数幂级数的阿贝尔定理，泰勒级数的收敛范围必然受限于某个收敛圆内。]

采用复变函数的高阶导数公式，$c_n$ 还可以被表示为

$
  c_n = 1 / (2 pi i) integral.cont_C f(z) / (z - z_0)^(n+1) d z
$

常见且常用的泰勒展开有

$
  e^z = sum_(n=0)^(oo) z^n / n! \
  sin z = sum_(n=0)^(oo) (-1)^n z^(2n+1) / (2n+1)! \
$
$
  cos z = sum_(n=0)^(oo) (-1)^n z^(2n) / (2n)! \
  "Ln"(1 + z) = sum_(n=1)^(oo) (-1)^(n-1) z^n / n, quad |z| < 1 \
  1 / (1 - z) = sum_(n=0)^(oo) z^n, quad |z| < 1
$

有时，直接求一个函数的泰勒展开式是非常复杂的，例如对于 $f(z) = e^z^2$ 在 $z_0 = 0$ 处的泰勒展开式，随着求导次数逐渐变高，其导数的形式会变得越来越复杂。这个时候应当引入泰勒公式的间接求法。

#theorem("麦克劳林展开式的间接求法")[
  若 $f(z)$ 在 $z = z_0$ 处的麦克劳林展开式为 $P(z)$，那么对函数 $f(b z^m)$ 而言 $(b != 0, m > 1, m in bb(Z)^+)$，其泰勒展开式为 $P(b z^m)$。#footnote[该定理的证明参考 https://www.docin.com/p-1700726939.html]
]

所以，$f(z) = e^(z^2)$ 的麦克劳林展开式为

$
  e^z = sum_(n=0)^(oo) z^n / n! quad => quad e^(z^2) = sum_(n=0)^(oo) z^(2n) / n!
$

==== 洛朗级数

有时，$f(z)$ 在某个点不解析（例如原点），但是有时从该不解析点处开始作泰勒展开能提供很大的便利，此时可引入洛朗级数。

#definition("洛朗级数")[
  一个函数 $f(z)$ 的洛朗级数展开指的是其可以被表示为

  $
    f(z) = sum_(n = -oo)^(oo) c_n (z - z_0)^n
  $

  其中 $c_n$ 可由柯西积分公式给出
  $
    c_n = 1/(2 pi i) integral.cont_C f(zeta) / (zeta - z_0)^(n+1) d zeta
  $

  该级数收敛的区域为 $R_1 < |z - z_0| < R_2$，即函数中 $z$ 的取值范围。其中 $R_1$ 是该级数正半部分的收敛半径，$R_2$ 是该级数负半部分的收敛半径。
]

洛朗级数具体为何能够收敛的证明在此不叙述，重要的结论是：若 $f(z)$ 在某个区域内除了 $z_0$ 点外处处解析，则 $f(z)$ 则可以 $z_0$ 为中心在一个解析环域内展开为双边幂级数，即洛朗级数。

收敛半径的求法如下，先将双边幂级数转换成两个单边幂级数之和

$
  f(z) = sum_(n=0)^(oo) c_n (z - z_0)^n + sum_(n=1)^(oo) c_(-n) (z - z_0)^(-n)
$

对于该式的前半段 $sum_(n=0)^(oo) c_n (z - z_0)^n$，其收敛半径为 $R_2$，仅对于 $abs(z - z_0) < R_2$ 收敛

$
  R_2 = 1 / ( lim_(n -> oo) root(n, |c_n|) ) = lim_(n -> oo) abs(c_n) / abs(c_(n+1))
$

对于该式的后半段 $sum_(n=1)^(oo) c_(-n) (z - z_0)^(-n)$，不妨令 $(z - z_0)^(-1) = xi$，那么原级数化为

$
  sum_(n=1)^(oo) c_(-n) (z - z_0)^(-n) = sum_(n=1)^(oo) c_(-n) xi^n
$

容易发现该表达式也是一个幂级数，其收敛半径为

$
  R_1' = 1 / ( lim_(n -> oo) root(n, |c_(-n)|) ) = lim_(n -> oo) abs(c_(-n)) / abs(c_(-(n+1)))
$

所以该表达式仅对于 $abs(xi) < R_1'$ 收敛，换句话说，就应当是 $abs(z - z_0) > 1 / R_1'$。

令 $R_1 = 1 / R_1'$，那么该式仅对于 $abs(z - z_0) > R_1$ 收敛。故，洛朗级数的收敛区域#footnote[有时 $R_2 -> +oo$，相关极限不存在，这种情况下我们认为 $abs(z - z_0)$ 没有上界；同样的 $R_1' -> +oo$ 也有可能，此时 $R_1 = 0$。]为 $R_1 < |z - z_0| < R_2$。

#line(length: 100%)

在求泰勒级数展开式时，一般通过直接列函数的 $f^((n))(x)$ 高阶导数来求解，有时也通过上述的间接求法来求解，求洛朗级数也可以采用直接法

$
  c_n = 1/(2 pi i) integral.cont_C f(zeta) / (zeta - z_0)^(n+1) d zeta
$

直接确定系数后，代入洛朗级数表达式即可

$
  f(z) = sum_(n = -oo)^(oo) c_n (z - z_0)^n
$

类似于泰勒级数的间接求法，许多时候洛朗级数可利用泰勒公式的变形来得到

泰勒公式的变形，一类是通过定比例/幂运算代换变量，来等价得到另一表达式的泰勒展开；而另一类则单纯是利用等式的性质，将泰勒展开式中的某些项进行求导、积分等运算，来得到新的表达式。

下面的例题展示了如何通过间接求法来得到洛朗级数展开式。

#example("例题")[
  求 $f(z) = 1 / ((z + 1)^2 (z + 2))$ 在以下圆盘域 $1 < abs(z + 2) < oo$ 的洛朗级数展开式。

  #highlight[解]：将原式中部分 $1 / (z + 1)$ 化为

  $
    1 / (z + 1) = 1 / ((z + 2) - 1) = 1 / ((z + 2) (1 - 1/(z + 2))) \ = 1 / (z + 2) sum_(n=0)^(oo) (1/(z + 2))^n = sum_(n=0)^(oo) (z + 2)^(-n-1)
  $

  而 $1 / (z + 1)^2 = (-1 / (z + 1))'$，故对于原式中成分 $1 / (z + 1)^2$，有

  $
    1 / (z + 1)^2 = (-1 / (z + 1))' = - ( sum_(n=0)^(oo) (z + 2)^(-n-1) )' = sum_(n=0)^(oo) (n+1) (z + 2)^(-n-2)
  $

  此时将该结果带回原式，得到

  $
    f(z) = 1 / ((z + 1)^2 (z + 2)) = sum_(n=0)^(oo) (n+1) (z + 2)^(-n-3)
  $
]

=== 复变函数的留数

留数指的是极点的洛朗级数中 $a_(-1)$ 的系数，之所以称之为留数，是因为它在计算复变函数的积分时起到了以下的关键作用。

不妨假设，在奇点 $z_k$ 的去心邻域内，$f(z)$ 可以展开为洛朗级数
$
  f(z) = ... + a_(-2)^(k) (z - z_k)^(-2) + a_(-1)^(k) (z - z_k)^(-1) + a_0^(k) + a_1^(k) (z - z_k) + ...
$

那么，若有一极小闭曲线 $C$ 包含该奇点，则有沿曲线 $C$ 的积分
$
  integral.cont_C f(z) d z = integral.cont_C sum_(n = -oo)^(oo) a_n (z - z_k)^n d z
$

观察该积分式，对于次数 $n != -1$ 的项目，有
$
  integral.cont_C (z - z_k)^n d z = cases(
    0 quad &"当" n != -1,
    2 pi i quad &"当" n = -1
  )
$

这是因为：

当 $n != -1$ 时，设 $u = z - z_k$，则 $d u = d z$，积分变为：
$
  integral.cont_C u^n d u = integral.cont_C d(u^(n+1) / (n+1)) = 0
$

这是因为 $u^(n+1) / (n+1)$ 在闭曲线上的积分为零（封闭路径上解析函数的积分）。

而例外的情况在于，当 $n = -1$ 时
$
  integral.cont_C (z - z_k)^(-1) d z = integral.cont_C 1/(z - z_k) d z = 2 pi i
$

这也就意味着，$integral.cont_C f(z) d z$ 表达式的值仅仅和 $f(z)$ 的洛朗级数展开中的 $c_(-1)$ 系数有关，故称这个特殊的洛朗级数系数为留数，写作
$
  "Res"(f(z), z_0) = c_(-1)
$

#theorem("留数定理")[
  设 $f(z)$ 在单连通区域 $D$ 内解析，但在 $z_1, z_2, ..., z_n$ 处有孤立奇点，$C$ 为 $D$ 内一条光滑闭曲线，且正向绕过这些孤立奇点，那么有
  $
    integral_C f(z) d z = 2 pi i sum_(k=1)^(n) "Res"(f(z), z_k)
  $
]

这被称为留数定理，所有积分运算都是留数运算。

#line(length: 100%)

根据解析和奇点的定义，我们知道仅有 $m$ 阶极点和本性极点处的留数不为零，其他类型的奇点处留数均为零。

对于这两种奇点处的留数，有以下计算方法

若 $z_0$ 是 $f(z)$ 的 $m$ 阶极点，则
$
  "Res"(f(z), z_0) = frac(1, (m-1)!) lim_(z -> z_0) frac(d^(m-1), d z^(m-1)) [(z - z_0)^m f(z)]
$

=== 留数定理在实积分领域的应用

==== 三角函数类

形如 $integral_(0)^(2 pi) R(sin theta, cos theta) d theta$ 的实积分，可以通过复变函数中的留数定理来计算。

如果设 $z = e^(i theta)$，则可以将原三角函数表达式代换为
$
  sin theta = (z - 1/z) / (2 i),
  cos theta = (z + 1/z) / 2,
  d theta = (d z) / (i z)
$

于是积分就化为对于单位圆 $abs(z) = 1$ 的复变函数积分

==== 有理实函数
形如 $integral_(-oo)^(+oo) P(x) / Q(x) d x$ 的实积分，也可以通过复变函数中的留数定理来计算。其中 $P(x), Q(x)$ 是有理函数，且 $deg(Q) - deg(P) >= 2$。#footnote[$deg$ 指的是多项式的次数，分母的次数比分子的次数至少高两次]。


== 概率与统计

概率学和统计学是两个研究随机现象的学科，前者侧重于描述和分析随机事件发生的规律，后者则侧重于从数据中提取信息和做出推断。

随机现象指的是在基本条件基本相同的情况下，其发生结果却不确定的现象，例如抛硬币、掷骰子等。随机现象在较少次数的试验中会表现出较大的偶然性，但在大量重复实验中可能会表现出一定的统计规律性，概率论即为研究这种规律性的学科。

=== 随机事件及其概率

随机试验指的是在相同条件下可以重复进行，所有可能结果已知，且无法在试验前预测结果的试验。

样本空间指的是随机试验中所有可能结果的集合，通常用 $Omega$ 来表示。其中任意一个可能结果称为样本点，样本空间中的一个子集称为随机事件。

随机事件之间可以进行和、差、积运算，例如对于事件 $A$ 和 $B$，有
$
  A or B = {omega | omega in A or omega in B} \
  A and B = {omega | omega in A and omega in B} \
  A - B = {omega | omega in A and omega not in B}
$

== 系统的介绍

=== 对系统和信号的介绍

系统指的是对输入信号（激励）进行处理，产生输出信号（响应）的装置或过程

==== 信号

信号是随时间变化的物理量，常用的描述方式有函数、图形与数据。

介绍以下常用连续信号类型
1. 正弦信号

$
  f(t) = A sin(2 pi f t + phi)
$

一类周期信号，$T = 1 / f$，傅里叶级数中的常客，最常见的信号类型；

2. 单位阶跃信号

$
  U(t) = cases(
    0 quad (t < 0),
    1 quad (t >= 0)
  )
$

一类因果信号，在 $t = 0$ 处由截止变为单位值。

值得一提的是，该函数的导数是单位冲激信号，即狄拉克函数 $delta(t)$#footnote[按照传统函数的定义，该函数显然不可微，但事实上现实中经常存在此类信号突变情况，例如开关的打开造成电压突变，故为了研究此类情况，$delta(t)$ 被引入作为一种理想化的数学工具。]；

3. 单位门信号

$
  G_(tau)(t) = cases(
    1 quad (-tau/2 <= t < tau/2),
    0 quad (t < -tau/2 or t >= tau/2)
  )
$

可以被单位阶跃信号表示为

$
  G_(tau)(t) = U(t + tau/2) - U(t - tau/2)
$

相较于前者，更适合用来表示一个时间段内的信号。

4. 单位冲激信号

$
  delta(t) = cases(
    +oo quad (t = 0),
    0 quad (t != 0)
  ), quad integral_(-oo)^(+oo) delta(t) d t = 1
$

又名狄拉克函数，它可以被认为是单位脉冲信号的门宽趋近于 $0$ 时的极限#footnote[泛函分析中，$delta(t)$ 的定义更加严谨，它被描述为一种广义函数：如果一个函数 $delta(x - a)$ 乘以任何一个连续函数 $phi(x)$ 后，再沿 $(-oo, oo)$ 积分，得到的其积分值为 $phi(a)$，那么就称函数为狄拉克函数——狄拉克函数是通过观察其对其他函数所起的采样效果来定义的，而非上式中的极限。]。

该信号具有采样性质：与另一信号相乘将转化为在指定点处的采样。

$
  f(t) delta(t - t_0) = f(t_0) delta(t - t_0)
$

同时具有尺度特性，扩充其尺度将会降低幅值#footnote[可以通过变量代换 $u = a t$ 来证明该式成立。另外，由于 $delta(t)$ 是偶函数，所以可以在计算过程中在 $a < 0$ 时代换 $delta(a t)$ 为 $delta(-a t)$，即可得到本式中的绝对值。]。

$
  delta(a t) = 1 / (|a|) delta(t)
$

由以上性质，可以衍生冲激偶函数 $delta'(t)$ ，它是 $delta(t)$ 的一阶导数，在 $t = 0$ 同时具有向上和向下的两轮冲激，具有下式的采样性质

$
  integral_(-oo)^(+oo) f(t) delta'(t - t_0) d t = f(t) delta(t - t_0) |_(-oo)^(+oo) - integral_(-oo)^(+oo) f'(t) delta(t - t_0) d t = -f'(t_0)
$

也就是

$
  integral_(-oo)^(+oo) f(t) delta'(t - t_0) d t = -f'(t_0)
$

该定义可以进一步衍生到高阶导，对于任意 $n$ 阶导的 $delta^(n)(t)$ 函数，有以下采样性质

$
  integral_(-oo)^(+oo) f(t) delta^(n)(t - t_0) d t = (-1)^n f^(n)(t_0)
$

同样的，任意 $n$ 阶导的 $delta^(n)(t)$ 函数，有以下尺度性质

$
  delta^(n)(a t) = 1/(|a|) 1/(a^n) delta^(n)(t)
$

单位冲激函数在描述状态突变、

5. 抽样信号

$
  f(t) = (sin t) / t = "Sa"(t)
$

抽样信号的一大特性是它的傅里叶变换结果是

$
  cal(F) { (sin t) / t } = pi "rect"(omega / 2) = cases(
    pi quad (|omega| < 1),
    0 quad (|omega| > 1)
  )
$

连续信号有能量与功率的定义，对应的代数关系为

$
  E = lim_(T -> +oo) integral_(-T)^(+T) |f(t)|^2 d t \
  P = lim_(T -> +oo) (1 / T) integral_(-T/2)^(+T/2) |f(t)|^2 d t
$

#line(length: 100%)

同时，对于离散信号而言，其通常被表示为序列 ${x_n}$，其中 $n$ 是整数。

介绍以下常用离散信号类型

1. 单位样值信号 $delta(n)$

单位样值信号表示为
$
  delta(n) = cases(
    1 quad n = 0,
    0 quad n != 0
  )
$

连续时域信号的 $delta(t)$ 以面积表示强度，而离散时域信号的 $delta(n)$ 则以高度表示强度。

单位样值信号也有抽样特性
$
  x(n) = sum_(k=-oo)^(oo) x(k) delta(n - k)
$

2. 单位阶跃信号 $u(n)$
$
  u(n) = cases(
    1 quad n >= 0,
    0 quad n < 0
  )
$
所以也有
$
  delta(n) = u(n) - u(n - 1)
$

3. 矩形序列
$
  R_N (n) = cases(
    1 quad 0 <= n < N,
    0 quad n < 0 and n >= N
  )
$

离散信号的能量与功率的定义如下
$
  E = sum_(n=-oo)^(+oo) |x(n)|^2 \
  P = lim_(N -> +oo) (1 / (2 N + 1)) sum_(n=-N)^(+N) |x(n)|^2
$

==== 系统

系统可以有以下常见且重要的性质

1. 线性性

若系统满足叠加和齐次原理，即对于任意输入信号 $x_1(t)$ 和 $x_2(t)$，及其对应的输出信号 $y_1(t)$ 和 $y_2(t)$，都有

$
  a x_1(t) + b x_2(t) mapsto a y_1(t) + b y_2(t)
$

则称该系统为线性系统。任何时候，相同的输入信号都应当产生相同的输出。

2. 时不变性

若系统的输入信号 $x(t)$ 对应输出信号 $y(t)$，那么对于任意时间平移 $t_0$，都有

$
  x(t - t_0) mapsto y(t - t_0)
$

则称该系统为时不变系统。

#example("判断系统的线性性和时不变性")[ \
  以下系统中 $f(t)$ 是激励，$y(t)$ 是响应


  1. $ y(t) = e^(-t) integral_(-oo)^(t) f(tau) e^(tau) d tau $
]

3. 因果性

若系统的输出信号 $y(t)$ 在任意时刻 $t_0$ 仅与输入信号 $x(t)$ 在 $t <= t_0$ 时的取值有关，而与 $t > t_0$ 时的取值无关，则称该系统为因果系统。

也就是说，系统的响应不会受未来还没发生的激励影响。

一种常见的，易于分析的系统是线性时不变系统（LTI 系统），它同时满足线性性与时不变性。

=== 系统的方程表示方法

==== 使用微分方程表示线性时不变系统

我们已经知道线性时不变系统（LTI 系统）的性质：线性性与时不变性。由此可以导出推论，所有线性时不变系统都可以被描述为以下形式

$
  a_n y^(n)(t) + a_(n-1) y^(n-1)(t) + ... + a_1 y'(t) + a_0 y(t) = \ b_m x^(m)(t) + b_(m-1) x^(m-1)(t) + ... + b_1 x'(t) + b_0 x(t)
$

其中 $x(t)$ 是输入信号，$y(t)$ 是输出信号，$a_i, b_j$ 是常数。

这样表示一个系统是很常见且有用的，因为很多系统输入输出量之间就是用微分方程约束的，一个经典的例子就是 RLC 串联电路，其微分方程为

$
  L (d^2y)/(d t^2) + R (d y)/(d t) + 1/C y = (d x)/(d t)
$

其中 $x(t)$ 是电压源的电压，$y(t)$ 是电路的电流。

===== 零输入响应与零状态响应

#definition("零输入响应")[
  零输入响应是指在输入信号 $x(t) = 0$ 的条件下，系统仅由初始条件激发产生的响应。

  即为在给定初始条件下：
  $
    y(0^-), y'(0^-), y''(0^-), ..., y^(n-1)(0^-)
  $

  齐次微分方程的解：
  $
    a_n y^(n)(t) + a_(n-1) y^(n-1)(t) + ... + a_1 y'(t) + a_0 y(t) = 0
  $
]

#definition("零状态响应")[
  零状态响应是指在零初始条件下，系统仅由输入信号 $x(t)$ 激发产生的响应。

  即为在给定初始条件下：
  $
    y(0^-) = y'(0^-) = y''(0^-) = ... = y^(n-1)(0^-) = 0
  $

  齐次微分方程的解：
  $
    a_n y^(n)(t) + a_(n-1) y^(n-1)(t) + ... + a_1 y'(t) + a_0 y(t) = \ b_m x^(m)(t) + b_(m-1) x^(m-1)(t) + ... + b_1 x'(t) + b_0 x(t)
  $
]

由齐次微分方程的线性性可知，系统的总响应等于这两种响应的叠加

$
  y(t) = y_"zs"(t) + y_"zi"(t)
$

这就意味着，对于输入和某时刻状态已知的线性时不变系统，我们可以将其等效为一个零状态系统加上一个初始状态激发的零输入系统，并通过这两个系统的响应之和来得到原系统的响应情况。

===== 冲激、阶跃输入

冲激、阶跃激励是分析线性时不变系统的常用激励信号。

#definition("冲激、阶跃响应")[
  - 冲激响应指的是系统对于输入 $x(t) = delta(t)$ 的响应，记作 $h(t)$，其中 $delta(t)$ 是狄拉克函数。
  - 阶跃响应指的是系统对于输入 $x(t) = u(t)$ 的响应，记作 $s(t)$，其中 $u(t)$ 是单位阶跃函数。
]

先讨论如何求解冲激响应 $h(t)$。对于线性时不变系统，其冲激响应可以通过求解微分方程

$
  a_n h^(n)(t) + a_(n-1) h^(n-1)(t) + ... + a_1 h'(t) + a_0 h(t) = \ b_m delta^(m)(t) + b_(m-1) delta^(m-1)(t) + ... + b_1 delta'(t) + b_0 delta(t)
$

可以发现，如果 $n <= m$，那么系统的冲激响应将会包含 $delta(t)$ 以及可能包含 $delta(t)$ 的 $m - n$ 阶导数，该信号是奇异的且不大可能在现实中出现，所以我们认为线性时不变系统的阶数 $n$ 必须大于输入信号的最高阶 $m$。

我们知道，该齐次微分方程的解由通解和一个特解构成；但是在本式中 $t > 0$ 时，右端为零，所以 $h(t)$ 在 $t > 0$ 时的解就是齐次微分方程的通解；

不妨设通解的形式为

$
  h(t) = (sum_(i=1)^n A_i e^(s_i t)) u(t)
$

其中 $s_i$ 是齐次微分方程的特征根，$A_i$ 是待定系数。

将该通解代入算式中，并令左右两边奇异函数（指 $delta(t)$ 及其导函数）的系数相等，可以解出 $A_i$ 的值，从而得到冲激响应 $h(t)$。

// 可在本部分补充例题

求得冲激响应后，根据 LTI 系统的积分特性，阶跃响应的表达式为

$
  g(t) = integral_(-oo)^t h(tau) d tau
$

===== 微分方程的转移算子

转移算子是线性微分方程的一种简化表示方法，围绕之还能推出一些运算小技巧。

定义函数的导数 $d/(d t) = p$，那么上述线性微分方程可以表示为

$
  D(p)y(t) = N(p)x(t)
$

其中 $D(p)$ 和 $N(p)$ 分别为 $p$ 的多项式，即

$
  D(p) = a_n p^n + a_(n-1) p^(n-1) + ... + a_1 p + a_0 \
  N(p) = b_m p^m + b_(m-1) p^(m-1) + ... + b_1 p + b_0
$

对上式做移项处理，有 $y(t) = N(p) / D(p) x(t)$，我们称这个多项式比值为系统的转移算子，记作 $H(p)$，即

$
  H(p) = N(p) / D(p)
$

转移算子一般是两个多项式函数的比值，所以它是一个有理函数，例如 $y'' + 3y' + 2y = 2f' + f$ 的转移算子为 $H(p) = (2p + 1) / (p^2 + 3p + 2)$。

我们已经学过有理分式分解定理，两个实系数多项式总能被唯一地分解为一系列最简分式之和。更具体地说，两个常系数多项式 $Q(D), P(D)$ 的比值是如下形式

$
  Q(D) / P(D) = G(D) + sum_(i=1)^k sum_(j=1)^(r_i) A_(i j) / (D - p_i)^j + sum_(l=1)^m (B_l D + C_l) / ((D^2 + b_l D + c_l)^s)
$

其中 $p_i$ 是 $P(D)$ 的实根，$D^2 + b_l D + c_l$ 是 $P(D)$ 的不可约二次因子（当有复根时出现），$G(D)$ 是 $Q(D) / P(D)$ 的整数部分（仅当 Q(D) / P(D) 为真分式时为 $0$）。

仍然以 $y'' + 3y' + 2y = 2f' + f$ 为例，其转移算子为 $H(p) = (2p + 1) / (p^2 + 3p + 2)$，分解后有

$
  H(p) = (2p + 1) / ((p + 1)(p + 2)) = -1 / (p + 1) + 3 / (p + 2)
$

分解的一大意义在于，将高阶的转移算子分解为若干个低阶算子之和之后，对于形式固定的低阶转移算子，有现成的冲激响应表达式，可以直接查表得到。#footnote[为什么算子和冲激响应一一对应？详见《拉普拉斯变换》一文，转移算子是可以被严谨推导的。]

#align(center)[
  #block(
    table(
      columns: (1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[算子形式]],
        [#text(weight: "bold")[对应的冲激响应形式]]
      ),
      [$1 / (D - lambda)$], [$e^(lambda t)$],
      [$1 / (D - lambda)^n$], [$t^(n-1) e^(lambda t)$],
      [$(B D + C) / (D^2 + p D + q)$], [$e^(alpha t) (M sin(beta t) + N cos(beta t))$#footnote[$alpha + beta i$ 是分母二次多项式的复根，将分母因式分解为 $(D - (alpha + beta i))(D - (alpha - beta i))$，$M, N$ 是待定系数。]],
      [$(B D + C) / (D^2 + p D + q)^n$], [$t^(n-1) e^(alpha t) (P sin(beta t) + Q cos(beta t))$#footnote[$alpha + beta i$ 是分母二次多项式的复根，将分母因式分解为 $(D - (alpha + beta i))(D - (alpha - beta i))$，$P, Q$ 是待定系数。]],
    )
  )
]

所以通过代值可知，上面的例子中的 $H(p) = -1 / (p + 1) + 3 / (p + 2)$ 对应的冲激响应为

$
  h(t) = -e^(-t) + 3e^(-2t)
$

这便是该系统的冲激响应。转移算子在将微分方程的解模块化的过程中起到了重要作用，是相当有用处的数学工具。

===== 冲激响应和卷积

想象两个六面骰子，投掷它们的结果为 $2D 6$，它们投掷出的点数之和的取值在 $[2, 12]$ 之间，那么点数之和落于该区间上的概率分布是怎样的呢？

以投掷出 $4$ 为例，有以下三种投掷情况：投出 $1+3, 2+2, 3+1$，所以投掷出 $4$ 的概率为

$
  P(4) = P_1(1) dot P_2(3) + P_1(2) dot P_2(2) + P_1(3) dot P_2(1) = sum_(k=1)^3 P_1(k) dot P_2(4-k)
$

其中 $P_1(k)$ 和 $P_2(k)$ 分别表示第一个和第二个骰子投出点数 $k$ 的概率。

可以发现投出一个总和值的概率为和为该值的所有组合情况的概率之和，推广上述情况到投掷出 $tau$，其概率为

$
  P(tau) = sum_(k=1)^6 P_1(k) dot P_2(tau - k)
$

仿照上述公式，将问题从离散的骰子点数推广到连续的随机变量上，假设有两个独立的随机变量 $X$ 和 $Y$，它们的概率密度函数（分布密度函数）分别为 $f_X (x)$ 和 $f_Y (y)$，那么随机变量 $Z = X + Y$ 的概率密度函数为

$
  f_Z (z) = integral_(-oo)^(+oo) f_X (x) dot f_Y (z - x) d x
$

该积分式遍历了所有 $X$ 和 $Y$ 的和为 $Z$ 的组合情况，并计算了每种组合情况下的概率密度，将所有可能积分，从而得到 $Z$ 的概率密度函数。

#definition("卷积")[
  我们称这种将两个独立变量的概率密度函数结合起来得到它们和的概率密度函数的运算为*卷积运算*，记作

  $
    f_Z (z) = (f_X * f_Y)(z)
  $
]

#line(length: 100%)

在现实中，对于给定 $f(t)$，LTI 系统的零状态响应 $y(t)$ 可能是非常复杂的，尤其是 LTI 系统的阶次非常高的情况下，涉及到 $n$ 阶导数，特征方程难以求解；但当系统处于零状态，$f(t) = delta(t)$ 时，系统的响应 $y(t) = h(t)$ 就是零状态冲激响应，且相应方程的求解相对简单，仅需将奇异项函数系数对应即可。

既然 $h(t)$ 求解相对简单，那么对于任何 LTI 系统，是否可以借助已知的 $h(t)$ 来求得系统对于其它输入 $f(t)$ 下的零状态响应 $y(t)$ 呢？

类比上述卷积概念，我们知道在 $t = tau$ 时刻的响应实际上由这些部分决定

- 在 $t = t_0$ 时的输入
- 在该输入发生后 $t = tau - t_0$ 时刻的响应

我们不妨将 $f(t)$ 看作一个概率密度函数，因为它反映了在任意时刻输入的强度状态，所以它实际上是对输入强度的分布描述。#footnote[概率的统计规律即为分布状态]

根据 LTI 系统的时不变特性，我们知道

$
  delta(t) -> h(t) quad 且 quad delta(t - t_0) -> h(t - t_0)
$

这意味着，在任意时刻 $t = t_0$ 输入的激励，其造成的响应在接下来 $[t_0, +oo]$ 时间段内的概率密度函数（分布状态）将为 $h(t - t_0)$，和 $delta(t)$ 的响应的分布情况相同。

所以，在此时输入的激励在 $t = tau$ 时刻的影响密度为 $f(t_0)h(tau - t_0)$；对于 $f(t)$ 作为激励，系统在任意时刻 $t = tau$ 时刻的响应将会等价于所有时刻输入的影响密度的叠加，即

$
  y(tau) = integral_(-oo)^(+oo) f(t_0) h(tau - t_0) d t_0
$

也就是输入信号 $f(t)$ 与系统冲激响应 $h(t)$ 的卷积

$
  y(t) = (f * h)(t)
$

卷积在信号处理中具有其独特的几何意义：先将 $h(t)$ 关于 $y$ 轴翻转，得到 $h(-t)$，然后将其沿 $x$ 轴平移 $t$ 个单位，得到 $h(tau - t)$，然后计算 $f(tau)$ 与 $h(tau - t)$ 的乘积得到新图形，最后计算新图形的线下面积得到卷积结果。

其中，反转和平移的本质是将 $h(t)$ 和 $f(t)$ 中时间之和为 $tau$ 的点对齐，这样求解它们乘积的积分就等价于求解它们对于 $tau$ 时刻的影响总和。

#theorem("卷积积分的主要性质")[
  卷积积分的积分和微分具有一些性质
  $
    integral_(-oo)^(t) (f * g)(tau) d tau = f(t) dot (integral_(-oo)^(t) g(tau) d tau)
  $
  $
    (d)/(d t) (f * g)(t) = f(t) * (d g)/(d t)
  $
  $
    (f * g)(t) = (d f(t))/(d t) * (integral_(-oo)^(t) g(tau) d tau)
  $
  由于卷积也具有交换律，所以 $f(t)$ 和 $g(t)$ 的位置可以互换。
]

接下来介绍 $delta(t)$ 和 $u(t)$ 的卷积性质

$
  f(t) * delta(t) = integral_(-oo)^(+oo) f(tau) delta(t - tau) d tau = f(t)
$

任何信号对于 $delta(t)$ 的卷积等于其本身。

所以根据卷积的微分和积分性质，有

$
  f(t) * u(t) = integral_(-oo)^(t) f(tau) d tau \
  f(t) * delta'(t) = (d f(t))/(d t)
$

#line(length: 100%)

接下来来看一道例题

#figure(image("images/工科数学/系统分析方法/卷积例题1.png", width: 35%),
  caption: [
    题目图
  ]
)
对于该系统，激励 $f(t) = U(t) - U(t - 6pi)$，求零状态响应 $u_c(t)$

先求系统的冲激响应，设 $f(t) = delta(t)$，则有

$
  (d^2 u_c)/(d t^2) + u_c = delta(t)
$

出于特征根 $r^2 + 1 = 0, r = ±i$，设 $u_c$ 的通解为
$
  u_c (t) = (A_0 e^(i x) + A_1 e^(-i x)) u(t)
$

又求导有
$
(d^2 u_c)/(d t^2) = -(A_0 e^(i x) + A_1 e^(-i x)) u(t) + \ (A_0 + A_1 + i(A_0 - A_1)) delta(t) + (A_0 + A_1)delta'(t)
$

将其带回原表达式，对齐奇异项 $delta(t)$ 和 $delta'(t)$ 的系数，有
$
  cases(
    A_0 + A_1 = 0,
    i(A_0 - A_1) = 1
  ) quad -> quad A_0 = -A_1 = -i/2
$

带回原表达式，有
$
  h(t) = -i/2 (e^(i t) - e^(-i t)) u(t) = sin(t) u(t)
$

所以在 $f(t) = U(t) - U(t - 6pi)$ 时，有其响应为该信号和冲激信号的卷积
$
  u_c (t) = (f * h)(t) = integral_(-oo)^(+oo) f(tau) h(t - tau) d tau
$

由于有多个阶跃函数，将它们放在同一个积分区间内不好处理，可以转化为
$
  u_c (t) = f'(t) * (integral_(-oo)^(t) h(tau) d tau) \ = (delta(t) - delta(t - 6pi)) * (integral_(-oo)^(t) sin(tau) d tau)
$

然后有

$
  integral_(-oo)^(t) sin(tau) d tau = (1 - cos(t)) u(t)
$

所以原式化为

$
  u_c (t) = (delta(t) - delta(t - 6pi)) * ((1 - cos(t)) u(t)) = \ (1 - cos(t)) u(t) - (1 - cos(t - 6pi)) u(t - 6pi)
$

这就是系统的零状态响应。

// TODO：在此添加微分方程描述系统的内容，貌似在笔记中缺少

==== 使用差分方程同理表示离散的线性时不变系统

对于连续的 LTI 系统而言，有时域微分方程描述系统的性质；而对于离散的 LTI 系统，则有时域差分方程描述系统的性质。

定义对序列 $x(n)$ 的差分运算为
$
  Delta x(n) = x(n) - x(n - 1)
$

差分运算类似于连续信号的微分运算，表示当前值与前一时刻值之差。

可以连着定义二阶差分
$
  Delta^2 x(n) = Delta(Delta x(n)) = x(n) - 2x(n - 1) + x(n - 2)
$

这样可以递推下去写出 $n$ 阶差分的公式，系数的分配类似杨辉三角
$
  Delta^n x(n) = sum_(k=0)^n (-1)^k binom(n, k) x(n - k)
$

由此，可以推导出差分方程的一般形式为
$
  sum_(k=0)^N a_k y(n - k) = sum_(m=0)^M b_m x(n - m)
$

差分方程的通解包含齐次解与特解两部分。求解齐次解可以通过特征方程法。

对于方程
$
  sum_(k=0)^N a_k y(n - k) = 0
$

将其写为
$
  a_0 y(n) + a_1 y(n - 1) + ... + a_N y(n - N) = 0
$

令 $y(n) = r^n$，代入上式得到特征方程
$
  a_0 r^n + a_1 r^(n-1) + ... + a_N r^(n-N) = 0
$

特征方程的解即为特征根，根据特征根的不同情况，可以得到齐次解的不同形式

1. 有多个非重根特征根
假设特征根为 $r_1, r_2, ..., r_N$，则齐次解为
$
  y_h(n) = C_1 r_1^n + C_2 r_2^n + ... + C_N r_N^n
$
其中系数可以通过待定系数法求出。

2. 有重根特征根
假设特征根 $r$ 的重数为 $m$，则齐次解为
$
  y_h(n) = (C_1 + C_2 n + C_3 n^2 + ... + C_m n^(m-1)) r^n
$

3. 有共轭复根特征根
假设特征根为 $alpha ± j beta$，则齐次解为
$
  y_h(n) = (sqrt(alpha^2 + beta^2))^n [C_1 cos(beta n) + C_2 sin(beta n)]
$

同理连续微分方程，求解单位样值信号 $delta(n)$ 输入时的响应的过程如下

#example("求解该差分方程的单位样值响应")[
  $
    y(n) - 3 y(n - 1) + 3 y(n - 2) - y(n - 3) = x(n)
  $

  有特征方程 $r^3 - 3r^2 + 3r - 1 = 0$，所以有一个三重根 $r = 1$。

  所以该系统有通解 $y(n) = (C_1 + C_2 n + C_3 n^2) u(n)$。

  根据 $x(n) = delta(n)$，所以 $x(0) = 1, x(-1) = 0, x(-2) = 0, ...$，代入原式，计算得到 $h(0) = 1, h(-1) = 0, h(-2) = 0$。

  代入通解，解得 $C_1 = 1, C_2 = 3/2, C_3 = 1/2$。因此该系统的单位样值响应为
  $
    h(n) = (1 + 3/2 n + 1/2 n^2) u(n)
  $
]

单位样值相应的求解主要包括先求解齐次解，然后通过 $delta(n)$ 提供的初始条件求解系数。最终得到单位样值响应 $h(n)$。

同理连续微分方程，有时域卷积定理，对于输入 $f(n)$，单位样值响应为 $h(n)$ 的离散系统，其输出 $y(n)$ 可由卷积律求得
$
  y(n) = sum_(k=-oo)^(oo) f(k) h(n - k) = f(n) * h(n)
$

所以，对于任意输入 $f(n)$，都可以通过系统的样值响应来求出对应的响应。

== 三大变换与系统的频域、复频域、Z域分析方法

=== 傅里叶变换
这是一个定义在 $\[ - 1 \, 1 \]$ 上的方波函数

#figure(image("images/工科数学/三大变换/fourier.png"),
  caption: [
    方波
  ]
)

现在，我们定义一系列的正弦波函数

$ f_k \( x \) = frac(2 \( 1 - cos \( k pi \) \), k pi) s i n \( k pi x \) $

令其前 $N$ 项的和为 $F \( N \)$

$ F \( N \) = sum_(k = 1)^N f_k \( x \) $

我们来把 $F \( 1 \)$ 的图像画出来看看

#figure(image("images/工科数学/三大变换/fourier-2.png"),
  caption: [
    F(1) 的图像
  ]
)

看起来正弦波和方波之间没什么联系，我们把 $F \( 11 \)$
的图像画出来，和方波比较看看

#figure(image("images/工科数学/三大变换/fourier-3.png"),
  caption: [
    F(11) 的图像
  ]
)

看起来正弦波有点向方波靠拢的趋势了，继续增加 $N$ 的值，看看 $F \( 31 \)$
的图像

#figure(image("images/工科数学/三大变换/fourier-4.png"),
  caption: [
    F(31) 的图像
  ]
)

图像和真正的方波越来越接近了

#figure(image("images/工科数学/三大变换/fourier-5.png"),
  caption: [
    F(100) 的图像
  ]
)

叠加到 $F \( 100 \)$ 的时候，图像已经和方波几乎重合了，我们把
$F \( 100 \)$ 单独画出来看看。

#figure(image("images/工科数学/三大变换/fourier-6.png"),
  caption: [
    通过 100 个正弦函数的叠加，模拟出的方波函数
  ]
)

可以发现，我们用一系列正弦函数的叠加模拟出了一个方波函数，像这样，将满足一定条件的函数用三角函数级数的和来表示，我们称之为傅里叶级数。

==== 傅里叶级数的提出
#link("https://zhuanlan.zhihu.com/p/31371519")[傅里叶]
发现傅里叶级数的过程有若干种说法，相对比较流行的说法是傅里叶在解有关于热传导的偏微分方程时（傅里叶曾从事有关于热传导的研究，著有《热的解析理论》），发现该微分方程的解是一个三角级数。

在经过一些更为广泛的论证后，傅里叶做出了一个大胆的猜想，他认为所有的周期函数都可以表示为正弦级数的形式，即

$ f \( t \) = A_0 + sum_(n = 1)^oo A_n sin \( n omega t + phi.alt_n \) $

#quote(block: true)[
此时 $f \( t \)$ 的周期为
$T = frac(2 pi, omega)$，$A_0 \, A_n \, phi.alt_n$ 为常数项。
]

傅里叶几乎是个天才，因为右边的式子涉及到无穷级数，明显就比左边的更复杂，把一个式子变得更复杂有什么呢。但是傅里叶认为右边的式子都是都是简单的正弦函数的叠加，在处理上更为方便，于是继续有

$ f \( t \) = A_0 + sum_(n = 1)^oo \[ A_n sin \( n omega t \) cos \( phi.alt_n \) + B_n cos \( n omega t \) sin \( phi.alt_n \) \] $

令 $a_n = A_n cos \( phi.alt_n \) \, b_n = B_n sin \( phi.alt_n \)$，则

$ f \( t \) = A_0 + sum_(n = 1)^oo \[ a_n sin \( n omega t \) + b_n cos \( n omega t \) \] $

现在，要求出 $A_0 \, a_n \, b_n$，我们可以利用三角函数的正交性。

三角函数的正交性指的是对于 $sin n omega x$ 和 $cos n omega x$ 而言，以下关系式成立

$ integral_(- pi / omega)^(pi / omega) sin(n omega x) d x = 0 $

$ integral_(- pi / omega)^(pi / omega) cos(n omega x) d x = 0 $

$ integral_(- pi / omega)^(pi / omega) sin(k omega x) cos(n omega x) d x = 0 $

$ integral_(- pi / omega)^(pi / omega) sin(k omega x) sin(n omega x) d x = 0 $

$ integral_(- pi / omega)^(pi / omega) cos(k omega x) cos(n omega x) d x = 0 $

其中 $n, k in bb(N)$，且 $n eq.not k$；

通过积化和差不难证明其正确性。

于是，我们首先对等式两边积分

$ integral_(- pi / omega)^(pi / omega) f \( t \) d t = integral_(- pi / omega)^(pi / omega) A_0 d t + sum_(n = 1)^oo \[ a_n integral_(- pi / omega)^(pi / omega) sin \( n omega t \) d t + b_n integral_(- pi / omega)^(pi / omega) cos \( n omega t \) d t \] $

根据正交性，我们可以得到

$ integral_(- pi / omega)^(pi / omega) f \( t \) d t = frac(2 pi, omega) A_0 + sum_(n = 1)^oo \[ a_n dot.op 0 + b_n dot.op 0 \] = frac(2 pi, omega) A_0 $

所以

$ A_0 = frac(omega, 2 pi) integral_(- pi / omega)^(pi / omega) f \( t \) d t $

对等式两边同时乘 $sin \( k omega t \)$，并对等式两边积分

$ integral_(- pi / omega)^(pi / omega) f \( t \) sin \( k omega t \) d t = integral_(- pi / omega)^(pi / omega) A_0 sin \( k omega t \) d t + sum_(n = 1)^oo \[ a_k integral_(- pi / omega)^(pi / omega) sin \( k omega t \) sin \( n omega t \) d t + b_k integral_(- pi / omega)^(pi / omega) cos \( n omega t \) sin \( k omega t \) d t \] $

根据正交性，无穷级数中有且仅有一项不为零，即

$ integral_(- pi / omega)^(pi / omega) f \( t \) sin \( k omega t \) d t = a_k integral_(- pi / omega)^(pi / omega) sin \( k omega t \) sin \( k omega t \) d t = a_k dot.op pi / omega $

所以

$ a_k = omega / pi integral_(- pi / omega)^(pi / omega) f \( t \) sin \( k omega t \) d t $

同样的道理，我们对等式两边同时乘
$cos \( k omega t \)$，并对等式两边积分，最终也可以推导出

$ b_k = omega / pi integral_(- pi / omega)^(pi / omega) f \( t \) cos \( k omega t \) d t $

我们称

$ cases(a_0 = omega / pi integral_(- pi / omega)^(pi / omega) f \( t \) d t,
a_k = omega / pi integral_(- pi / omega)^(pi / omega) f \( t \) sin \( k omega t \) d t,
b_k = omega / pi integral_(- pi / omega)^(pi / omega) f \( t \) cos \( k omega t \) d t) $

这些系数为傅里叶系数，$A_0$ 称为常数项，$a_k$ 称为正弦项，$b_k$
称为余弦项。根据这些系数的值，我们就可以把一个周期函数表示为上述三角函数级数

$ f \( t \) = a_0 / 2 + sum_(n = 1)^oo \[ a_n sin \( n omega t \) + b_n cos \( n omega t \) \] $

#quote(block: true)[
这里为了统一系数的格式，常数项 $A_0$ 被除以 $2$。
]

由此，我们也可以知道，在无穷三角级数中，第 $k$ 项三角函数的

+ 角速度为 $k omega$

+ 振幅为 $sqrt(a_n^2 + b_n^2)$

+ 相位角为 $arctan \( b_n / a_n \)$

傅里叶本人提出了这个级数的存在，但是他的成果一开始并未得到认可，1807
年，傅里叶提交的论文被巴黎科学院拒绝了，原因是他并未证明这个级数对于一切周期函数都有收敛性，在数学上不够严密。

1822
年，#link("https://baike.baidu.com/item/%E7%BA%A6%E7%BF%B0%C2%B7%E5%BD%BC%E5%BE%97%C2%B7%E5%8F%A4%E6%96%AF%E5%A1%94%E5%A4%AB%C2%B7%E5%8B%92%E7%83%AD%E7%BA%B3%C2%B7%E7%8B%84%E5%88%A9%E5%85%8B%E9%9B%B7/8200419")[狄利克雷]
对傅里叶级数产生了兴趣，并在 1829
年在他的论文《关于三角函数的收敛性》中，证明了傅里叶级数的收敛性。

严格来讲，傅里叶的结论并不正确，傅里叶级数并不适用于所有的周期函数，只有在满足一定条件的周期函数上，傅里叶级数才是收敛的，狄利克雷指出了其收敛的充分条件

狄利克雷条件指的是周期函数 $f \( x \)$ 若在其一个周期内满足

1. $f(x)$ 在 $[-pi, pi]$ 上是分段连续的，即在 $[-pi, pi]$ 上只有有限个间断点，且在每个间断点处的左右极限存在；

2. $f(x)$ 在 $[-pi, pi]$ 上是分段单调的，即在 $[-pi, pi]$ 上只有有限个极值点，且在每个极值点处的左右导数存在；

则 $f(x)$ 的傅里叶级数处处收敛。

#quote(block: true)[
注：该条件本文不予证明。
]

狄利克雷条件的提出，使得傅里叶级数的收敛性有了理论依据，傅里叶级数也因此被广泛应用于物理学、工程学等领域。

在狄利克雷条件的基础上，后来的数学家对于傅里叶级数的收敛性又提出了更为严密的理论，不过我们这里就不继续展开了。

==== 傅里叶级数的复数形式
考虑以下傅里叶系数

$ cases(a_0 = omega / pi integral_(- pi / omega)^(pi / omega) f \( t \) d t,
a_k = omega / pi integral_(- pi / omega)^(pi / omega) f \( t \) sin \( k omega t \) d t,
b_k = omega / pi integral_(- pi / omega)^(pi / omega) f \( t \) cos \( k omega t \) d t) $

根据欧拉公式

$ e^(i k omega t) = cos \( k omega t \) + i sin \( k omega t \) $

所以有

$ sin \( k omega t \) = frac(e^(i k omega t) - e^(- i k omega t), 2 i) $

$ cos \( k omega t \) = frac(e^(i k omega t) + e^(- i k omega t), 2) $

代入上面的傅里叶系数中，我们可以得到

$ a_k = omega / pi integral_(- pi / omega)^(pi / omega) f \( t \) dot.op frac(e^(i k omega t) - e^(- i k omega t), 2 i) d t $

$ b_k = omega / pi integral_(- pi / omega)^(pi / omega) f \( t \) dot.op frac(e^(i k omega t) + e^(- i k omega t), 2) d t $

重新将目光看回傅里叶级数，将其中的三角函数替换为复指数函数

$ f \( t \) = a_0 / 2 + sum_(n = 1)^oo \[ a_n dot.op frac(e^(i n omega t) - e^(- i n omega t), 2 i) + b_n dot.op frac(e^(i n omega t) + e^(- i n omega t), 2) \] $

$ f \( t \) = a_0 / 2 + sum_(n = 1)^oo \[ frac(b_n - i a_n, 2) e^(i n omega t) + frac(b_n + i a_n, 2) e^(- i n omega t) \] $

现在将 $a_k \, b_k$ 重新代入上面的式子中，先有

$ b_n - i a_n = omega / pi integral_(- pi / omega)^(pi / omega) f \( t \) e^(- i n omega t) d t $

$ b_n + i a_n = omega / pi integral_(- pi / omega)^(pi / omega) f \( t \) e^(i n omega t) d t $

所以

$ f \( t \) = a_0 / 2 + frac(omega, 2 pi) sum_(n = 1)^oo \[ e^(i n omega t) integral_(- pi / omega)^(pi / omega) f \( t \) e^(- i n omega t) d t + e^(- i n omega t) integral_(- pi / omega)^(pi / omega) f \( t \) e^(i n omega t) d t \] $

取最后一项积分式内的向量方向相反，那么有

$ f \( t \) = a_0 / 2 + frac(omega, 2 pi) sum_(n = 1)^oo e^(i n omega t) integral_(- pi / omega)^(pi / omega) f \( t \) e^(- i n omega t) d t + sum_(n = - oo)^(- 1) e^(- i n omega t) integral_(- pi / omega)^(pi / omega) f \( t \) e^(- i n omega t) d t $

考虑到当 $n = 0$ 时有

$ frac(omega, 2 pi) e^(i n omega t) integral_(- pi / omega)^(pi / omega) f \( t \) e^(- i n omega t) d t = frac(omega, 2 pi) integral_(- pi / omega)^(pi / omega) f \( t \) d t = a_0 / 2 $

所以将三项直接合成，有

$ f \( t \) = frac(omega, 2 pi) sum_(n = - oo)^oo e^(i n omega t) integral_(- pi / omega)^(pi / omega) f \( t \) e^(- i n omega t) d t $

此时可以令
$C_k = frac(omega, 2 pi) integral_(- pi / omega)^(pi / omega) f \( t \) e^(- i k omega t) d t$
，于是有

$ f \( t \) = sum_(n = - oo)^oo C_n e^(i n omega t) $

称 $C_k$ 为复数形式下的傅里叶系数。

==== 非周期函数与傅里叶变换
以上所有的讨论都建立在 $f \( t \)$
是一个周期函数的情况下，那难道非周期函数就不能用傅里叶级数来表示吗？

我们刚刚推到了傅里叶级数的复数形式，现在，不妨考虑一个极端情况，假设
$f \( t \)$ 是一个周期为 $T$ 的周期函数，那么当
$T arrow.r oo$，即函数周期为无穷大时，函数的第二个周期就永远不会出现，此时可以认为函数是一个非周期函数。

让我们考虑上面的傅里叶级数式

$ f \( t \) = sum_(n = - oo)^oo frac(omega, 2 pi) integral_(- pi / omega)^(pi / omega) f \( t \) e^(- i n omega t) d t dot.op e^(i n omega t) $

将上面的式子化为由 $T$ 表达的形式

$ f \( t \) = sum_(n = - oo)^oo 1 / T integral_(- oo)^oo f \( t \) e^(- i n frac(2 pi, T) t) d t dot.op e^(i n frac(2 pi, T) t) $

出于 $T arrow.r oo$，所以 $1 / T$ 可以看作是一个小增量，令
$frac(2 pi n, T) = mu$，$frac(2 pi, T) = d mu$，那么就有

$ f \( t \) = sum_(n = - oo)^oo frac(1, 2 pi) integral_(- oo)^oo f \( t \) e^(- i mu t) d t dot.op e^(i mu t) d mu $

不妨将这个无穷级数之和理解为黎曼和，那么就有其积分形式

$ f \( t \) = frac(1, 2 pi) integral_(- oo)^oo integral_(- oo)^oo \( f \( t \) e^(- i mu t) d t \) dot.op e^(i mu t) d mu $

如何理解这个公式？先看看最内层的积分
$integral_(- oo)^oo \( f \( t \) e^(- i mu t) d t \)$，这个式子可以看作是一个函数
$f \( t \)$ 在指定频率 $frac(mu, 2 pi)$ 时在复平面上的累计情况。

而外层积分 $integral_(- oo)^oo F \( frac(mu, 2 pi) \) e^(i mu t) d mu$
则又是一个复平面上的积分，实际上是对 $f \( t \)$
所覆盖的整个频域的累计情况进行积分。

所以，这个函数 $f \( t \)$
在时域上的积分可以看作是对一个函数在整个频域下的累计情况的积分。

相应地，$f \( t \) e^(- i mu t)$
描述了函数在指定频率下的情况，我们不妨规定

$ mu = 2 pi f $

那么就有

$ f \( t \) = integral_(- oo)^oo F \( f \) e^(i 2 pi f t) d f $

其中

$ F \( f \) = integral_(- oo)^oo f \( t \) e^(- i 2 pi f t) d t $

于是乎， $F \( f \)$ 就是一个描述 $f \( t \)$
在频率方面特性的函数，我们称 $F \( f \)$ 是 $f \( t \)$
的傅里叶变换，记作

$ F \( f \) = cal(F) \( f \( t \) \) = integral_(- oo)^oo f \( t \) e^(- i 2 pi f t) d t $

同时，$f \( t \)$ 是 $F \( f \)$ 的傅里叶逆变换

$ f \( t \) = cal(F)^(- 1) \( F \( f \) \) = integral_(- oo)^oo F \( f \) e^(i 2 pi f t) d f $

上述两个式子的角频率形式也很常用，令 $w = 2 pi f$

$ F \( w \) = cal(F) \( f \( t \) \) = integral_(- oo)^oo f \( t \) e^(- i w t) d t $

$ f \( t \) = cal(F)^(- 1) \( F \( w \) \) = frac(1, 2 pi) integral_(- oo)^oo F \( w \) e^(i w t) d w $

这里需要注意的是，傅里叶变换的存在是有条件的，并不是所有的函数都可以进行傅里叶变换。

一个函数存在傅里叶变换的充分必要条件是其在 $(-oo, oo)$ 上绝对可积，即

$ integral_(-oo)^(oo) abs(f(t)) d t < oo $

这是因为如果 $f(t)$ 是绝对可积的，即 $ integral_(-oo)^(oo) abs(f(t)) d t < oo $，那么：

由于 $abs(e^(-i omega t)) = 1$，所以 $abs(f(t) e^(-i omega t)) = abs(f(t))$

所以如果 $abs(f(t))$ 的积分收敛，那么 $f(t) e^(-i omega t)$ 的积分也一定收敛，这样频域函数才不会发散，上述推理才能成立

所以，诸如 $f(x) = e^x, f(x) = 2x$ 之类的函数，就不满足这个条件，不能进行傅里叶变换。

==== 非常规傅里叶变换
===== 狄拉克函数（单位冲激函数）
我们知道，傅里叶变换的前提条件是函数在 $\( - oo \, oo \)$
上绝对可积，而诸如 $e^x$
之类的函数就不满足这个条件，不能进行傅里叶变换，那难道这类函数就没有频域特性吗？

我们介绍一类特殊的函数，它可以帮我们解决这个疑惑，我们来看一个例子，强行对指数函数做傅里叶变换

$ cal(F) \( e^(i w_0 t) \) = integral_(- oo)^oo e^(i w_0 t) e^(- i 2 pi f t) d t $

令 $w = 2 pi f$，则有

$ cal(F) \( e^(i w_0 t) \) = integral_(- oo)^oo e^(i \( w_0 - w \) t) d t $

观察该函数，发现当 $w eq.not w_0$
时，$F \( w \) = 0$（旋转向量抵消）；而当 $w = w_0$ 时，$F \( w \)$
的值为无穷大（对 $1$ 积分）。

为了研究相应的问题，我们引入一个新的函数，称为狄拉克函数，记作
$delta \( w \)$，作为指数函数的傅里叶变换结果，其定义为

$ delta \( w \) = cases(delim: "{", + oo \, & w = 0, 0 \, & w eq.not 0) $

同时，为了使得频域狄拉克函数的逆变换是时域指数函数，即

$ cal(F)^(- 1) \( delta \( w - w_0 \) \) = frac(1, 2 pi) e^(i w_0 t) $

#strong[规定];狄拉克函数在全域上的积分为 $1$

$ integral_(- oo)^(+ oo) delta \( w \) d w = 1 $

所以我们可以知道，狄拉克函数是一个这样的函数，它满足

$ cases(integral_(- oo)^(+ oo) delta \( w \) d w = 1,
delta \( w \) = 0 \, & w eq.not 0,
delta \( w \) = + oo \, & w = 0) $

这个性质看似矛盾，因为函数几乎处处为 $0$，却能积分得到
$1$。这是因为狄拉克函数严格来说不是普通函数，这个函数是我们通过观察其他函数（例如
$e^x$）的特性与极限来定义的，像这样，通过观察函数对其他函数所起的作用来定义的函数，我们称之为#link("https://zhuanlan.zhihu.com/p/514695737")[广义函数];。

===== 周期函数的傅里叶变换
我们知道，一个分段连续且单调的周期函数可以表示为下列傅里叶级数

$ f \( t \) = sum_(n = - oo)^oo c_n e^(i n omega_0 t) $

其中

$ c_k = frac(omega, 2 pi) integral_(- pi / omega)^(pi / omega) f \( t \) e^(- i k omega t) d t $

所以说，对该周期函数做傅里叶变换有

$ cal(F) \( f \( t \) \) = sum_(n = - oo)^oo c_n cal(F) \( e^(i n omega_0 t) \) = sum_(n = - oo)^oo 2 pi c_n delta \( w - n w_0 \) $

所以说，周期函数的傅里叶变换是离散的狄拉克函数的叠加，狄拉克函数的幅值之比反映其在不同频率下的强度。

举个例子，对于 $s i n \( 2 x \)$ 的傅里叶变换，可考虑

$ cal(F)(sin(2t)) = integral_(-oo)^(oo) sin(2t) e^(-i omega t) d t $

利用欧拉公式，$sin(2t) = frac(e^(i 2 t) - e^(-i 2 t), 2i)$，将其代入：

$ cal(F)(sin(2t)) = integral_(-oo)^(oo) frac(e^(i 2 t) - e^(-i 2 t), 2i) e^(-i omega t) d t $

$ = frac(1, 2i) integral_(-oo)^(oo) (e^(i (2 - omega) t) - e^(-i (2 + omega) t)) d t $

这两个积分的结果是狄拉克函数。对于形如 $integral_(-oo)^(oo) e^(i alpha t) d t$ 的积分，其结果为 $2 pi delta(alpha)$，因此

$ cal(F)(sin(2t)) = frac(1, 2i) [2 pi delta(2 - omega) - 2 pi delta(- (2 + omega))] $

$ = frac(pi, i) [delta(2 - omega) - delta(-2 - omega)] $

$ = -i pi [delta(2 - omega) - delta(2 + omega)] $

这个结果表明 $sin(2t)$ 的傅里叶变换在频率 $omega = 2$ 和 $omega = -2$ 处有冲激。在 $omega = 2$ 处系数为 $-i pi$，在 $omega = -2$ 处系数为 $i pi$。

这符合我们对 $sin(2t)$ 的频率特性的理解：它是一个纯频率为 $2$ 的正弦波，其频谱应当在 $omega = ±2$ 处有对称的冲激。这也验证了正弦函数可以被看作是两个复指数函数的组合，分别对应于正频率和负频率。

===== 周期延拓
假设有函数 $y = 2 x$，尝试分析其频域特性，发现其并非周期函数，也不满足绝对可积的条件，不能进行傅里叶变换。

那么难道我们就不能分析其频域特性吗？实际上，$y = 2 x$
的函数图像很少出现在实际情况中，该函数表明信号不随时间衰减，且强度分布在无限远处，现实中很少有类似的情景，单独分析这个信号的频域本身意义不大。

#quote(block: true)[
注：硬要分析也是可以分析的，引入广义傅里叶变换和分布理论，最终其频域特性函数和狄拉克函数的导数有关，但这不是本文讨论的范围。
]

不过，有一种信号，它有和 $y = 2 x$
类似的特性，这就是锯齿波函数，其函数图像如下

#figure(image("images/工科数学/三大变换/fourier-7.png"),
  caption: [
    锯齿波
  ]
)

$ f \( t \) = 2 \( t - \[ t \] \) - 1 $

锯齿波函数是周期函数，且其周期为
$T = 1$，通过分析其频域特性，我们就可以分析 $y = 2 x$
在局部的频域特性，对其进行傅里叶级数展开。

$ cases(f \( t \) = sum_(n = - oo)^oo C_n e^(i n omega t),
C_k = frac(omega, 2 pi) integral_(- pi / omega)^(pi / omega) f \( t \) e^(- i k omega t) d t )
 $

明显这里的 $T = 1$，所以代入 $w = 2 pi$，有

$ C_k = integral_0^1 f \( t \) e^(- i k 2 pi t) d t $

代入首个周期时的函数表达式， $y = 2 t - 1$

$ C_k = integral_0^1 \( 2 t - 1 \) e^(- i k 2 pi t) d t $

要化简积分表达式 $ C_k = integral_0^1 f \( t \) e^(- i k 2 pi t) d t $

$ = 2 integral_0^1 t e^(- i k 2 pi t) d t - integral_0^1 e^(- i k 2 pi t) d t $

其中后面一项有

$ integral_0^1 e^(- i k 2 pi t) d t = frac(e^(- i k 2 pi t), - i k 2 pi)\|_0^1 = frac(1 - 1, - i k 2 pi) = 0 $

计算第一项分部积分

$ integral_0^1 t e^(- i k 2 pi t) d t = frac(t e^(- i k 2 pi t), - i k 2 pi)\|_0^1 - integral_0^1 frac(e^(- i k 2 pi t), - i k 2 pi) d t = frac(- 1, i k 2 pi) . $

合并有

$ C_k = cases(delim: "{", 0 \, & k = 0 \,, frac(i, k pi) \, & k eq.not 0 .) $

所以锯齿波函数的傅里叶级数展开为

$ f \( t \) = sum_(n = - oo)^oo frac(i, n pi) e^(i n 2 pi t) $

绘制频谱图

#figure(image("images/工科数学/三大变换/fourier-8.png"),
  caption: [
    锯齿波频谱图
  ]
)

就像这样，我们取一个非周期函数的一部分，将其看作是一个函数的一个周期，再对该周期函数做傅里叶展开，得到的频谱图就可以看作是该非周期函数在该部分的频域特性，这就是周期延拓。

==== 离散傅里叶变换
对于一个连续的函数，例如
$y = frac(1, 1 + x^2)$，我们可以用傅里叶变换来分析其频域特性，通常可以得到一个连续的频谱图。

#figure(image("images/工科数学/三大变换/fourier-9.png"),
  caption: [
    函数频谱图
  ]
)

但是，无论是一些常见的传感器、ADC、还是计算机，它们都是在离散的时间点上对信号进行采样的，实际上我们得到的都是离散的信号数据。

#quote(block: true)[
注：很多传感器在物理上是连续感应的，例如温度传感器，但是即便如此，针对数据的采样过程仍然是离散的。
]

例如，假设有一个 ADC
芯片对一个波形采样，那么我们得到的时序数据大概率会是这样的散点图。

#figure(image("images/工科数学/三大变换/fourier-10.png"),
  caption: [
    离散采样
  ]
)

现在，要分析这个离散信号的频域特性，我们就不能直接使用傅里叶变换了，因为傅里叶变换是针对连续函数的，而我们得到的是离散的时序数据。

为了分析离散信号的频域特性，我们引入一种新的傅里叶变换方法，称为离散傅里叶变换。

===== 冲击采样函数
冲击采样函数是用于表示离散信号的数学工具。

$ y_s \( t \) = sum_(n = - oo)^oo y \( t \) delta \( t - n T_s \) $

其中 $delta \( t - n T_s \)$ 是狄拉克函数。

你会发现，这个函数仅当 $t = n T_s$ 时有值，且值为
$y \( t \)$，而在其他时刻则为处处为 $0$，这个函数有助于我们描述以
$Delta x = T_s$ 为取样间隔时，函数离散的状态。

将该函数代入傅里叶变换中，得到

$ cal(F) \( y_s \( t \) \) = integral_(- oo)^oo sum_(n = - oo)^oo y \( t \) delta \( t - n T_s \) dot.op e^(- i w t) d t $

整理得到

$ cal(F) \( y_s \( t \) \) = sum_(n = - oo)^oo integral_(- oo)^oo y \( t \) delta \( t - n T_s \) dot.op e^(- i w t) d t $

发现当且仅当 $t = n T_s$ 时，积分才有值，且值为 $y \( n T_s \)$，所以有

$ cal(F) \( y_s \( t \) \) = sum_(n = - oo)^oo y \( n T_s \) e^(- i w n T_s) $

===== 离散傅里叶变换公式
为了方便表示，我们建立一个数列 $y \[ n \]$，使得
$y \[ n \] = y \( n T_s \)$，那么就有

$ cal(F) \( y_s \( t \) \) = sum_(n = - oo)^oo y \[ n \] e^(- i w n T_s) $

现实情况中，采样点的数量不可能是无穷的，所以我们实际上只取有限个采样点，然后对
$N$
个采样点外的部分采用边沿截断方式进行处理，即认为函数在该范围外无任何响应。

仅考虑 $N$
个采样点的情况，$n = 0 \, 1 \, 2 \, dots.h.c \, N - 1$，那么就有

$ Y \( w \) = sum_(n = 0)^(N - 1) y \[ n \] e^(- i w n T_s) $

出于电脑无法处理连续变化的
$w$（计算所有频率下的傅里叶变换值的算法复杂度是
$O \( oo \)$，因为频率有无穷个），我们不妨将 $w$ 离散化为
$w_k = frac(2 pi k, N T_s)$，其中 $k in bb(N)$。

那么，代入即有

$ Y \[ k \] = sum_(n = 0)^(N - 1) y \[ n \] e^(- i frac(2 pi k, N) n) $

这就是离散傅里叶变换，对于一组样本量为 $N$ 的采样数据
$y \[ n \]$，其离散傅里叶变换的结果是一个复数序列
$Y \[ k \]$，其长度也是 $N$，反应了目标序列的频域特性。

#figure(image("images/工科数学/三大变换/fourier-11.png"),
  caption: [
    离散傅里叶变换
  ]
)

这里需要注意的是，$k$ 有一个取值范围
$0 lt.eq k < N$。

这是因为当 $k > N - 1$ 时，有

$ Y \[ k \] = sum_(n = 0)^(N - 1) y \[ n \] e^(- i frac(2 pi \( k - N \), N) n) dot.op e^(- i 2 pi n) = Y \[ k - N \] $

也就意味着 $Y \[ k \]$ 和 $Y \[ k - N \]$ 是相同的，当 $k$ 超过 $N - 1$ 时会导致频谱上有无意义重复部分，这是应当避免的。

离散傅里叶变换也有逆变换，即为

$ y \[ n \] = 1 / N sum_(k = 0)^(N - 1) Y \[ k \] e^(i frac(2 pi k, N) n) $

推导过程和上方推理类似。

===== 采样定理
请看下面这个例子，对函数
$f \( t \) = sin \( 3 t \) + cos \( 2 t \) + sin \( 7 t \) + cos \( 11 t \)$
以 $f = 12 / pi$ 进行采样，做傅里叶变换，有以下频谱图

#figure(image("images/工科数学/三大变换/fourier-12.png"),
  caption: [
    频谱图
  ]
)

虽然通过散点已经很难看出来这是正弦波叠加而成的波形了，但是傅里叶变换却精确指出了其频率成分（每个三角函数对应正负一对频率冲激），我们仍然可以知道波形由四个频率成分组成，分别是
$w = 3 \, 2 \, 7 \, 11$。

现在，以 $f = 9 / pi$ 对信号进行采样，做傅里叶变换，得到的频谱图如下

#figure(image("images/工科数学/三大变换/fourier-13.png"),
  caption: [
    频谱图
  ]
)

可以看到，频谱图上现在只剩下了三个频率成分，$w = 3 \, 2 \, 7$，而
$w = 11$
的频率成分已经消失了，我们降低了采样频率，导致了频谱图上出现了某些频率冲激消失的情况，这被称作频谱混叠。

为什么会出现频谱混叠？直觉告诉我们，在采样点数量太少的时候，原波形就越来越难被看出，对它的复原也越来越难，所以频谱图上就会出现一些频率成分消失，即复原失败的情况，这就是频谱混叠出现的原因。

但是，频率具体要低到什么程度才会出现频谱混叠呢？接下来我们通过一个例子简要说明；

设想一个三角函数
$f \( t \) = A sin \( w t + phi.alt \)$，在三角函数的一个周期内，我们需要几个在三角函数上的点才能确定这个三角函数的所有参数（$A \, w \, phi.alt$）呢？答案应当是
$3$ 个，因为这里总共有 $3$ 个未知量，要使得三个参数有唯一解，就需要 $3$
个方程。

所以，要想通过采样复原一个三角函数波形，我们需要在一个周期内至少采样 $3$
次，而为了保证这一点，我们需要采样频率至少是
$2 w$，也就是采样频率至少是信号频率的两倍。

#box(image("images/工科数学/三大变换/fourier-14.png"))

由上图可以注意到，要保证一个周期内有 $3$ 个采样点，两个相邻采样点之间的采样间隔不应当超过 $T/2$，也就是采样频率至少是信号频率的两倍。

而对于一个时变信号而言，傅里叶变换的思想告诉我们信号可以被表示为不同频率的正弦波叠加而成，所以，为了保证信号的频率成分不丢失，我们需要保证采样频率至少是正弦波组中频率最高信号频率的两倍，这就是采样定理

$ f_s gt.eq 2 f_(m a x) $

所以，为了完美复现信号
$f \( t \) = sin \( 3 t \) + cos \( 2 t \) + sin \( 7 t \) + cos \( 11 t \)$
的频域特性，采样频率 $f > frac(11, 2 pi)$ 是必要的，这就是为什么
$f = frac(9, 2 pi)$ 时会出现频谱混叠的原因，主要是采样过于稀疏不足以确定
$w = 11$ 的频率特性。


=== 拉普拉斯变换

#theorem("拉普拉斯变换")[
  拉普拉斯变换指的是对于 $[0, +oo)$ 上的函数 $f(t)$，其拉普拉斯变换定义为
  $
    cal(L)[f(t)] = integral_0^(+oo) e^(-s t) f(t) d t = F(s)
  $

  其中 $s = beta + j omega$，$beta$ 和 $omega$ 为实数，$j$ 是虚数单位。

  当 $beta = 0$，拉普拉斯变换就是傅里叶变换，直接写作
  $
    cal(F)[f(t)] = integral_0^(+oo) e^(-j omega t) f(t) d t = F(j omega)
  $

  #line(length : 100%)

  拉氏变换也有逆变换，定义 $cal(L)^(-1)$ 为拉普拉斯逆变换，有#footnote[这个反变换公式可以这样推导：由傅里叶反变换，可以知道 $f(t) e^(-beta t) = integral_(-oo)^(oo) F(s) e^(j omega t) d omega$，将左边的因子 $e^(-beta t)$ 移到右边，并将积分变量 $omega$ 替换为 $s = beta + j omega$，就得到上式。]
  $
    cal(L)^(-1)[F(s)] = frac(1, 2 pi j) lim_(T -> +oo) integral_(beta - j T)^(beta + j T) e^(s t) F(s) d s = f(t)
  $

  这使得得拉普拉斯变换和逆变换构成了一对互逆运算
  $
    cal(L)^(-1)[cal(L)[f(t)]] = f(t)
  $
]

傅里叶变换的性质在其它的文档里有介绍，这里不再详细展开；而拉普拉斯变换与之不同的是，它具有因子 $beta$，所以对于 $f(t)$ 的拉氏变换相当于
$
  cal(L)[f(t)] = cal(F)[f(t) U(t) e^(-beta t)]
$

我们引入一个新的变换 $cal(L)$，那么首要的问题就是这个变换具有何种应用？傅氏变换的应用我们有目共睹，可以用于频谱和系统的分析，那么拉氏变换的作用又体现在哪？

==== 拉普拉斯变换的应用

我们知道傅里叶变换可以用来求解微分方程，例如对于一个 LTI 系统，其微分方程为
$
  sum_(k=0)^n a_k frac(d^k y(t), d t^k) = sum_(m=0)^l b_m frac(d^m x(t), d t^m)
$

若该系统的冲激响应为 $h(t)$，那么对于输入 $x(t)$，系统的输出为 $y(t) = x(t) * h(t)$。

同理的，我们称冲激响应的频域特性为该系统的传输算子 $H(j omega)$，于是就有
$
  Y(j omega) = H(j omega) X(j omega)
$

其中 $X(j omega)$、$Y(j omega)$ 和 $H(j omega)$ 分别是 $x(t)$、$y(t)$ 和 $h(t)$ 的傅里叶变换。#footnote[傅里叶变换有卷积性质 $cal(F)[f(t) * g(t)] = cal(F)[f(t)] cal(F)[g(t)]$ ，所以上式成立。] 传统的求解 $H(j omega)$ 方法为，先在 $f(t) = delta(t)$ 解时域微分方程，求出 $h(t)$，然后再对 $h(t)$ 做傅里叶变换，得到 $H(j omega)$。

实际上，$H(j omega)$ 的求解也可以通过直接对方程进行操作来完成，对上文中微分方程两边作傅里叶变换，有#footnote[傅里叶变换有微分性质 $cal(F)[frac(d^n f(t), d t^n)] = (j omega)^n cal(F)[f(t)]$ 。]
$
  sum_(k=0)^n a_k (j omega)^k Y(j omega) = sum_(m=0)^l b_m (j omega)^m X(j omega)
$

于是就可以通过多项式除法解得
$
  H(j omega) = frac(Y(j omega), X(j omega)) = frac(sum_(m=0)^l b_m (j omega)^m, sum_(k=0)^n a_k (j omega)^k)
$

#example("求解以下 LTI 系统的时域响应")[
  设有以下 LTI 系统
  $
    (d y(t))/(d t) + a y(t) = x(t)
  $

  初始条件为 $y(0^-) = y_0$，求该系统的激励函数为 $x(t) = u(t)$ 时的输出 $y(t)$。

  取傅里叶变换，有
  $
    (j omega) Y(j omega) + a Y(j omega) = X(j omega)
  $

  这就意味着传输算子和冲激响应为
  $
    H(j omega) = 1 / (j omega + a),  h(t) = e^(-a t) U(t)
  $

  所以对于输入 $x(t) = u(t)$，零响应输出为
  $
    y(t) = x(t) * h(t) = (1/a)(1 - e^(-a t)) U(t)
  $

  再加上在初始条件 $y(0^-) = y_0$ 下的特解 $y_s = y_0 e^(-a t) U(t)$，有最终的响应
  $
    y(t) = (y_0 e^(-a t) + (1/a)(1 - e^(-a t))) U(t)
  $
]

可以看出，传输算子可以非常方便地求出系统的频域特性，也能配合激励信号求解系统的零状态响应，可以说已经是很完备的分析工具了。

19 世纪以来，傅里叶变换在工程学上被得到广泛运用，其分析系统和频域特性的能力被充分认可。而随着人们对系统研究的深入，拉普拉斯变换作为一种新的描述系统的改进工具被提出，它在某些方面比傅里叶变换更具优势。

#line(length: 100%)

傅里叶变换指的是
$
  H(j omega) = integral_(-oo)^(+oo) h(t) e^(-j omega t) d t
$

相当于，整个函数的频域部分经过傅里叶变换后，都展开到了 $j omega$ 轴，即虚轴上进行分析。

而对于拉普拉斯变换而言
$
  H(s) = integral_0^(+oo) h(t) e^(-s t) d t
$

它和傅里叶变换仅仅有两处不同，第一处是积分下限从 $-oo$ 变为了 $0$，第二处是指数部分从 $e^(-j omega t)$ 变为了 $e^(-s t)$。这两处变化使得拉普拉斯变换在分析系统时，具有了以下两个不同于傅里叶变换的优势。

===== 初始条件

我们知道，现在拉普拉斯积分变换的下限为 $0$，所以有以下新的微积分性质

#theorem("拉普拉斯变换的微积分性质")[
  若 $cal(L)[f(t)] = F(s)$，则有以下性质
  $
    cal(L)[frac(d^n f(t), d t^n)] = s^n F(s) - sum_(k=0)^(n-1) s^(n-1-k) frac(d^k f(t), d t^k) |_(t=0)
  $
  以及
  $
    cal(L)[(integral_0^t)^n f(tau) d tau] = 1 / s^n F(s) + sum_(k=1)^n frac(1, s^(n - k + 1)) (integral_0^t)^(k) f(tau) d tau |_(t=0^-)
  $

  这意味着，对微分算子作拉普拉斯变换，将会将 $f(0^-)$ 以及 $f^((n))(0^-)$ 项包含在式子中
  $
    cases(
      cal(L)[frac(d f(t), d t)] = s F(s) - f(0^-),
      cal(L)[frac(d^2 f(t), d t^2)] = s^2 F(s) - s f(0^-) - f'(0^-),
      cal(L)[frac(d^3 f(t), d t^3)] = s^3 F(s) - s^2 f(0^-) - s f'(0^-) - f''(0^-)
    )
  $
  以及对于积分而言
  $
    cases(
      cal(L)[(integral_0^t) f(tau) d tau] = 1 / s F(s) + 1 / s f^((-1))(0^-),
      cal(L)[(integral_0^t)^2 f(tau) d tau] = 1 / s^2 F(s) + 1 / s^2 f^((-1))(0^-) + 1 / s f^((-2))(0^-)
    )
  $

  不过，由于我们普遍认为 $f(t)$ 在 $(-oo, 0)$ 是没有任何响应的，所以实际上，多出来的积分项总是可以认为他们都是 $0$，所以式子还可以写作
  $
    cal(L)[(integral_0^t)^n f(tau) d tau] = 1 / s^n F(s)
  $
]

这就使得拉普拉斯变换在求解微分方程时，能够直接将初始条件包含在内，这是傅里叶变换不具备的#footnote[$(d f(t)) / (d t) <=> (j omega) F(j omega)$，不包含信号在 $t = 0^-$ 的初始条件]，其仅仅能够求解零状态响应。

#example("利用拉普拉斯变换求解微分方程")[
  仍然考虑之前的 LTI 系统
  $
    (d y(t))/(d t) + a y(t) = x(t)
  $

  初始条件为 $y(0^-) = y_0$，求该系统的激励函数为 $x(t) = u(t)$ 时的输出 $y(t)$。

  取拉普拉斯变换，有
  $
    s Y(s) - y_0 + a Y(s) = X(s)
  $
  所以有
  $
    Y(s) = frac(X(s) + y_0, s + a)
  $

  此时再代入激励 $x(t) = u(t)$ 的拉普拉斯变换 $X(s) = 1 / s$，有
  $
    Y(s) = frac(1 + s y_0, s (s + a)) = 1 / (a s) + (y_0 - 1 / a) / (s + a)
  $

  对函数作拉普拉斯逆变换，可以查表找到上方两个算式对应的逆变换，有
  $
  y(t) = frac(1, a) u(t) + (y_0 - frac(1, a)) e^(-a t) u(t)
  $

  整理一下就可以得到
  $
    y(t) = (y_0 e^(-a t) + (1/a)(1 - e^(-a t))) u(t)
  $

]

===== 度量系统的稳定性

拉普拉斯变换将傅里叶变换中的 $j omega$ 因子替换为了 $s = alpha + j omega$，这就使得对函数的分析从纯虚轴扩展到了复平面上。接下来探究多出来的实轴部分 $alpha$ 有何作用。

#example("阻尼系统的拉普拉斯转移算子分析")[
  分析下面的一个阻尼系统 $x(t)$
  $ frac(d^2 x, d t^2) + beta / m frac(d x, d t) + k / m x = 0 $

  取拉普拉斯变换，假设弹簧振子有初始位置 $x(0) = x_0$ 和初始速度 $x'(0) = 0$，有最终的响应
  $
    X(s) = frac((s + beta / m) x_0, s^2 + (beta / m) s + (k / m))
  $
]

将上述 $X(s)$ 看作是复平面上关于 $s$ 的函数，绘制出 $abs(X(s))-s$ 的三维图像

#figure(image("images/工科数学/三大变换/拉普拉斯变换.png", width: 75%),
  caption: [
    以 $beta=2, m=1, k=5$ 为例，绘制出的 $abs(X(s))-s$ 三维图像
  ]
)

如果单独截取纯虚数轴 $alpha = 0$，那么得到的截面图像就为原阻尼系统的傅里叶变换结果。这很好理解，因为当 $alpha = 0$ 时，拉普拉斯变换就退化为了傅里叶变换。

那么当 $alpha != 0$ 时，相当于对系统施加了一个指数衰减或增长的因子 $e^(-alpha t)$。当 $alpha > 0$ 时，相当于对系统施加了一个指数衰减因子，使得系统的响应更快地收敛；而当 $alpha < 0$ 时，相当于对系统施加了一个指数增长因子，使得系统的响应会更容易发散。

观察上方的三维图像，我们发现 $alpha = 0$ 一轴上，$abs(X(s))$ 是相对平缓的，而当 $alpha > 0$ 时，图中的颜色变得更深，说明 $abs(X(s))$ 变得更小，系统响应更快地衰减；这也就意味着，原系统的频域响应存在，且在引入外界的衰减因子后，系统的响应会更快地收敛。

但是，如果我们观察 $alpha < 0$ 的部分，发现图中的颜色变得更浅，乃至于当 $alpha = -1$ 时，图像中出现两个值很大的奇点，这说明 $abs(X(s))$ 变得很大，此时表达式中的分母为 $0$；系统的频域响应在此发散，这说明系统在引入发散因子 $e^(alpha t), alpha=1$ 时，系统的响应会发散。

所以，我们可以通过观察 $X(s)$ 在复平面上的极点位置，来判断系统的稳定性。如果所有极点的实部都小于零，即 $Re(s_i) < 0$，那么系统是稳定的；如果存在极点的实部大于零，即 $Re(s_i) > 0$，那么系统是不稳定的。并且 ，如果极点的实部距离虚轴越远，系统的稳定性就越好（越靠左）或者越差（越靠右），这是因为要使得系统到达临界状态要引入的外界因子强度越大。

为了量化描述这种“收敛态势”，定义收敛域
#definition("收敛域")[
  对于拉普拉斯变换 $cal(L)[f(t)] = F(s)$，存在一个复数 $s = sigma + j omega$，使得当 $Re(s) > sigma$ 时，$F(s)$ 收敛，而当 $Re(s) < sigma$ 时，$F(s)$ 发散。那么称 $Re(s) > sigma$ 的区域为 $f(t)$ 的收敛域。
]

收敛域可以方便地通过观察 $F(s)$ 的极点位置来确定，收敛域的左边界即为所有极点中实部最大的那个极点的实部。

#theorem("收敛域计算方法")[
  设 $F(s)$ 的极点集合为 $S = {s_i}$，那么 $f(t)$ 的收敛域左边界为
  $
    sigma = max_(s_i in S) Re(s_i)
  $
]

所以，如果要判断一个信号输入系统后，系统是否能给出收敛的响应，只需要遵从以下判定定理

#theorem("指定输入信号的系统稳定性判定")[

  设系统的传递函数为 $H(s)$，收敛域为 $"Re"(s) > sigma_H$，输入信号 $x(t)$ 的拉普拉斯变换 $X(s)$ 的收敛域为 $"Re"(s) > sigma_X$。

  当且仅当 $sigma_X < sigma_H$ 时，系统输出 $Y(s) = H(s)X(s)$ 在收敛域 $"Re"(s) > max(sigma_H, sigma_X)$ 内收敛，对应的时域输出 $y(t)$ 有界稳定。
]

当 $sigma_X < sigma_H$ 时，输入信号的发散程度就小于系统的收敛能力，所以系统能够给出稳定的响应；反之，当 $sigma_X >= sigma_H$ 时，输入信号的发散程度大于或等于系统的收敛能力，所以系统无法给出稳定的响应。

这便是拉普拉斯变换引入实轴的优势所在，它使得我们能够通过观察系统传递函数的极点位置，来判断系统的稳定性。

#line(length: 100%)

当然，你也可以直接求解原方程，得到具体的系统响应，并分析其稳定性。不过，直接使用上述的极点实部判据可以在不求解系统响应的情况下，快速判断系统的稳定性。
#example("直接求解方程")[
  我们关注分母部分，其有判别式
  $
    Delta = (beta / m)^2 - 4(k / m) = (beta^2 - 4 k m) / m^2
  $

  根据 $Delta$ 的符号，系统有三种不同的响应模式。

  - 首先是 $beta^2 > 4 k m$，$Delta > 0$ 时，分母有两个不同的实根
  $
    s_(1,2) = -(beta / m) / 2 ± sqrt((beta / m)^2 - 4(k / m)) / 2
  $

  所以分式可以分解为 $X(s) = frac(A, s - s_1) + frac(B, s - s_2)$，如此逆变换得到
  $
    x(t) = (A e^(s_1 t) + B e^(s_2 t)) u(t)
  $
  这种情况我们称为过阻尼，系统会渐渐恢复到平衡点，但比较慢。

  - $beta^2 = 4 k m$，$Delta = 0$ 时，分母有重根 $s = -beta / (2m)$
  $
    X(s) = frac(x_0 (s + beta / m), (s + beta / (2m))^2) = frac(x_0, s + beta / (2m)) + frac(x_0 beta / (2m), (s + beta / (2m))^2)
  $

  此时的逆变换得到以下响应表达式
  $
    x(t) = x_0 e^(-beta t / (2m)) (1 + beta t / (2m)) u(t)
  $
  这种情况我们称为临界阻尼，系统会以最快的速度回到平衡点，且不会超调。

  - 当 $beta^2 < 4 k m$，$Delta < 0$ 时，分母有共轭复根，设 $omega_n = sqrt(k / m)$，$zeta = beta / (2 sqrt(k m))$，则：
  $
    s_(1,2) = -zeta omega_n ± j omega_n sqrt(1 - zeta^2)
  $

  其中 $omega_d = omega_n sqrt(1 - zeta^2)$ 为阻尼振荡频率。

  重写传递函数为以下表达式
  $
    X(s) = frac(x_0 (s + 2 zeta omega_n), (s + zeta omega_n)^2 + omega_d^2) = frac(x_0 (s + zeta omega_n), (s + zeta omega_n)^2 + omega_d^2) + frac(x_0 zeta omega_n, (s + zeta omega_n)^2 + omega_d^2)
  $
  逆变换得到
  $
    x(t) = x_0 e^(-zeta omega_n t) (cos(omega_d t) + frac(zeta omega_n, omega_d) sin(omega_d t)) u(t)
  $
  这种情况我们称为欠阻尼，系统会不断震荡，并以该形式形式回到平衡点。
]

所以，原阻尼系统对于初始输入 $x(0) = x_0$ 和 $x'(0) = 0$，无论阻尼系数 $beta$ 取何值，系统的响应最终都会收敛到平衡点 $x = 0$，系统是稳定的。

===== 反演计算和系统稳定性

我们曾谈到拉普拉斯变换具有反变换
$
  cal(L)^((-1))[F(s)] = lim_(T -> +oo) frac(1, 2 pi j) integral_(beta-j T)^(beta +j T) F(s) e^(s t) d s
$

直接计算该积分求反变换结果十分复杂，实际上，运用复变函数的留数定理，可以将该式化简为以下形式

// #theorem("拉普拉斯逆变换的留数定理形式")[
//   若 $F(s)$ 在复平面上只有有限个奇点（极点），且当 $|s| -> oo$ 时 $F(s) -> 0$，则
//   $
//     cal(L)^(-1)[F(s)] = sum_("所有极点") "Res"[F(s) e^(s t), s_k]
//   $

//   其中 $"Res"[F(s) e^(s t), s_k]$ 表示 $F(s) e^(s t)$ 在极点 $s_k$ 处的留数。
// ]

// 过会我再来想想

==== 性质与计算
所以，拉普拉斯变换不仅具有原傅里叶变换分析系统频域特性的能力（取 $Re(s) = 0$），还能通过引入实轴部分分析系统的稳定性，以及方便地处理系统的初始条件。

为了更好地通过拉普拉斯变换来分析系统，我们还需要了解它的其它数学性质，以及常见函数的拉普拉斯变换结果。

===== 时域微积分性质
#theorem("拉普拉斯变换的微积分性质")[
  若 $cal(L)[f(t)] = F(s)$，则有以下性质
  $
    cal(L)[frac(d^n f(t), d t^n)] = s^n F(s) - sum_(k=0)^(n-1) s^(n-1-k) frac(d^k f(t), d t^k) |_(t=0)
  $
  以及
  $
    cal(L)[(integral_0^t)^n f(tau) d tau] = 1 / s^n F(s)
  $
]

微积分性质是 $cal(L)$ 变换最重要的性质之一，已经在前部分关于其在方程求解上的应用中介绍过，与傅里叶变换不同的是，其包含了初始条件项。

===== S 域微积分性质
#theorem("拉普拉斯变换的 S 域微积分性质")[
  若 $cal(L)[f(t)] = F(s)$，则有以下对 $F(s)$ 的微分性质
  $
    cal(L)[(-t)^n f(t)] = frac(d^n F(s), d s^n)
  $
  同样的，也具有以下积分性质
  $
    cal(L)[f(t) / t^n] = (integral_s^(+oo))^n F(sigma) d sigma
  $
]

该性质在一定程度上可以方便拉普拉斯变换的计算，对时域函数乘以 $t^n$ 算子，将反映到 $F(s)$ 的微分或积分。

===== 线性性质
#theorem("拉普拉斯变换的线性性质")[
  若 $cal(L)[f(t)] = F(s)$，$cal(L)[g(t)] = G(s)$，则有
  $
    cal(L)[a f(t) + b g(t)] = a F(s) + b G(s)
  $
  其中 $a$ 和 $b$ 是常数。
]

和 $cal(F)$ 变换一样，$cal(L)$ 变换也具有线性性质。这是因为积分运算本身就是线性的。

===== 尺度变换
#theorem("尺度变换性质")[
  若 $cal(L)[f(t)] = F(s)$，则有对于常实数 $alpha > 0$，应当有#footnote[注意这里限制了 $alpha > 0$，与傅里叶变换不同；拉普拉斯变换定义在 $[0, +oo)$，所以比例不能为负。]
  $
    cal(L)[f(a t)] = 1/alpha F(s / alpha)
  $
]

===== 时移频移性质
#theorem("时移频移性质")[
  若 $cal(L)[f(t)] = F(s)$，则对于 $t_0 > 0$，有#footnote[拉普拉斯变换定义在 $[0, +oo)$ 上，所以向负方向时移是不允许的。]
  $
    cal(L)[f(t - t_0) u(t - t_0)] = e^(-s t_0) F(s)
  $

  $
    cal(L)[e^(a t) f(t)] = F(s - a)
  $

  和傅里叶变换类似，记忆时可以连起来记忆。#footnote[$f(t - t_0) <=> F(j omega) e^(-j omega t_0), quad f(t) e^(j omega_0 t) <=> F(j (omega - omega_0))$]
]

===== 卷积性质
#theorem("卷积性质")[
  对于拉普拉斯变换而言，时域上的卷积可以等价为频域上的乘法，例如对于下面的情况而言

  若 $cal(L)[f(t)] = F(s)$，$cal(L)[g(t)] = G(s)$，则有
  $
    cal(L)[(f * g)(t)] = F(s) G(s)
  $

  而对于反过来，时域上的乘法可以等价为频域上的卷积
  $
    cal(L)[f(t) g(t)] = frac(1, 2 pi j) integral_(c - j oo)^(c + j oo) F(sigma) G(s - sigma) d sigma
  $

  其中积分路径 $c$ 位于 $F(sigma)$ 和 $G(s-sigma)$ 的公共收敛域内。
  // 等等...这是为什么？
]

若将上表中令 $s = j omega$，那么就可以得到对应的傅里叶变换表格。不过需要注意的是，若函数收敛域不包含 $Re(s) = 0$，那么函数的傅里叶变换是不存在的，必须引入奇异函数来描述，而不是简单的利用上述代换。

Fourier 变换，Laplace 变换，Z 变换都是相当重要的数学工具，为了方便，此处总结出对应的速查表

=== Z 变换

连续时域有拉普拉斯变换的说法，定义为
$
  F(s) = integral_(-oo)^(oo) f(t) e^(-s t) d t
$

对于离散时域而言，对应有有 Z 变换的说法，定义为#footnote[一个令人诧异的点在于为什么 Z 变换的通式不写作 $sum_(n=-oo)^(oo) x(n) e^(-z n)$ 而是 $z^(-n)$，这样不是可以和 Laplace 变换统一格式吗？这是因为 $z^-n$ 的幂函数特性可以表征在离散时域上的位移，具体见下方 Z 变换的性质。]
$
  cal(Z)(x) = X(z) = sum_(n=-oo)^(oo) x(n) z^(-n)
$

其中 $z$ 是复变量。称 $X(z)$ 为序列 $x(n)$ 的 Z 变换。当 $z = e^(j omega)$，为单位圆时，Z 变换即为离散时间傅里叶变换（DTFT）。#footnote[详细内容见《离散信号的频域分析》]。

==== Z 变换的收敛域

对于 Laplace 变换而言，其收敛域为 $Re(s) > alpha$，其中 $alpha$ 是复平面上最右边的极点的实部。同样地，Z 变换也有收敛域的问题；理论上，因为 Z 变换的表达式是洛朗级数，故 Z 变换的收敛域是圆环域。

#example("求下列表达式 Z 变换的收敛域")[
  $x(n) = a^n u(n)$

  求解 Z 变换，应该有
  $
    X(z) = sum_(n=0)^(oo) a^n z^(-n) = lim_(n -> +oo) 1 / (a/z - 1) dot (a/z)^n - 1 / (a/z - 1)
  $

  运用阿贝尔定理，前项幂级数的收敛半径是
  $
    R = lim_(n -> oo) (a/z - 1) / (a/z - 1) = 1
  $

  所以要使得幂级数收敛应当有
  $
    |a/z| < 1 quad -> quad |z| > |a|
  $
  这就是该 Z 变换的收敛域。
]

==== Z 变换的性质

1. 线性性质：字面意思，Z 变换和原函数之间的变换是线性的，满足可加和数乘；

2. 时移性质
$
  cal(Z)(x[n - n_0]) = z^(-n_0) X(z)
$

该性质表征了算符 $z$ 的时移作用，这也可以解释为什么 Z 变换是这样定义的，而不是 $e^(-z n)$，因为 $z^(-n)$ 的幂函数特性可以表征在离散时域上的位移，这是指数函数做不到的。证明上式可以通过代入表达式到原式中完成。

该表达式的形式和 Fourier / Laplace 变换的时移性质类似，可以联动记忆：
$
  cal(F)(x(t - t_0)) = e^(-j omega t_0) X(j omega), quad cal(L)(x(t - t_0)) = e^(-s t_0) X(s)
$

3. 尺度变换性质
$
  cal(Z)(a^n x(n)) = X(z / a)
$

此处的尺度变换性质和 Fourier / Laplace 变换的尺度变换略有区别，此处的原序列乘以 $a^n$，而后两者的时间函数则是乘常系数
$
  cal(F)(x(a t)) = 1/abs(a) X((j omega) / a), quad cal(L)(x(a t)) = 1/a X(s / a)
$

4. Z 域微积分性质

有以下微分性质
$
  cal(Z)(n f[n]) = -z (d X(z))/(d z) \
  cal(Z)(n^2 f[n]) = -z (d)/(d z) [-z (d X(z))/(d z)]
$

该定理的证明可以通过对 Z 变换表达式求导得到
$
  (d X(z))/(d z) = sum_(n=-oo)^(oo) x(n) (-n) z^(-n-1) = -1/z cal(Z)(n x(n))
$

同理也有积分性质
$
  cal(Z)(f[n] / n) = integral X(z) / z d z
$

5. 卷积定理

Z 变换最重要的定理之一，时域序列的卷积对应 Z 域变换的乘积
$
  cal(Z)(f(n) * g(n)) = F(z) G(z)
$

注意收敛域的问题，卷积后的 Z 变换的收敛域是 $F(z)$ 和 $G(z)$ 收敛域的交集。

6. 初值定理和终值定理

如果时域序列 $x(n)$ 是一个当 $n < M$ 时为零的因果序列，则有初值定理
$
  x(M) = lim_(z -> oo) z^M X(z)
$

这是因为展开 Z 变换表达式有
$
  X(z) = sum_(n=M)^(oo) x(n) z^(-n) = z^(-M) x(M) + z^(-M-1) x(M+1) + ...
$

乘上 $z^M$ 并令 $z -> oo$，第一项后面的各项均趋于零，故得初值定理。
$
  z^M X(z) = x(M) + x(M+1) / z + x(M+2) / z^2 + ... -> x(M)
$

也有终值定理
$
  lim_(n -> oo) x(n) = lim_(z -> 1) (z - 1) X(z)
$

该表达式仅当 $f(oo)$ 收敛时成立。

7. 时域翻转性质
$
  cal(Z)(x(-n)) = X(1/z)
$

#example("求解 Z 变换表达式")[
  $cal(Z)[-u(-n - 1)]$

  首先有 $cal(Z)[u(n)]$ 的表达式为
  $
    cal(Z)[u(n)] = sum_(n=0)^(oo) z^(-n) = 1 / (1 - z^(-1)) quad, quad |z| > 1
  $
  然后运用翻转定理
  $
    cal(Z)[u(-n)] = 1 / (1 - z) quad, quad |z| < 1
  $
  然后运用时移性质
  $
    cal(Z)[u(-(n + 1))] = z / (1 - z)
  $
  最后运用线性性质
  $
    cal(Z)[-u(-n - 1)] = -z / (1 - z) = z / (z - 1)
  $
]

可以观察到上述定理的操作对象都是对 $n$ 本身，而不是对整个时域表达式，运用性质时应当尤其注意。


==== 常见的 Z 变换对照表

#align(center)[
  #block(
    inset: 8pt,
    radius: 6pt,
    table(
      columns: (1fr, 1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[$x(n)$]],
        [#text(weight: "bold")[$X(z)$]],
        [#text(weight: "bold")[收敛域]]
      ),
      [$delta(n)$], [$1$], [全平面],
      [$delta(n - 1)$], [$z^(-1)$], [全平面],
      [$u(n)$], [$z / (z - 1)$], [$|z| > 1$],
      [$a^n u(n)$], [$z / (z - a)$], [$|z| > |a|$],
      [$n a^n u(n)$], [$(a z) / (z - a)^2$], [$|z| > |a|$],
      [$sin(n Omega_0) u(n)$], [$(z sin(Omega_0)) / (z^2 - 2 z cos(Omega_0) + 1)$], [$|z| > 1$],
      [$cos(n Omega_0) u(n)$], [$(z (z - cos(Omega_0))) / (z^2 - 2 z cos(Omega_0) + 1)$], [$|z| > 1$],
    )
  )
]

三角函数的 Z 变换推导比较复杂，以正弦函数为例
#example("推导正弦函数的 Z 变换表达式")[
  首先将正弦函数写为指数形式
  $
    sin(n Omega_0) = (e^(j n Omega_0) - e^(-j n Omega_0)) / (2 j)
  $
  所以有
  $
    cal(Z)[sin(n Omega_0) u(n)] = 1/(2 j) [cal(Z)[e^(j n Omega_0) u(n)] - cal(Z)[e^(-j n Omega_0) u(n)]]
  $
  分别计算两个 Z 变换
  $
    cal(Z)[e^(j n Omega_0) u(n)] = sum_(n=0)^(oo) (e^(j Omega_0) / z)^n = z / (z - e^(j Omega_0)) quad, quad |z| > 1
  $
  $
    cal(Z)[e^(-j n Omega_0) u(n)] = sum_(n=0)^(oo) (e^(-j Omega_0) / z)^n = z / (z - e^(-j Omega_0)) quad, quad |z| > 1
  $
  将两式代入，得到
  $
    cal(Z)[sin(n Omega_0) u(n)] = 1/(2 j) [z / (z - e^(j Omega_0)) - z / (z - e^(-j Omega_0))] = (z sin(Omega_0)) / (z^2 - 2 z cos(Omega_0) + 1)
  $
]

==== Z 反变换

Z 反变换用于将 Z 域的函数转换回时域序列。其表达式为
$
  x(n) = (1 / (2 pi j)) integral.cont_(C) X(z) z^(n - 1) d z
$

其中 C 是处于收敛域内的包围原点的逆时针闭合曲线。
#theorem("该变换公式的成立性")[
  将 $X(z)$ 用其 Z 变换表达式替代
  $
    "RHS" = (1 / (2 pi j)) integral.cont_(C) [sum_(k=-oo)^(oo) x(k) z^(-k)] z^(n - 1) d z = \ (1 / (2 pi j)) sum_(k=-oo)^(oo) x(k) integral.cont_(C) z^(n - k - 1) d z
  $

  对后项环路积分，当 $n - k$ 的取值不同时，结果会有所变化

  1. $n > k$ 时，$n - k - 1 >= 0$，所以 $z^(n - k - 1)$ 在 $z = 0$ 处没有极点，环路积分结果为零；
  2. $n = k$ 时，$z^(n - k - 1) = z^(-1) = 1$，为一级极点，此处有
  $
    "Res"(z = 0) = lim_(z -> 0) z / z = 1
  $
  故该积分表达式的值为 $2 pi j$。
  3. $n < k$ 时，$n - k - 1 < 0$，所以 $z^(n - k - 1)$ 在 $z = 0$ 处为高阶极点，此处有
  $
    "Res"(z = 0) = lim_(z -> 0) 1 / (m - 1)! (d^(m-1))/(d z^(m-1)) dot 1 = 0
  $
  其中 $m$ 为极点的阶数，为原式乘上 $z^m$ 后对原式化为 $1$，再求导即为 $0$，故该积分表达式的值为零。

  所以，原式化为
  $
    "RHS" = (1 / (2 pi j)) sum_(k=-oo)^(oo) x(k) dot 2 pi j dot delta(n - k) = sum_(k=-oo)^(oo) x(k) delta(n - k) = x(n)
  $

  所以 $"LHS" = "RHS"$，等式成立。
]

一般不直接通过该表达式求解 Z 反变换，而是通过部分分式展开等方法将 $X(z)$ 化为已知 Z 变换形式的线性组合，然后通过线性性质求解。

#example("求解 Z 反变换")[
  $F(z) = z / (z^2 + 4)$

  先改写为
  $
    F(z) = z / [(z - 2j)(z + 2j)] = 1/4 i (z / (z + 2i) - z / (z - 2i))
  $
  对照可知
  $
    x(n) = 1/4 i u(n) [(-2i)^n - (2i)^n]
  $
  因为 $(2i)^n = 2^n e^(i pi/2 n), (-2i)^n = 2^n e^(-i pi/2 n)$，所以原式写作
  $
    x(n) = 1/4 dot 2^n dot i dot u(n) [e^(-i pi/2 n) - e^(i pi/2 n)] = 1/2 dot 2^n dot u(n) sin(pi/2 n)
  $
]

==== Z 变换求解零输入响应与单边变换

零输入响应指的是 $f(n) = 0$ 时的系统响应。此时系统的响应受到其初始状态和系统本身特性的影响。直到当前段落，上述文本的讨论都是基于双边 Z 变换的，即 Z 运算的范围是从负无穷到正无穷。

$
  cal(Z)[x(n)] = sum_(n=-oo)^(+oo) x(n) z^(-n)
$

对于 LTI 系统而言，它是因果的，故 $n < 0$ 的序列值应当不对系统产生影响，故为了分析此类系统的特性，引入单边 Z 变换的算法，定义为
$
  cal(Z^+)[x(n)] = sum_(n=0)^(+oo) x(n) z^(-n)
$

对于在 $n < 0$ 时序列值 $x(n)$ 为 $0$ 的序列而言，单边 Z 变换和双边 Z 变换的结果是一致的，包括收敛域；但若序列是双边序列，该两种变换是不等价的。

单边 Z 变换具有新的时移性质，表现为 $n_0 > 0$ 时
$
  cal(Z^+)[x(n - n_0)] = z^(-n_0) X^+(z) + sum_(k=1)^(n_0) x(-k) z^(k - n_0)
$

这是因为对原单边 Z 变换表达式拆分检查
$
  cal(Z^+)[x(n - n_0)] = sum_(n=0)^(oo) x(n - n_0) z^(-n) = sum_(n=-n_0)^(oo) x(n) z^(-n - n_0) \
  = z^(-n_0) sum_(n=0)^(oo) x(n) z^(-n) + sum_(n=-n_0)^(-1) x(n) z^(-n - n_0) \
  = z^(-n_0) X^+(z) + sum_(k=1)^(n_0) x(-k) z^(k - n_0)
$

这就意味着，单边 Z 变换的时移性质中多出了一个和初始条件相关的项。
$
  cal(Z^+)[x(n - 1)] = z^(-1) X^+(z) + x(-1) \
  cal(Z^+)[x(n - 2)] = z^(-2) X^+(z) + z^(-1) x(-1) + x(-2)
$

利用该性质，可以通过单边 Z 变换求解差分方程的零输入响应。
#example("求该系统的零输入响应")[
  $y(n) - 5y(n - 1) + 6y(n - 2) = f(n)$，其中 $y(-2) = 1, y(-1) = 4$，求零输入响应 $y_x(n)$

  对两边作单边 Z 变换
  $
    Y(z) - 5[z^(-1) Y(z) + 4] + 6[z^(-2) Y(z) + 4z^(-1) + 1] = 0
  $

  整理得到 $Y(z) = (14z^2 - 24z) / (z^2 - 5z + 6)$，分离部分分式得到
  $
    Y(z) = z(18/(z - 3) - 4/(z - 2))
  $

  所以有最终的响应为
  $
    x(n) = 18 dot 3^n u(n) - 4 dot 2^n u(n)
  $
]

==== Z 变换的信号流图

#figure(image("images/工科数学/系统分析方法/离散信号的时域分析-1.png", width: 85%),
  caption: [
    LTI 系统的信号流图
  ]
)

图中的 $z^(-1)$ 为单位时延算子，用梅森公式可以求出信号流图的系统表达式
$
  H(z) = sum_(k=1)^N (P_k Delta_k) / Delta = (b_2 + b_1/z + b_0/z^2) / (1 - a_1/z - a_0/z^2) = (b_2 z^2 + b_1 z + b_0) / (z^2 - a_1 z - a_0)
$

可见该信号流图是二阶离散 LTI 系统的通用信号流图。

==== 判断离散系统的稳定性

离散时间 LTI 系统的稳定性判据与连续时间 LTI 系统类似，均可通过系统函数的极点位置判断。简要记忆来说，有
$
  "离散时间系统稳定" <=> "系统函数" H(z) "的所有极点均在单位圆" abs(z) < 1 "内"
$

上述性质使得对于任何有界输入，系统的输出均为有界。

可以通过求解极点的方式判断系统的稳定性，但对于阶数较高的系统，求解极点较为复杂，此时可以运用 Jury 判据判断系统的稳定性。

Jury 准则是 Routh 判据在离散时间系统中的对应版本，通过列些具有特定形式的矩阵来判断系统的稳定性，具体步骤如下。

1. 不同于 Routh 判据，Jury 判据的位移算子写在第一行而非第一列；
$
  z^n quad z^(n-1) quad z^(n-2) quad ... quad z^0
$

2. 接下来的两行，分别正序写上分母的系数和倒序写上分母的系数；例如当分母为 $D(z) = a_n z^n + a_(n-1) z^(n-1) + ... + a_1 z + a_0$ 时，有
$
  a_n &quad a_(n-1) &quad a_(n-2) &quad ... &quad a_0 \
  a_0 &quad a_1 &quad a_2 &quad ... &quad a_n
$

3. 从下一行开始，每一行均由前两行通过特定的计算方式得到，具体为
$
  b_(n-1) = abs(vec(a_n &quad a_0, a_0 &quad a_n)), quad
  b_(n-2) = abs(vec(a_n &quad a_1, a_0 &quad a_(n-1))),
  b_(n-3) = abs(vec(a_n &quad a_2, a_0 &quad a_(n-2))), ...
$

列写行列式，第一列为上两行的第一列，第二列一开始为上两行的最后一列，依次类推令第二列逐渐向左靠拢，直到列数不足为止。

4. 重复上述步骤，计算 $c_(n-1), c_0; d_(n-1), d_0 ...$；出于每新计算一个两行，其列数就会减少一列，所以该过程将进行直到最后只剩下*三*列为止。

5. 判断稳定性：仅当以下条件均成立时，系统稳定
$
  cases(a_n > abs(a_0), b_(n-1) > abs(b_0), c_(n-1) > abs(c_0), ... ) \
  且 \
  D(1) > 0, quad (-1)^n D(-1) > 0
$
其中 $D(1)$ 指的是将 $z = 1$ 代入分母多项式所得的值，$D(-1)$ 同理，$n$ 是多项式的阶数。

Jury 判据的证明较为复杂，不在此叙述。


=== 三大变换速查表
==== Fourier 变换
#align(center)[
  #block(
    inset: 8pt,
    radius: 6pt,
    table(
      columns: (1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[时域函数 $f(t)$]],
        [#text(weight: "bold")[频域函数 $F(j omega)$]],
      ),
      [$e^(-a t) U(t), (a > 0)$], [$1/(j omega + a)$],
      [$e^(-a abs(t)), (a > 0)$], [$(2a)/( omega^2 + a^2)$],
      [$e^(a t), (a > 0)$], [$2 pi delta(omega + a j)$],
      [$e^(a t) U(t), (a > 0)$], [$pi delta(omega + a j) + 1 / (j omega - a)$],
      [$delta(t)$], [$1$],
      [$1$], [$2 pi delta(omega)$],
      [$t$], [$2 pi j delta'(omega)$],
      [$delta'(t)$], [$j omega$],
      [$delta^((n))(t)$], [$(j omega)^n$],
      [$cos(omega_0 t)$], [$pi [ delta(omega - omega_0) + delta(omega + omega_0) ]$],
      [$sin(omega_0 t)$], [$j pi [ delta(omega + omega_0) - delta(omega - omega_0) ]$],
      [$"sgn"(t) quad$ #footnote[指数函数的 $a arrow 0$ 得来，下方的 $U(t)$ 同理]], [$2/(j omega)$],
      [$U(t)$], [$pi delta(omega) + 1/(j omega)$],
      [$"Sa"(omega_0 t)$], [$pi/omega_0 g_(2 omega_0) (omega)$],
      [$g_(tau)(t)$], [$tau "Sa"(omega tau / 2)$],
      [$(1 - abs(t)/(tau)) g_(2 tau)(t)$], [$tau "Sa"^2(omega tau / 2)$],
    )
  )
]

==== Laplace 变换
#align(center)[
  #block(
    inset: 8pt,
    radius: 6pt,
    table(
      columns: (1fr, 1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[函数 $f(t)$]],
        [#text(weight: "bold")[拉普拉斯变换 $F(s)$]],
        [#text(weight: "bold")[收敛域]]
      ),
      [$delta(t)$], [$1$], [全s平面],
      [$u(t)$], [$frac(1, s)$], [$"Re"(s) > 0$],
      [$t u(t)$], [$frac(1, s^2)$], [$"Re"(s) > 0$],
      [$frac(t^n, n!) u(t)$], [$frac(1, s^(n+1))$], [$"Re"(s) > 0$],
      [$e^(-a t) u(t)$], [$frac(1, s+a)$], [$"Re"(s) > -a$],
      [$t e^(-a t) u(t)$], [$frac(1, (s+a)^2)$], [$"Re"(s) > -a$],
      [$frac(t^n, n!) e^(-a t) u(t)$], [$frac(1, (s+a)^(n+1))$], [$"Re"(s) > -a$],
      [$cos(omega t) u(t)$], [$frac(s, s^2 + omega^2)$], [$"Re"(s) > 0$],
      [$sin(omega t) u(t)$], [$frac(omega, s^2 + omega^2)$], [$"Re"(s) > 0$],
      [$e^(-a t) cos(omega t) u(t)$], [$frac(s+a, (s+a)^2 + omega^2)$], [$"Re"(s) > -a$],
      [$e^(-a t) sin(omega t) u(t)$], [$frac(omega, (s+a)^2 + omega^2)$], [$"Re"(s) > -a$],
      [$cosh(a t) u(t)$], [$frac(s, s^2 - a^2)$], [$"Re"(s) > |a|$],
      [$sinh(a t) u(t)$], [$frac(a, s^2 - a^2)$], [$"Re"(s) > |a|$],
      [$t cos(omega t) u(t)$], [$frac(s^2 - omega^2, (s^2 + omega^2)^2)$], [$"Re"(s) > 0$],
      [$t sin(omega t) u(t)$], [$frac(2 omega s, (s^2 + omega^2)^2)$], [$"Re"(s) > 0$],
      [$e^(a t) u(t)$], [$frac(1, s-a)$], [$"Re"(s) > a$],
      [$frac(d f(t), d t)$], [$s F(s) - f(0^-)$], [与$F(s)$相同],
      [$frac(d^2 f(t), d t^2)$], [$s^2 F(s) - s f(0^-) - f'(0^-)$], [与$F(s)$相同],
      [$integral_0^t f(tau) d tau$], [$frac(F(s), s)$], [$"Re"(s) > max(0, sigma_F)$],
    )
  )
]
==== Z 变换
#align(center)[
  #block(
    inset: 8pt,
    radius: 6pt,
    table(
      columns: (1fr, 1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[$x(n)$]],
        [#text(weight: "bold")[$X(z)$]],
        [#text(weight: "bold")[收敛域]]
      ),
      [$delta(n)$], [$1$], [全平面],
      [$delta(n - 1)$], [$z^(-1)$], [全平面],
      [$u(n)$], [$z / (z - 1)$], [$|z| > 1$],
      [$a^n u(n)$], [$z / (z - a)$], [$|z| > |a|$],
      [$n a^n u(n)$], [$(a z) / (z - a)^2$], [$|z| > |a|$],
      [$sin(n Omega_0) u(n)$], [$(z sin(Omega_0)) / (z^2 - 2 z cos(Omega_0) + 1)$], [$|z| > 1$],
      [$cos(n Omega_0) u(n)$], [$(z (z - cos(Omega_0))) / (z^2 - 2 z cos(Omega_0) + 1)$], [$|z| > 1$],
    )
  )
]

=== 三大变换性质汇总
==== 时移性质
时移性质是其重要的性质之一，这使得三大变换能够用于数理方程的求解。
$
  cases(
    cal(F)(f(t - t_0)) = e^(-j omega t_0) cal(F)(f(t)),
    cal(L)(f(t - t_0)) = e^(-s t_0) cal(L)(f(t)),
    cal(Z)(f(n - n_0)) = z^(-n_0) cal(Z)(f(n)),
  )
$

==== 频移/S域移/Z域移性质
$
  cases(
    cal(F)(e^(j omega_0 t) f(t)) = F(j (omega - omega_0)),
    cal(L)(e^(s_0 t) f(t)) = F(s - s_0)
  )
$

==== 尺度变换性质
$
  cases(
    cal(F)(f(a t)) = (1/abs(a)) F(omega / a),
    cal(L)(f(a t)) = (1/a) F(s / a),
    cal(Z)(a^n x(n)) = X(z / a),
  )
$

==== 时域微分性质
$
  cases(
    cal(F)((d^n f(t)) / (d t^n)) = (j omega)^n cal(F)(f(t)),
    cal(L)((d^n f(t)) / (d t^n)) = s^n cal(L)(f(t)) - sum_(k=0)^(n-1) s^(n-1-k) (d^k f(0^-)) / (d t^k)
  )
$

Z 变换的微分定义为 $D(f(k)) = f(k) - f(k - 1)$，所以其微分和时移同质，差分方程的求解则使用先前的时移性质求解。

==== 频域/S域/Z域微分性质
$
  cases(
    cal(F)(t^n f(t)) = j^n (d^n cal(F)(f(t))) / (d omega^n),
    cal(L)(t^n f(t)) = (-1)^n (d^n cal(L)(f(t))) / (d s^n),
    cal(Z)(n^m x(n)) = (-z (d/(d z)))^m cal(Z)(x(n)),
  )
$

==== 卷积性质
$
  cases(
    cal(F)(f(t) * g(t)) = cal(F)(f(t)) cal(F)(g(t)),
    cal(L)(f(t) * g(t)) = cal(L)(f(t)) cal(L)(g(t)),
    cal(Z)(x(n) * y(n)) = cal(Z)(x(n)) cal(Z)(y(n)),
  )
$
特有的，对于 Fourier 变换，还有乘积卷积性质
$
  cal(F)(f(t) g(t)) = 1/(2 pi) (F(j omega) * G(j omega))
$

==== 初值定理与终值定理
对于 Laplace 变换，有初值定理与终值定理
$
  cases(
    f(0^+) = lim_(s arrow oo) s F(s),
    f(+oo) = lim_(s arrow 0) s F(s),
  )
$

对于 Z 变换，也有初值定理与终值定理
$
  cases(
    x(0) = lim_(z arrow oo) X(z),
    x(+oo) = lim_(z arrow 1) (z - 1) X(z),
  )
$
== 状态变量法

先前的文章已经探讨过了对于系统的传输算子表示法，例如对于零状态的 RLC 串联电路而言，有以下系统方程描述激励 $u_s (t)$ 和电容上的输出电压 $u_c (t)$ 的关系

#figure(image("images/工科数学/系统分析方法/状态变量法-1.png", width: 45%),
  caption: [
    RLC 串联电路
  ]
)

$
  H(s) = 1 / (C s) / (R + L s + 1 / (C s)) = 1 / (L C s^2 + R C s + 1)
$

所以，对于任何给定的激励 $F(s)$ 而言，可以求出系统的输出 $Y(s) = F(s) H(s)$，换句话说，传输算子法建立了从激励函数到响应函数的映射。

该系统的微分方程是二阶的，这意味着当系统中两个独立的初始条件被指定后，且在系统接下来输入已知的情况下，系统可以确定唯一的响应。#footnote[这是因为在解二阶微分方程的零输入响应时，总是会出现两个特征根（也可能是重根），这导致解方程需要面对两个待定系数，所以需要两个确定的初始条件来完成这个二自由度方程。]

于是，可以构建一种特殊的映射，这种映射不是建立在输入和输出上的，而是建立在系统的状态上，构建关系式，将系统的一个状态组映射到另一个状态组。这种描述系统的方法被称作状态变量法。作为一种新的分析方法，状态变量法有其独特的优势，例如它可以方便地处理多输入多输出系统，且在数值计算中通常比传输算子法更稳定。

=== 状态变量模型的建构

==== 构建状态方程与响应方程

一个 $n$ 阶的工作中的系统系统应当有 $n$ 个独立的状态变量，可以描述为
$
  x = vec(x_1, x_2, ..., x_n)
$

这被称作系统的状态向量。状态变量法的核心思想是，系统的未来行为完全由当前的状态变量和当前的输入决定。

而*系统未来的行为*这个概念可以用状态变量的导数来描述，记作
$
  dot(x) = vec((d x_1)/(d t), (d x_2)/(d t), ..., (d x_n)/(d t))
$

这被称作状态导数向量，它描述了系统状态随时间的变化率。#footnote[系统未来的行为由状态轨迹 $x(t)$ 来描述，而状态轨迹的变化率正是状态导数 $dot(x)$，所以称其为系统未来的行为，因为它有能力刻画轨迹的下一步行动。]

此外，规定外界的激励向量为
$
  f = vec(f_1, f_2, ..., f_m)
$

当系统有 $m$ 个独立的外部输入时，这被称作系统的输入向量。

于是，系统的状态方程 “系统的未来行为完全由当前的状态变量和当前的输入决定” 就可以被表征为以下关系式
$
  dot(x) = A x + B f
$

其中 $A$ 是一个 $n times n$ 的矩阵，称作系统矩阵，它描述了系统状态变量之间的相互关系；$B$ 是一个 $n times m$ 的矩阵，称作输入矩阵，它描述了外部输入如何影响系统的状态变量。

此外，出于系统的输出也是共同由状态变量和输入决定的考虑，系统的输出方程可以被表征为
$
  y = C x + D f
$

当系统有 $p$ 个响应量时，其中 $C$ 是一个 $p times n$ 的矩阵，称作输出矩阵，它描述了系统状态变量如何影响输出；$D$ 是一个 $p times m$ 的矩阵，称作直接传输矩阵，它描述了外部输入如何直接影响输出。

#example("RLC 串联电路的状态变量法分析")[
  以上图所示电路为例，设电容上电压 $u_c$ 和回路中的电流 $i$ 为状态变量，那么就有
  $
    x_1 = u_c, quad x_2 = i, quad x = vec(u_c, i)
  $

  列写系统方程组，根据元件特性有
  $
    i = C (d u_c)/(d t) \
    R i + L (d i)/(d t) + u_c = u_s (t)
  $

  将上述方程组整理为状态变量的导数，可得
  $
    (d u_c)/(d t) = 1/C i \
    (d i)/(d t) = -1/L u_c - R/L i + 1/L u_s (t)
  $

  因此可以写成标准的状态空间形式。令输入为一阶向量 $f = vec(u_s (t))$，输出为一阶向量 $y = vec(u_c (t))$，则
  $
    vec(u_c^', i^') = A vec(u_c, i) + B vec(u_s (t))
  $
  其中
  $
    A = vec(0 quad& 1/C, -1/L quad& -R/L), quad B = vec(0, 1/L)
  $

  同理，输出方程为
  $
    y = C x + D f
  $
  其中
  $
    C = vec(1 quad& 0), quad D = vec(0)
  $

  所以，这个系统的状态变量方程和输出方程即为
  $
    dot(x) = vec(0 quad& 1/C, -1/L quad& -R/L) x + vec(0, 1/L) f \
    y = vec(1 quad& 0) x + vec(0) f
  $

]

// 若系统为零初值（零状态）响应，则在拉普拉斯域中有
// $
//   X(s) = (s I - A)^{-1} B F(s), quad Y(s) = C X(s) + D F(s)
// $
// 从而传输函数可由状态空间得到
// $
//   H(s) = Y(s) / F(s) = C (s I - A)^{-1} B + D
// $
// 将本例中的 $A,B,C,D$ 代入并化简，可以得到
// $
//   H(s) = 1 / (L C s^2 + R C s + 1)
// $
// 这与先前由传输算子法得到的结果一致。

==== 从电路图构建状态变量法模型

先介绍推论：电路系统中的独立#footnote[此处“独立”指这些储能元件所对应的储能变量（如电容电压 $v_C$、电感电流 $i_L$）可以被选作相互独立的自由状态，也即它们的初始值可以在物理约束（KCL/KVL 与元件关系）下独立指定，而不会被电路拓扑强制绑定为代数约束。由电容与理想电压源构成的回路（纯电容回路）会约束电容电压，此时电容电压与其本身特性无关。]储能元件数量决定了系统的阶数，也即状态变量的数量。每一个独立的储能元件（电感、电容、忆阻器等等）都对应一个状态变量。

确定系统阶数后，可以从电路图中提取出状态向量，一般选取所有独立电容的电压和所有独立电感的电流作为状态变量。对于每个状态变量 $x_i$，可以写出其导数 $dot(x_i)$ 的表达式，这些表达式通常是基于元件的特性（如电容的电流与电压的关系）和基尔霍夫定律（KCL/KVL）来推导的。

#example("列写下方电路图的状态变量法模型")[
  #figure(image("images/工科数学/系统分析方法/状态变量法-2.png", width: 85%),
    caption: [
      电路图
    ]
  )

  选取电容上的电压 $x_1 (t)$，两个电感上的电流 $x_2 (t), x_3 (t)$ 构建状态向量
  $
    x = vec(x_1, x_2, x_3)
  $

  列写状态方程组
  $
    cases(
      C (d x_1)/(d t) = x_2 + x_3,
      x_1 = f_1 - L_2 (d x_2)/(d t),
      f_1 - x_1 - L_3 (d x_3)/(d t) = (x_3 + f_2) R
    )
  $

  于是整理后得到
  $
    cases(
      (d x_1)/(d t) = 1/C x_2 + 1/C x_3,
      (d x_2)/(d t) = 1/L_2 f_1 - 1/L_2 x_1,
      (d x_3)/(d t) = 1/L_3 f_1 - R/L_3 x_3 - R/L_3 f_2 - 1/L_3 x_1
    )
  $

  所以列写为矩阵形式
  $
    dot(x) = vec(0 quad& 1/C quad& 1/C, -1/L_2 quad& 0 quad& 0, -1/L_3 quad& 0 quad& -R/L_3) x + vec(0 quad& 0, 1/L_2 quad& 0, 1/L_3 quad& -R/L_3) vec(f_1, f_2)
  $
]

==== 从信号流图构建状态变量法模型

从信号流图构建状态变量的一种通用方法被称为相位变量法，Laplace 算子 $s$ 被视作一个积分器，相邻两个节点之间的相位差为 $pi / 2$。于是可以将每个积分器的输出视作一个状态变量。以此列写状态方程。#footnote[$s$ 算子相当于 $j omega$，在频域中引入了 $90°$ 的相位差。]

#example("列写下方信号流图的状态变量法模型")[
  #figure(image("images/工科数学/系统分析方法/状态变量法-3.png", width: 85%),
    caption: [
      信号流图
    ]
  )
  选取图示的 $x^' (t), x(t)$ 节点为 $x_1 (t), x_2 (t)$ 状态变量，构建状态向量
  $
    x = vec(x_1, x_2)
  $

  列写关系方程组
  $
    cases(
      (d x_1) / (d t) = -a_1 x_1 - a_0 x_2 + f(t),
      (d x_2) / (d t) = x_1
    )
  $

  整理，并写作矩阵形式有
  $
    dot(x) = vec(-a_1 quad& -a_0, 1 quad& 0) x + vec(1, 0) f(t)
  $

  且有输出关系式 $y(t) = b_0 x_2 + b_1 x_1 + b_2 (d x_1)/(d t) = (b_1 - b_2 a_1) x_1 + (b_0 - b_2 a_0) x_2 + b_2 f(t)$，故整理为矩阵形式，有输出关系式
  $
    y = vec(b_1 - b_2 a_1 quad& b_0 - b_2 a_0) x + vec(b_2) f(t)
  $
]

=== 状态变量模型的解算

解算指将状态变量模型转换为系统的传输函数或时域响应。

一个以状态变量法表示的线性时不变系统可以表示为
$
  dot(x) = A x + B f \
  y = C x + D f
$

如果对上式的两边都做 Laplace 变换，有
$
  s X(s) - x(0) = A X(s) + B F(s) \
  Y(s) = C X(s) + D F(s)
$

这里的 $A, B, C, D$ 是前文提到的系统矩阵、输入矩阵、输出矩阵和直接传输矩阵。因为它们不是关于时间的函数，且矩阵的乘积具有线性性，所以在 Laplace 变换时不受影响。原向量 $x(t), f(t), y(t)$ 分别变换为 $X(s), F(s), Y(s)$，对向量的 Laplace 变换是对向量的每个分量分别做 Laplace 变换。

先讨论第一个方程的解法，整理后有
$
  X(s) = (s I - A)^(-1) x(0) + (s I - A)^(-1) B F(s)
$

此处称 $Phi(s) = (s I - A)^(-1)$ 为状态预解算子，它将状态变量的初始条件 $x(0)$ 和输入 $F(s)$ 映射到状态变量 $X(s)$。

根据此，就可以解得系统的状态的 S 域方程为
$
  X(s) = Phi(s) dot [x(0) + B F(s)]
$

再将目光看向第二个方程，将 $X(s)$ 代入，有
$
  Y(s) = C Phi(s) x(0) + [C Phi(s) B + D] F(s)
$

对于该方程而言，如果 $F(s) = 0$，那么系统的响应即为前半部分 $Y(s) = C Phi(s) x(0)$；如果 $x(0) = 0$，那么系统的响应即为后半部分 $Y(s) = [C Phi(s) B + D] F(s)$。所以响应实际上可以被分为两部分，一部分是零输入响应，另一部分是零状态响应
$
  Y(s) = overbracket(C Phi(s) x(0), "零输入响应") + overbracket([C Phi(s) B + D] F(s), "零状态响应")
$

于是，零状态时的系统传输算子就是
$
  H(s) = C Phi(s) B + D = C (s I - A)^(-1) B + D
$

由于此时的系统可以是多输入多输出系统，所以实际上 $H(s)$ 被称作转移函数矩阵。

==== 系统的固有频率

系统的固有频率是指系统在没有外部激励时的自然振荡频率。在传统的传输算子模型中，系统的固有频率是传输算子的极点。因为极点的位置对应系统零状态方程的特征根。而在状态变量模型中，系统的固有频率可以通过系统矩阵 $A$ 的特征值来确定。

首先，由于矩阵的逆可以被表示为矩阵的伴随矩阵与行列式的比值，有
$
  H(s) = C (s I - A)^(-1) B + D = C ("adj"(s I - A)) / (det(s I - A)) B + D
$

观察发现，传输算子的极点正是由方程 $det(s I - A) = 0$ 所决定的。而行列式 $det(s I - A)$ 的根正是矩阵 $A$ 的特征值。

故称系统矩阵 $A$ 的特征值为系统的固有频率。

==== 系统的时域解法

我们知道对于线性时不变系统，其时域解法是求解系统的微分方程，即对于方程
$
  sum_(i=0)^(n) a_i (d^i y)/(d t^i) = sum_(j=0)^(m) b_j (d^j f)/(d t^j)
$

其解的形式应当是 $e^(lambda t)$ 乘系数的线性组合，其中 $lambda$ 是系统的固有频率。

而对于以矩阵形式表示的状态变量模型，可以猜测其时域解应当是 $exp(A t)$ 乘系数的线性组合，其中 $exp(A t)$ 是矩阵指数函数，定义为
$
  exp(A t) = sum_(k=0)^(+oo) (A^k t^k) / (k!)
$

这是采用泰勒级数定义的，展开来看就是
$
  exp(A t) = I + A t + (A^2 t^2) / 2! + (A^3 t^3) / 3! + ...
$

其结果最后也是一个和 $A$ 同等大小的矩阵。

#line(length: 100%)

先介绍 $e^(A t)$ 的求导性质，有以下等式是成立的
$
  (d)/(d t) e^(A t) = A e^(A t)
$

这是因为对于矩阵指数函数的导数，可以对其泰勒级数逐项求导，得到
$
  d/(d t) e^(A t) = d/(d t) [I + A t + (A^2 t^2) / 2! + (A^3 t^3) / 3! + ...] = \ A + (A^2 t) / 1! + (A^3 t^2) / 2! + ... = A [I + A t + (A^2 t^2) / 2! + ...] = A e^(A t)
$

由于矩阵的公因式也可以向右提取，所以此处的矩阵乘法也满足交换律
$
  (d)/(d t) e^(A t) = e^(A t) A = A e^(A t)
$

#line(length: 100%)

再观察系统的状态方程
$
  dot(x) = A x + B f
$

此时，我们可以利用积分因子法求解。将方程移项，有
$
  dot(x) - A x = B f
$

两边同时左乘 $e^(-A t)$，有
$
  e^(-A t) dot(x) - e^(-A t) A x = e^(-A t) B f
$

注意到左边正是 $d/(d t) (e^(-A t) x)$ 的展开形式（利用乘积求导法则和 $d/(d t) e^(-A t) = -e^(-A t) A$），所以
$
  d/(d t) (e^(-A t) x) = e^(-A t) B f
$

对两边从 $0$ 到 $t$ 积分，有
$
  integral_0^t d/(d tau) (e^(-A tau) x(tau)) d tau = integral_0^t e^(-A tau) B f(tau) d tau
$

根据牛顿-莱布尼茨公式，左边积分结果为
$
  e^(-A t) x(t) - e^(-A 0) x(0) = e^(-A t) x(t) - x(0)
$

于是
$
  e^(-A t) x(t) = x(0) + integral_0^t e^(-A tau) B f(tau) d tau
$

两边同时左乘 $e^(A t)$，得到状态方程的时域解
$
  x(t) = e^(A t) x(0) + integral_0^t e^(A (t - tau)) B f(tau) d tau = e^(A t) x(0) + e^(A t) B * f
$

其中第一项 $e^(A t) x(0)$ 是由初始状态引起的响应，称为零输入响应；第二项 $e^(A t) B * f$ 是由输入引起的响应，称为零状态响应。这与 S 域分析的结果是一致的。

此处定义状态转移矩阵 $phi(t) = e^(A t)$，它描述了状态从 $0$ 时刻转移到 $t$ 时刻的自然演化过程。那么原式也可以写成
$
  x(t) = phi(t) x(0) + phi(t) B * f
$

这里的卷积是一个矩阵对一个同大小向量的卷积，实际对应正常的矩阵乘法做法，但是将每个量之间的乘法替换为卷积。#footnote[例如，对于 $vec(f_(11) quad & quad f_(12), f_(21) quad & quad f_(22)) * vec(g_(1), g_(2))$，其结果为 $vec(f_(11) * g_(1) + f_(12) * g_(2), f_(21) * g_(1) + f_(22) * g_(2))$。此处将乘法全部替换为了卷积运算。这可以根据上述积分式的实际意义推导出来。]

为了求得系统的状态变量时域解，有必要解出 $e^(A t)$，实际上有等式成立
$
  e^(A t) = cal(L)^(-1) [(s I - A)^(-1)] = cal(L)^(-1) [Phi(s)]
$

这是因为，对矩阵指数函数 $e^(A t)$ 进行 Laplace 变换，有
$
  cal(L) [e^(A t)] = cal(L) [I + A t + (A^2 t^2) / 2! + ...] \
  = I/s + A/s^2 + A^2/s^3 + ... \
  = s^(-1) (I + s^(-1) A + s^(-2) A^2 + ...)
$

括号内的部分正是几何级数求和公式 $(I - X)^(-1) = I + X + X^2 + ...$ 的形式，其中 $X = s^(-1) A$。于是
$
  cal(L) [e^(A t)] = s^(-1) (I - s^(-1) A)^(-1) = (s (I - s^(-1) A))^(-1) = (s I - A)^(-1)
$

所以，对上式两边取 Laplace 逆变换，即可得到 $e^(A t) = cal(L)^(-1) [(s I - A)^(-1)]$。

综上所述，可以得到时域求解的最终结论
#theorem("状态变量法的时域解")[
  线性时不变系统的状态变量模型
  $
    dot(x) = A x + B f \
    y = C x + D f
  $
  的时域解为
  $
    x(t) = e^(A t) x(0) + e^(A t) B * f(t) \
    y(t) = C e^(A t) x(0) + C e^(A t) B * f(t) + D f(t)
  $
  其中矩阵指数函数 $e^(A t)$ 可由以下等式求得
  $
    e^(A t) = cal(L)^(-1) [(s I - A)^(-1)]
  $
]

另外，对于任何线性时不变系统的系统矩阵 $A$ 而言，其系统矩阵必然是一个常数矩阵。

==== 离散模型下的状态变量法

在离散模型下，系统未来的行为被描述为 $x(k + 1)$，当前的状态为 $x(k)$，当前的输入为 $f(k)$。据此列出的方程为
$
  x(k + 1) = A x(k) + B f(k) \
  y(k) = C x(k) + D f(k)
$

和先前的推断类似，对首个表达式作 Z 变换。

根据 Z 变换的左移性质，有
$
  cal(Z)[x(k+1)] = sum_(k=0)^(+oo) x(k+1) z^(-k) = z sum_(k=0)^(+oo) x(k+1) z^(-(k+1)) \
  = z (sum_(m=0)^(+oo) x(m) z^(-m) - x(0)) = z X(z) - z x(0)
$

于是得到
$
  z X(z) - z x(0) = A X(z) + B F(z)
$

进一步有
$
  X(z) = (z I - A)^(-1) z x(0) + (z I - A)^(-1) B F(z)
$

称 $Phi(z) = (z I - A)^(-1) z$ 为离散状态预解算子。所以原式可写为
$
  X(z) = Phi(z) x(0) + (z I - A)^(-1) B F(z)
$

如果带入第二个方程，有
$
  Y(z) = C Phi(z) x(0) + [C (z I - A)^(-1) B + D] F(z)
$

称系统的离散传输算子为
$
  H(z) = C (z I - A)^(-1) B + D
$

若在时域求解，通过递推关系可以得到
$
  x(k) = A^k x(0) + sum_(j=0)^(k-1) A^(k-1-j) B f(j)
$
其中 $A^k$ 即为离散系统的状态转移矩阵 $Phi(k)$，它满足 $Phi(k) = cal(Z)^(-1) [Phi(z)]$。

==== 系统的稳定性判据

对于连续时间系统，其稳定性判据为 $det(s I - A) = 0$ 的所有解的实部均小于零；而对于离散时间系统，其稳定性判据为 $det(z I - A) = 0$ 的所有解的模均小于一（位于单位圆内）。

离散时域信号指的是仅在离散的时间点上有定义的信号。与连续时域信号不同，离散时域信号只在特定的时间点上取值，这些时间点通常是均匀分布的。

离散时域信号用序列来表示，记作 $x(n)$。

== 采样信号的分析

=== 离散信号采样的理论基础

现实世界中的信号大多是连续的，但出于采样设备的限制，实际工程中的信号大多是每隔一定时间对连续信号进行抽样而获得的，所以这些信号仅在采样点时刻上具有定义，称这类信号为离散信号。

对于连续信号 $f(t)$，定义抽样序列 $s(t)$ 为

$
  s(t) = sum_(n=-oo)^(oo) delta(t - n T)
$

将 $f(t)$ 与 $s(t)$ 相乘，得到原信号抽样过后的信号

$
  f_s (t) = f(t) s(t) = sum_(n=-oo)^(oo) f(n T) delta(t - n T)
$

就这样经过抽样间隔为 $T$ 的采样，信号 $f(t)$ 就被转换为离散信号 $f_s (t)$，其在 $t = n T$ 时刻有强度为 $f(n T)$ 的冲激，其他时刻均没有响应。

#figure(image("images/工科数学/系统分析方法/离散信号的频域分析.png", width: 85%),
  caption: [
    抽样序列函数对连续信号进行抽样
  ]
)

由此构建出的时域离散信号 $f_s (t)$ 在离散化的同时仍然包含原信号的信息，可用于数字信号处理。有理由认为，若对于一个连续信号 $f(t)$，若采样间隔 $T$ 足够小，那么，离散信号 $f_s (t)$ 就能较好地反映原信号 $f(t)$ 的信息，乃至可以用之还原出原信号。

为了考察其是否包含了原信号的所有信息，可以从频域上进行分析。

先分析周期采样序列 $s(t)$ 的频谱，将 $s(t) = sum_(n=-oo)^(oo) delta(t - n T)$ 展开为傅里叶级数

$
  s(t) = sum_(n=-oo)^(oo) c_n e^(j n omega_s t), quad
  c_n = 1/T integral_(-T/2)^(T/2) sum_(n=-oo)^(oo) delta(t - n T) e^(-j n omega_s t) d t
$

容易发现，在 $c_n$ 的积分式中，仅当 $t = 0$ 时，$delta(t - n T)$ 有非零值#footnote[$delta(t - n T)$ 在任何 $t = n T$ 时都有值，但只有 $t = 0$ 落于积分区间中]，所以

$
  c_n = 1/T dot e^(- j n omega_s dot 0) = 1/T
$

所以 $s(t)$ 的傅里叶级数展开式为 $s(t) = 1/T sum_(n=-oo)^(oo) e^(j n omega_s t)$，据此得出其傅里叶变换为#footnote[指数函数的傅里叶变换为 $cal(F)(e^(t)) = 2 pi dot delta(omega + i)$]下式，其中 $w_s = (2 pi) / T$

$
  S(j omega) = omega_s sum_(n=-oo)^(oo) delta(omega - n omega_s)
$

所以周期采样序列 $s(t)$ 的频谱是一个以 $omega_s$ 为间隔的冲激序列。以此为基础，分析 $f_s (t)$ 的频谱 $F_s (j omega)$，那么应当有

$
  F_s (j omega) = cal(F)(f(t)s(t)) = (1 / (2 pi)) (F(j omega) * S(j omega)) = \ (1 / (2 pi)) (F(j omega) * omega_s sum_(n=-oo)^(oo) delta(omega - n omega_s))
$

我们知道冲激函数的卷积性质 $f(t) * delta(t - a) = f(t - a)$，所以

$
  F_s (j omega) = (omega_s / (2 pi)) sum_(n=-oo)^(oo) F(j (omega - n omega_s))
$

这么一来，离散信号 $f_s (t)$ 的频谱 $F_s (j omega)$ 就是原信号 $f(t)$ 的频谱 $F(j omega)$ 的无数个平移版本的叠加，其中频域平移的位置是 $n omega_s$。

#figure(image("images/工科数学/系统分析方法/离散信号的频域分析-2.png", width: 75%),
  caption: [
    离散信号的频谱是原信号频谱的无数平移版本的叠加
  ]
)

所以，只需要提取 $-omega_s / 2 < omega < omega_s / 2$ 范围内的频域成分，将其作为原信号的频域响应 $F_r (j omega)$，对其作傅里叶逆变换，就可以还原出原信号 $f(t)$。

不过这样做是有前提的，试想这样一种情况，若上图中的 $F(j omega)$ 很宽，以至于其有值的频率范围超过了 $[-omega_s / 2, omega_s / 2]$，那么其平移版本就会相互重叠，导致无法区分 $-omega_s / 2 < omega < omega_s / 2$ 范围内的频域成分和其他频域成分。我们称这种现象为频谱混叠。

出现频谱混叠会导致 $F(j omega)$ 出现失真，无法还原出原信号 $f(t)$，所以，为了避免频谱混叠的出现：若一连续信号 $f(t)$ 的频率成分 $F(j omega)$ 有值的最大频率为 $omega_m$，那么采样频率 $omega_s$ 应当满足

$
  omega_s >= 2 omega_m
$

这就是采样定理，遵循该规律的采样序列可以较好地反映原信号的信息。#footnote[另外一种基于傅里叶级数的解释可以参考笔记微积分栏目中《傅里叶变换》的内容。]

=== 离散信号的傅里叶变换分析

上述离散抽样信号 $f_s (t)$ 仅在 $t = n T$ 时刻有值

$
  f_s (t) = f(t) s(t) = sum_(n=-oo)^(oo) f(n T) delta(t - n T)
$

故该函数实际上可以被表示为一串瞬时样本值序列，我们定义 $x[n]$ 序列，该序列反映连续冲激信号的强度，可以被常见数据结构如数组保存，有

$
  x[n] = f(n T)
$

#figure(image("images/工科数学/系统分析方法/离散信号的频域分析-3.png", width: 75%),
  caption: [
    将原信号转化为离散样本值序列，其中 $p(t)$ 是采样序列
  ]
)

接下来用该连续序列来表示离散时间傅里叶变换

$
  X(e^(j omega)) = integral_(-oo)^(oo) f_s (t) e^(-j omega t) d t = integral_(-oo)^(oo) [ sum_(n=-oo)^(oo) f(n T) delta(t - n T) ] e^(-j omega t) d t
$

提取求和式到积分式之外，得

$
  X(e^(j omega)) = sum_(n=-oo)^(oo) f(n T) [ integral_(-oo)^(oo) delta(t - n T) e^(-j omega t) d t ]
$

右边的式子仅在 $t = n T$ 时有值，所以有

$
  X(e^(j omega)) = sum_(n=-oo)^(oo) f(n T) e^(-j omega n T) = sum_(n=-oo)^(oo) x[n] e^(-j omega n T)
$

不妨令采样间隔 $T = 1$，所以该离散序列 $x[n]$ 的离散时间傅里叶变换为#footnote[令 $T = 1$ 实际上是一种归一化处理的手段，实际采样中，为了采集足够的信息，采样间隔 $T$ 往往是一个很小的数值，以获取足够高的采样频率；但在数学分析中，为了简化表达式将 $T$ 归一化为 $1$，这使得接下来的讨论中信号分布在 $[-omega_m, omega_m]$ 中的各个频率成分被映射到了 $[-pi, pi]$ 范围内。]

$
  X(e^(j omega)) = sum_(n=-oo)^(oo) x[n] e^(-j omega n)
$

离散时间傅里叶变换的频谱是连续且周期性的，这是因为

$
  X(e^(j (omega + 2 pi))) = sum_(n=-oo)^(oo) x[n] e^(-j (omega + 2 pi) n) = sum_(n=-oo)^(oo) x[n] e^(-j omega n) e^(-j 2 pi n) \ = sum_(n=-oo)^(oo) x[n] e^(-j omega n) = X(e^(j omega))
$

所以离散时间傅里叶变换所包含有效信息的频率范围为 $-pi < omega <= pi$。

#line(length: 100%)

离散时间傅里叶变换可以反映离散序列的频域特性，但它是不可能被以数值计算方法计算的。因为采样点有无限多个，且频率轴也有无限个计算点。

为此，先引入以下序列 $x_N [n]$

$
  x_N [n] = cases(
    x[n] quad n in [0, N-1],
    0 quad "otherwise"
  )
$

该序列仅在 $0 <= n <= N-1$ 范围内与 $x[n]$ 相同，其他时刻均为零。通过截断序列 $x[n]$，可以得到有限长的序列 $x_N [n]$，其离散时间傅里叶变换#footnote[我们将离散时间傅里叶变换写作 $X_N (e^(j omega))$ 而非 $X_N (j omega)$，是因为这里采用了 Z 变换的写法，以和连续傅里叶变换有所区分。]为 $X_N (e^(j omega))$

$
  X_N (e^(j omega)) = sum_(n=0)^(N-1) x[n] e^(-j omega n)
$

对于有限个采样点，该式针对指定 $omega$ 的值就具有可计算性了。

同时，将频域也进行离散化处理，定义对于有限长序列 $x_N [n]$ 的离散傅里叶变换

$
  X[k] = sum_(n=0)^(N-1) x[n] e^(-j (2 pi k n) / N), quad k = 0,1,...,N-1
$

这也就相当于是对连续频率轴的采样，采样点为 $omega_k = (2 pi k) / N$，$k = 0,1,...,N-1$

$
  X[k] = integral_(0)^(2 pi) X_N (e^(j omega)) delta(omega - (2 pi k) / N) d omega
$

所以现在的频域也被离散化了，且频率范围为 $0 <= omega < 2 pi$。

频域的离散化会引起信息的丢失吗？可以引入频域采样定理来进行说明。

#theorem("频域采样定理")[
  若 $f(t)$ 仅在时域区间 $(-t_m, t_m)$ 内有值，且其频谱函数为 $F(j omega)$，那么该 $F(j omega)$ 可唯一地由其在均匀间隔 $omega_s$ 处的采样值重构而成。且该均匀间隔满足
  $
    omega_s <= pi / t_m
  $

  这是因为，若将频谱再看作时域函数 $F(j t)$，其离散时间傅里叶变换为
  $
    cal(F)(F(j t)) = 2 pi f(-omega)
  $

  该结果仅在 $-t_m < omega < t_m$ 范围内有值，这即是 $F(j t)$ 的有效频域范围。所以针对 $F(j t)$ 进行采样时，采样的角频率 $omega_s$ 应当满足
  $
    omega_s >= 2 t_m
  $

  满足该采样角频率的采样就可以完整留存 $F(j t)$ 的信息，所以类推到对于实际的频域函数 $F(j omega)$，采样间隔就应当满足 $omega_s <= (2 pi) / omega_m = pi / t_m$。
]

对于原时域序列 $x[n]$，其有值范围为 $[0, N - 1]$，不妨平移令 $t_m = (N - 1) / 2$，则有

$
  omega_s <= pi / t_m = (2 pi) / (N - 1)
$

所以在 $x[n]$ 的频谱 $X(e^(j omega))$ 上以间隔 $omega_s = (2 pi) / (N - 1)$ 进行采样，就可以完整保留 $X(e^(j omega))$ 的信息，而该采样点正好是 $X[k]$ 所对应的频率点。

所以，对于长度为 $N$ 的离散序列 $x[n]$，其频谱 $X(e^(j omega))$ 可以由其在 $N$ 个均匀间隔的采样点 $omega_k = (2 pi k) / N$ 处的采样值 $X[k]$ 唯一重构而成，而不会引起信息的丢失。这便是离散傅里叶变换的理论基础。

#line(length: 100%)

所以，离散傅里叶变换的表达式为

$
  X[k] = sum_(n=0)^(N-1) x[n] e^(-j (2 pi k n) / N), quad k = 0,1,...,N-1
$

其中，$x[n]$ 为时域离散序列，$X[k]$ 为其对应频域离散序列，归一化到 $[0, 2 pi)$。

若原采样间隔为 $T$，则频域离散序列对应的频率点为

$
  omega_k = (2 pi k) / N, quad k = 0,1,...,N-1
$

同样地，如果想通过频域离散序列 $X[k]$ 来还原时域离散序列 $x[n]$，则可以使用离散傅里叶反变换

$
  x[n] = (1 / N) sum_(k=0)^(N-1) X[k] e^(j (2 pi k n) / N), quad n = 0,1,...,N-1
$

这使得离散傅里叶变换和离散傅里叶反变换构成了一对互逆变换，可以相互转换时域和频域的离散序列。

综合迄今为止谈到的所有傅里叶变换性质，可以总结出以下框图

#figure(image("images/工科数学/系统分析方法/离散信号的频域分析-4.png", width: 100%),
  caption: [
    各类信号之间的关系示意图
  ]
)

连续信号是现实世界中最常见的信号形式，但由于采样设备的限制，实际工程中大多使用采样得到的离散信号进行处理。而连续傅里叶变换，离散时间傅里叶变换，离散傅里叶变换则起到桥梁作用，沟通连续信号、离散信号它们的时域与频域。

得益于采样定理，时域上的信号在经过合适的离散采样后，其频域特性仍然可以被完整保留。而针对于频域的离散采样，频域采样定理也保证了傅里叶逆变换不会引起信息的丢失。所以，连续和离散两域的采样和信号处理理论上不丢失任何信息。这便是傅里叶变换能够成为现代信号处理的基石的原因。

=== 快速傅里叶变换

若仔细观察离散傅里叶变换的表达式，可以发现

$
  Y[k] = Y_1[k] + Y_2[k], \
  cases(
    Y_1[k] = x[0] e^(-j (2 pi k 0) / N) + x[2] e^(-j (2 pi k 2) / N) + ... + x[N-2] e^(-j (2 pi k (N-2)) / N),
    Y_2[k] = x[1] e^(-j (2 pi k 1) / N) + x[3] e^(-j (2 pi k 3) / N) + ... + x[N-1] e^(-j (2 pi k (N-1)) / N)
  )
$

令 $u = e^(-j (2 pi k n) / N)$，原式改写为

$
  Y[k] = [ x[0] u^0 + x[2] u^2 + ... + x[N-2] u^(N-2) ] + \
  u dot [ x[1] u^0 + x[3] u^2 + ... + x[N-2] u^(N-2) ] = Y_1[k] + u dot Y_2[k]
$

同时，有 $Y[k + N/2]$ 的计算公式为

$
  Y[k + N/2] = Y_1[k] - u dot Y_2[k]
$

这是因为 $e^(-j (2 pi (k + N/2) n) / N) = e^(-j (2 pi k n) / N) e^(-j pi n) = - e^(-j (2 pi k n) / N)$，该式中的 $u$ 项相对于前一项变号。

所以计算 $Y[k + N/2]$ 时，可以利用 $Y[k]$ 的结果进行快速计算。这样计算规模为 $O(N)$ 的离散傅里叶变换就可以被分解为两个规模为 $O(N/2)$ 的离散傅里叶变换

$
  T(N) = 2 T(N/2) + O(N)
$

根据主定理可知，其时间复杂度为 $O(N log N)$，这就是快速傅里叶变换算法的基本思想。也是现代数字信号处理的基础算法之一。

以下是使用 C 语言实现的 FFT 算法示例代码

```c
typedef struct complex_num
{
    double real;
    double imag;
} complex_num_t;

void compute_fft(const complex_num_t* input, complex_num_t* output, int n) {
    if (n == 1) {
        output[0] = input[0];
        return;
    }

    complex_num_t* even = (complex_num_t*)malloc((n/2) * sizeof(complex_num_t));
    complex_num_t* odd = (complex_num_t*)malloc((n/2) * sizeof(complex_num_t));
    for (int i = 0; i < n/2; i++) {
        even[i] = input[2*i];
        odd[i] = input[2*i + 1];
    }

    complex_num_t* even_fft = (complex_num_t*)malloc((n/2) * sizeof(complex_num_t));
    complex_num_t* odd_fft = (complex_num_t*)malloc((n/2) * sizeof(complex_num_t));

    // 递归计算偶数和奇数部分的 FFT
    compute_fft(even, even_fft, n/2);
    compute_fft(odd, odd_fft, n/2);

    // 合并结果
    for (int k = 0; k < n/2; k++) {
        // 计算旋转因子 W_n^k = e^(-2πik/n)
        double angle = -2.0 * PI * k / n;
        double cos_val = cos(angle);
        double sin_val = sin(angle);

        // W_n^k * odd_fft[k]
        double temp_real = cos_val * odd_fft[k].real - sin_val * odd_fft[k].imag;
        double temp_imag = cos_val * odd_fft[k].imag + sin_val * odd_fft[k].real;

        // X[k] = E[k] + W_n^k * O[k]
        output[k].real = even_fft[k].real + temp_real;
        output[k].imag = even_fft[k].imag + temp_imag;

        // X[k + n/2] = E[k] - W_n^k * O[k]
        output[k + n/2].real = even_fft[k].real - temp_real;
        output[k + n/2].imag = even_fft[k].imag - temp_imag;
    }

    free(even);
    free(odd);
    free(even_fft);
    free(odd_fft);
}
```

该算法采用递归分治的思想，将输入序列不断拆分为偶数和奇数两部分，直到子序列长度为 1，然后逐层合并计算结果。合并的依据是利用上方提到的
$
  Y[k] = Y_1[k] + u dot Y_2[k] \
  Y[k + N/2] = Y_1[k] - u dot Y_2[k]
$

通过利用旋转因子的对称性，大大减少了计算量，实现了快速傅里叶变换。

同样地，快速傅里叶逆变换的实现也可以采用类似的方法，只需将旋转因子的符号取反，并在最终结果中除以序列长度 $N$ 即可。

```c
    complex_num_t* even_ifft = (complex_num_t*)malloc((n/2) * sizeof(complex_num_t));
    complex_num_t* odd_ifft = (complex_num_t*)malloc((n/2) * sizeof(complex_num_t));

    compute_ifft(even, even_ifft, n/2);
    compute_ifft(odd, odd_ifft, n/2);

    for (int k = 0; k < n/2; k++) {
        double angle = +2.0 * PI * k / n;
        double cos_val = cos(angle);
        double sin_val = sin(angle);

        // W_n^k * odd_ifft[k]
        double temp_real = cos_val * odd_ifft[k].real - sin_val * odd_ifft[k].imag;
        double temp_imag = cos_val * odd_ifft[k].imag + sin_val * odd_ifft[k].real;

        // X[k] = E[k] + W_n^k * O[k]
        output[k].real = even_ifft[k].real + temp_real;
        output[k].imag = even_ifft[k].imag + temp_imag;

        // X[k + n/2] = E[k] - W_n^k * O[k]
        output[k + n/2].real = even_ifft[k].real - temp_real;
        output[k + n/2].imag = even_ifft[k].imag - temp_imag;
```

综合来讲，利用 FFT 和 IFFT 算法，可以快速地将时域离散信号转换为频域离散信号，反之亦然。这为数字信号处理提供了高效的计算手段。

```c
  // 进行 FFT
  compute_fft(x, X, SAMPLE_POINTS);

  // 进行 IFFT 并归一化
  compute_ifft(X, Y, SAMPLE_POINTS);
  for (int i = 0; i < SAMPLE_POINTS; i++) {
      Y[i].real /= SAMPLE_POINTS;
      Y[i].imag /= SAMPLE_POINTS;
  }
```

现代数字信号处理中，许多 DSP 芯片会有配套的 DSP 软件库，内置了高效的 FFT 和 IFFT 实现，可以直接调用以简化开发工作。


== 系统的图表示方法

=== 系统框图表示法

==== LTI 系统的表示

对于一个二阶连续 LTI 系统而言，它的系统方程总可以被表示为
$
  y^'' (t) + a_1 y^' (t) + a_0 y(t) = b_2 f^'' (t) + b_1 f^' (t) + b_0 f(t)
$

为此，可以画出以下系统框图来描述它
#figure(image("images/工科数学/系统分析方法/连续系统的图示法-1.png", width: 95%),
  caption: [
    上述方程的系统框图表示法
  ]
)

接下来解释为什么这个框图是成立的，首先围绕和节点列写以下方程
$
  f(t) = x^('') (t) + a_1 x^' (t) + a_0 x(t) \
  y(t) = b_2 x^('') (t) + b_1 x^' (t) + b_0 x(t)
$

将上式代入 LTI 系统方程内，可以得到
$
  "LHS" = y^'' (t) + a_1 y^' (t) + a_0 y(t) \
  = b_2 x^('''') + (b_1 + a_1 b_2) x^(''' ) + (b_0 + a_1 b_1 + a_0 b_2) x^('' ) + (a_1 b_0 + a_0 b_1) x^' + a_0 b_0 x \
  "RHS" = b_2 f^'' (t) + b_1 f^' (t) + b_0 f(t) \
  = b_2 x^('''') + (b_1 + a_1 b_2) x^(''' ) + (b_0 + a_1 b_1 + a_0 b_2) x^('' ) + (a_1 b_0 + a_0 b_1) x^' + a_0 b_0 x
$

因此 $"LHS" = "RHS"$，框图成立。

如果要绘制更高阶的连续 LTI 系统框图，也可同理处理。接下来介绍笔者自己的记忆方法：

1. 观察图中的积分器，它们连接了几个节点，称最后的节点为 0 阶节点，前一个节点为 1 阶节点，再到 2 阶节点，依次类推；

2. 从第 n 阶节点经过乘法器系数 $b_n$ 连接到输出端累加器的对应输入部分 $b_n f^((n)) (t)$；

3. 从第 n 阶节点经过乘法器系数 $-a_n$ 连接到输入端累加器的对应输入部分 $a_n y^((n)) (t)$；#footnote[上图中二阶节点没有链接乘法器，这一点需要注意，默认令 $a_2 = 1$。]

==== 系统框图的串联与并联

讨论并联的情况，如果有两个连续 LTI 系统 $H_1$ 和 $H_2$，且有下图的连接方式

#figure(image("images/工科数学/系统分析方法/连续系统的图示法-2.png", width: 70%),
  caption: [
    两个连续 LTI 系统的并联
  ]
)

那么首先应当有
$
  y = h_1 * f + h_2 * f = (h_1 + h_2) * f
$

所以整理得到
$
  Y(s) = (H_1(s) + H_2(s)) F(s) = H(s) F(s)
$

因此两个系统的并联系统的系统函数为
$
  H(s) = sum_(i=1)^n H_i (s)
$

#line(length: 100%)

也有串联的情况，如下图所示

#figure(image("images/工科数学/系统分析方法/连续系统的图示法-3.png", width: 70%),
  caption: [
    两个连续 LTI 系统的串联
  ]
)

此时应当有
$
  y = h_2 * (h_1 * f) = (h_2 * h_1) * f
$

所以整理得到
$
  Y(s) = H_2 (s) H_1 (s) F(s) = H(s) F(s)
$

因此两个系统的串联系统的系统函数为
$
  H(s) = product_(i=1)^n H_i (s)
$

=== 信号流图表示法

==== 信号流图的基本元素

信号流图是系统的另一种图解表达形式，以节点和有向边表示系统的信号流动关系。节点表示系统的变量（输入、输出或中间变量），有向边表示变量之间的因果关系。


有向边表示从一个节点到另一个节点的信号传递，边上通常标有增益或传递函数，表示信号在传递过程中的变化。
#figure(image("images/工科数学/系统分析方法/连续系统的图示法-4.png", width: 40%),
  caption: [
    边的示例
  ]
)

节点表示系统中的变量，所有指向该节点的边的信号值经过求和后，作为该节点的输出信号。所以节点相当于一个累加器。#footnote[有时从一个节点会引出多个输出，这种情况下每个输出信号的值都等于该节点的输出信号值，即输入信号值的求和，是相同的。]
#figure(image("images/工科数学/系统分析方法/连续系统的图示法-5.png", width: 60%),
  caption: [
    节点的示例
  ]
)

所以 LTI 系统也可以用信号流图表示

#figure(image("images/工科数学/系统分析方法/连续系统的图示法-6.png", width: 80%),
  caption: [
    LTI 系统的信号流图表示
  ]
)

==== 梅森增益公式
对于一个信号流图的传输函数，塞缪尔·杰斐逊·梅森推导出了一个直接计算之的方法，称为梅森增益公式。其内容为#footnote[这样的说法会让人觉得梅森公式是后于信号流图而提出的，但实际上 Mason 在其著名论文（Samuel J. Mason, “Feedback theory — Some properties of signal flow graphs”, Proceedings of the IRE, 1953）中既给出了“Signal Flow Graph（信号流图）”的形式化定义，也推导出了用于计算传输函数的 Mason 增益公式，两者是同时提出的，都是 Mason 对线性系统理论的重要贡献。]
$
  H(s) = (sum_(k) P_k Delta_k) / Delta
$

这个公式略为复杂#footnote[因其较为复杂，本公式的证明不在此叙述。]，先引入以下概念

#figure(image("images/工科数学/系统分析方法/连续系统的图示法-7.png", width: 70%),
  caption: [
    一个系统的示例
  ]
)

1. 通路指的是一条从一个到另一个节点的有向路径，且沿途不经过任何节点两次。

  上图从激励节点到响应节点有三条通路，分别是从 $V_("in")$ 经由 $b_0$、$Z^(-1) -> b_1$ 和 $Z^(-1) -> Z^(-1) -> b_2$ 到达 $V_("out")$ 的三条通路。注意你不能通过 $V_("in") -> Z^(-1) -> -a_1$ 先转回 $V_("in")$ 再继续行进，因为那样会重复经过节点，不能被构成为通路。

2. 环路指的是一条通路，它的起点和终点是同一个节点。对于这条环路，它的环路增益指的是沿着该环路所有边的增益的乘积。

  上图中有两个环路，分别是由 $V_("in")$ 经由 $Z^(-1) -> -a_1$ 和 $V_("in")$ 经由 $Z^(-1) -> Z^(-1) -> -a_2$ 的环路。注意图中有许多个环，但其它的未提到的环不是环路，因为有向边的方向不正确。

3. 特征行列式 $Delta$ 定义为
$
  Delta = 1 - sum_(i) L_i + sum_(i, j) L_i L_j - sum_(i, j, k) L_i L_j L_k + ...
$

  其中 $L_i$ 表示系统中第 $i$ 个环路的环路增益。需要注意的是，第一项求和式子是对所有环路的环路增益求和，第二项求和式子是对所有两两不相交的环路增益乘积求和，两两不相交指的是这两个环路没有经过同一个节点，第三项求和式子是对所有三三不相交的环路增益乘积求和，依此类推。

  对于上图而言，有两个环路 $L_1 = -a_1 / Z$ 和 $L_2 = -a_2 / Z^2$，所以第一项表达式为
  $
    sum_(i) L_i = L_1 + L_2 = -a_1 / Z - a_2 / Z^2
  $

  由于这两个环路经过了同一个节点 $V_("in")$，所以没有两两不相交的环路，因此第二项表达式为 $0$。这里没有三个及以上的环路，所以后续项也为 $0$。因此特征行列式为
  $
  Delta = 1 - (-a_1 / Z - a_2 / Z^2) = 1 + a_1 / Z + a_2 / Z^2
  $

4. 接下来定义 $P_k$，$P_k$ 指的是第 $k$ 条从系统的激励节点到响应节点的通路增益。对于上图而言，有三条通路，它们的通路增益分别为
$
  P_1 = b_0,\
  P_2 = b_1 / Z,\
  P_3 = b_2 / Z^2
$

在此基础上继续定义 $Delta_k$，$Delta_k$ 定义为去除第 $k$ 条通路上所有节点和其直接关联的支路后，剩余信号流图的特征行列式。

对于 $P_1, P_2, P_3$，去除它们各自通路上的节点后，由于 $V_("in")$ 节点被去除，剩余信号流图均没有环路，因此它们对应的 $Delta_k$ 均为 $1$。

综上所述，代入梅森增益公式可得
$
  H(s) = (b_0 + b_1 / Z + b_2 / Z^2) / (1 + a_1 / Z + a_2 / Z^2) = (b_0 Z^2 + b_1 Z + b_2) / (Z^2 + a_1 Z + a_2)
$

所以上图对应的系统函数即如上所示。它是 LTI 系统的系统函数的一般形式。
$
  y^('') (t) + a_1 y^' (t) + a_0 y(t) = b_2 f^('') (t) + b_1 f^' (t) + b_0 f(t)
$

需要注意的是，梅森公式只能求解激励节点（入度为 $0$）和响应节点（出度为 $0$）之间的传输函数。如果系统中有混合节点，求它们之间的传输函数时，不可直接套用梅森公式，而应当先对信号流图进行变换，直到激励节点和响应节点均为纯净节点为止。

#pagebreak()

#example("伺服驱动器系统的信号流图表示与分析")[
#figure(image("images/工科数学/系统分析方法/连续系统的图示法-8.png", width: 100%),
  caption: [
    伺服驱动器系统
  ]
)

该系统中，用户输入理想的位置 $theta_c$，该系统将输出负载位置 $theta_L$。系统包含位置反馈回路，以使得后者尽可能跟随前者。

观察信号流图，有以下几条回路
$
  L_1 = (K_c R_s) / (s L_M) \
  L_2 = -(R_M + R_s) / (s L_M) \
  L_3 = -beta / (M s) \
  L_4 = -(K_M G_M) / (M s^2 L_M) \
  L_5 = (K_v K_c K_M G_T) / (s^2 M L_M) \
  L_6 = -(K_p K_v K_c K_M ) / (s^3 M L_M) \
$

两两不接触的通路仅有
$
  L_1 L_3 = (K_c R_s)(-beta) / (s^2 M L_M) \
  L_2 L_3 = -(R_M + R_s) beta / (s^2 M L_M)
$

所以本系统的特征行列式为
$
  Delta = 1 - (L_1 + L_2 + L_3 + L_4 + L_5 + L_6) + (L_1 L_3 + L_2 L_3)
$

本系统只有一条从 $theta_c$ 到 $theta_L$ 的通路，其通路增益为
$
  P_1 = K_p K_v K_c K_M / (s^3 M L_M)
$

出于去除这一条通路后没有环路的考虑，有 $Delta_1 = 1$。

所以系统函数为
$
  H(s) = (P_1 Delta_1) / Delta
$
]

对于上述系统，其系统函数相当复杂，我们可以通过仿真程序的方法来验证其正确性。
```python
import numpy as np
import matplotlib.pyplot as plt
import sympy as sp
from control import TransferFunction, step_response

# 计算传输算子
s = sp.Symbol('s')

Kc = 1.0
Rs = 1.0
RM = 1.0
beta = 0.2
KM = 0.8
GM = 1.0
Kv = 1.0
GT = 1.0
Kp = 1.0
M  = 1.0
LM = 0.01

L1 = (Kc * Rs) / (s * LM)
L2 = - (RM + Rs) / (s * LM)
L3 = - beta / (M * s)
L4 = - (KM * GM) / (M * s**2 * LM)
L5 = (Kv * Kc * KM * GT) / (s**2 * M * LM)
L6 = - (Kp * Kv * Kc * KM) / (s**3 * M * LM)

L1L3 = L1 * L3
L2L3 = L2 * L3

Delta = 1 - (L1 + L2 + L3 + L4 + L5 + L6) + (L1L3 + L2L3)
P1 = (Kp * Kv * Kc * KM) / (s**3 * M * LM)
Hsym = sp.simplify(P1 / Delta)


# 构造 control.TransferFunction 并做阶跃仿真
H_together = sp.together(Hsym)
num_sym, den_sym = sp.fraction(H_together)
num_poly = sp.Poly(sp.expand(num_sym), s)
den_poly = sp.Poly(sp.expand(den_sym), s)

num_coeffs = [float(c) for c in num_poly.all_coeffs()]
den_coeffs = [float(c) for c in den_poly.all_coeffs()]

sys = TransferFunction(num_coeffs, den_coeffs)
t, y = step_response(sys)

# 绘图
plt.rcParams['font.sans-serif'] = ['SimHei']
plt.rcParams['axes.unicode_minus'] = False
plt.figure(figsize=(6,4))
plt.plot(t, y, 'b')
plt.title('单位阶跃响应: θ_c → θ_L')
plt.xlabel('时间 (s)')
plt.ylabel('输出 θ_L(t)')
plt.grid(True)
plt.tight_layout()
plt.show()
```

于是可以得到对于 $H(s)$ 的阶跃响应曲线，如下图所示
#figure(image("images/工科数学/系统分析方法/连续系统的图示法-9.png", width: 70%),
  caption: [
    系统函数 $H(s)$ 的阶跃响应曲线
  ]
)

可以看到，对于 $U(t)$ 输入，输出 $theta_L (t)$ 先振荡，然后振荡幅度逐渐减小，且最终收敛到 $1$，符合该伺服系统的预期。不过出于参数不够优化，这个系统的收敛时间较长，且有较大的超调量，可以通过调整参数来改善系统性能。

=== 系统稳定性判据

巴克豪森稳定性判据告诉我们，一个系统具有稳定性的必要条件是
$
  integral_(0)^(+oo) |h(t)| d t < +oo \
  1 / (2 pi) integral_(-oo)^(+oo) |H(j omega)| d omega < +oo \
$

这是从时域和频域角度的，扩展到 $s$ 域，由先前的知识，可以知道当传输算子 $H(s)$ 的收敛域 $Re(s) > 0$ 时，系统是稳定的。即 $H(s)$ 的所有极点均位于复平面的左半开平面。故可通过求极点位置来判定系统的稳定性。

当系统阶数较高，求解极点较为复杂时，可以使用劳斯判据来判定系统的稳定性。

#theorem("劳斯稳定性判据")[
  劳斯稳定性判据是一个判断传输算子 $H(s)$ 的分母极点情况的判定方法，其内容如下

  1. 首先，$H(s)$ 多项式的分母 $D(s)$，应当满足其各项系数均大于 $0$；且多项式中无缺项（对于 $n$ 阶多项式，$s$ 的幂从 $n$ 到 $0$ 一项都不应当缺少）

  2. 在满足上述条件的情况下，构造劳斯阵列以进一步探索其稳定性
  $
    vec(
      s^n quad & a_n quad & a_(n-2) quad & a_(n-4) quad & ... ,
      s^(n-1) quad & a_(n-1) quad & a_(n-3) quad & a_(n-5) quad & ... ,
      s^(n-2) quad & b_1 quad & b_2 quad & b_3 quad & ... ,
      s^(n-3) quad & c_1 quad & c_2 quad & c_3 quad & ... ,
      s^0 quad & k_1 quad & 0 quad & 0 quad & ...
    )
  $

  该阵列略显复杂，现解释该阵列的含义

  2-1. $s$ 是拉氏算子；

  2-2. $a_i$ 是多项式 $D(s)$ 的系数，$a_n$ 是最高次项系数，$a_0$ 是常数项系数；例如对于 $D(s) = s^4 + 2s^3 + 8s^2 + 20s + 1$，其劳斯阵列的前两行即为
  $
    s^4 quad & 1 quad & 8 quad & 1 \
    s^3 quad & 2 quad & 20 quad & 0 \
  $

  2-3. $b_i, c_i, k_i$ 等系数通过如下公式计算
  $
    b_1 = abs(vec(a_n quad & a_(n-2), a_(n-1) quad & a_(n-3))) / (-a_(n-1)), quad b_2 = abs(vec(a_n quad & a_(n-4), a_(n-1) quad & a_(n-5))) / (-a_(n-1)), quad b_3 = abs(vec(a_n quad & a_(n-6), a_(n-1) quad & a_(n-7))) / (-a_(n-1))
  $
  $
    c_1 = abs(vec(a_(n-1) quad & a_(n-3), b_1 quad & b_2)) / (-b_1), quad c_2 = abs(vec(a_(n-1) quad & a_(n-5), b_1 quad & b_3)) / (-b_1), quad c_3 = abs(vec(a_(n-1) quad & a_(n-7), b_1 quad & b_4)) / (-b_1), ... \
  $
  以此类推，直到计算到 $s^0$ 项。

  2-4. 如果在计算过程中，某一行的首项系数为 $0$，但这一整行还存在非 $0$ 项，则采用一极小正数 $epsilon$ 代替该位置的 $0$，并忽略关于其的所有正幂次项，继续计算后续行。

  2-5. 如果在计算过程中，这一整行均为 $0$，那么说明多项式的解中有共轭复根，此时需要构造辅助多项式，例如对于情况
  $
    s^4 quad & 1 quad & 4 quad & 4 \
    s^3 quad & 3 quad & 6 quad & 0 \
    s^2 quad & 2 quad & 4 quad & 0 \
    s^1 quad & 0 quad & 0 quad & 0 \
  $
  $s^1$ 全为 $0$，根据上一行 $s^2$ 构造 $P(s) = 2s^2 + 4$，对其求导 $P^(') (s) = 4s$，将该多项式的值代入 $s^1$ 行，得到#footnote[由于 $P(s)$ 的所有项的幂次必然全为奇数或偶数，因此求导后的多项式必然全为偶数或奇数，自然能够代入劳斯阵列的下一行。]
  $
    s^1 quad & 4 quad & 0 quad & 0 \
  $

  然后继续根据先前提到的步骤计算分析。需要注意的是，经过了该步骤的劳斯阵列，第一列全为正得到的结论变为系统处于稳定或临界稳定状态，而非稳定状态。

  3. 最关键的一步是，观察劳斯阵列的第一列系数，如果它们均大于 $0$，则系统稳定；如果有任意一个系数小于等于 $0$，则系统不稳定。

  另外注：满足条件 1 的二阶系统必然稳定，这是因为二阶多项式的第一列必定为 $a_2, a_1, a_0$，各系数均大于 $0$，系统稳定。
]

#example("分析反馈系数对系统稳定性的影响")[
  设 $H(s) = (10(s + 1)) / (s^3 + s^2 + 10(K + 1)s + 10)$，分析 $K$ 使得该系统稳定的取值范围。

  首先，要满足条件 1，应当有
  $
    10(K + 1) > 0  ->  K > -1
  $

  其次，构造劳斯阵列
  $
    vec(s^3 quad & 1 quad & 10(K + 1) ,
        s^2 quad & 1 quad & 10 ,
        s^1 quad & 10K quad & 0 ,
        s^0 quad & 10 quad & 0)
  $
  为了使得系统稳定，应当有
  $
    10K > 0  ->  K > 0
  $

  综合取交集，于是使得系统稳定的 $K$ 的取值范围为
  $
    K > 0
  $
]

= 工科物理

== 经典力学

// 在此处应当填充更有意义的内容

=== 弹簧振子的运动
弹簧振子是指一个质点受到与位移成正比的弹性力作用而做往复运动的系统。它是物理学中最基本的振动系统之一，也称为简谐振子。

在理想情况下，弹簧振子由一个质量为 $m$
的质点，一个理想的满足胡克定律的弹簧构成。

#figure(image("images/工科物理/经典力学/mass-spring-1.png"),
  caption: [
    弹簧振子
  ]
)

弹簧振子的运动受到多种因素的共同影响，接下来我们来分析弹簧振子的几种常见运动情况。

==== 自由振动
自由振动是弹簧振子运动的一种理想模型，在其自由振动时，其运动无阻力，无外力，振子仅受弹簧的弹性恢复力作用。

此时，弹簧振子的动力分析方程为

$ m frac(d^2 x, d t^2) = - k x $

作为二阶线性常微分方程，我们可以将其化为标准形式

$ frac(d^2 x, d t^2) + k / m x = 0 $

接下来求其特征方程，设 $x = e^(r t)$，那么有 $ r^2 + k / m = 0 $

解得 $r = plus.minus i sqrt(k / m)$，带回方程，得到通解为

$ x \( t \) = C_1 e^(i sqrt(k / m) t) + C_2 e^(- i sqrt(k / m) t) $

运用欧拉公式化简为

$ x \( t \) = C_1 cos \( sqrt(k / m) t \) + C_2 sin \( sqrt(k / m) t \) $

#quote(block: true)[
注意：该方程中的 $C_1 \, C_2$ 和 上一个方程中的 $C_1 \, C_2$
并不是一样的，它们只是泛指常数。
]

代入简谐振子的初始条件（位移和速度），再通过三角变换，我们可以知道，总的表达式应当为一个三角函数

$ x \( t \) = A cos \( sqrt(k / m) t + phi.alt \) $

#figure(image("images/工科物理/经典力学/mass-spring-2.png"),
  caption: [
    自由振动位移-时间图像
  ]
)

所以，我们知道，自由振动下的弹簧振子做 $omega = sqrt(k / m)$
的简谐运动，其位移随时间的关系满足正弦函数关系。

==== 阻尼振动
阻尼振动是弹簧振子在受到阻力作用下的运动状态。一般来说，阻力是一个和速度有关的量，与速度方向相反，且可认为和速度成线性关系。

#figure(image("images/工科物理/经典力学/mass-spring-3.png"),
  caption: [
    阻尼振动
  ]
)

我们认为阻力的方程为 $f = - beta frac(d x, d t)$，其中 $beta$
是阻力系数，那么有以下关系成立。

$ m frac(d^2 x, d t^2) = - k x - beta frac(d x, d t) $

作为二阶线性常微分方程，我们可以将其化为标准形式

$ frac(d^2 x, d t^2) + beta / m frac(d x, d t) + k / m x = 0 $

接下来求其特征方程，设 $x = e^(r t)$，那么有

$ r^2 + beta / m r + k / m = 0 $

求解该二次方程的根，得到

$ r = frac(- beta / m plus.minus sqrt((beta / m)^2 - 4 k / m), 2) $

接下来，是时候分类讨论了，当 $m \, beta \, k$
的值不同的时候，弹簧振子的运动会有不同的表现。我们来根据这些参数的不同情况进行分析

+ 当 $frac(beta^2, 4 m^2) - k / m > 0$ 时，根为实数且不相等，设其为
  $r_1 \, r_2$，那么有方程的通解为

  $ x \( t \) = C_1 e^(r_1 t) + C_2 e^(r_2 t) $

  这种情况下，随着时间的推移，振子的运动是单调衰减的，最终静止在平衡位置。

  #figure(image("images/工科物理/经典力学/mass-spring-4.png"),
    caption: [
      过阻尼振动位移-时间图像
    ]
  )

  我们称像这样的振动为过阻尼振动。

+ 当 $frac(beta^2, 4 m^2) - k / m = 0$ 时，根为实数且相等，设其为
  $r_1 = r_2 = r$，那么有方程的通解为

  $ x \( t \) = \( C_1 + C_2 t \) e^(r t) $

  这种情况下，随着时间的推移，振子的运动也是单调衰减的，最终静止在平衡位置。

  #figure(image("images/工科物理/经典力学/mass-spring-5.png"),
    caption: [
      临界阻尼振动位移-时间图像
    ]
  )

  我们称像这样的振动为临界阻尼振动。

+ 当 $frac(beta^2, 4 m^2) - k / m < 0$ 时，根为复数，设其为
  $r = alpha + i beta$，那么有方程的通解为

  $ x \( t \) = e^(alpha t) \( C_1 cos \( beta t \) + C_2 sin \( beta t \) \) $

  这种情况下，随着时间的推移，振子的运动是周期性的，且振幅逐渐减小。

  #figure(image("images/工科物理/经典力学/mass-spring-6.png"),
    caption: [
      欠阻尼振动位移-时间图像
    ]
  )

  我们称像这样的振动为欠阻尼振动。

令 $ gamma = frac(beta, 2 m) $
称上面的 $gamma$ 为阻尼因子。

回顾阻尼振动动力学方程的特征方程解

$ r = frac(- beta / m plus.minus sqrt((beta / m)^2 - 4 k / m), 2) $

带入 $gamma$，和固有角频率 $omega = sqrt(k / m)$ 我们可以得到

$ r = - gamma plus.minus sqrt(gamma^2 - omega^2) $

所以，上方的三种阻尼振动情况用 $gamma$ 和 $omega$ 来表示，就分别为

+ 过阻尼振动：$gamma > omega$

  微分方程通解化为

  $ x \( t \) = e^(- gamma t) [C_1 e^(sqrt(gamma^2 - omega^2) dot.op t) + C_2 e^(- sqrt(gamma^2 - omega^2) dot.op t)] $

  引入阻尼比 $zeta = gamma / omega > 1$，可以重写为

  $ x \( t \) = e^(- gamma t) [C_1 e^(omega sqrt(zeta^2 - 1) dot.op t) + C_2 e^(- omega sqrt(zeta^2 - 1) dot.op t)] $

+ 临界阻尼振动：$gamma = omega$

  微分方程通解化为

  $ x \( t \) = e^(- gamma t) [C_1 + C_2 t] $

+ 欠阻尼振动：$gamma < omega$

  微分方程通解化为

  $ x \( t \) = e^(- gamma t) [C_1 cos \( omega sqrt(1 - zeta^2) dot.op t \) + C_2 sin \( omega sqrt(1 - zeta^2) dot.op t \)] $

  引入阻尼比 $zeta = gamma / omega < 1$，可以重写为

  $ x \( t \) = e^(- gamma t) [C_1 cos \( omega sqrt(1 - zeta^2) dot.op t \) + C_2 sin \( omega sqrt(1 - zeta^2) dot.op t \)] $

对于一个固定的固定的弹簧振子，其固有角频率 $omega$
是一个常数，所以我们可以通过调节阻力系数 $beta$ 来改变阻尼因子
$gamma$，从而改变振子的阻尼运动状态。

#figure(image("images/工科物理/经典力学/mass-spring-7.png", width: 80%),
  caption: [
    改变阻尼因子
  ]
)

虽然不是很好通过数学公式直接看出来，但是根据仿真绘图，我们可以知道，对于同一个弹簧振子而言，阻尼比越接近于
$1$，振子的运动衰减越快，我们接下来说明这点的数学原理。

先从过阻尼开始分析，设弹簧振子在远离原点的位置静止释放，则应用该初始条件得

$ C_1 + C_2 = x_0 $

$ C_1(gamma - omega sqrt(zeta^2-1)) - C_2(gamma + omega sqrt(zeta^2-1)) = 0 $

由此求出 $C_1, C_2$ 的值

$ C_1 = x_0 / 2 (1 + gamma / (omega sqrt(zeta^2-1))) $

$ C_2 = x_0 / 2 (1 - gamma / (omega sqrt(zeta^2-1))) $

代入原方程 $ x(t) = e^{- gamma t} [C_1 e^{omega sqrt(zeta^2 - 1) t} + C_2 e^{- omega sqrt(zeta^2 - 1) t}] $

$ y = x_0 / 2 ((1 + zeta / sqrt(zeta^2-1)) e^{omega (sqrt(zeta^2 - 1) - zeta) t} + (1 - zeta / sqrt(zeta^2-1)) e^{omega (- sqrt(zeta^2 - 1) - zeta) t}) $

关于该方程，对 $t$ 求导，得到

$ d y / d t = omega x_0 / 2 (sqrt(zeta^2 - 1) - zeta^2 / sqrt(zeta^2 - 1)) (e^{omega (sqrt(zeta^2 - 1) - zeta) t} - e^{omega (- sqrt(zeta^2 - 1) - zeta) t}) $

这个导数越小（意思是为负值且绝对值越大）代表运动衰减越快，观察表达式，对于 $e^{omega (sqrt(zeta^2 - 1) - zeta) t} - e^{omega (- sqrt(zeta^2 - 1) - zeta) t}$，我们发现 $zeta$ 越趋近于 $1$，该表达式的值越小；对于 $sqrt(zeta^2 - 1) - zeta^2 / sqrt(zeta^2 - 1)$，我们也发现 $zeta$ 越趋近于 $1$，该表达式的值也会减小。

所以，对于过阻尼情况，我们可以知道，阻尼因子越接近于 $1$，振子的运动衰减越快。而临界阻尼，即 $zeta = 1$，是衰减最快的情况。

对欠阻尼的分析就更为简单一些，我们观察上图，发现 $e^(alpha t)$ 是其三角函数振幅的变化函数，随着 $zeta$ 越接近于 $1$，这个振幅衰减越快，规律仍然成立。

阻尼比在机械设计中是一个非常重要的参数，有的时候我们希望弹簧振子快速衰减到平衡位置，有些时候我们希望弹簧振子慢慢衰减到平衡位置，有时候我们希望弹簧振子保持轻微振荡，这时我们会采用不同的设计。

例如汽车悬挂系统，会设计成轻微的欠阻尼状态，允许机械结构有一定的弹跳；精密天平的支架则采用临界阻尼设计，令指针以最快速度稳定于平衡位置；而过阻尼，出于其稳定性和慢响应，被用于门禁的机械设计中。

==== 受迫振动
受迫振动是弹簧振子在受到外力作用下的运动状态

#figure(image("images/工科物理/经典力学/mass-spring-8.png", width: 70%),
  caption: [
    受迫振动
  ]
)

我们假设有一个外力 $F \( t \) = F_0 cos \( omega_F t \)$
作用在弹簧振子上，那么有以下关系成立。

$ m frac(d^2 x, d t^2) = - k x - beta frac(d x, d t) + F_0 cos \( omega_F t \) $

这是一个二阶线性非齐次常微分方程，它的齐次部分的通解我们已经求过了，即为上面的三个情况对应的运动方程。

所以，这个运动的方程通解为

$ x \( t \) = x_h \( t \) + x_p \( t \) $

其中 $x_h \( t \)$
是齐次部分的通解（参考阻尼振动得出的方程），$x_p \( t \)$
是该方程的特解。


接下来，我方使用惊人的注意力，假设特解的形式为

$ x_p \( t \) = C e^(i omega_F t) $

那么，不妨将其带回原微分方程，由
$x_(p') \( t \) = i w_F C e^(i w_F t)$，$x_(p'') \( t \) = - w_F^2 C e^(i w_F t)$，带入后得到

$ C e^(i omega_F t) (- m w_F^2 + k + beta i w_F) = F_0 cos \( omega_F t \) $

为了凑齐
$e^(i omega_F t)$，我们可以将右侧的余弦函数表示为复指数形式，得到
$ F_0 cos \( omega_F t \) = F_0 / 2 (e^(i omega_F t) + e^(- i omega_F t)) $

于是，我们可以求出常数 $C$ 的值，应当为

$ C = frac(F_0, - m omega_F^2 + k + beta i omega_F) $

常数 $C$ 内有虚部，不妨将其化为相量形式

$ C = A e^(i theta) $

于是我们可以知道，特解的形式为

$ x_p \( t \) = A e^(i \( omega_F t + theta \)) $

所以受迫振动的通解为

$ x \( t \) = x_h \( t \) + A e^(i \( omega_F t + theta \)) $

其中 $x_h \( t \)$ 是该方程对应齐次部分
$m frac(d^2 x, d t^2) = - k x - beta frac(d x, d t)$
的通解（参考阻尼振动得出的方程）。


分析振幅
$A = \| F_0 / sqrt(\( - m omega_F^2 + k \)^2 + \( beta omega_F \)^2) \|$
的表达式，将分母下方整理为二次函数，有

$ A = \| F_0 / sqrt(m^2 omega_F^4 + \( beta^2 - 2 k m \) omega_F^2 + k^2) \| $

振幅取得极大值时该二次函数取得最小值，即 $w_F$ 的值位于其对称轴处，为

$ omega_F^2 = - frac(b, 2 a) = k / m - frac(beta^2, 2 m^2) $

设 $k / m = omega_0^2$，为其无阻尼固有频率时，原表达式化为

$ omega_F^2 = omega_0^2 - 2 gamma^2 $

这个频率很有趣，它揭示了下面的一些规律，在弹簧振子受外力大小 $F_0$
不变时

+ 如果弹簧振子无阻尼，则当 $omega_F = omega_o$
  时，外力施加的振动幅度达到最大。

+ 如果弹簧振子有阻尼且 $zeta < sqrt(2) / 2$，则当外力施加的频率接近
  $omega_F = omega_0^2 - 2 gamma^2$，外力施加的振动幅度达到最大，随着时间逐渐推移，最终振子的稳态状态将会是以该频率进行的简谐振动。

+ 如果弹簧振子有阻尼且
  $zeta gt.eq sqrt(2) / 2$，则振动幅度随着外力频率的增加逐渐变小，随着时间逐渐推移，最终振子的稳态状态将会是以该频率进行的简谐振动。

#quote(block: true)[
读者还可以自行分析外力相位角变化时的受迫振动规律，在有阻尼的运动中，运动的最终稳态状态的振幅是不受相位角变化的影响的。
]

==== 共振
在上文的前两种情况中，当外力频率接近于 $omega_F = omega_0^2 - 2 gamma^2$
时，外力施加的振动幅度达到最大，这就是共振现象。

塔科马海峡吊桥坍塌（大风的振动频率接近桥的固有频率），人声震碎玻璃杯，等等现象都是共振的案例。在实际工程设计中，设计师会利用或避免共振，以达到设计目的。


=== 拍波
当两个频率非常接近的正弦波叠加时，会产生拍波现象。

给定两个非常接近的正弦信号 $ y_1 = A sin \( 2 pi f_1 t \) $

$ y_2 = A sin \( 2 pi f_2 t \) $

其中$f_1$和$f_2$非常接近

两波叠加后有

$ y = y_1 + y_2 = A sin \( 2 pi f_1 t \) + A sin \( 2 pi f_2 t \) $

即为
$ y = 2 A cos \[ 2 pi \( frac(f_1 - f_2, 2) \) t \] sin \[ 2 pi \( frac(f_1 + f_2, 2) \) t \] $

这表示一个频率为 $frac(f_1 + f_2, 2)$ 的正弦波，其振幅随时间以频率
$frac(f_1 - f_2, 2)$缓慢变化。

==== 拍频
拍频定义为$f_(b e a t) = \| f_1 - f_2 \|$，换算为周期即上方所示正弦波的半个周期，即两个极值出现的时间差。

== 电磁学

=== 麦克斯韦方程组简述
麦克斯韦方程组是描述电磁场的基本方程组，概括了电场和磁场的相互作用规律。真空中的麦克斯韦方程组如下所示

$ nabla dot.op upright(bold(E)) = rho / epsilon_0 $

$ nabla dot.op upright(bold(B)) = 0 $

$ nabla times upright(bold(E)) = - frac(partial upright(bold(B)), partial t) $

$ nabla times upright(bold(B)) = mu_0 upright(bold(J)) + mu_0 epsilon_0 frac(partial upright(bold(E)), partial t) $

==== 高斯定律
$ nabla dot.op upright(bold(E)) = rho / epsilon_0 $

其中，$upright(bold(E))$ 是电场强度，$rho$ 是电荷密度，$epsilon_0$
是传导介质的介电常数。

这个公式告诉我们电场的强度和电荷的分布有关，且电荷密度越大，电场强度越大。


我们可以举一个简单的例子，比如说，对于空间中的一个点电荷
$q$，分析它在空间中产生的电场强度

考虑一个以点电荷为中心的球面，半径为
$r$，我们接下来计算这个点电荷在球面上贡献的电场强度。

#figure(image("images/工科物理/电磁学/麦克斯韦方程组-1.png", width: 70%),
  caption: [
    电场强度
  ]
)

$ nabla dot.op upright(bold(E)) = rho / epsilon_0 = frac(q, 4 / 3 pi r^3 epsilon_0) $

采用高斯公式，将散度转换为面积分

$ integral.double_S upright(bold(E)) dot.op d upright(bold(S)) = integral_V nabla dot.op upright(bold(E)) d V = integral_V frac(q, 4 / 3 pi r^3 epsilon_0) d V = q / epsilon_0 $

出于我们知道电荷在球面上的电场贡献是均匀的，而 $S = 4 pi r^2$，所以有

$ upright(bold(E)) = frac(q, 4 pi r^2 epsilon_0) $

不妨令 $k = frac(1, 4 pi epsilon_0)$，那么

$ upright(bold(E)) = k q / r^2 $

这便是中学物理中常见的点电荷产生的电场强度公式。

==== 高斯磁定律
$ nabla dot.op upright(bold(B)) = 0 $

这个公式告诉我们磁场是无源场。

我们知道电荷有正负之分，一个单独的电荷可以是正电荷、也可以是负的。而磁体却没有类似的性质。我们无法找到单独的
N 极磁体或 S 极磁体。即对于#strong[任何];磁体而言，它都同时具有 N 极和 S
极。

这就是为什么高斯磁定律表征磁场的散度为零，因为选定任何一个区域，其磁体一定会同时有
N 极和 S
极，其强度相互抵消，磁场线流入和流出该区域的强度是相等的，故其散度为零。


现实生活中，我们会使用磁铁，磁铁具有产生磁场的能力，是因为其内部原子电子的轨道运动产生的

构成物质的原子中，电子的轨道运动会产生磁场。根据泡利不相容原理，大部分电子成对运动，它们产生的磁场相互抵消，所以很多物体是不显磁性的。

而对于Fe、Co、Ni这类原子来讲，由于这些金属元素的原子中有未成对的电子，这些单个电子运动产生的磁矩不会相互抵消，致使其累计成的整体就得以产生总的磁场。

所以，对于一个磁铁而言，它的 N 极和 S 极是由其内部原子中电子的轨道运动产生的，即便只分割其中一极的一部分分析，其内部的原子仍然同时具有 N 极和 S 极，其磁场散度仍然为 0 。#footnote[注：实际上，磁铁带磁的原理比文中提到的还要复杂得多，除了文中提到的原子产生磁矩是带磁的重要因素以外，磁铁中原子产生的磁矩还要方向一致才能在整体上产生磁场，所以很多其它有未成对电子的原子之所以没能表现出磁性，是和它们结合成的晶体结构使其磁矩方向难以一致有关。]

==== 法拉第电磁感应定律
$ nabla times upright(bold(E)) = - frac(partial upright(bold(B)), partial t) $

这个公式告诉我们，变化的磁场会在周围空间中产生电场，电场的旋度和磁场的变化率成正比。


#figure(image("images/工科物理/电磁学/麦克斯韦方程组-3.png", width: 50%),
  caption: [
    感生电动势
  ]
)

举个例子，高中时期我们学习过感生电动势的概念，在闭合回路中，穿过其中磁通量的变化会在回路中产生电动势，这便是法拉第电磁感应定律的一种体现。

我们将该式两边对一面区域积分

$ integral.cont_(partial S) upright(bold(E)) dot.op d upright(bold(l)) = - frac(d, d t) integral.double_S upright(bold(B)) dot.op d upright(bold(S)) $

运用斯托克斯公式，将左边的面积分换为线积分，所以有沿闭合回路的电动势等于穿过该回路的磁通量的变化率

$ E = - frac(d, d t) Phi_B $

这便是我们在高中时期学习过的法拉第电磁感应定律，$Phi_B$
是穿过回路的磁通量，$E$ 是回路中的电动势。

==== 安培-麦克斯韦定律
$ nabla times upright(bold(B)) = mu_0 upright(bold(J)) + mu_0 epsilon_0 frac(partial upright(bold(E)), partial t) $

其中 $upright(bold(J)) = frac(sum upright(bold(I)), upright(bold(S)))$
是电流密度，为通过选定面积的电流总和除以面积；$mu_0$
是真空的磁导率；$epsilon_0$ 是真空的介电常数。

这个公式告诉我们，电流和变化的电场会在周围空间中产生磁场，磁场的旋度和电流密度以及电场的变化率成正比。


同样也举个例子，对于一段电流稳定的长直导线，电流会在周围的空间产生磁场

#figure(image("images/工科物理/电磁学/麦克斯韦方程组-4.png", width: 50%),
  caption: [
    长直导线
  ]
)

我们可以量化计算它产生的磁场，取以导线方向为中轴线，垂直于导线的圆形截面。

对原公式两边积分，有

$ integral.double_S upright(bold(B)) dot.op d upright(bold(l)) = mu_0 integral.double_S upright(bold(J)) dot.op d upright(bold(S)) + mu_0 epsilon_0 frac(d, d t) integral.double_S upright(bold(E)) dot.op d upright(bold(S)) $

将左边的式子用斯托克斯公式转换为圆形截面边界上的环量，即

$ integral.cont_(partial S) upright(bold(B)) dot.op d upright(bold(l)) = mu_0 integral.double_S upright(bold(J)) dot.op d upright(bold(S)) + mu_0 epsilon_0 frac(d, d t) integral.double_S upright(bold(E)) dot.op d upright(bold(S)) $

出于电流稳定，所以 $frac(d upright(bold(E)), d t) = 0$，有

$ integral.cont_(partial S) upright(bold(B)) dot.op d upright(bold(l)) = mu_0 I $

圆的周长为 $2 pi r$，所以圆环上某点的磁场强度为

$ upright(bold(B)) = frac(mu_0 I, 2 pi r) $


再分析一个典型，对于一个电流稳定的 N 匝螺线圈，分析其产生的磁场

#figure(image("images/工科物理/电磁学/麦克斯韦方程组-5.png", width: 50%),
  caption: [
    螺线圈
  ]
)

取一段矩形截面，其下边界为 N
匝螺线圈的中轴线，上边界在线圈外，左右边界垂直于导线方向。

对原公式两边积分，有

$ integral.cont_(partial S) upright(bold(B)) dot.op d upright(bold(l)) = mu_0 N I $

假设线圈是#strong[无限长];的，那么长方形的左右边界相对于上下边界就可以忽视，考虑每两匝线圈之间的间隔是
$d$，那么矩形的周长就应当为

$ C = 2 N d $

同时，对无限长螺线管而言，其外部磁场接近于 0（此处不做详细推导），所以
$upright(bold(B))$ 的有效积分区域只在线圈内部。

所以有 $L = C / 2 = N d$，代入原方程

$ upright(bold(B)) = frac(mu_0 I, d) $

这就是理想螺线管的磁场强度公式，令密绕密度 $n = 1 / d$ 得到

$ upright(bold(B)) = mu_0 n I $

这便是该公式的更常见形式。

麦克斯韦方程组展示了电场和磁场的基本关系，是经典电磁学的基石

$
  cases(
    nabla dot.op upright(bold(E)) = rho / epsilon_0,
    nabla dot.op upright(bold(B)) = 0,
    nabla times upright(bold(E)) = - frac(partial upright(bold(B)), partial t),
    nabla times upright(bold(B)) = mu_0 upright(bold(J)) + mu_0 epsilon_0 frac(partial upright(bold(E)), partial t),
  )
$

上述方程是基于真空的分析环境讨论的，若分析的环境中存在电/磁介质，那么方程中的 $epsilon_0$ 和 $mu_0$ 就需要替换为介质的介电常数和磁导率。

同时，电介质和磁介质在电/磁场中可能会发生极化和磁化现象，这些现象本身也会影响电/磁场的分布和强度，所以在分析电/磁介质中的电/磁场时，还需要考虑这些现象的影响。之后将会讨论如何使用方程分析在发生极化和磁化现象的介质中的电/磁场。

=== 静电场

电场指的是存在于点和周围，能对其它电荷产生作用的物理场。而电荷是电场的源头，电荷的分布决定了电场的分布和强度。

静电场指的是由静止的、电荷量不随着时间变化的电荷产生的电场。

==== 电场强度

高中时候的物理知识告诉我们真空中的点电荷间存在库仑力，其表达式为

$
  arrow(F) = k dot (q_1 q_2) / r^2 dot arrow(r) / r
$

其中 $k = 1/(4 pi epsilon_0)$，$epsilon_0$ 是真空介电常数，$q_1$ 和 $q_2$ 是两个点电荷的电量，$r$ 是两点电荷之间的距离，$arrow(r)$ 是从 $q_1$ 指向 $q_2$ 的位置矢量。

库仑力可以叠加，多个电荷对同一个电荷的库仑力是各个电荷对该电荷的库仑力的矢量和。

$
  arrow(F) = sum_(i=1)^(n) arrow(F_i) = k dot q_0 sum_(i=1)^(n) (q_i / r_i^2 dot arrow(r_i) / r_i)
$

根据该式，我们根据比值定义法，定义空间中某一点的电场强度 $arrow(E)$ 为该点处电荷所受库仑力总和与该点处电荷量的比值

$
  arrow(E) = arrow(F) / q_0
$

这便是电场强度的定义。

据此可以推断，点电荷 $q$ 产生的电场强度为

$
  arrow(E) = k dot (q / r^2) dot arrow(r) / r
$

电场强度是一个矢量，表征该点处电荷所受电场影响的强度和方向，同样地，电场强度也满足矢量的叠加原理，所以一个点的电场强度是该点周围所有电荷产生的电场强度的矢量和。

$
  arrow(E) = k sum_(i=1)^(n) (q_i / r_i^2 dot arrow(r_i) / r_i)
$

对于一个连续的带电体 $V$ ，其电荷分布可以看作是无数个微小电荷元 $d q$ 的叠加，这些电荷元对空间中某一点 $P$ 产生的电场强度为

$
  arrow(E) = integral_V k dot (d q) / r^2 dot arrow(r) / r
$

==== 电位

电位是电场的一个标量特征，定义为单位正电荷在该点处的电势能。

有以下关键公式描述电位和电场强度之间的关系
$
  arrow(E) = - nabla V
$
即电场强度等于电位的负梯度。

==== 电场的高斯定理

现在介绍高斯定理，高斯定理是电场与电荷分布之间的重要关系，对于一个空间区域，有以下表达式成立。

$
  overbracket(nabla E, "区域内电场的平均散度") = overbracket((quad rho quad) / epsilon_0, "该点处的电荷密度与真空介电常数的比值")
$

其中 $rho$ 是该区域的电荷密度，$epsilon_0$ 是真空介电常数。

根据散度定理，可以将上式积分，得到

$
  integral_V (nabla dot arrow(E)) d V = integral_S arrow(E) dot arrow(d S) = integral_V (rho / epsilon_0) d V
$

这也就意味着，在真空中取一闭合曲面，曲面上向外的电通量等于该闭合曲面内的总电荷量与真空介电常数的比值。

运用高斯定理，我们可以求某些已知具有一定对称性的电荷分布所产生的电场强度，例如对于空间中的无限长细直导线，其线电荷密度为 $lambda$，那么在距离导线 $r$ 处的电场强度大小为

$
  E = lambda / (2 pi epsilon_0 r)
$

这是因为若我们取以导线为轴、半径为 $r$ 的圆柱面作为高斯面，那么该区域内的平均电场散度为

$
  nabla dot arrow(E) = rho / epsilon_0 = lambda / (epsilon_0 dot 2 pi r h)
$

而该高斯面上的电通量为

$
  integral_S arrow(E) dot arrow(d S) = E dot (2 pi r h)
$

由此便可解出 $E$ 的表达式

$
  E = lambda / (2 pi epsilon_0 r)
$

=== 恒定电流

==== 电流定义与电流密度

通过某一截面的电流强度定义为
$
  I = (d q)/(d t)
$

根据这个定义定义电流密度 $j$ 为
$
  arrow(j) = lim_(S -> 0) (d arrow(I))/(d S)
$

其中 $arrow(I)$ 是电流矢量，长度为电流强度，方向为电流方向；而 $d S$ 是面积元的面积，方向为面积元的法线方向。这样也有关系式
$
  I = integral.double_S arrow(j) dot d arrow(S)
$

==== 电流连续性方程

#theorem("电流的连续性方程")[
  $
    -(d q)/(d t) = integral.double_S arrow(j) dot d arrow(S)
  $
  令外法线方向为正方向，$q$ 为曲面内电荷量。则上式表示流出某闭合曲面的电流强度等于该闭合曲面所包围的电荷减少的速率。

  也可以把其改写为微分形式，即一个区域内电荷密度的变化率等于该区域内电流密度的散度的负值，即
  $
    -(d q)/(d t) = integral.triple_V (nabla dot arrow(j)) d V quad -> quad (d rho)/(d t) = - nabla dot arrow(j)
  $ <电流的连续性方程>
]

据此，可以定义恒定电流与恒定电场。
#definition("恒定电流与恒定电场")[
  若电流强度 $I$ 与电流密度 $arrow(j)$ 在空间各点均不随时间变化，则称该电流为恒定电流；若电场强度 $arrow(E)$ 在空间各点均不随时间变化，则称该电场为恒定电场。

  当电流为恒定电流时，电流的连续性方程化为
  $
    integral.double_S arrow(j) dot d arrow(S) = 0
  $
]

=== 恒定磁场

==== 磁感应强度的定义

#definition("磁感应强度的定义")[
  磁场中各点处运动电荷不受磁力作用的特征方向即为相应点磁感应强度的方向，定义运动电荷在磁场中某点所受最大磁力与电荷量与速度的比值为该点磁感应强度的大小。
  $
    B = F_max/(q v)
  $
]

磁现象起源于电荷的运动，这是磁场与电场的本质联系。

==== 毕奥-萨伐尔定律

#theorem("毕奥-萨伐尔定律")[
  载流导体中的电流是大量带电粒子的定向运动所形成的，所以电流激发的磁场，实质上就是运动电荷在其周围空间激发的磁场，这个磁场的强度可以用毕奥-萨伐尔定律来计算
  $
    d arrow(B) = (mu_0)/(4 pi) (arrow(I) times arrow(r))/(r^3) d l
  $
  其中 $d arrow(B)$ 是由电流元 $arrow(I) d l$ 在场点 $P$ 处产生的磁感应强度，$arrow(r)$ 是从电流元指向场点 $P$ 的位置矢量，$r$ 是 $arrow(r)$ 的模，$mu_0$ 是真空磁导率。
]

磁场可以线性叠加，所以对于一个已知的电流分布，可以通过积分求出它在场点 $P$ 处产生的磁感应强度：例如对于一根导线而言有
$
  arrow(B) = (mu_0)/(4 pi) integral_L (arrow(I) times arrow(r))/(r^3) d l
$

==== 磁通量与磁场的高斯定理

磁通量被定义为通过某一面积的磁力线的总数，数学上定义为
$
  Phi_B = integral_S upright(bold(B)) dot.op d upright(s)
$

其单位为韦伯（Wb）。

#theorem("磁场的高斯定理")[
  $
    integral.double_S arrow(B) dot d arrow(S) = 0
  $
  对任意闭合曲面 $S$，通过该闭合曲面的磁通量总是零。这表明磁场是无源场，这是因为不存在磁单极子，即便是最小的磁极也总是以偶极子的形式存在，既有北极又有南极。这和电场不同，后者是有源场。
]

这说明了磁场是无源场，没有磁单极子存在，磁力线总是闭合的。

==== 安培环路定律

麦克斯韦方程组告诉我们磁场的旋度和电流密度以及电场变化率之间的关系
$
  nabla times arrow(B) = mu_0 arrow(j) + mu_0 epsilon_0 (d arrow(E))/(d t)
$

如果电场是静电场，则上式化为
$
  nabla times arrow(B) = mu_0 arrow(j)
$

对两边积分，有
$
  integral_L arrow(B) dot d arrow(l) = mu_0 I
$

#theorem("安培环路定律")[
  $
    integral_L arrow(B) dot d arrow(l) = mu_0 I
  $
  对任意闭合回路 $L$，沿该闭合回路的磁感应强度的环路积分等于该闭合回路所围面积内的总电流乘以真空磁导率。此处令法线方向与积分路径的方向遵循右手定则。
]

安培环路定律也适用于求具有对称性的恒定电流所产生的磁场。

=== 磁场的作用

==== 洛伦兹力

先前讨论的磁感应强度的定义表明，磁场对运动电荷有作用力，这个力称为洛伦兹力。
#theorem("洛伦兹力公式")[
  $
    arrow(F) = q dot (arrow(v) times arrow(B))
  $
  运动电荷在磁场中所受的洛伦兹力等于电荷量与速度矢量和磁感应强度矢量的叉积的乘积。洛伦兹力是符合左手定则的，左手成掌，四指并拢，大拇指垂直四指张开，当磁场从掌面进入时，四指指向速度方向，则大拇指所指方向即为洛伦兹力的方向。
]

==== 霍尔效应

出于洛伦兹力的作用，带电粒子在磁场中运动时会发生偏转，这种偏转会导致带电粒子在垂直于运动方向和磁场方向的方向上积累电荷，从而形成电势差，这种现象称为霍尔效应。

霍尔电压的计算表达式为
#theorem("霍尔电压公式")[
  $
    U_H = 1/(n q) (B I)/(d)
  $
  其中 $U_H$ 是霍尔电压，$B$ 是磁感应强度，$I$ 是通过导体的电流，$n$ 是导体中载流子的浓度，$q$ 是载流子的电荷量，$d$ 是导体的厚度（在电压产生方向上）。
]

==== 安培力

带电导体在磁场中受到的力称为安培力，这是洛伦兹力在宏观导体层面的表现。
#theorem("安培力公式")[
  $
    arrow(F) = arrow(I) times arrow(B) l
  $
  载流导体在磁场中所受的安培力等于电流矢量与磁感应强度矢量的叉积乘以导体长度 $l$。安培力的方向也符合左手定则，左手成掌，四指并拢，大拇指垂直四指张开，当磁场从掌面进入时，四指指向电流方向，则大拇指所指方向即为安培力的方向。
]

对于一般的载流导体，安培力的表达式为
$
  upright(bold(F)) = upright(I) integral_L d upright(l) times upright(bold(B))
$

其中 $d upright(l)$ 是线元，它的方向与电流方向相同，长度和线元的实际长度相等。

可以由此得到推论，在*匀强磁场*中，闭合导线框受到的安培力为 $0$，这是因为
$
  upright(bold(F)) = upright(I) integral_L d upright(l) times upright(bold(B)) = upright(I) (integral_L d upright(l)) times upright(bold(B)) = upright(0)
$

==== 磁力矩

安培力是实现电动机工作的基本原理。接下来介绍对于线圈而言的磁矩概念。

力矩定义为 $arrow(M) = arrow(r) times arrow(F)$，其中 $arrow(r)$ 是力的作用点到参考点的位矢，而 $arrow(F)$ 指代力矢量。力矩和角动量的关系为 $d arrow(L)/(d t) = arrow(M)$，而角动量又可以描述物体的旋转状态。

由安培力对线圈产生的力矩称为磁力矩，套用公式，对于一个闭合回路 $L$ 而言，有对于回路的磁力矩为
$
  arrow(M) = integral_L arrow(r) times (arrow(I) times arrow(B)) d l
$

这便是通用的磁力矩公式。

// 矩形平面线圈？
// 磁力做功的公式？

=== 电磁感应

==== 法拉第电磁感应定律

#theorem("法拉第电磁感应定律")[
  变化的磁场会在周围空间产生电场，这个现象称为电磁感应。法拉第电磁感应定律描述了这种现象的规律
  $
    nabla times arrow(E) = - (d arrow(B))/(d t)
  $
]

根据斯托克斯定理，可以将上式积分形式表示为
$
  integral_L arrow(E) dot d arrow(l) = - (d)/(d t) integral_S arrow(B) dot d arrow(S) = - (d Phi)/(d t)
$

通过闭合回路的磁通量的变化会引起回路中的感生电动势，这便是法拉第电磁感应定律的内容。至于产生电动势的方向，可以用楞次定律来描述：感生电流的方向总是试图阻碍引起它的磁通量变化。

另外，感生电场是一种无源场，因为其不是源自电荷产生的。其旋度不为零，但散度为零，这和静电场不同，后者是有源场。
$
  integral.double_S arrow(E) dot d arrow(S) = 0
$

==== 动生电动势

#theorem("动生电动势公式")[
  $
    E = integral_L (arrow(v) times arrow(B)) dot d arrow(l)
  $
  导体在磁场中运动时，导体中的自由电荷受到洛伦兹力的作用，从而在导体中产生电动势，这种电动势称为动生电动势。上式描述了沿导体长度方向的动生电动势的计算方法。
]

==== 自感与互感

当电路中的电流发生变化时，电路本身会产生感生电动势，这种现象称为自感。自感现象的本质是电流变化引起的磁通量变化，从而根据法拉第电磁感应定律在电路中产生感生电动势。

这种情况下，线圈中产生的自感电动势为#footnote[注意，此处的方程前有负号，这是楞次定律的体现，感生电动势的方向总是试图阻碍引起它的电流变化。但是通常情况下的电感 VAR 方程是没有负号的，这是在参考方向一致的情况下的表达。两者并不矛盾。]
$
  epsilon = - L (d I)/(d t)
$

其中 $L$ 是线圈的自感系数，描述了线圈产生自感电动势的能力，单位为亨利（H = Wb / A）。自感系数与线圈的几何形状、匝数以及线圈周围介质的磁导率有关。

自感系数可以通过式子计算，因为 $epsilon = -N (d Phi)/(d t)$，所以
$
  L = N (Phi)/(I) = N B / (I S)
$

在电感元件中，出于自感现象，线圈中会产生磁场，这意味着元件可以将电能转化为磁场能量，储存在磁场中。线圈中储存的磁场能量为
$
  W = 1/2 L I^2
$

=== 电 & 磁介质

电介质和磁介质是指在电场和磁场中会发生极化和磁化现象的物质。

==== 极化现象

在外电场作用下，电介质内部的正、负电荷中心会发生微小相对位移，或原有电偶极子发生取向排列，使介质整体表现出电偶极矩，这一现象称为极化。

宏观上，当介质整体的电偶极矩不为零时，这等效为介质中有束缚电荷，这是因为电偶极矩的存在导致介质内部的电荷分布不再完全对称，正负电荷中心不重合。束缚电荷的大小可以被表示为
$
  rho_"bound" = - nabla dot arrow(P)
$

其中 $arrow(P)$ 是极化强度，定义为单位体积内的电偶极矩总和。
$
  arrow(P) = sum arrow(p) / V, quad arrow(p) = q dot arrow(d)
$
$q$ 指代电偶极子中正负电荷的电量，$arrow(d)$ 是从负电荷指向正电荷的位矢。#footnote[该公式的推导此处不做讨论。]

==== 磁化现象

在外磁场的作用下，某些不具备永久磁性的物质会表现出磁性，这种现象称为磁化。磁化现象的本质是物质内部原子或分子的微观磁矩#footnote[原子的简单模型表明电子围绕原子核旋转，相当于一个小电流环，该电流环具有磁矩。]在外磁场作用下发生取向排列，从而在宏观上表现出磁性。

宏观上，定义磁化后的物质单位体积内的磁矩总和为磁化强度 $arrow(M)$
$
  arrow(M) = sum arrow(m) / V
$

依据一些推导#footnote[同样地，此处的推导也不做讨论。]，可以得出磁化物质中存在等效的束缚电流，其电流密度为
$
  arrow(j)_"bound" = nabla times arrow(M)
$

==== 介质中的麦克斯韦方程组

$
  cases(
    nabla dot.op upright(bold(E)) = rho / epsilon_0,
    nabla dot.op upright(bold(B)) = 0,
    nabla times upright(bold(E)) = - frac(partial upright(bold(B)), partial t),
    nabla times upright(bold(B)) = mu_0 upright(bold(J)) + mu_0 epsilon_0 frac(partial upright(bold(E)), partial t),
  )
$

所以，当介质被极化/磁化时，介质内部会存在束缚电荷/束缚电流，分别对上式中的 $rho$ 和 $J$ 产生贡献。故此处的 $rho$ 和 $J$ 应当是自由电荷/电流与束缚电荷/电流的总和。

所以，上式中的 $rho$ 和 $J$ 可以被分解为
$
  rho = rho_V + rho_P, quad J = J_c + J_m
$

在实际的工程中，自由/束缚电荷/电流的贡献通常是分开计算的，所以在分析介质中的电/磁场时，麦克斯韦方程组通常被改写为以下形式
$
  cases(
    nabla dot.op upright(bold(E)) = rho_V / epsilon_0 - nabla dot arrow(P) / epsilon_0,
    nabla dot.op upright(bold(B)) = 0,
    nabla times upright(bold(E)) = - frac(partial upright(bold(B)), partial t),
    nabla times upright(bold(B)) = mu_0 J_c + mu_0 epsilon_0 frac(partial upright(bold(E)), partial t) + mu_0 nabla times arrow(M),
  )
$

如果规定 $H = (1/mu_0) B - M, D = epsilon_0 E + P$，分别表征磁场强度和电位移强度，那么上述方程组又可以写作
$
  cases(
    nabla dot.op upright(bold(D)) = rho_V,
    nabla dot.op upright(bold(B)) = 0,
    nabla times upright(bold(E)) = - frac(partial upright(bold(B)), partial t),
    nabla times upright(bold(H)) = J_c + frac(partial upright(bold(D)), partial t),
  )
$

如果我们研究的对象是线性均匀，各向同性媒质，那么上式还可以进一步简化，由于对于此类性质的介质而言，有
$
  P = epsilon_0 chi_e E, quad M = chi_m H
$
其中 $chi_e$ 是电介质的电极化率，$chi_m$ 是磁介质的磁化率，那么关于 $H$ 与 $D$ 的关系可以表示为

$
  H = frac(1, mu_0 (1 + chi_m)) B \
  D = epsilon_0 (1 + chi_e) E
$

进一步定义，令材料的绝对介电常数 $epsilon = epsilon_0 (1 + chi_e)$，绝对磁导率 $mu = mu_0 (1 + chi_m)$，则上述方程组可以写作
$
  D = epsilon E, quad B = mu H
$

同时，对于一段导体而言，若其中存在电流，那么设在 $tau$ 时间内电子获得的动量为 $m v_d$，那么应当有#footnote[注意，虽然按照公式来看，电子的动量和时间成正比，但实际上电子的动量并不会无限增大，因为在导体中，电子会不断地与晶格发生碰撞。所以下式中，假设每次碰撞之间平均间隔时间为 $tau$，每次碰撞后电子的动量都会被重置为 $0$，得到的 $v_d$ 就是电子的平均漂移速度。]
$
  m v_d = e E tau
$
又有电流密度 $j$ 可以被表示为
$
  j = N_e e v_d
$

所以，如果定义载流子迁移率 $mu_e = e tau / m$，那么电流密度与电场强度之间的关系可以表示为
$
  j = N_e e mu_e E
$

所以，导体中的电流密度 $j$ 与电场强度 $E$ 成正比，比例常数为#footnote[系数 $N_e e mu_e$ 也被称作电导率 $sigma$，所以也可以写作 $j = sigma E$] $N_e e mu_e$。

所以，线性均匀各向同性介质中的麦克斯韦方程组可以写作
$
  cases(
    nabla dot.op upright(bold(D)) = rho_V,
    nabla dot.op upright(bold(B)) = 0,
    nabla times upright(bold(E)) = - frac(partial upright(bold(B)), partial t),
    nabla times upright(bold(H)) = J_c + frac(partial upright(bold(D)), partial t),
  ), quad
  cases(
    D = epsilon E,
    B = mu H,
    J_c = sigma E
  )
$

=== 高频效应

==== 趋肤效应

越高频的电流越倾向于集中在导体的表面流动，这种现象称为趋肤效应。因为对于越高频的信号而言，电感的阻抗 $Z = j omega L$ 越大，对于信号的阻滞现象越明显，从而导致电流趋向于在电感较小的路径上流动，即导体的表面。


== 电磁波




== 光学

=== 波动光学
==== 电磁波
由#link("https://frp-arm.com:19964/%E7%89%A9%E7%90%86%E5%B1%82/%E9%BA%A6%E5%85%8B%E6%96%AF%E9%9F%A6%E6%96%B9%E7%A8%8B%E7%BB%84%E7%AE%80%E8%BF%B0/")[麦克斯韦方程];，我们可以知道，空间中变化的电场会产生磁场，又有变化的磁场也会产生电场，电场和磁场交替催生，在空间中不断传递。这就是电磁波------电场和磁场相互作用而产生的波动现象。

电磁波是一种横波，电场的震荡方向、磁场的振荡方向与传播方向三者两两垂直，且遵循右手定则（右手大拇指指向传播方向，四指从电场方向弯曲到磁场方向）。

#figure(image("images/工科物理/光学/波动光学-1.png"),
  caption: [
    电磁波
  ]
)

#quote(block: true)[
其中绿色为电场，红色为磁场，引用自：https:\/\/www.geogebra.org/m/xhYwXSsH
]

电磁波是横波的性质可以用麦克斯韦方程组来证明，在自由空间（无自由电荷与电流，$rho = 0$，$J = 0$）中，假设电磁波为沿
$z$ 轴传播的平面波，电场和磁场可先假定表示为如下的简谐波形式

$ upright(bold(E)) \( z \, t \) = upright(bold(E))_0 e^(i \( k z - omega t + phi.alt_E \)) \, quad upright(bold(B)) \( z \, t \) = upright(bold(B))_0 e^(i \( k z - omega t + phi.alt_B \)) $

#quote(block: true)[
注：最终表征场的强度是复变量的实部，即
$upright("Re") \( upright(bold(E)) \) \, upright("Re") \( upright(bold(B)) \)$
]

将平面波形式代入高斯定律，出于空间中并无自由电荷与电流，电场的散度为
$0$，有

$ nabla dot.op upright(bold(E)) = frac(partial E_z, partial z) = i k E_z = 0 arrow.r.double.long E_z = 0 $

同理

$ nabla dot.op upright(bold(B)) = 0 arrow.r.double.long B_z = 0 $

所以在传播方向 $z$ 上，电场和磁场的分量均为 $0$，电磁波当然是横波。

同时，电场和磁场是正交的，这是因为

$ nabla times upright(bold(E)) = i upright(bold(k)) times upright(bold(E)) = - frac(partial upright(bold(B)), partial t) = - i omega upright(bold(B)) $

#quote(block: true)[
在这一步计算中，我们将电场看作
$upright(bold(E)) \( z \, t \) = upright(bold(E))_0 e^(i \( k z - omega t + phi.alt_E \)) hat(i)$，那么旋量的结果就是
$i k upright(bold(E))_0 e^(i \( k z - omega t + phi.alt_E \)) hat(j)$，令
$upright(bold(k))$ 为朝向 $z$ 轴的单位矢量，那么
$i upright(bold(k)) times upright(bold(E))$ 就是该旋量的结果。
]

化简得

$ upright(bold(k)) times upright(bold(E)) = - omega upright(bold(B)) $

同理，代入安培定律

$ nabla times upright(bold(B)) = i upright(bold(k)) times upright(bold(B)) = mu_0 epsilon.alt_0 frac(partial upright(bold(E)), partial t) = - i omega mu_0 epsilon.alt_0 upright(bold(E)) $

化简得

$ upright(bold(k)) times upright(bold(B)) = - omega mu_0 epsilon.alt_0 upright(bold(E)) $

所以，我们得到对于麦克斯韦方程组中安培-麦克斯韦定律与法拉第电磁感应定律的
$E$ 和 $B$ 的一对解，在这对解中两个量正交，所以电矢量和磁矢量是正交的。

==== 光的电磁波特性
光是一种电磁波，遵循#link("https://frp-arm.com:19964/%E7%89%A9%E7%90%86%E5%B1%82/%E9%BA%A6%E5%85%8B%E6%96%AF%E9%9F%A6%E6%96%B9%E7%A8%8B%E7%BB%84%E7%AE%80%E8%BF%B0/")[麦克斯韦方程组];，上述电磁波的传导方式也是光的传导方式，结论同样适用于光。

人眼中视细胞感光的光学刺激主要由电磁波中的电场引起，所以定义光波的电场
$upright(bold(E))$ 为光矢量，这便是我们描述光波的方式。

==== 光源
能够发出一定波长电磁波的物体称为光源。

生活中我们能见到很多用于照明的光源，它们发出的电磁波的波长范围在 380nm
到 780nm
之间，这个范围的电磁波可以被人眼感知，被称为可见光，像这样的光源被称作可见光源。

诸如白炽灯，LED，甚至是太阳，它们发出的电磁波的光矢量的方向是随机的，也就是它们发出的光在各个方向上都有光震动。

#figure(image("images/工科物理/光学/波动光学-2.png", width: 80%),
  caption: [
    各向同性光源
  ],
)

这样的光源被称为各向同性光源。

还有一些光源，它发出的光仅在特定方向上有较强的光振动，这样的光源被称为各向异性光源。

==== 光的速度
考虑电磁波传播满足的方程

$ {upright(bold(k)) times upright(bold(E)) = - omega upright(bold(B))\
upright(bold(k)) times upright(bold(B)) = - omega mu_0 epsilon.alt_0 upright(bold(E)) $

对一式两边做叉乘

$ upright(bold(k)) times \( upright(bold(k)) times upright(bold(E)) \) = - omega upright(bold(k)) times upright(bold(B)) $

#quote(block: true)[
先介绍向量的叉乘恒等式
$upright(bold(a)) times \( upright(bold(b)) times upright(bold(c)) \) = \( upright(bold(a)) dot.op upright(bold(c)) \) upright(bold(b)) - \( upright(bold(a)) dot.op upright(bold(b)) \) upright(bold(c))$，所以我们可以将
$upright(bold(k)) times \( upright(bold(k)) times upright(bold(E)) \)$
化简为
$\( upright(bold(k)) dot.op upright(bold(E)) \) upright(bold(k)) - \( upright(bold(k)) dot.op upright(bold(k)) \) upright(bold(E)) = k^2 upright(bold(E))$。
]

$ k^2 upright(bold(E)) = - omega upright(bold(k)) times upright(bold(B)) $

代换磁场为电场

$ k^2 upright(bold(E)) = - omega^2 mu_0 epsilon.alt_0 upright(bold(E)) $

而考虑电场的表达式

$ upright(bold(E)) \( z \, t \) = upright(bold(E))_0 e^(i \( k z - omega t + phi.alt_E \)) $

有电场的波速

$ v = omega / k = 1 / sqrt(mu_0 epsilon.alt_0) $

代入真空中的介电常数和真空中的磁导率，有

$ v = 1 / sqrt(4 pi times 10^(- 7) times 8.854 . . . times 10^(- 12)) = 299 \, 792 \, 458 upright(" m/s") $

这就是光在真空中的速度，传统的运动学认为速度的测定必然依赖于一个参考系，而麦克斯韦方程组指出光的速度是一个定值，那么这个速度是依赖于哪个参考系得出的呢？

在爱因斯坦的狭义相对论中有光速不变原理，即在所有惯性参考系中，光在真空中的传播速度恒定，为299,792,458米/秒，且不随光源或观察者的运动状态改变。这个原理是狭义相对论的基础。


在非真空的介质中，光的传播速度应当会减慢，因为介质的介电常数和磁导率都大于真空中的介电常数和磁导率，所以光在介质中的传播速度为

$ v = 1 / sqrt(mu epsilon.alt) = c / sqrt(mu_r epsilon.alt_r) = c / n $

其中 $mu_r \, epsilon.alt_r$
分别为介质的相对磁导率和相对介电常数，是该介质的介电常数和磁导率与真空中的介电常数和磁导率的比值。

定义介质有

$ n = sqrt(mu_r epsilon.alt_r) $

称为其折射率，折射率是一个无量纲的量，表示光在该介质中的传播速度与真空中的传播速度之比。

==== 光的叠加
光的叠加是指两束或多束光波在空间中相遇时，它们的电场和磁场会相互叠加，形成新的电场和磁场分布，从而形成新的光束。

考虑到麦克斯韦方程组是线性方程组，外积和内积都满足对加法的分配律，所以要计算光波的叠加情况，我们可以简单将两束光的电场和磁场叠加起来，得到新的电场和磁场分布。

$ E = sum_(i = 1)^n E_i $

==== 光的强度
===== 能量密度
光的传导伴随着能量的传递，这种能量的主要表现在伴随光波传递的电磁场上。

考虑光波激发出的电场
$upright(bold(E))$，那么不妨将这个电场看作是由一个电容 $C$
产生的，该电容所存储的能量即为电场的能量，有

$ C = frac(epsilon.alt_r S, 4 pi k d) $

考虑到我们在麦克斯韦方程组中#link("https://frp-arm.com:19964/%E7%89%A9%E7%90%86%E5%B1%82/%E9%BA%A6%E5%85%8B%E6%96%AF%E9%9F%A6%E6%96%B9%E7%A8%8B%E7%BB%84%E7%AE%80%E8%BF%B0/#_2")[关于高斯定律的推导];，有

$ k = frac(1, 4 pi epsilon.alt_0) $

代入有电容的表达式

$ C = frac(epsilon.alt S, d) $

考虑电容的储能公式，有

$ W = 1 / 2 C U^2 = 1 / 2 frac(epsilon.alt S, d) \( E d \)^2 $

令体积 $V = S d$，则有

$ W / V = 1 / 2 epsilon.alt E^2 $

我们称 $W / V$ 为光的能量密度，能量密度是一个体积单位内的能量，单位为
$upright("J/m")^3$。

同理，根据电感的计算公式

$ L = mu frac(N^2 S, L) $

也可以计算出磁场的能量密度

$ W / V = frac(1, 2 mu) B^2 $

所以，电磁波的能量密度为

$ u = 1 / 2 epsilon.alt E^2 + frac(1, 2 mu) B^2 $

===== 坡印廷定理 & 坡印廷矢量
由麦克斯韦方程组，我们有

$ nabla times upright(bold(E)) = - frac(partial upright(bold(B)), partial t) $

$ nabla times upright(bold(H)) = upright(bold(J)) + frac(partial upright(bold(D)), partial t) $

其中 $upright(bold(D)) = epsilon.alt upright(bold(E))$ 且
$upright(bold(B)) = mu upright(bold(H))$，它们分别为电位移矢量和磁场强度。

考虑 $nabla dot.op \( upright(bold(E)) times upright(bold(H)) \)$ 的展开

$ nabla dot.op \( upright(bold(E)) times upright(bold(H)) \) = upright(bold(H)) dot.op \( nabla times upright(bold(E)) \) - upright(bold(E)) dot.op \( nabla times upright(bold(H)) \) $

代入麦克斯韦方程组

$ nabla dot.op \( upright(bold(E)) times upright(bold(H)) \) = - upright(bold(H)) dot.op frac(partial upright(bold(B)), partial t) - upright(bold(E)) dot.op \( upright(bold(J)) + frac(partial upright(bold(D)), partial t) \) $

$ = - upright(bold(H)) dot.op frac(partial upright(bold(B)), partial t) - upright(bold(E)) dot.op upright(bold(J)) - upright(bold(E)) dot.op frac(partial upright(bold(D)), partial t) $

注意到能量密度
$u = 1 / 2 epsilon.alt E^2 + frac(1, 2 mu) B^2 = 1 / 2 upright(bold(E)) dot.op upright(bold(D)) + 1 / 2 upright(bold(B)) dot.op upright(bold(H))$，因此

$ frac(partial u, partial t) = upright(bold(E)) dot.op frac(partial upright(bold(D)), partial t) + upright(bold(H)) dot.op frac(partial upright(bold(B)), partial t) $

代入上式

$ nabla dot.op \( upright(bold(E)) times upright(bold(H)) \) = - frac(partial u, partial t) - upright(bold(E)) dot.op upright(bold(J)) $

应用高斯公式

$ integral.triple_V nabla dot.op \( upright(bold(E)) times upright(bold(H)) \) d V = integral.double_(partial V) \( upright(bold(E)) times upright(bold(H)) \) dot.op d upright(bold(S)) $

所以

$ integral.double_(partial V) \( upright(bold(E)) times upright(bold(H)) \) dot.op d upright(bold(S)) = - integral.triple_V frac(partial u, partial t) d V - integral.triple_V upright(bold(E)) dot.op upright(bold(J)) d V $

整理得到

$ - frac(partial, partial t) integral.triple_V u d V = integral.double_(partial V) upright(bold(E)) times upright(bold(H)) dot.op d upright(bold(S)) + integral.triple_V upright(bold(J)) dot.op upright(bold(E)) d upright(bold(V)) $

这就是坡印廷定理，其物理意义是：区域内能量的减少率（左侧，能量对时间的偏导）等于通过边界流出的能量流率（第一项）加上区域内焦耳热损耗（第二项，即电场力驱动电流做功）。

#quote(block: true)[
学习过高中物理的我们都知道，洛伦茨力不做功，所以这里没有磁场所耗散的能量。
]

为了更直观地了解边界流出的能量速率，我们定义坡印廷矢量

$ upright(bold(S)) = upright(bold(E)) times upright(bold(H)) $

它表示单位时间内通过单位面积的能量流率，单位为
$upright("W/m")^2$。容易知道它的方向和电场和磁场的方向是正交的，且遵循右手定则，也就是和电磁波传播方向一致。

所以，实际问题中，我们选取一个截面，计算通过该截面的坡印廷矢量的积分，即可得到通过该截面的能量流率。

#figure(image("images/工科物理/光学/波动光学-3.png",width: 60%),
  caption: [
    坡印廷矢量
  ]
)

$ P = integral.double_S upright(bold(S)) dot.op d upright(bold(A)) $

==== 惠更斯-菲涅耳原理
惠更斯-菲涅耳原理是描述波传播的普遍几何法则，它指出对于波的传播而言，波阵面上的每一点都可行做是发射子波的波源，在其后的任一时刻，这些#strong[子波的包迹];就成为新的波阵面。

#quote(block: true)[
波阵面指的是波动的相位相同的点所组成的面，通常是一个平面或球面，而包迹是指这些子波的相位相同的点所组成的面。
]

#figure(image("images/工科物理/光学/波动光学-4.png", width: 60%),
  caption: [
    惠更斯-菲涅耳原理
  ]
)

#quote(block: true)[
引用自：https:\/\/wuli.wiki/online/Huygen.html
]

所以，当我们分析光的传播时，我们可以认为光的传播形式是电磁场的波阵面（或者说是波扰）在空间中的传播。

==== 光的反射定律
波的波阵面从一种介质接触另一种折射率不同的介质时，部分或全部的波在两介质界面处，波阵面的传播方向发生改变且返回原介质，这种波的传播现象被称为反射。

光的反射遵循反射定律，即入射光线、反射光线和法线在同一平面内，且入射角等于反射角。

#figure(image("images/工科物理/光学/波动光学-5.png", width: 80%),
  caption: [
    光的反射定律
  ]
)


光在发生反射时，有时其相位会发生变化，反射光的相位会比入射光的相位多
$pi$，这就是半波损失现象。

#figure(image("images/工科物理/光学/波动光学-11.png"),
  caption: [
    光的反射相位变化
  ]
)

#quote(block: true)[
引用自：https:\/\/www.zhihu.com/question/267529217
]

如上图所示，光从一种介质接近另一种介质时（上图），同时发生反射和折射（下图），反射光的相位变化了
$pi$。

发生半波损失的一个充分不必要条件是

+ 光波发生反射；
+ 光是从光疏介质进入光密介质的；
+ 光是垂直交界面入射的。

我们将在后面的部分介绍其具体原理。

==== 斯涅尔定律（光的折射定律）
波的波阵面从一种介质穿入另一种折射率不同的介质时，其传播方向发生改变，这种波的传播现象被称为折射。

在先前“光的速度”部分中，我们曾推导光在介质中的传播速度为

$ v = c / n $

其中 $n = sqrt(mu_r epsilon.alt_r)$ 是介质的折射率。

那么我们不妨考虑接下来的情况，一平面波阵面以 $theta$ 夹角从 $n_1$
折射率的材料接触 $n_2$ 的材料。

#figure(image("images/工科物理/光学/波动光学-6.png"),
  caption: [
    折射-波阵面
  ]
)

图中蓝色是波阵面，白色为两材料交界线，$upright(bold(k))$
为光波传来的方向。

以当前波阵面和交界线的交点为原点，正方向为沿交界线向右，建立坐标系，那么我们知道波阵面和
$x$ 位置发生接触所需的时间为

$ t_i = frac(x sin theta, c / n_1) = frac(n_1 x sin theta, c) $

在波阵面和交界线接触后，根据惠更斯原理，接触点成为一个新的子波源，向介质中发射子波，子波的传播速度为
$v = c / n_2$，那么从一开始计时，在时间 $t$ 内，子波传播的距离为

$ r_s = c / n_2 \( t - t_i \) $

#figure(image("images/工科物理/光学/波动光学-7.png"),
  caption: [
    折射-子波
  ]
)

所以，在 $t = t_0$ 时刻，交界面上所有
$x in \[ 0 \, frac(c t_0, n_1 sin theta) \]$
都会有子波发射出来，且子波的传播距离为

$ r_s = c / n_2 \( t_0 - frac(n_1 x sin theta, c) \) $

考虑 $x$ 到 $t = t_0$ 时刻波阵面和交界线最右边的交点的距离为 $x_l$，则有

$ x_l = frac(c t_0, n_1 sin theta) - x $

#figure(image("images/工科物理/光学/波动光学-8.png"),
  caption: [
    折射-交点
  ]
)

此时发现 $x_l$ 与 $r_s$ 的比值为

$ x_l / r_s = frac(frac(c t_0, n_1 sin theta) - x, c / n_2 \( t_0 - frac(n_1 x sin theta, c) \)) = frac(n_2, n_1 sin theta) $

这是一个定值，意味着从最右边的交点向传播距离的圆弧引出切线，该切线和交界线的夹角为
$frac(n_2, n_1 sin theta)$
不变，所以我们有下图的情况，新的由子波源构成的波阵面的包络是平面且和交界线的夹角为
$frac(n_2, n_1 sin theta)$。

#figure(image("images/工科物理/光学/波动光学-9.png", width: 60%),
  caption: [
    折射-新的波阵面
  ]
)

如图，设新的波阵面，即所有子波的包络（绿色）和交界面夹角为 $theta_2$

$ theta_2 = frac(n_2, n_1 sin theta) arrow.r.double.long n_1 sin theta_1 = n_2 sin theta_2 $

所以我们就知道，折射现象中，入射光线和折射光线的夹角正弦值和介质的折射率成一定的比值关系，有

#figure(image("images/工科物理/光学/波动光学-10.png", width: 60%),
  caption: [
    斯涅尔定律
  ]
)

$ n_1 sin theta_1 = n_2 sin theta_2 $

以上关于光折射传播方向变化规律的阐述就是斯涅尔定律。

==== 菲涅耳方程
波阵面接触交界面时，反射和折射可能是同时发生的，此时光的强度会被其反射光和折射光分担，描述这两种光强度比例的方程被称为菲涅耳方程。

#figure(image("images/工科物理/光学/波动光学-12.png", width: 80%),
  caption: [
    s波和p波
  ]
)

#quote(block: true)[
引用自：https:\/\/zhuanlan.zhihu.com/p/520141099
]

上图展示了两种光震动不同的入射光线，左边的我们称作 $s$
波，右边的我们称作 $p$ 波，$s$
波是指电场垂直于入射光和反射光所在的平面，$p$
波是指电场平行于入射光和反射光所在的平面。

我们从 $s$
波的入射光开始分析，考虑在光与交界面的交点处，根据光的叠加原理，有

$ {E_(1 s) + E'_(1 s) = E_(2 s)\
H_(1 s) cos theta_1 - H'_(1 s) cos theta_1 = H_(2 s) cos theta_2 $

考虑我们推算电磁波传播规律中的方程

$ upright(bold(k)) times upright(bold(E)) = - omega upright(bold(B)) $

又有
$k / omega = n / c \, upright(bold(B)) = mu upright(bold(H))$，所以将磁场强度用电场表示，有

$ \| upright(bold(H)) \| = sqrt(epsilon.alt / mu) \| upright(bold(E)) \| $

所以

$ sqrt(epsilon.alt_1 / mu_1) E_(1 s) cos theta_1 - sqrt(epsilon.alt_1 / mu_1) E'_(1 s) cos theta_1 = sqrt(epsilon.alt_2 / mu_2) E_(2 s) cos theta_2 $

出于大部分材料的磁导率和真空中的磁导率相同，考虑
$mu_1 = mu_2 = mu_0$，那么就有 $n = sqrt(epsilon.alt mu_0)$，代换有

$ n_1 E_(1 s) cos theta_1 - n_1 E'_(1 s) cos theta_1 = n_2 E_(2 s) cos theta_2 $

#strong[请注意：接下来的推导都建立在两种介质的磁导率和真空磁导率接近的情况下！若该条件不成立，则下列结论失效。]

接下来，不妨假设反射系数和透射系数分别为 $r_s$ 和 $t_s$

$ r_s = E'_(1 s) / E_(1 s) \, quad t_s = E_(2 s) / E_(1 s) $

那么根据 $E_(1 s) + E'_(1 s) = E_(2 s)$，将 $E_(2 s)$ 代换有

$ n_1 E_(1 s) cos theta_1 - n_1 E'_(1 s) cos theta_1 = n_2 (E_(1 s) - E'_(1 s)) cos theta_2 $

两边同时除去 $E_(1 s)$，有

$ n_1 cos theta_1 - n_1 r_s cos theta_1 = n_2 (1 - r_s) cos theta_2 $

整理得到

$ r_s = frac(n_1 cos theta_1 - n_2 cos theta_2, n_1 cos theta_1 + n_2 cos theta_2) $

同理代换 $E'_(1 s) = E_(2 s) - E_(1 s)$，则有

$ n_1 E_(1 s) cos theta_1 - n_1 (E_(2 s) - E_(1 s)) cos theta_1 = n_2 E_(2 s) cos theta_2 $

两边除去 $E_(1 s)$，有

$ n_1 cos theta_1 - n_1 (1 - t_s) cos theta_1 = n_2 t_s cos theta_2 $

整理得到

$ t_s = frac(2 n_1 cos theta_1, n_1 cos theta_1 + n_2 cos theta_2) $

这就是 $s$ 波的菲涅耳方程，对于 $p$
波的菲涅耳方程，我们可以用类似的方法推导出

$ r_p = frac(n_2 cos theta_1 - n_1 cos theta_2, n_2 cos theta_1 + n_1 cos theta_2) $

$ t_p = frac(2 n_1 cos theta_1, n_2 cos theta_1 + n_1 cos theta_2) $

所以有菲涅尔方程组

$ {r_s = frac(n_1 cos theta_1 - n_2 cos theta_2, n_1 cos theta_1 + n_2 cos theta_2)\
r_p = frac(n_2 cos theta_1 - n_1 cos theta_2, n_2 cos theta_1 + n_1 cos theta_2)\
t_s = frac(2 n_1 cos theta_1, n_1 cos theta_1 + n_2 cos theta_2)\
t_p = frac(2 n_1 cos theta_1, n_2 cos theta_1 + n_1 cos theta_2) $

$r_s$ 和 $t_s$（或者 $r_p$ 和 $t_p$
）之间的关系可以用坡印廷矢量表示，考虑透过交界面的能量守恒

$ S_1 cos theta_1 = S_(1') cos theta_1 + S_2 cos theta_2 $

#quote(block: true)[
注：这不是矢量方程，指的是坡印廷矢量的模长乘上夹角余弦值之间的关系。
]

而
$upright(bold(S_n)) = upright(bold(E_n)) times upright(bold(H_n))$，所以说

$ {S_1 = E_1 times H_1\
S_(1') = E_(1') times H_(1')\
S_2 = E_2 times H_2 $

代入有

$ E_1 times H_1 cos theta_1 = E_(1') times H_(1') cos theta_1 + E_2 times H_2 cos theta_2 $

两边同时除去 $E_1 \, H_1$ 有

$ cos theta_1 = frac(E_(1') times H_(1') cos theta_1 + E_2 times H_2 cos theta_2, E_1 times H_1) $

考虑到
$\| upright(bold(H)) \| = sqrt(epsilon.alt / mu) \| upright(bold(E)) \| = n \| upright(bold(E)) \|$（认为
$mu approx 1$，则
$n = sqrt(epsilon.alt_r mu_r) = sqrt(epsilon.alt_r)$），有

$ cos theta_1 = n_1 r^2 cos theta_1 + n_2 t^2 cos theta_2 $

这便是反射系数和透射系数之间的关系。

如果我们定义透射率 $T$ 和反射率 $R$ 为

$ {R = r^2\
T = t^2 frac(n_2 cos theta_2, n_1 cos theta_1) $

那么代入原方程就有

$ R + T = 1 $

透射率和反射率分别对应原方程的两个坡印廷矢量模长，所以它们的值就表明了光的能量在反射和折射时的分配情况。

我们都知道，自然光是各向同性的光源，其同时含有等量的 $s$ 偏振和 $p$
偏振，此时应当有 $\| upright(bold(S)) \|_s = \| upright(bold(S)) \|_p$

$ \| upright(bold(S)) \| prop upright(bold(E))^2 \, R prop r^2 $

两者次数相同，可以知道有

$ \| upright(bold(S)) \|_r = \| upright(bold(S)) \|_s I_s + \| upright(bold(S)) \|_p I_p $

考虑到两种偏振光的坡印廷矢量方向相同叠加有
$\| upright(bold(S)) \| = \| upright(bold(S)) \|_s + \| upright(bold(S)) \|_p$，有

$ \| upright(bold(S)) \|_r = 1 / 2 (R_s + R_p) \| upright(bold(S)) \| $

所以，对于自然光的反射率有

$ R = 1 / 2 (R_s + R_p) $

同理，透射率也有

$ T = 1 / 2 (T_s + T_p) $

==== 全反射与临界角
考虑到当各向同性光的反射率 $R = 1$ 时，有 $r_s = r_p = 1$

$ \( n_1 cos theta_1 - n_2 cos theta_2 \)^2 = \( n_1 cos theta_1 + n_2 cos theta_2 \)^2 $

$ \( n_2 cos theta_1 - n_1 cos theta_2 \)^2 = \( n_2 cos theta_1 + n_1 cos theta_2 \)^2 $

即

$ n_1 n_2 cos theta_1 cos theta_2 = 0 $

不妨假设 $n_1 < n_2$，那么
$theta_1 > theta_2 in \[ 0 \, pi / 2 \]$，要使得该式等于 $0$，则
$theta_1 = pi / 2$，此时根据斯涅尔定理

$ sin theta_2 = n_1 / n_2 $

所以说，当光从光密介质射入光疏介质时，如果入射角的正弦值等于 $n_1 / n_2$
时，透射光的透射率为 $0$，光全部反射会介质，像这样的现象被称作全反射。

实际上，经验表明，若入射角的正弦值大于 $n_1 / n_2$，全反射情况也会出现。

==== 布儒斯特角
当入射角和反射角有

$ theta_1 + theta_2 = pi / 2 $

那么对于

$ r_p = frac(n_2 cos theta_1 - n_1 cos theta_2, n_2 cos theta_1 + n_1 cos theta_2) $

根据斯涅耳定律（$n_1 sin theta_1 = n_2 sin theta_2$）有它的分子为

$ n_2 cos theta_1 - n_1 cos theta_2 = frac(n_1, sin theta_2) dot.op \( sin theta_1 cos theta_1 - cos theta_2 sin theta_2 \) $

右边的式子只考虑括号，有

$ sin theta_1 cos theta_1 - cos theta_2 sin theta_2 = 1 / 2 \( sin 2 theta_1 - sin 2 theta_2 \) $

代入 $theta_2 = pi / 2 - theta_1$ 有

$ sin 2 theta_2 = sin \( pi - 2 theta_1 \) = sin 2 theta_1 $

所以 $sin 2 theta_1 - sin 2 theta_2 equiv 0$，这也就意味着有

$ r_p equiv 0 $

所以，当 $theta_1 + theta_2 = pi / 2$ 时，$p$
偏振光，即平行于入射光和反射光所在平面的光矢量无法通过，反射光即为垂直于入射光和反射光所在平面的线偏振光。

我们称此时的入射角 $theta_1$
为布儒斯特角，以该角入射光的反射光具有线偏振性质。

根据相关数学原理，布儒斯特角可以由下列公式求出

$ theta_B = arctan (n_2 / n_1) $

==== 光的强度的叠加和光的干涉
一般情况下，我们知道对于光波来讲，有它的坡印廷矢量

$ upright(bold(S)) = upright(bold(E)) times upright(bold(H)) $

考虑到有

$ epsilon.alt / mu \| upright(bold(E)) \| = \| upright(bold(H)) \| $

所以

$ \| upright(bold(S)) \| = epsilon.alt / mu \| upright(bold(E)) \|^2 $

于是我们知道，光的能量传递强度 $I$ 和电场强度成正比

$ I prop \| upright(bold(E)) \|^2 $

对于
$\| upright(bold(E)) \| = E_0 sin \( omega t + phi.alt \)$，将该强度值对时间求平均有

$ macron(I) = 1 / T integral_0^T I d t = 1 / T integral_0^T epsilon.alt / mu E_0^2 sin^2 \( omega t + phi.alt \) d t $

使用三角函数降幂公式容易得到

$ macron(I) = frac(epsilon.alt, 2 mu) E_0^2 $

这便是一束光的平均光强表达式。

我们也知道光矢量是满足叠加定理的

$ upright(bold(E)) = upright(bold(E_1)) + upright(bold(E_2)) $

故两束光波叠加成的光的强度由两个矢量的矢量和决定，有

#figure(image("images/工科物理/光学/波动光学-13.png", width: 80%),
  caption: [
    叠加光
  ]
)

其中 $Delta phi.alt$ 为两束光波的相位差。

根据余弦定理，我们有

$ upright(bold(E))^2 = upright(bold(E_1))^2 + upright(bold(E_2))^2 + 2 upright(bold(E_1)) dot.op upright(bold(E_2)) cos Delta phi.alt $

我们知道 $upright(bold(E_1))$ 和 $upright(bold(E_2))$
的强度实际上是按照正弦规律不断变化的，有

$ upright(bold(E_1)) = E_1 sin \( omega_1 t + phi.alt_1 \) \, quad upright(bold(E_2)) = E_2 sin \( omega_2 t + phi.alt_2 \) $

假如说 $E_1$ 和 $E_2$ 是两束频率不相同的光波，即
$omega_1 eq.not omega_2$，那么根据三角函数的正交性，有

$ integral_0^T sin \( omega_1 t + phi.alt_1 \) sin \( omega_2 t + phi.alt_2 \) d t = 0 $

所以无论光振动的相位差如何，在对时间平均的意义上，总有

$ upright(bold(E))^2 = upright(bold(E_1))^2 + upright(bold(E_2))^2 $

即

$ macron(I) = macron(I_1) + macron(I_2) $

若
$omega_1 = omega_2$，那么事情就变得复杂起来了，我们考虑有两光矢量同方向振动，有

#figure(image("images/工科物理/光学/波动光学-14.png", width: 80%),
  caption: [
    叠加光-同方向
  ]
)

那么就有新的光矢量

$ upright(bold(E)) = upright(bold(E_1)) + upright(bold(E_2)) $

考虑
$upright(bold(E_1)) = E_1 sin \( omega t + phi.alt_1 \) \, quad upright(bold(E_2)) = E_2 sin \( omega t + phi.alt_2 \)$，将它们化为相位形式有

#figure(image("images/工科物理/光学/波动光学-16.png", width: 80%),
  caption: [
    叠加光-相位
  ]
)

由此我们可以知道，叠加光的振幅应当为

$ upright(bold(E)) = sqrt(E_1^2 + E_2^2 + 2 E_1 E_2 cos Delta phi.alt) $

又有光强和振幅的关系

$ macron(I) = frac(epsilon.alt, 2 mu) E_0^2 = frac(epsilon.alt, 2 mu) (E_1^2 + E_2^2 + 2 E_1 E_2 cos Delta phi.alt) $

该公式告诉我们改变光振动的相位差，光叠加的强度会受到相位差的影响。

考虑两个光矢量振动的方向垂直，有

#figure(image("images/工科物理/光学/波动光学-15.png", width: 60%),
  caption: [
    叠加光-垂直
  ]
)

那么就有新的光矢量

$ upright(bold(E))^2 = upright(bold(E_1))^2 + upright(bold(E_2))^2 $

所以有

$ macron(I) = macron(I_1) + macron(I_2) $

此时，虽然
$omega_1 = omega_2$，但由于光矢量的方向不同，光的强度仍然是相互独立叠加，不受到光振动相位差的影响。

综上所述，我们可以总结出光的强度叠加的规律：

+ 当两束光的频率不相同，或者两束光的光矢量正交，则两束光的强度叠加是相互独立的，满足
  $macron(I) = macron(I_1) + macron(I_2)$；

+ 当两束光的频率相同，且两束光的光矢量方向相同，则两束光的强度叠加是相互依赖的，满足
  $macron(I) = macron(I_1) + macron(I_2) + 2 sqrt(macron(I_1) macron(I_2)) cos Delta phi.alt$；

针对第二种情况，我们可以进一步分析其物理意义。由于两束光的频率相同，且光矢量不完全正交，导致它们在光强的叠加上依赖于它们的相位差，我们称之为光的干涉现象。

实际情况中，光矢量的夹角不一定是 $0$ 或
$pi / 2$，更可能是一个一般的角度，此时要分析干涉现象，可以将光矢量做正交分解。只要两束相同频率的光存在平行的振动分量，干涉就可以在一定程度上发生。

==== 菲涅耳-基尔霍夫公式
惠更斯-菲涅耳原理的数学表述是菲涅耳-基尔霍夫公式，它描述了从波前到任意观察点的光场分布。

假设有一波前 $Sigma$ 上的光场分布为
$U \( P_0 \)$，我们想要计算空间中某点 $P$ 处的光场
$U \( P \)$。根据惠更斯-菲涅耳原理，$P$ 点的光场是 $Sigma$
上所有点发出的子波在 $P$ 点的叠加。

菲涅耳-基尔霍夫公式可表示为

$ U \( P \) = - i / lambda integral.double_Sigma U \( P_0 \) e^(i k r) / r frac(1 + cos theta, 2) d S $

其中

- $U \( P_0 \)$ 是波前 $Sigma$ 上点 $P_0$ 处的光场分布情况，代表 $P_0$
  处的光场振幅

- $r$ 是从 $P_0$ 到 $P$ 的距离

- $k = frac(2 pi, lambda)$ 是波数

- $theta$ 是 $arrow(n)$ (波前 $Sigma$ 在 $P_0$ 处的法向量)与
  $accent(P_0 P, ⃗)$ 的夹角

- $frac(1 + cos theta, 2)$ 是倾斜因子，代表子波的方向性

- $d S$ 是波前上的面元

要证明该公式，我们要解一系列非齐次微分方程，且引用诸多电动力学的分析方法，出于笔者水平不足，暂不进行详细推导。

==== 光的衍射
根据惠更斯-菲涅耳原理，在光透过狭缝或绕过障碍物时，光波会在狭缝处形成新的子波源，这些子波源所发出的光波会向空间中扩散，将光传播到原本按照直线传播无法波及的区域。

#figure(image("images/工科物理/光学/波动光学-18.png"),
  caption: [
    光的衍射
  ]
)

#quote(block: true)[
引用自：https:\/\/zh.wikipedia.org/wiki/%E8%A1%8D%E5%B0%84
]

这就是光的衍射现象。

我们一般比较关注光在产生衍射现象后，场内的光强分布情况，接下来我们运用相关数学方法进行分析。

===== 单缝的夫琅禾费衍射
#figure(image("images/工科物理/光学/波动光学-19.png", width: 80%),
  caption: [
    单缝衍射示意图
  ]
)

考虑这样一个情况，在有狭缝的遮光板的#strong[非常远];处
$r_0 gt.double a$，有另一块遮光板，光波发生衍射，并打到后方的遮光板，在其上显示光斑，我们称这种衍射现象为单缝的夫琅禾费衍射。

采用 MATLAB 对 $r_0 = 1$ m，$a = 0.1$ mm，$lambda = 500$ nm
的单缝衍射进行模拟，得到如下图像

#figure(image("images/工科物理/光学/波动光学-17.png"),
  caption: [
    单缝衍射光强分布
  ]
)

我们发现，远处的遮光板上有多级亮条纹，其中中间的强度最大，向两侧逐渐减弱。中间的亮条纹宽度明显大于
$1$ mm。

运用惠更斯-菲涅耳原理的数学公式，我们可以解释这种现象的成因。

菲涅耳-基尔霍夫公式告诉我们，对于非常远处的挡板上的观察点
$P$，其光场分布情况为

$ U \( P \) = - i / lambda integral.double_Sigma U \( P_0 \) e^(i k r) / r frac(1 + cos theta, 2) d S $

其中 $Sigma$ 是有狭缝的挡板区域，$P_0$ 是该挡板上任意一点。

不妨考虑狭缝衍射是一个二维衍射问题，且带狭缝的挡板上发出的光有

$ cases(delim: "{", U \( P_0 \) = U_0 & - a / 2 < x < a / 2, 0 & x lt.eq - a / 2 upright(" or ") x gt.eq a / 2) $

即只有狭缝处有光透过，其他地方光强均为 $0$，那么改写公式为

$ U \( P \) = - i / lambda integral_(- a / 2)^(a / 2) U \( P_0 \) e^(i k r) / r frac(1 + cos theta, 2) d x $

出于 $r_0$ 非常大，观察点 $P$ 与波阵面 $Sigma$
的距离远大于波阵面本身的尺寸 $a$ 和光波波长 $lambda$
。在这种情况下，我们可以对菲涅耳-基尔霍夫公式进行如下简化

+ 倾斜因子 $frac(1 + cos theta, 2)$ 近似为常数 $1$，因为远场中 $theta$
  几乎相同，为 $0$。

+ 分母中的 $r$ 可近似为常数 $r_0$（从波源中心到观察点的距离）

+ 指数项中的 $r$ 比分母中的 $r$ 影响大得多，我们考虑对 $r$ 进行泰勒展开

  考虑 $arrow(xi)$ 是波前上点 $P_0$ 相对于波前中心的位置矢量，$arrow(s)$
  是从波源中心指向观察点的#strong[单位];方向矢量。

  #figure(image("images/工科物理/光学/波动光学-20.png"),
    caption: [
      光的衍射-三角形
    ]
  )

  根据余弦定理，从波面点到观测点的距离$r$可以表示为

  $ r^2 = r_0^2 + xi^2 - 2 r_0 xi sin theta $

  利用二项式定理对 $r$ 进行展开

  $ r = sqrt(r_0^2 + xi^2 - 2 r_0 xi sin theta) = r_0 sqrt(1 + xi^2 / r_0^2 - frac(2 xi sin theta, r_0)) $

  当$xi lt.double r_0$时，$xi^2 / r_0^2 approx 0$，于是约去二次小量

  $ r approx r_0 sqrt(1 - frac(2 xi sin theta, r_0)) $

  应用泰勒展开 $sqrt(1 + x) approx 1 + x / 2$（当$\| x \| lt.double 1$时

  $ r approx r_0 \( 1 - frac(xi sin theta, r_0) \) = r_0 - xi sin theta $

  由于 $arrow(xi) dot.op arrow(s) = xi sin theta$ ，所以最终简化为：
  $r approx r_0 - arrow(xi) dot.op arrow(s) = r_0 - xi sin theta$

经过这些近似，远场衍射的菲涅耳-基尔霍夫公式可简化为

$ U \( P \) approx - i / lambda e^(i k r_0) / r_0 integral_(- a \/ 2)^(a \/ 2) U_0 e^(- i k x sin theta) d x $

计算积分，有了合适的近似这一步反倒难度不大

$ U \( P \) approx - i / lambda e^(i k r_0) / r_0 U_0 integral_(- a \/ 2)^(a \/ 2) e^(- i k x sin theta) d x = - i / lambda e^(i k r_0) / r_0 U_0 frac(sin \( k a sin theta \/ 2 \), k a sin theta \/ 2) $

光强正比于复振幅的模方，所以

$ I \( theta \) prop \| U \( P \) \|^2 prop lr(|frac(sin \( k a sin theta \/ 2 \), k a sin theta \/ 2)|)^2 $

所以我们推得单缝的夫琅禾费衍射光强分布公式为

$ I \( theta \) = I_0 lr(|frac(sin \( k a sin theta \/ 2 \), k a sin theta \/ 2)|)^2 $

===== 圆孔的夫琅禾费衍射
考虑一个半径为 $a$
的圆形孔径，光波垂直入射到孔径上，离圆形孔径足够远的位置有一挡板，光在孔径处发生干涉并在该挡板上形成衍射图样，这就是圆孔的夫琅禾费衍射。

#figure(image("images/工科物理/光学/波动光学-21.png", width: 40%),
  caption: [
    圆孔衍射示意图
  ]
)

在圆孔平面上，我们用极坐标 $\( r \, phi.alt \)$
表示孔径上的点，而在远场观察平面，我们用 $theta$ 表示与光轴的夹角，$phi$
表示绕光轴的方位角。

根据前一节的推导，对于远场衍射，菲涅耳-基尔霍夫公式可以简化为

$ U \( P \) approx - i / lambda e^(i k r_0) / r_0 integral.double_(upright("S")) U_0 e^(- i k arrow(rho) dot.op arrow(s)) d rho $

其中 $arrow(rho)$ 是圆孔平面上的位置矢量，$arrow(s)$
是从孔径中心指向观察点的单位矢量。

在极坐标下，$arrow(rho) dot.op arrow(s) = rho sin theta cos \( phi.alt - phi \)$，其中
$theta$ 为 $arrow(s)$ 与中轴线的夹角，而 $phi.alt$ 与 $phi$
为两矢量极坐标方位角。同时积分区域是半径为 $a$ 的圆，所以有

$ U \( P \) approx - i / lambda e^(i k r_0) / r_0 U_0 integral_0^a integral_0^(2 pi) e^(- i k rho sin theta cos \( phi.alt - phi \)) rho d phi.alt d rho $

引入贝塞尔函数

$ integral_0^(2 pi) e^(- i k rho sin theta cos \( phi.alt - phi \)) d phi.alt = 2 pi J_0 \( k rho sin theta \) $

贝塞尔函数指的是形如

$ J_n \( x \) = 1 / pi integral_0^pi cos \( n theta - x sin theta \) d theta $

的函数，其中 $n$ 是整数，它的图像如下所示

#figure(image("images/工科物理/光学/波动光学-22.png", width: 100%),
  caption: [
    贝塞尔函数
  ]
)

贝塞尔函数具有如下的积分性质

$ integral x J_n \( x \) d x = x J_(n + 1) \( x \) + C $

这些性质在此不做具体推导。

原函数
$integral_0^(2 pi) e^(- i k rho sin theta cos \( phi.alt - phi \)) d phi.alt$
推导到贝塞尔函数的过程如下所示

设 $alpha = phi.alt - phi$，则原式化为

$ integral_0^(2 pi) e^(- i k rho sin theta cos alpha) d alpha $

零阶贝塞尔函数有复指数形式

$ J_0 \( x \) = frac(1, 2 pi) integral_0^(2 pi) e^(i x cos alpha) d alpha $

将 $x = - k rho sin theta$ 代入，我们得到

$ J_0 \( - k rho sin theta \) = frac(1, 2 pi) integral_0^(2 pi) e^(- i k rho sin theta cos alpha) d alpha $

由于贝塞尔函数 $J_0 \( x \)$ 是偶函数，即

$ J_0 \( k rho sin theta \) = frac(1, 2 pi) integral_0^(2 pi) e^(- i k rho sin theta cos alpha) d alpha $

因此

$ integral_0^(2 pi) e^(- i k rho sin theta cos \( phi.alt - phi \)) d phi.alt = 2 pi J_0 \( k rho sin theta \) $

代入原式

$ U \( P \) approx - i / lambda e^(i k r_0) / r_0 U_0 dot.op 2 pi integral_0^a J_0 \( k rho sin theta \) rho d rho $

利用贝塞尔函数的性质，可以计算出

$ integral_0^a J_0 \( k rho sin theta \) rho d rho = a^2 / 2 frac(J_1 \( k a sin theta \), k a sin theta \/ 2) $

最终，有圆孔的远场衍射复振幅

$ U \( P \) approx - i / lambda e^(i k r_0) / r_0 U_0 dot.op pi a^2 dot.op frac(2 J_1 \( k a sin theta \), k a sin theta) $

光强正比于复振幅的模方，所以圆孔衍射的光强分布为

$ I \( theta \) = I_0 [frac(2 J_1 \( k a sin theta \), k a sin theta)]^2 $

这个分布被称为艾里斑。根据贝塞尔函数零点的数值，第一个暗环出现在
$J_1 \( k a sin theta \) = 0$ 的位置，即当 $k a sin theta approx 3.832$
时

$ sin theta approx frac(3.832 lambda, 2 pi a) approx 1.22 frac(lambda, 2 a) $

对于小角度，$sin theta approx theta$，所以第一个暗环的角半径约为

$ theta approx 1.22 frac(lambda, 2 a) = 1.22 lambda / D $

#figure(image("images/工科物理/光学/波动光学-23.png"),
  caption: [
    艾里斑图样
  ]
)

===== 光学仪器的分辨率
上述推导让我们明白，一个直径为 $D$
的圆孔在远场衍射时，会形成一个角半径约为 $1.22 lambda / D$
的艾里斑图样。

#figure(image("images/工科物理/光学/波动光学-24.png"),
  caption: [
    艾里斑图样
  ]
)

这就意味着，当两个点光源靠的足够近，它们的衍射图像会重叠在一起，从而导致光学系统无法分辨它们。

经验表明，当一个点光源产生的艾里斑的中心和另一个点光源的艾里斑的第一个暗环重叠时，光学系统恰好能够分辨这两个点光源，所以，两个点光源恰好能被分辨的条件是两者的角半径满足

$ Delta theta gt.eq 1.22 lambda / D $

这就被称为光学系统的分辨率极限，又名瑞利判据。

===== 光栅的夫琅禾费衍射
想象一块非常光滑的玻璃板，这块玻璃板可以透射光线，现在在这块玻璃板上用刻刀刻出许多平行的刻刀痕迹，痕迹处的玻璃板变得不透明，无法再透过光线。

#figure(image("images/工科物理/光学/波动光学-25.png"),
  caption: [
    光栅衍射示意图
  ]
)

我们称这样的光学器件为光栅，光栅是由很多平行狭缝组成的光学元件。

假设光栅有 $N$ 个狭缝，每个狭缝宽度为 $a$，相邻狭缝中心间距为
$d$。当平行光垂直入射到光栅上时，根据惠更斯-菲涅耳原理，每个狭缝都会成为次波源，这些次波源发出的光波在远处形成衍射图样。

我们可以将光栅的衍射看作是多个单缝衍射的叠加。对于每个宽度为 $a$
的单缝，我们已经推导出其远场衍射公式

$ I \( theta \) = I_0 lr(|frac(sin \( k a sin theta \/ 2 \), k a sin theta \/ 2)|)^2 $

出于我们将分析多个狭缝的叠加效应，不妨将光强改写为复振幅形式，令
$k = frac(2 pi, lambda)$，有

$ U_(upright("s")) \( theta \) = U_0 frac(sin \( k a sin theta \/ 2 \), k a sin theta \/ 2) e^(i k r) $

对于 $N$ 个狭缝组成的光栅，认为每个狭缝的中心位置为 $x_n = n d$，其中
$n = 0 \, 1 \, 2 \, . . . \, N - 1$，$d$ 为相邻两光栅之间的间距。

我们再分析分析从两个狭缝出射出光的光程差，有

#figure(image("images/工科物理/光学/波动光学-26.png"),
  caption: [
    光栅衍射光程差
  ]
)

发现两束光之间的光程差为 $n d sin theta$，因此每个狭缝的复振幅可以写成

$ U_(upright("t")) \( theta \) = sum_(n = - N)^N U_(upright("s")) \( theta \) e^(- i k n d sin theta) $

其中，出于指数函数的影响比前面的多项式大得多，且在远场条件下各个狭缝到挡板上的方位角几乎相同，所以我们认为方位角
$theta$
在累加中保持不变，而影响光强叠加的主要因子是相位，也就是后方的指数项。

接下来将上方级数进行整理

$ U_(upright("t")) \( theta \) = U_0 frac(sin \( k a sin theta \/ 2 \), k a sin theta \/ 2) e^(i k r_0) sum_(n = - N)^N e^(- i k n d sin theta) $

将后面的等比数列求和写作

$ sum_(n = - N)^N e^(- i k n d sin theta) = sum_(n = - N)^N \( e^(- i k d sin theta) \)^n $

这是一个以 $q = e^(- i k d sin theta)$ 为公比，首项为
$q^(- N) = e^(i k N d sin theta)$ 的有限等比数列，根据等比数列求和公式

$ sum_(n = - N)^N q^n = frac(q^(- N) - q^(N + 1), 1 - q) = frac(e^(i k N d sin theta) - e^(- i k d sin theta \( N + 1 \)), 1 - e^(- i k d sin theta)) $

进一步整理，将复指数转化为正弦函数形式：

$ sum_(n = - N)^N e^(- i k n d sin theta) = frac(sin \[ \( 2 N + 1 \) k d sin theta \/ 2 \], sin \( k d sin theta \/ 2 \)) $

因此，光栅的远场衍射复振幅为：

$ U_(upright("t")) \( theta \) = U_0 frac(sin \( k a sin theta \/ 2 \), k a sin theta \/ 2) frac(sin \[ \( 2 N + 1 \) k d sin theta \/ 2 \], sin \( k d sin theta \/ 2 \)) e^(i k r_0) $

光强正比于复振幅的模方，所以光强分布为：

$ I \( theta \) = I_0 lr(|frac(sin \( k a sin theta \/ 2 \), k a sin theta \/ 2)|)^2 lr(|frac(sin \[ \( 2 N + 1 \) k d sin theta \/ 2 \], sin \( k d sin theta \/ 2 \))|)^2 $

这个公式由两部分组成：左边的
$lr(|frac(sin \( k a sin theta \/ 2 \), k a sin theta \/ 2)|)^2$
为单缝衍射因子，右边的
$lr(|frac(sin \[ \( 2 N + 1 \) k d sin theta \/ 2 \], sin \( k d sin theta \/ 2 \))|)^2$
为多缝干涉因子，共同决定了光栅衍射的光强分布。

绘制该函数的图像，有

#figure(image("images/工科物理/光学/波动光学-27.png"),
  caption: [
    光栅衍射光强分布
  ]
)

在这张图中，我们绘制了 $N = 0$ 即单缝衍射情况下的图线（黑色虚线）和
$N = 10$
的多缝干涉情况（红色实线），可以观察到多缝干涉加持情况下，光强分布峰值变得更加尖锐，且越靠近中心的光强峰值越高。

出现这么尖锐的光强变化，全拜多缝干涉因子的分母所赐，当

$ sin \( k d sin theta \/ 2 \) arrow.r 0 $

光强就会表现出极大值，此时满足

$ d sin theta = m lambda \, quad m = 0 \, plus.minus 1 \, plus.minus 2 \, dots.h.c $

又有当 $sin \( k a sin theta \/ 2 \) = 0$
时，按照单缝衍射因子的限制，此时无论多缝衍射因子表现如何，光强都为
$0$。我们称这种现象为缺级现象。

缺级现象发生的条件是

$ a sin theta = n lambda \, quad n = 0 \, plus.minus 1 \, plus.minus 2 \, dots.h.c $

又或者说，对于任何 $m$ 若有

$ m in { m \| m / n = d / a \, n in bb(Z) upright(" and ") m in bb(Z) } $

则 $m$ 处的条纹会缺级。

===== X 光的晶体衍射与布拉格定律
X 光指的是波长在 $0.01$ nm 到 $10$ nm
之间的电磁波，具有很强的穿透能力。现代科技会使用 X
光进行医学成像、材料分析等。

以前的人们并不知道 X
光是一种电磁波，因为要验证其电磁波性质，就要针对其设计观测其衍射现象的实验，但是这种光的波长极短，这种规格的光栅是没办法人为制作的。

直到 1912 年，德国物理学家马克斯·冯·劳厄（Max von
Laue）想到，某些天然晶体本身就可以被看作是一个光栅，且晶体的原子排列具有周期性，间距通常在
$0.1$ nm 到 $0.5$ nm 之间，正好适合 X 光的波长。

#figure(image("images/工科物理/光学/波动光学-28.jpg"),
  caption: [
    NaCl
  ]
)

#quote(block: true)[
图示为 NaCl 晶体
]

英国物理学家威廉·亨利·布拉格（William Henry
Bragg）和他的儿子威廉·劳伦斯·布拉格（William Lawrence
Bragg）对晶体的衍射进行了深入的研究。

考虑一个简单的晶体模型，其中原子排列在平行的晶面上，相邻晶面间距为 $d$。

#figure(image("images/工科物理/光学/波动光学-30.png", width: 80%),
  caption: [
    布拉格衍射
  ]
)

当 X 射线以角度 $theta$
入射到晶体上时，每个原子都会成为次级波源。以上图为例，相邻晶面上的原子散射的
X 射线之间存在光程差。

从几何关系可以看出，从第二个晶面反射的光线比从第一个晶面反射的光线多走了距离
$2 d sin theta$。

对于发生相长干涉（即形成强衍射）的情况，这个光程差必须等于波长的整数倍：

$ 2 d sin theta = n lambda \, quad n = 1 \, 2 \, 3 \, dots.h $

这就是布拉格定律。

==== 起偏器和马吕斯定律
我们曾提到过，光是一种电磁波，其电场矢量 $upright(bold(E))$
在空间中以波动的方式传播。

若对于一束光而言，其光的电场矢量在传播过程中具有某种特定的方向性，即仅在一个特定的方向上振动，则我们称这种光具有偏振特性。

在现代光学中，一种特殊的仪器：起偏器（偏振片）被广泛应用于产生和分析偏振光。通过选择性地透过光的某一方向的电场分量，从而将未偏振光转变为偏振光。

现代工艺普遍采用聚乙烯醇（PVA）作为偏振片的基座材料，并将碘单质（$I_2$）与之结合，形成复合材料。

生产过程中，聚乙烯醇薄膜会被进行拉伸处理，使得碘分子沿着拉伸方向排列，薄膜的电导率就会成各向异性，致使偏振片吸收指定方向上的电场，从而使得透过薄膜的光的电场方向具有特异性。

像这样的偏振片，线偏振光透过时，只有与偏振片的光轴平行的电场分量能够通过，而垂直于光轴的分量则被吸收

#figure(image("images/工科物理/光学/波动光学-29.png", width: 70%),
  caption: [
    偏振片示意图
  ]
)

这也就意味着，当未偏振光通过偏振片时，只有与偏振片光轴平行的电场分量能够透过，而垂直于光轴的分量则被吸收，所以透过偏振片的电场强度为

$ E_t = E cos theta $

考虑光强和电场的关系，我们就得到了马吕斯定律，即透过偏振片的光强与入射光强的关系为

$ I = I_0 cos^2 theta $

其中，$I_0$ 为入射光强，$theta$ 为入射光与偏振片光轴之间的夹角。

要深入研究光学，还需要学习量子物理等更进一步的内容，这些知识我可能以后会有所涉猎。

== 现代物理

=== 狭义相对论
想象一下有一列火车穿过隧道

#figure(image("images/工科物理/现代物理/狭义相对论-1.png", width: 80%),
  caption: [
    火车和隧道
  ]
)

图中蓝色的是火车，而橙色的是隧道，那么假设我们以隧道为参考系，绘制出
$t - x$ 图像，则有

#figure(image("images/工科物理/现代物理/狭义相对论-2.png", width: 60%),
  caption: [
    火车和隧道-2
  ]
)

图中，蓝色的线是火车的轨迹，橙色的线是隧道的轨迹，可以发现随着时间的推移（向上），火车的轨迹是向右上方倾斜的，代表火车的移动，这条线的斜率的倒数即为火车的速率；而隧道的轨迹是向上垂直的，代表隧道静止在原地。

那么，我们现在转变分析的参考系，以火车为参考系观察隧道的运动，那么对于当前的
$t - x$ 图像而言，对其施加何种变换能够将其变化为以火车为参考系的 $t - x$
图像呢？

==== 伽利略变换
传统的运动学认为，#strong[不同参考系之间的相对运动可以通过速度的叠加来描述];。

这也就意味着当火车以 $v$
的速度向右运动时，隧道的参考系相对于火车的参考系以 $- v$
的速度向左运动，所以以火车为参考系的 $t - x$
图像将会是这个样子，即将所有的轨迹线向左平移 $v t$ 的距离

#figure(image("images/工科物理/现代物理/狭义相对论-3.png", width: 60%),
  caption: [
    火车和隧道-3
  ]
)

更准确点描述，对于一维情境下，从一个惯性参考系变换到另一个相对于它运动速度为
$v$ 的惯性参考系，原参考系下的事件 $\( t \, x \)$ 在新参考系下的对应事件
$\( t' \, x' \)$ 的变换关系为

$ t' = t\
x' = x - v t $

反之也是同理，有

$ t = t'\
x = x' + v t' $

这种变换被称为伽利略变换，根据日常经验而言，伽利略变换是正确的。

==== 经典电磁理论的缺陷
麦克斯韦方程组指出，光的速度满足

$ v = omega / k = 1 / sqrt(mu_0 epsilon.alt_0) = c $

这意味着，光的速度是一个定值常数，但是根据上面提到的经典运动学的观点，光的速度应该是相对于参考系的，所以在不同的参考系下，光的速度应该是不同的。

所以，为了解决麦克斯韦方程组中光速为定值而不同参考系下光速有别的冲突，人们规定了一个绝对静止的参考系“以太”，作为光传播的介质，并指出麦克斯韦方程组仅仅在该参考系下适用。

#quote(block: true)[
It is known that Maxwell's electrodynamics---as usually understood at
the present time---when applied to moving bodies, leads to asymmetries
which do not appear to be inherent in the phenomena. (On the
electrodynamics of moving bodies, Albert Einstein, 1905)
]

在 1905 年，阿尔伯特·爱因斯坦在它的论文《On the electrodynamics of
moving
bodies》中，指出了经典电磁理论和以太假说的缺陷（这其中涉及非常多的电动力学分析，恕我水平不足无法讲清），他认为与其规定光的运动依赖于绝对的参考系，不如认为光的速度是时空的固有性质------光速在任何参考系下都是不变的。这便是狭义相对论。

==== 洛伦茨变换
狭义相对论认为光速在任何惯性参考系下都是不变的，这就使得我们在进行参考系变换的时候，要使用另外一套方法。

#figure(image("images/工科物理/现代物理/狭义相对论-4.png", width: 80%),
  caption: [
    火车
  ]
)

一辆长为 $9 times 10^8 m$ 的火车以 $0.8 c$
的速度向右运动，即将穿过一条长为 $9 times 10^8 m$
的隧道，现在我们以隧道为参考系，画出火车和隧道的 $t - x$ 图像。

#figure(image("images/工科物理/现代物理/狭义相对论-5.png", width: 60%),
  caption: [
    火车和隧道-5
  ]
)

这张图中还有一条红色的线，这条线代表光速，斜率为
$1 / c$，表明在当前隧道参考系下光速是 $c$。

现在希望进行一种变换，让蓝色的火车轨迹变为竖直直线，即获取以火车为参考系的
$t - x$ 图像，应当如何变换？

按照传统的伽利略变换，这行不通，因为当横向移动轨迹线时，有

#figure(image("images/工科物理/现代物理/狭义相对论-6.png", width: 60%),
  caption: [
    火车和隧道-6
  ]
)

此时，注意观察红色直线的斜率改变，这意味着通过伽利略变换，得到在火车系中，光相对于火车的速度仅仅为
$c - 0.8 c = 0.2 c$，与狭义相对论光速不变的观点相悖。

好吧，回到最开始的情况，对这个参考系的变换，我们明确除了要让蓝色的火车轨迹变为竖直直线，还要让表征光速的红色直线斜率保持为
$1 / c$，应当有

+ 变换是线性变换：因为原运动是匀速直线运动，变换后的运动也应是匀速直线运动，所以对参考系的变换是线性的。

+ 变换有特征向量
  $upright(bold(v_1)) = vec(1, 1)$，因为要光速的斜率保持为
  $1 / c$，和光速斜率方向一致的矢量变换后应当仍然保持方向不变。

+ 变换有特征向量
  $upright(bold(v_2)) = vec(1, - 1)$，因为向相反方向上的光速斜率也应当保持为
  $- 1 / c$。

那么我们知道对原矩阵做特征值分解有

$ L = P D P^(- 1) $

其中应当有

$ D = mat(delim: "(", lambda_1, 0; 0, lambda_2) $

$ P = mat(delim: "(", frac(upright(bold(v_1)), parallel upright(bold(v_1)) parallel), frac(upright(bold(v_2)), parallel upright(bold(v_2)) parallel)) = mat(delim: "(", 1 / sqrt(2), - 1 / sqrt(2); 1 / sqrt(2), 1 / sqrt(2)) $

所以算得有

$ L = P D P^(- 1) = mat(delim: "(", frac(lambda_1 + lambda_2, 2), frac(lambda_1 - lambda_2, 2); frac(lambda_1 - lambda_2, 2), frac(lambda_1 + lambda_2, 2)) $

出于要转换参考系为火车系，即令世界线 $\( t \, x \)$ 转换到
$\( t' \, 0 \)$，应当有

$ mat(delim: "(", frac(lambda_1 + lambda_2, 2), frac(lambda_1 - lambda_2, 2); frac(lambda_1 - lambda_2, 2), frac(lambda_1 + lambda_2, 2)) vec(v t, t) = vec(0, t') $

所以

$ frac(lambda_1 + lambda_2, 2) dot.op v t + frac(lambda_1 - lambda_2, 2) dot.op t = 0 $

$ frac(lambda_1 - lambda_2, 2) dot.op v t + frac(lambda_1 + lambda_2, 2) dot.op t = t' $

考虑第一个方程

$ lambda_1 - lambda_2 = - v \( lambda_1 + lambda_2 \) $

为了唯一确定一对变换，我们还需要对 $lambda_1$ 和 $lambda_2$
施加一个约束条件，考虑到在两个坐标系之间的变换 $L$ 和 $L'$
应当是是互逆的矩阵，所以应当有

$ lambda_1 \( v \) lambda_1 \( - v \) = 1 $

$ lambda_2 \( v \) lambda_2 \( - v \) = 1 $

出于当参考系转换方向相反时，特征向量 $\( 1 \, 1 \)$ 和 $\( 1 \, - 1 \)$
的伸缩效果会互换，所以

$ lambda_1 \( - v \) = lambda_2 \( v \) $

$ lambda_2 \( - v \) = lambda_1 \( v \) $

所以我们知道
$lambda_1 \( v \) dot.op lambda_2 \( v \) = 1$，因此，我们得出重要结论

$ det \( L \) = lambda_1 \( v \) dot.op lambda_2 \( v \) = 1 $

根据这些，我们解得

$ {lambda_1 = sqrt(frac(1 - v, 1 + v))\
lambda_2 = sqrt(frac(1 + v, 1 - v)) $

然后将其代入

$ {frac(lambda_1 + lambda_2, 2) = 1 / sqrt(1 - v^2)\
frac(lambda_1 - lambda_2, 2) = frac(- v, sqrt(1 - v^2)) $

代入原变换矩阵

$ L = mat(delim: "(", 1 / sqrt(1 - v^2), frac(- v, sqrt(1 - v^2)); frac(- v, sqrt(1 - v^2)), 1 / sqrt(1 - v^2)) $

由于我们先前使用的坐标轴 $t - x$ 的比例在数值上是 $1 : 3 times 10^8$
的（光矢量是 $vec(1, 1)$ 和 $vec(1, - 1)$），所以现在，我们将 $v$ 代换为
$v / c$

$ L = mat(delim: "(", 1 / sqrt(1 - v^2 / c^2), frac(- v / c, sqrt(1 - v^2 / c^2)); frac(- v / c, sqrt(1 - v^2 / c^2)), 1 / sqrt(1 - v^2 / c^2)) $

还有一点，由于光矢量为 $vec(1, 1)$ 和
$vec(1, - 1)$，是两个无量纲量作为参量，而实际上，该矢量第一参量量纲为距离，第二参量量纲为时间，所以我们同时也应当统一一下原矩阵的量纲，且保持原矩阵行列式值为
$1$，所以有

$ L = mat(delim: "(", 1 / sqrt(1 - v^2 / c^2), frac(- v, sqrt(1 - v^2 / c^2)); frac(- v / c^2, sqrt(1 - v^2 / c^2)), 1 / sqrt(1 - v^2 / c^2)) $

所以，我们就得到了对于火车系而言，原本隧道系中事件在火车系中的映射，我们就称这个在惯性系之间的事件变换矩阵为洛伦茨变换。

#figure(image("images/工科物理/现代物理/狭义相对论-7.png"),
  caption: [
    火车和隧道-7
  ]
)

==== 钟慢与尺缩
对于隧道系中的事件 $\( t \, x \)$，在火车系中变换为 $\( t' \, x' \)$，有

$ vec(x', t') = L vec(x, t) $

由此可以导出

$ t' = 1 / sqrt(1 - v^2 / c^2) (t - frac(v x, c^2)) $

$ x' = 1 / sqrt(1 - v^2 / c^2) (x - v t) $

这也就意味着在火车上的人看来，本来在隧道系中隧道的世界线 $\( t \, 0 \)$
将变为
$\( 1 / sqrt(1 - v^2 / c^2) t \, 1 / sqrt(1 - v^2 / c^2) \( - v t \) \)$。也就意味着火车系中的人早在
$1 / sqrt(1 - v^2 / c^2) t$ 就能观察到原本隧道系中 $t$
时刻才能发生的事情，换言之，隧道系中发生的事情在火车看来好像变慢了。

这便是狭义相对论中的钟慢效应，相对原参考系以速度为 $v$
运动的参考系中的事件流逝速度在原参考系中的观察者看来为原参考系的

$ alpha = sqrt(1 - v^2 / c^2) $

考虑一个在原参考系中长度为 $L = x_2 - x_1$ 的静止物体，其两端位于
$x_1 \, x_2$，有 $x_2 > x_1$。

那么在火车系中，物体的两端位置变为

$ x'_1 = 1 / sqrt(1 - v^2 / c^2) (x_1 - v t_1) $

$ x'_2 = 1 / sqrt(1 - v^2 / c^2) (x_2 - v t_2) $

要在火车系中测得物体的长度，我们应当在同一时刻记录物体两端的位置，即
$t_(1') = t_(2')$ 时，列出时间线上的洛伦茨变换

$ t_(1') = 1 / sqrt(1 - v^2 / c^2) (t_1 - frac(v x_1, c^2)) $

$ t_(2') = 1 / sqrt(1 - v^2 / c^2) (t_2 - frac(v x_2, c^2)) $

出于 $t_(1') = t_(2')$，我们可以得到

$ 1 / sqrt(1 - v^2 / c^2) (t_1 - frac(v x_1, c^2)) = 1 / sqrt(1 - v^2 / c^2) (t_2 - frac(v x_2, c^2)) $

$ t_1 - t_2 = v / c^2 \( x_1 - x_2 \) $

于是有

$ x_(2') - x_(1') = 1 / sqrt(1 - v^2 / c^2) (\( x_2 - v t_2 \) - \( x_1 - v t_1 \)) = 1 / sqrt(1 - v^2 / c^2) (\( x_2 - x_1 \) - v \( t_2 - t_1 \)) $

代入有

$ L' = 1 / sqrt(1 - v^2 / c^2) (L - v dot.op v / c^2 L) = sqrt(1 - v^2 / c^2) L $

这便是狭义相对论中的尺缩效应，相对原参考系静止的物体，在以速度为 $v$
运动的参考系中看来与原参考系中的观察者看来长度的比值为

$ beta = sqrt(1 - v^2 / c^2) $

#figure(image("images/工科物理/现代物理/狭义相对论-7.png"),
  caption: [
    火车和隧道-7
  ]
)

#quote(block: true)[
上方这张图中，在隧道看来，火车头接触隧道尾部时，用时
$3.75$；而在火车系中看来用时 $2.25$。隧道系中隧道认为自己的长度为
$3$，而火车系中的观察者看来认为只有 $1.8$。
]

==== 时间是因人而异的
传统的时空观认为时间是绝对的，无论你坐在教室里，还是在火车上，抑或是正在月球空间站上喝咖啡，我们的时间流逝都是同步的。

而狭义相对论则否定了这一点，每个参考系都有自己的一套时间体系，每个参考系都会认为自己相对于其它有速度参考系时间流逝的，对其它参考系的事件进行观测实际上是对事件在自己参考系上映射的观测。

#figure(image("images/工科物理/现代物理/狭义相对论-8.png", width: 80%),
  caption: [
    火车和隧道-8
  ]
)

不可思议的是，两个推论都正确，火车系中的人会认为隧道系中的时间流逝的慢，而隧道系中的人会认为火车系中的时间流逝的慢。时间流逝的快慢取决于参考系，而并非一个绝对的量表。

我们常说的时间比较，实际上是又使得火车停下，回归隧道参考系后，再比较火车和隧道的时间流逝。可以根据洛伦茨变换证明，此时火车上所经过的时间比隧道内所经过的时间要少。

这便是狭义相对论的相对性原理，时间是因参考系而异的东西。

推荐视频：https:\/\/www.bilibili.com/video/BV17P4y1V7BX/?vd\_source=b101593d20983860cd3e333b3a1f5eeb

#quote(block: true)[
该视频详细地阐述了火车隧道佯谬与浦岛效应（双生子佯谬），对于时间的相对性有进一步的启发。
]

==== 相对论性质量
#quote(block: true)[
该部分内容需要进一步考证
]

为了保证切换参考系时，动量定理和能量守恒定律仍然成立，狭义相对论引入了相对论性质量的概念。

若在一个参考系下观测到一个物体的运动速度为 $v$，则该物体的相对论性质量为

$ m = m_0 / sqrt(1 - v^2 / c^2) $

其中 $m_0$ 为物体相对于参考系静止的静止质量，是物体的基本属性。

所以，高速运动的物体所具有的等效动量和能量分别为

$ p = m v = frac(m_0 v, sqrt(1 - v^2 / c^2)) $

$ E = m c^2 = frac(m_0 c^2, sqrt(1 - v^2 / c^2)) $


=== 量子物理基础

==== 热辐射

任何物体在任何温度下都向周边空间辐射各种频率的电磁波，且在单位时间内向外辐射的能量与物体的温度有关，这种与温度有关的辐射被称为热辐射。

为描述热辐射能与辐射波长的关系，定义单色辐射出射度，为
$
  M_lambda (T) = (d M_lambda)/(d lambda)
$
其中 $d M_lambda$ 指代物体单位表面积在 $[lambda, lambda + d lambda]$ 波长范围内辐射的电磁波能量。

所以，物体在温度 $T$ 下辐射的总电磁波能量可以计算为
$
  M(T) = integral_0^(+oo) M_lambda (T) d lambda
$

物体可以发射辐射能，也能吸收辐射能；当电磁波被发射到物体的表面时，一部分被物体吸收，另一部分被反射或透射，吸收和反射或透射的比例与波长和温度有关。定义物体的单色吸收系数 $a_lambda (T)$ 和单色反射系数 $r_lambda (T)$ 为
$
  a_lambda (T) = (d U_"absorb")/(d U), quad r_lambda (T) = (d U_"reflect")/(d U)
$

当物体不透明，总有 $a_lambda (T) + r_lambda (T) = 1$。且当 $a_lambda (T) = 1$ 时，物体吸收所有辐射能，称该物体为黑体。

==== 基尔霍夫辐射定律

任何物体在温度 $T$ 下的单色辐射出射度与黑体在同一温度下的单色辐射出射度之比都相等，且等于黑体在该温度下的单色吸收比，即
$
  (M_lambda (T))/(a_lambda (T)) = M_lambda ^"black" (T)
$

用这一性质，可以利用同温度下黑体的单色幅出度，确定物质的单色吸收系数后，即可求出单色幅出度。

因此，黑体的单色辐射出射度 $M_lambda ^"black" (T)$ 成为研究热辐射的关键。

#figure(image("images/工科物理/现代物理/量子力学基础-1.png", width: 55%),
caption: [
  黑体辐射曲线
]
)

根据实验，可以发现随温度升高，黑体辐射的总能量增加，且辐射能的波长分布也发生变化，出射度极大值对应的波长随之略微减小，实际上，如下有关系式
$
  M_B (T) = sigma T^4 quad ("Stefan-Boltzmann 定律") \
  lambda_"max" T = b quad ("Wien 位移定律")
$
其中 $M_B (T)$ 是黑体在温度 $T$ 下的总辐射出射度，$lambda_"max"$ 是出射度极大值对应的波长，$sigma = 5.67 times 10^(-8)  (W dot m^-2 dot K^4)$ 称为 Stefan-Boltzmann 常数，$b = 2.898 times 10^(-3) (m dot K)$ 称为 Wien 位移常数。

==== 普朗克量子假设

要推导上文的关系式，要先介绍普朗克量子假设。普朗克假设物体的能量发射和吸收不是连续的，而是以能量子形式进行的，能量子的大小与辐射频率成正比，即
$
 epsilon = h nu
$
其中 $h = 6.626 times 10^(-34) (J dot s)$ 称为普朗克常数，$nu$ 是辐射频率。

在该前提下，普朗克推导出黑体的单色辐射出射度为
$
  M_lambda ^"black" (T) = (2 pi h c^2)/(lambda^5) (1)/(exp((h c)/(lambda k T)) - 1)
$

这一公式称为普朗克辐射定律，其中 $k = 1.381 times 10^(-23) (J dot K^-1)$ 称为玻尔兹曼常数。

==== 光电效应

金属被光照射时，有电子从金属中逸出，该现象被称作光电效应。

光电效应由爱因斯坦于 1905 年基于普朗克量子假设进行了解释，从而得到了光电效应方程
$
  1/2 m v^2 = h nu - W
$

其中 $m$ 是逸出电子的质量，$v$ 是逸出电子的速度，左式为电子的动能；$W$ 是金属的逸出功，而 $h nu$ 是入射光子的能量。

光电效应与经典的电磁理论预测存在显著差异，例如光电效应的截止频率现象、光电流与入射光强的关系等，这些现象都支持了光的粒子性理论。

==== 康普顿散射

康普顿散射是指光子与物质中的电子发生非弹性碰撞，导致光子行进方向和波长发生变化的现象，描述该现象可以用康普顿散射公式
$
  Delta lambda = lambda' - lambda = (h)/(m_e c) (1 - cos theta)
$
其中 $m_e$ 是电子的静止质量，$c$ 是光速，$theta$ 是散射角，$lambda$ 和 $lambda'$ 分别是入射光子和散射光子的波长。

在 $theta$ 的散射角上的散射波，所包含的成分包括入射波 $lambda$ 和波长变大为 $lambda'$ 的散射波。

==== 玻尔氢原子模型
实验发现，原子光谱是离散分布的线状谱线，例如巴尔末系的氢原子光谱线可以用里德-巴尔末公式描述
$
  1/lambda = R (1/2^2 - 1/n^2) quad (n = 3, 4, 5, ...)
$

其中 $R = 1.097 times 10^7 (m^-1)$ 称为里德-巴尔末常数。

为了解释这一现象，玻尔于 1913 年提出了玻尔氢原子模型，假设电子在原子核周围做圆周运动，并且只有满足量子化条件的轨道才是允许的轨道。氢原子理论中有三个基本假设：
1. 原子中的电子只能处于某些允许的轨道上，这些轨道对应于离散的能量值。在轨道上电子不吸收或辐射电磁波。
2. 电子的轨道角动量是量子化的，满足条件
$
  L = n (h)/(2 pi) quad (n = 1, 2, 3, ...)
$
3. 当电子从一个允许的轨道跃迁到另一个允许的轨道时，会吸收或辐射一个光子，光子的能量等于两个轨道能量之差，即
$
  h nu = abs(E_i - E_f)
$

根据此，可以推导电子所具有的轨道势能为
$
  E_n = - (13.6 "eV")/(n^2) quad (n = 1, 2, 3, ...)
$

==== 德布罗意波
质量为 $m$ 的实物粒子，以 $v$ 的速度运动时，具有波动性质，其德布罗意波长为
$
  lambda = h/(m v) = h/(m_0 v) sqrt(1 - (v^2)/(c^2))
$
这和玻尔的量子化条件有一定联系，即当电子沿轨道运动时的物质波满足驻波条件 $2 pi r = n lambda$ 时，物质波就可以稳定存在，而因为驻波条件是离散化的，所以电子轨道也是量子化的。

#line(length: 100%)

上述现象表明，实物粒子既具有粒子性，又具有波动性，这种现象称为实物粒子的波粒二象性。这使得一个粒子的状态不能简单采用位矢 $vec(r)$ 和动量 $vec(p)$ 来描述，而是要引入新的量子力学描述方法。

==== 海森堡测不准原理
在微观粒子系统中，粒子的位置和动量不能同时被精确测量；能量和时间也存在类似的测不准关系。
$
  Delta x dot Delta p >= h/(4 pi), quad Delta E dot Delta t >= h/(4 pi)
$
其中 $Delta x$ 和 $Delta p$ 分别是位置和动量的不确定度，$Delta E$ 和 $Delta t$ 分别是能量和时间的不确定度。#footnote[不确定度分为 A 类和 B 类，不确定度的计算方法请参考《不确定度的评定》。]

==== 波函数

一个频率为 $nu$，波长为 $lambda$，幅值为 $A$ 的沿 x 轴传播的简谐物质波，可以用波函数 $y(x, t)$ 描述，有
$
  y(x, t) = A cos(2pi (nu t - x/lambda))
$

我们也用复数形式描述该种类的波函数
$
  psi(x, t) = A exp[i 2pi (nu t - x/lambda)]
$
需要注意的是这两个式子并不相等，相较于实函数，在量子力学中，采用复平面上的矢量来表征波动是更常见的方法。

出于物质的德布罗意波性质，有
$
  nu = E/h, quad lambda = h/p
$
其中的 $E$ 是粒子的能量，$p$ 是粒子的动量，两个式代入上式波函数中，有
$
  psi(x, t) = A exp[2 pi i (1/h)(p x - E t)]
$

如果定义约化普朗克常数 $planck = h / (2 pi)$，那么上式可以写为
$
  psi(x, t) = A exp[(i)/(planck) (p x - E t)]
$

===== 玻恩概率解释

波函数只是一个数学公式，其本身不具备意义，那么如何将其和实际的物质波联系在一起？为此，玻恩提出了概率解释，认为波函数的模方 $|psi(x, t)|^2$ 表示粒子在位置 $x$ 处出现的概率密度
$
  P(x, t) = |psi(x, t)|^2
$
概率密度定义为在粒子在 $t$ 时刻出现在 $x$ 空间处体积元 $d V$ 内的概率 $P(x, t) d V$ 与体积元 $d V$ 之比。

同时，在整个空间中，粒子出现的总概率为 1，即
$
  integral_V |psi(x, t)|^2 d V = 1
$

因此，按照该解释，波函数并不实际描述某个物理量的变化，而是描述粒子出现的概率分布，在统计意义下是概率波。

===== 薛定谔方程
牛顿第二定律描述了经典力学中粒子的运动规律
$
  F = m (d^2 x)/(d t^2)
$

这意味着给定系统初始状态 $vec(x, t)$ 和受力情况 $vec(F)$ 后，可以通过积分求出粒子在任意时刻的位置和速度。

然而，在量子力学中，粒子的状态由波函数 $psi(x, t)$ 描述，因此需要一个描述波函数随时间变化的方程，这就是薛定谔方程

$
  hat(H) psi(x, t) = i planck (partial)/(partial t) psi(x, t)
$

右式表明波函数的时间变化率，左式中 $hat(H)$ 是哈密顿算符，对应于系统的总能量，包含系统的势能和动能两部分，有
$
  hat(H) = hat(T) + hat(V)
$

势能可以用势能函数 $V(x, t)$ 描述，而动能算符 $hat(T)$ 则为
$
  hat(T) = - (planck^2)/(2 m) nabla^2
$

所以，完整的薛定谔方程为
$
  - (planck^2)/(2 m) nabla^2 psi(x, t) + V(x, t) psi(x, t) = i planck (partial)/(partial t) psi(x, t)
$

薛定谔方程描述了系统的波函数随时间演化的趋势和系统的能量分布情况之间的关系。该关系和牛顿第二定律一样，不能由任何其它原理推导出来，而是量子力学的基本假设之一。许多实验表明，薛定谔方程能够准确描述微观粒子的行为。#footnote[该方程仅适用于非相对论性粒子，即非高速粒子。]

接下来讨论一些简单的问题

#example("一维无限深势阱")[
  势阱指的是一种空间区域，在该区域内粒子受到的势能较低，而在区域外势能较高。这样粒子若要脱离该区域，需要克服能量差代价，因此粒子大概率会被限制在该区域内。

  无限深势阱是势阱的一种理想化模型，其假设区域之间的势能差无穷大，这样粒子完全不能逃逸出势阱区域。考虑一维无限深势阱，势阱宽度为 $a$，势能函数为
  $
    U(x) = cases(
      0 quad 0 <= x <= a,
      +oo quad x > a or x < 0
    )
  $
]
== 物理实验方法

=== 不确定度的评定
出于测量结果会因为各种因素出现偏差，即误差不可避免，所以测量结果会有一定程度上的不确定性。

==== 不确定性的来源
不确定性的来源包括测量过程中产生的误差与仪器本身或环境影响造成的测量误差。

前者被称为随机偏差，后者被称为系统偏差。

==== 不确定度
为了刻画这种由不确定性带来的偏差，我们引入不确定度的概念来表征数据的不确定性。

不确定度是一个物理量，用来量化表示一个测量结果的不确定性，我们接下来介绍它的计算、表示方法。

===== A类不确定度
现在，考虑测得一组数据
$x_1 \, x_2 \, . . . \, x_n$，那么进行如下计算

先测算数据的平均值 $ macron(x) = 1 / n sum_(i = 1)^n x_i $

然后计算实验标准差，注意不是标准差，分母为 $n - 1$
$ s = sqrt(frac(1, n - 1) sum_(i = 1)^n \( x_i - macron(x) \)^2) $

数据的不确定度可表示为 $ U_A = s / sqrt(n) $

我们通过计算数据与它们的平均值之间的偏差算得了不确定度，像这样的不确定度由测量中的随机偏差产生，称这种不确定度为
A类不确定度。

===== A类不确定度的修正
让我们举一个例子，假设现在我们正在进行一项实验，我们收集了具有相当规模的实验数据，处理后，发现这项实验的测量结果近似于正态分布
$f \( x \) = frac(1, sigma sqrt(2 pi)) e^(- 1 / 2 (frac(x - mu, sigma))^2)$。

于是你知道在这次实验中，有 $0.997$ 的可能性实验数据会落在
$\[ mu - 3 sigma \, mu + 3 sigma \]$ 的区间内。所以说，要覆盖 $99.7 %$
的实验数据，实际的方差区间应当是现有的方差区间的 $3$ 倍。

于是，我们称置信度为 $0.997$ 的正态分布分布因子的值为 $3$。

为了让实验结果覆盖更大区间内的可能出现的实验数据，即提高结果的置信度，可以根据上述的分布因子
$t$ 对A类不确定度进行修正。

对于给定的置信概率 $P$，A类不确定度的修正计算为

$ U_A = t_P dot.op s / sqrt(n) $

其中

- $t_(P \, nu)$ 是置信概率为 $P$ 的分布因子
- $s$ 是实验标准差
- $n$ 是测量次数

常见的置信概率为 $0.95$ 或
$0.99$。当测量次数足够多时$\( n > 30 \)$，t分布近似于正态分布，此时

- $P = 0.95$时，$t_(P \, nu) approx 1.96$
- $P = 0.99$时，$t_(P \, nu) approx 2.58$

对于少量测量$\( n < 10 \)$，t分布系数就不能直接用简单的正态分布或其它分布的分布因子替代，应当查表获取准确的系数值。

===== B类不确定度
除了随机偏差，系统偏差也可能对测量数据产生影响，我们称由这部分偏差产生的不确定度为
B类不确定度 $U_B$。

B类不确定度的一个主要来源为仪器本身，可以通过查找仪器的标准校准证书来获取相关信息。此外，诸如环境温度、气压等也可能造成不确定，实验前要综合估计这些因素。

===== 总不确定度
用平方和根法求总不确定度，总不确定度为上述两种不确定度的平方和

$ U = sqrt(U_A^2 + U_B^2) $

==== 在测量结果中表征不确定度
当表示实验的测量结果时，应当表征不确定度信息

$ x = macron(x) plus.minus U italic("(unit)") $

其中 $macron(x)$ 为平均值，$U$ 为测得的不确定度信息。

==== 间接测量量的不确定度
假设我们最终得到了若干个实验结果
$x_1 \, x_2 \, . . . \, x_n$，其中对于第 $k$ 个实验结果有
$x_k = macron(x_k) plus.minus U_k$。

那么，假设我们根据这些实验结果计算出来了一个新的量

$ y = f \( x_1 \, x_2 \, . . . \, x_n \) $

计算这个新量 $y$ 的不确定度 $U_y$
可以使用不确定度传递公式。假设各个测量量之间相互独立，则不确定度的计算公式为

$ U_y = sqrt(sum_(i = 1)^n (frac(partial f, partial x_i))^2 U_i^2) $

其中 - $frac(partial f, partial x_i)$ 是函数 $f$ 对于变量 $x_i$ 的偏导数
\- $U_i$ 是变量 $x_i$ 的不确定度

这种方法被称为不确定度传递法则或误差传递公式。在实际应用中，需要先求出函数
$f$ 对各个变量的偏导数，然后代入上述公式计算。

对于一些常见的函数关系，不确定度计算可以简化

+ 若 $y = x_1 plus.minus x_2 plus.minus . . . plus.minus x_n$，则
  $U_y = sqrt(U_1^2 + U_2^2 + . . . + U_n^2)$

+ 若 $y = k dot.op x$（$k$ 为常数），则 $U_y = \| k \| dot.op U_x$

+ 若 $y = x_1 dot.op x_2 dot.op . . . dot.op x_n$，则相对不确定度
  $frac(U_y, \| y \|) = sqrt((frac(U_1, \| x_1 \|))^2 + (frac(U_2, \| x_2 \|))^2 + . . . + (frac(U_n, \| x_n \|))^2)$

= 电子电路

== 电路的基本分析方法

=== 引入

功率一般指的是单位时间内能量的传输速率，电子电路中的功率传输一般指的是电能的传输速率。根据焦耳定律，电路中的功率 $P$ 可以表示为
$
  P = U I
$

结合欧姆定律，还有
$
  P = I^2 R = frac(U^2, R)
$

接下来讨论由上述公式引出的信号功率问题。


=== 多正弦波叠加功率计算

当 $U(t)$ 是由多个正弦波叠加而成时，直接计算数学表达式求功率比较复杂，而帕塞瓦尔定理可以将时域信号转化为频谱，通过频谱分析信号的功率情况。

#theorem("帕塞瓦尔定理")[
设时域信号 $u(t)$ 的傅里叶变换为 $U(j omega)$，那么有表达式
$
  integral_(-oo)^(+oo) abs(u(t))^2 d t = frac(1, 2 pi) integral_(-oo)^(+oo) abs(U(j omega))^2 d omega
$
]

所以，对于类似于
$
  U(t) = C + sum_(n=1)^N A_n cos (omega_n t + phi_n)
$

的正弦+直流叠加信号，应当有其在无穷尽时域上的积分为
$
  integral_(-oo)^(+oo) U(t)^2 d t = 1 / (2 pi) integral_(-oo)^(+oo) abs(U(j omega))^2 d omega
$

出于傅里叶变换中
$
  cal(F)[C] = 2 pi C delta(omega) \
  cal(F)[A_n cos (omega_n t + phi_n)] = pi A_n [e^(j phi_n) delta(omega - omega_n) + e^(-j phi_n) delta(omega + omega_n)]
$

仅当有 $omega = 0$ 或 $omega = ± omega_n$ 时，频谱 $U(j omega)$ 不为零，在此时的幅值为
$
  abs(U(j omega)) = 2 pi C quad (omega = 0) \
  abs(U(j omega)) = pi A_n quad (omega = ± omega_n)
$

根据狄拉克函数的采样特性，有值时的幅值平方和即为积分结果，所以有原式的值为
$
  "RHS" = 1 / (2 pi) [ (2 pi C)^2 + sum_(n=1)^N (pi A_n)^2 times 2 ] = 2 pi C^2 + pi sum_(n=1)^N A_n^2
$


=== 品质因数的定义

品质因数描述了一个电路在其工作周期内能量的损耗情况。以能量角度进行定义，品质因数 $Q$ 定义为
$
  Q = 2 pi times frac("电路工作时储存的最大能量 E_s", "每周期损耗的能量 E_d")
$

品质因数一般用于描述谐振电路的性能，谐振电路中储存的能量主要集中在电感和电容中，而能量的损耗主要发生在电阻元件上。例如以下的例子

#theorem("RLC 串联和并联电路的品质因数")[
对于 RLC 串联电路，当其处于谐振状态时，应当有谐振角频率 $omega_0$ 为
$
  omega_0 = frac(1, sqrt(L C))
$

若假设谐振时电流峰值为 $I_m$，那么电路的最大储能为
$
  E_s = frac(1, 2) L I_m^2
$

电路每周期的能量损耗为
$
  E_d = (I_m / sqrt(2))^2 R T = pi / omega_0 R I_m^2
$

因此 RLC 串联电路的品质因数为
$
  Q = 2 pi dot frac(E_s, E_d) = 2 pi (1/2 L I_m^2) / (pi / omega_0 R I_m^2) = omega_0 L / R
$

上述过程也可以用电压和电容最大储能#footnote[谐振电路中，电容和电感的储能是轮番变化的，当电容储能最大时，电感储能为零，反之亦然。]推出，可以得到
$
  Q = 1 / (omega_0 R C)
$

出于 $omega_0 = 1 / sqrt(L C)$，所以原式也可以表达为 $Q = 1/R dot sqrt(L / C)$

#line(length: 100%)

对于 RLC 并联电路，当其处于谐振状态时，电路的最大储能为
$
  E_s = frac(1, 2) C V_m^2
$

电路每周期的能量损耗为
$
  E_d = (V_m / sqrt(2))^2 dot frac(T, R) = pi / (omega_0 R) V_m^2
$

所以 RLC 并联电路的品质因数为
$
  Q = 2 pi dot frac(E_s, E_d) = 2 pi (1/2 C V_m^2) / (pi / (omega_0 R) V_m^2) = omega_0 R C
$

对应也有 $omega_0 = 1 / sqrt(L C)$，所以原式也能被表达为 $Q = R dot sqrt(C / L)$，刚好是串联电路品质因数的倒数。
]

尽管品质因数大多用于讨论谐振电路的性能，但对于单独的电感和电容，由于其并非理想元件，亦可以定义品质因数。对于电感，其品质因数定义为
$
Q_L = omega L / r
$
其中，$r$ 是电感的等效串联电阻，因为电感本质上是线圈，其也具有内阻，表示电感的损耗情况。

对于电容，其品质因数定义为
$
Q_C = omega C r
$
其中，$r$ 是电容的等效并联电阻，因为电容本质上是介质，其也具有漏电阻，表示电容的损耗情况。

对于先前讨论过的石英晶体，其工作在设定的频段下时相当于高品质电感，是因为其等效串联电阻非常小，从而使得 $Q_L$ 非常大。

=== Colpitts 振荡电路中电感品质因数的影响

如果 Colpitts 振荡器中电感并非理想器件，而是具有等效串联电阻 $r$ 的实际电感，那么该电感的品质因数为
$
  Q_L = omega_0 L / r
$

此时信号通过电感后的相位偏移就不是理想的 $90 degree$，而应当略有一点偏差，这将导致要满足巴克豪森判据的相位条件时，实际的振荡频率应当当略有偏移。

接下来推导 $r$ 的引入带来的频偏影响，此时若要满足相位振荡条件，应当有新的电路构成谐振，即
$
  Z = (1/(j omega C_1) dot (j omega L + r + 1/(j omega C_2))) / (1/(j omega C_1) + 1/(j omega C_2) + j omega L + r)
$

分别计算两条路上的导纳，有
$
  Y_1 = j omega C_1 \
  Y_2 = 1 / (r + j (omega L - 1/(omega C_2))) = (r - j (omega L - 1/(omega C_2))) / (r^2 + (omega L - 1/(omega C_2))^2)
$

要使得该阻抗为纯实数，应当有两个导纳的虚部共轭，即
$
  omega C_1 = (omega L - 1/(omega C_2)) / (r^2 + (omega L - 1/(omega C_2))^2)
$

直接解该方程的复杂度是灾难性的，且得到的公式不一定包含能直接在工程中使用的有价值信息，所以采用近似方法，令 $X = omega L - 1/(omega C_2)$，那么原式化为
$
  omega C_1 = X / (r^2 + X^2) quad => quad X^2 - (1/(omega C_1)) X + r^2 = 0
$

使用求根公式，那么解得
$
  X = (1/(2 omega C_1)) (1 ± sqrt(1 - 4 omega^2 C_1^2 r^2))
$

取正根，且对根式作泰勒展开，得到
$
  X = (1/(2 omega C_1)) (2 - 2 omega^2 C_1^2 r^2) = (1/(omega C_1)) - omega C_1 r^2
$

代回 $X$ 的定义，得到
$
  omega L - 1/(omega C_2) = (1/(omega C_1)) - omega C_1 r^2
$

解这个方程，得到
$
  omega^2 = 1 / (C_t L) dot (1 / (1 + (C_1 r^2) / L))
$

当电路的 $Q$ 相对比较大，那么应当有 $r$ 很小，借助近似公式 $1 / (1 + x) = 1 - x$，所以可以近似地认为原式化为
$
  omega^2 = 1 / (C_t L) (1 - (C_1 r^2) / L)
$

如果认为 $omega_0 = 1 / (sqrt(C_t L)), Q = omega L / r$，代入上式化为
$
  omega^2 = omega_0^2 (1 - C_1 / (C_t Q^2))
$

这便是考虑电感 $L$ 的品质因数后，Colpitts 振荡器的振荡频率表达式
#theorem("带品质因数的 Colpitts 振荡器振荡频率")[
  $
    omega_r = omega_0 sqrt(1 - (C_1) / (C_t Q^2))
  $
]

由上述内容可知，Q 值越大的电感，品质越好，引入的频率偏移越小。其他种类的振荡器同理，当电感的品质越好，振荡频率的偏移越小。

=== 品质因数的带宽值意义

对于一个谐振系统，其品质因数 $Q$ 与其谐振频率 $f_0$ 和带宽 $B$ 之间存在如下关系
$
  Q = f_0 / B = frac("谐振频率", "通频带宽")
$

#theorem[
  以 RLC 串联谐振电路为例证明之，电路的阻抗为
  $
    Z(omega) = R + j (omega L - 1 / (omega C))
  $

  当电路发生谐振时，$omega L - 1 / (omega C) = 0$，此时阻抗最小 $Z(omega_0) = R$，电流最大 $I_m = V / R$。

  定义通频带为回路电流 $I >= I_m / sqrt(2)$ 的频率范围，此时电路消耗的功率为谐振时的一半，故也称为半功率点。此时阻抗模值应当满足
  $
    abs(Z(omega)) = sqrt(2) R \
    sqrt(R^2 + (omega L - 1 / (omega C))^2) = sqrt(2) R
  $

  整理得到
  $
    omega L - 1 / (omega C) = plus.minus R
  $

  这对应两个频率点 $omega_1$ (下限) 和 $omega_2$ (上限)。
  对于 $omega_2$ (感性侧)，有 $omega_2 L - 1 / (omega_2 C) = R$，整理得 $omega_2^2 - (R/L) omega_2 - 1/(L C) = 0$。
  对于 $omega_1$ (容性侧)，有 $omega_1 L - 1 / (omega_1 C) = -R$，整理得 $omega_1^2 + (R/L) omega_1 - 1/(L C) = 0$。

  根据韦达定理或求根公式，两根之差（带宽）为
  $
    B_omega = omega_2 - omega_1 = R / L
  $

  又因为串联回路的品质因数 $Q = (omega_0 L) / R$，所以
  $
    B_omega = omega_0 / Q => Q = omega_0 / B_omega = f_0 / B
  $

  并联谐振回路同理可证。
]

所以，品质因数还表明了谐振电路的选择性，品质因数越大，带宽越小，电路对特定频率的选择性越强。

=== 总结

总而言之，品质因数 $Q$ 是一个描述谐振电路工作效益的参数。其可以反映能量转化效率，振荡电路频率稳定性和频率的选择性，是谐振电路设计中不可或缺的重要参数。
== 电路的复频域分析

对于一个一般电路而言，要分析系统的特性，一般列出其网络方程，列方程的依据是基尔霍夫定律和元件的特性方程。

为了分析系统频域特性，常将得到的网络方程作拉普拉斯变换将其转换为复频域方程；现介绍基尔霍夫定律和常见元件的特性方程复频域表达形式，可以直接从系统得到复频域方程，而省去列时域网络方程再作变换的步骤。

#theorem("复频域基尔霍夫定律")[

  对于电路中的任一节点，其所有支路电流 $i_k (t)$ 的 $cal(L)$ 变换像的代数和为零。
  $
    sum_(k=1)^(n) I_k (s) = 0
  $

  其中 $I_k (s) = cal(L)(i_k (t))$ 为支路电流 $i_k (t)$ 的拉普拉斯变换像。

  #line(length: 100%)

  对于电路中的任一回路，其所有支路电压 $u_k (t)$ 的 $cal(L)$ 变换像的代数和为零。
  $
    sum_(k=1)^(m) U_k (s) = 0
  $
  其中 $U_k (s) = cal(L)(u_k (t))$ 为支路电压 $u_k (t)$ 的拉普拉斯变换像。

  上述表达式可以从时域的基尔霍夫定律通过拉普拉斯变换直接得到。
]

#theorem("复频域元件特性方程")[

  1. 电阻 $R$ 的复频域特性方程为
  $
    U(s) = R I(s), quad I(s) = 1 / R U(s)
  $

  2. 电感 $L$ 的复频域特性方程为#footnote[
    这是因为 $u(t) = L (d i(t))/(d t)$，同时拉普拉斯变换有时域微分性质 $cal(L)((d f) / (d t)) = s F(s) - f(0^-)$，所以两边同时作拉普拉斯变换就有阻抗表达式成立。另外也有积分性质 $cal(L)(integral_0^(t) f(tau) d tau) = 1 / s F(s)$，所以导纳的表达式也成立。
  ]
  $
    U(s) = L s I(s) - L i(0^-), quad I(s) = 1 / (L s) U(s) + i(0^-) / s
  $

  3. 电容 $C$ 的复频域特性方程为
  $
    U(s) = 1 / (C s) I(s) + u(0^-) / s, quad I(s) = C s U(s) - C u(0^-)
  $

  其中 $i(0^-)$ 和 $u(0^-)$ 分别为电感和电容在 $t=0$ 时刻的初始电流和初始电压。
]

根据上述特性方程，也可以将欧姆定律推广到复频域，得到复频域欧姆定律

#theorem("复频域欧姆定律")[
  对 RLC 串联电路而言，任一支路的复频域电压 $U(s)$ 与复频域电流 $I(s)$ 之间的关系为
  $
    U(s) = Z(s) I(s) - L i(0^-) + 1 / s u(0^-)
  $

  其中 $Z(s)$ 为该支路的复频域阻抗
  $
    Z(s) = R + L s + 1 / (C s)
  $

  $L i(0^-)$ 和 $1 / s u(0^-)$ 分别为电感初始电流和电容初始电压引起的附加电压。
]

== 半导体器件

=== 本征、杂质半导体

半导体指的是一种电导率介于导体和绝缘体之间的材料。

以硅（Si）为例，其电子排布为 1s² 2s² 2p⁶ 3s² 3p²，最外层有四个价电子。这使得硅原子在晶体结构中能够与其他硅原子形成稳定的共价键，但整体结构既不如金属那样容易导电，也不像绝缘体那样难以导电，因此其导电率介于例如钠（Na）这样的金属和氦（He）这样的绝缘体之间。

#figure(image("images/电子电路/半导体器件/半导体器件-1.png", width: 30%), caption: "硅的晶体结构示意图，每个硅原子与四个相邻的硅原子形成共价键。")

在硅晶体中，室温下部分价电子会挣脱共价键的束缚，成为自由电子，此时共价键中留下的空位称作空穴，这种现象称作*本征激发*，这是硅晶体产生载流子以导电的基础。

可以向硅晶体中参杂其他元素，构成杂质半导体，如磷（P）或硼（B），以改变其电导率。磷原子比硅原子多一个价电子，掺入后会提供额外的自由电子，使其成为*N 型半导体*；而掺入硼原子则会导致缺少一个价电子，从而形成更多的空穴，使其成为*P 型半导体*。

#figure(image("images/电子电路/半导体器件/半导体器件-2.png", width: 70%), caption: "N 型和 P 型半导体的示意图。N 型半导体中有多余的自由电子，而 P 型半导体中有多余的空穴。")

=== PN 结

若将 N 型半导体和 P 型半导体接触在一起，就会在两者的交界面形成 PN 结。

PN 结具有单向导电性，若 P 区电位高于 N 区电位，则电子会从 N 区流向 P 区，填补空穴，从而形成电流，我们称其为正向偏置。此时的电流由多数载流子的扩散产生，我们称其为正向电流 $I_F$。

若 N 区电位高于 P 区电位，则电子和空穴会趋向于留在各自的区域，而不是互相复合，我们称其为反向偏置。此时几乎没有电流，仅仅有少数载流子的扩散产生，我们称这个微小电流为反向电流 $I_R$。

#figure(image("images/电子电路/半导体器件/半导体器件-3.png", width: 80%), caption: "正向和反向偏置下的 PN 结电流示意图。")

PN 结的伏安特性曲线如下图所示。正向偏置时，电流随电压的增加而迅速增大；反向偏置时，电流几乎保持不变，只有一个微小的反向漏电流。同时，若正向或反向电压过大，PN 结会被击穿损坏，电流急剧增大。

#figure(image("images/电子电路/半导体器件/半导体器件-4.jpg", width: 80%), caption: "PN 结的伏安特性曲线。")

不考虑击穿，PN 结两端的电压 $u$ 和电流 $i$ 之间的关系可以用 Shockley 方程来描述

$
i = I_S ( e^(u / (n V_T)) - 1 )
$

其中，$I_S$ 是反向饱和电流，$n$ 是理想因子（通常为 $1$），$V_T = k T/q$ 是电压当量，其中 $k$ 是玻尔兹曼常数，$T$ 是绝对温度，$q$ 是电子电荷（常温下通常为 $25.85"mV"$）。

=== 二极管

将 PN 结封装起来，从 P 区和 N 区引出电极，就形成了二极管。

#figure(image("images/电子电路/半导体器件/半导体器件-5.jpg", width: 60%), caption: "二极管示意图")

二极管具有以下两个重要性质：

+ 门槛电压：
  二极管在正向偏置时，只有当电压超过一定值（硅管通常为 $0.5"V"$）时，才会开始导电，这个值称为门槛电压。

+ 反向击穿：
  当二极管在反向偏置时，若电压超过一定值，则会发生击穿，此时二极管会损坏。

#quote([值得一提的是，存在一种特殊的二极管，称为齐纳二极管，在反向击穿时不会损坏，而是会保持在击穿状态，以一定的压降继续导电，其特性常被用于稳压电路，故也被称作稳压二极管。], block: true)

=== 三极管

由两个 PN 结，三个不同参杂区域构成的半导体器件称为三极管。

#figure(image("images/电子电路/半导体器件/半导体器件-6.png", width: 80%), caption: "三极管示意图")

如上图所示，根据参杂区域的不同，三极管可以分为 NPN 型和 PNP 型，两种类型的三极管都有三个端口：发射极（E）、基极（B）和集电极（C）。

+ 发射区是高掺杂浓度的杂质半导体，和基区形成的 PN 结被称作发射结；

+ 集电区是面积较大且掺杂浓度较低的杂质半导体，和基区形成的 PN 结被称作集电结；

+ 基区是很薄且杂质浓度低的杂质半导体。

三极管具有*电流放大作用*，即基极电流的微小变化可以引起集电极电流的较大变化，接下来介绍其作用原理。

#figure(image("images/电子电路/半导体器件/半导体器件-7.png", width: 100%), caption: "三极管工作原理示意图")

- 三极管的发射结若发生正偏，则发射区的多数载流子（N 型为电子，P 型为空穴）会注入到基区中；

- 基区的杂质浓度很低，且很薄，因此大部分注入的多数载流少部分会和基区的空穴复合，构成基极电流 $I_B$，另外大部分多数载流子会穿过基区，进入集电区；

- 集电区的杂质浓度较低，故能够容纳这些载流子，当发射级和集电极之间存在足够的正向电压 $v_("CE")$ 时，集电区的多数载流子会被吸引到集电极上，构成集电极电流 $I_C$；

- 这样，当基极电流 $I_B$ 发生微小变化时，集电极电流 $I_C$ 会发生较大变化，这就是三极管的电流控制能力；

#figure(image("images/电子电路/半导体器件/半导体器件-8.png", width: 75%), caption: "三极管输出特性曲线")

$ i_C = f(i_B, v_("CE")) $

通过工程实际应用，三极管的输出特性曲线可以分为三个区域：

+ 截止区：当基极电流 $I_B$ 很小或为零时，集电极电流 $I_C$ 也很小，此时我们称三极管处于截止状态。

+ 放大区：当 $v_("CE")$ 足够大，大于图中饱和区和放大区的分界线时，集电极电流 $I_C$ 随基极电流 $I_B$ 的变化而变化，且此时 $I_C$ 与 $I_B$ 存在固定的比值关系。

  $
  beta = I_C / I_B
  $

  我们称这个比值为三极管的*电流增益*，通常我们说三极管具有电流放大作用，实则是令三极管工作在放大区，使得其成为一个线性的流控电流源。

+ 饱和区：当 $v_("CE")$ 不足，集电区的载流子收集能力不足，此时限制 $i_C$ 的主要因素就从 $i_B$ 变为 $v_("CE")$，此时我们称三极管处于饱和状态。

=== 绝缘栅型场效应管

==== MOSFET 的工作原理

绝缘栅型场效应管全名为金属-氧化物-半导体场效应管（MOSFET），是一种利用电场效应来控制电流的半导体器件，目前在大规模集成电路中占据主导地位。

根据工作原理分类，MOSFET 可以分为增强型和耗尽型两种；根据结构分类，可以分为 N 沟道型和 P 沟道型两种；
两两组合总共有四种不同的 MOSFET 类型。

#figure(image("images/电子电路/半导体器件/半导体器件-9.png", width: 60%), caption: "MOSFET 类型示意图")

MOSFET 的工作原理是通过控制在 Gate 极和 Body 极之间的电压来控制 Drain 极和 Source 极之间的导通情况。

以 N 沟道增强型 MOSFET 为例，当 $v_("GB") = 0$ 时， Drain 极和 Source 极之间的通道是关闭的，此时 MOSFET 处于截止状态，无论 $v_("DS")$ 如何变化，Drain 极和 Source 极之间都没有电流流过；

而当 $v_("GB") > 0$ 时， Gate 极和 Body 极之间的电压会在 P 型半导体中产生指向 B 极的电场，使得自由电子被排斥向上，从而和 N 型半导体一起形成导电通道，此时 MOSFET 处于导通状态，Drain 极和 Source 极之间就可以有电流流过。

#figure(image("images/电子电路/半导体器件/半导体器件-10.png", width: 80%), caption: "N 沟道增强型 MOSFET 导通时的示意图")

其它类型的 MOSFET 工作原理类似，只是电压极性和导电通道的形成方式有所不同。

==== MOSFET 的特性曲线

#figure(image("images/电子电路/半导体器件/半导体器件-11.png", width: 80%), caption: "N 沟道增强型 MOSFET 的输出特性曲线")

$ i_("DS") = f(v_("GB"), v_("DS")) $

与三极管类似，MOSFET 的输出特性曲线也可以分为三个区域

- 截止区：当 Gate 极和 Body 极之间的电压 $v_("GB")$ 很小或为零时，Drain 极和 Source 极之间的电流随电压增大仍然保持 $i_("DS")$ 也很小，可以看作是关断状态，此时我们称 MOSFET 处于截止状态。

- 放大区（也叫做饱和区）：当 $v_("DS")$ 足够大，大于图中饱和区和放大区的分界线时，Drain 极和 Source 极之间的电流 $i_("DS")$ 由 $v_("GB")$ 控制，此时 MOSFET 相当于压控恒流源。

以增强型 NMOS 为例，理想情况下，在放大区时，驱动电流 $i_D$ 、驱动电压 $v_("DS")$ 和栅源电压 $v_("GS")$ 之间的关系为

$
  i_D = 1/2 mu_n C_("ox") (W/L) (v_("GS") - V_("TH"))^2
$

其中 $1/2 mu_n C_("ox") (W/L)$ 是一个常数，称为跨导参数，和 FET 的工艺有关，$V_("TH")$ 是 MOSFET 的阈值电压。上式也被称作 MOSFET 的平方律，在驱动电压 $v_("DS")$ 足够时，输出电流与之无关。#footnote[上式不考虑 Early 效应，具体见文档《低频交流小信号模型》]

- 可变电阻区：当 $v_("DS")$ 不足，Drain 极和 Source 极之间的电流 $i_("DS")$ 与 $v_("GB")$ 有关，此时 MOSFET 相当于一个可变电阻。

仍然可以通过调整 $v_("GB")$ 来控制 $i_("DS")$ 的大小。以增强型 NMOS 为例，在放大区时，驱动电流 $i_D$ 、驱动电压 $v_("DS")$ 和栅源电压 $v_("GS")$ 之间的关系为

$
  i_D = mu_n C_("ox") (W/L) ((v_("GS") - V_("TH"))v_("DS") - v_("DS")^2 / 2)
$

所以在非饱和状态中，$i_D$ 受到仍不充足的 $v_("DS")$ 的限制，通过增大驱动电压的值，可以增强 MOSFET 输出的电流。

上式也告诉我们：理想模型的 NMOS，当 $v_("DS") > v_("GS") - V_("TH")$ 时，NMOS 饱和；否则则处于非饱和工作状态。

==== MOSFET 的常见应用特性

+ 实际应用中，Body 极通常和 Source 极短接，因此 Gate 极和 Body 极之间的电压 $v_("GB")$ 通常等于 Gate 极和 Source 极之间的电压 $v_("GS")$。

  #figure(image("images/电子电路/半导体器件/半导体器件-12.png", width: 50%), caption: "更常见的 MOSFET 连接方式")

+ 在上图的连接方式中，Source 极和 Drain 极之间存在 P 型半导体和 N 型半导体形成的 PN 结，我们称这为寄生二极管。

  #figure(image("images/电子电路/半导体器件/半导体器件-13.png", width: 50%), caption: "寄生二极管")

  该二极管有导通压降，这使得 MOSFET 若反向导通，发热将很严重，乃至烧坏 MOSFET，因此 MOSFET 通常不能反向导通。#footnote[当 $v_("GS") < V_("TH")$ 时，MOSFET 的沟道是没法开启的，故若此时为 MOSFET 施加反向电压，那么电流只能通过寄生二极管流过，这确实会导致反向导通和严重发热，乃至烧坏 MOSFET；但若 $v_("GS") > V_("TH")$，那么 MOSFET 的沟道是开启的，此时 MOSFET 可以反向导通，而且电流主要通过沟道流过。在由 NMOS 和 PMOS 构成的推挽电路中，下方的 NMOS 就是通过反向导通，以实现对输出端的下拉。]

  #figure(image("images/电子电路/半导体器件/半导体器件-14.png", width: 20%), caption: "在 MOSFET 上的寄生二极管图示")

此外，受限于 MOSFET 的构造，MOSFET 实际上具有寄生电容。#footnote[MOSFET的栅极通过一层很薄的氧化硅（SiO₂）与半导体沟道隔离，这形成了一个平行板电容器结构：金属栅极 - 氧化层介质 - 半导体；此外，PN 结本身的结构也具有结电容。]

#figure(image("images/电子电路/半导体器件/开关管与其驱动与半桥-5.png", width: 45%),
  caption: [
    MOSFET 的寄生电容
  ]
)

等效地说，这导致在 MOSFET 的三个极之间互有连接一极小电容，极小电容所带来的影响在于：当栅极电压要快速变化时，寄生电容会导致 MOS 的电压在变化时首先要充电/放电，引入了电压变化的反应时间，导致 MOS 不可能瞬时导通。

为了在高频工作环境下令 MOS 栅极电压快速变化，栅极需要有足够的电流输出能力，这就引出了栅极驱动电路的需求。#footnote[详见《开关管及栅极驱动电路》]

#line(length: 100%)

最后，需要注意的是，上述提到的三极管，MOSFET 的各类公式规律，都是基于理想模型的推导；随着现代半导体制造工艺的进步，器件的反应曲线早已不是简单的线性或平方关系，且器件的参数也会随着温度、频率等外界条件变化而变化。

因此在实际选型的过程中，需要参考器件的实际参数手册和仿真数据来进行设计，切忌盲目套用理想模型公式。


== 放大电路

放大电路指的是利用半导体器件的电流放大作用来实现信号放大的电路。

=== 低频交流小信号模型

晶体管、场效应管都是非线性元件，线性电路的分析方法，例如叠加定理等都不适用。

但是，若这些非线性器件的输入信号是小信号，例如振幅较小的正弦波，使得器件的工作范围始终位于放大区的一个小范围内，那么我们就可以认为信号随输入量的变化幅度大致固定，器件的特性可视为线性，这就是小信号模型。

==== 三极管的交流小信号模型

#figure(image("images/电子电路/放大电路/低频交流小信号模型-1.png", width: 70%), caption: "三极管示意图")

试想三极管的各路状态都仅在一个小范围内变化，有

$
  cases(
    u_("be") = u_("beq") + u_("be"),
    i_("b") = i_("bq") + i_("b"),
    i_("c") = i_("cq") + i_("c"),
    u_("ce") = u_("ceq") + u_("ce"),
  )
$

观察 BE 两极之间的电压，我们发现该电压由一个直流偏置电压 $U_("BEQ")$ 和一个小信号交流电压 $u_("be")$ 叠加构成，$i_B$ 显然和 $U_("BE")$ 有关，有电流 $i_B$ 的交变分量 $i_b$ 受到电压的影响

$
  i_b = overbracket((d i_B) / (d u_("BE"))|_Q, i_B "受到" u_("BE") "的影响程度") times overbracket(laplace u_("BE"), "实际的" u_("BE") "变化程度")
$

在 $u_("be")$ 小信号影响下，实际的 $u_("BE")$ 的变化程度就是 $u_("be")$，同时我们对右边的式子做变形

$
  i_b = (d i_B) / (d i_E) dot (d i_E) / (d u_("BE"))|_Q dot u_("be")
$

做变形，则有

$
  u_("be") / i_b = (d i_E) / (d i_B) dot (d u_("BE")) / (d i_E)|_Q = (1 + beta) dot overbracket(r_e, "小信号输入电阻")
$

在三极管正向导通的时候，不妨假设有

$
  i_E = I_s dot (e^(u_("be") / V_T) - 1)
$

那么就有小信号的输入电阻

$
  r_e = ((d i_E) / (d u_("BE")))^(-1) = V_T / i_E
$

出于 $i_E = I_("EQ") + i_e$，而 $|i_e| < |i_E|$，我们可以认为 $i_E$ 的变化量很小，在过程中几乎不变，因此 $r_e$ 也可以近似为常数。

$
  r_e = V_T / I_("EQ")
$

所以，最终的等效输入电阻就应当为

$
  r_("be") = (1 + beta) r_e = (1 + beta) V_T / I_("EQ") = V_T / I_("BQ")
$

对于放大状态的三极管，其集电极电流应当等于 $beta$ 倍的基极电流，所以小信号之间的关系理论上应当为

$
  i_c = beta dot i_b
$

但是，实际的集电极电流 $i_c$ 还受到集电极电压 $u_("CE")$ 的影响，观察三极管的实际输出特性曲线，位于放大区的 $i_C - u_("CE")$ 曲线存在一定的向上倾斜的趋势，且每条曲线的斜率大致分别不变。

#figure(image("images/电子电路/半导体器件/半导体器件-8.png", width: 70%), caption: "三极管输出特性曲线")

这一由 $u_("CE")$ 引起 $i_C$ 变化的效应最早由 James M. Early 发现，故其被称作厄尔利效应，又称基区宽度调变效应。

当三极管工作在放大区区时，发射结正偏，集电结反偏，当 $u_("CE")$ 增大，两个 PN 结的正/反偏程度也增大，致使其耗尽区宽度增大，从而造成基区宽度变窄，该效应使得元件有阻性表现。

更具体的研究发现，所有放大区特性曲线不仅仅是斜率一致，它们的反向延长线和 x 轴的交点一致，根据这个关系，前人总结导出了厄尔利效应公式。

#figure(image("images/电子电路/放大电路/低频交流小信号模型-2.png", width: 70%), caption: "厄尔利效应示意图")

$
  cases(
    i_c = beta dot i_b + u_("ce") / r_("ce"),
    r_("ce") = V_A / I_("CQ")
  )
$

所以，输出信号的完整表达式即为上式。

根据我们所研究的简化模型输入和输出特性，最终的模型可以被简化为一个如下图所示的网络

#figure(image("images/电子电路/放大电路/低频交流小信号模型-3.png", width: 70%), caption: "最终简化模型图示")

其中有

$
  cases(
    r_("be") = V_T / I_("BQ") = (1 + beta) V_T / I_("EQ"),
    r_("ce") = V_A / I_("CQ")
  )
$

==== 绝缘栅场效应管的交流小信号模型

#figure(image("images/电子电路/放大电路/低频交流小信号模型-4.png", width: 70%), caption: "MOSFET 示意图")

试想 MOSFET 的各路状态都仅在一个小范围内变化，有

$
  cases(
    u_("GS") = u_("GSQ") + u_("gs"),
    i_("D") = i_("DQ") + i_("d"),
    u_("DS") = u_("DSQ") + u_("ds"),
  )
$

输入信号为 $u_("gs")$，而出于 MOSFET 的 Gate 极是绝缘的，Gate 极电流 $i_G$ 为零，所以输入信号的变化不会引起 Gate 极电流的变化，因此无需讨论输入阻抗。

在小范围内，可以认为 $i_d$ 和 $u_("gs")$ 之间的变化对应关系是线性的，有

$
  g_m = (d i_D) / (d u_("GS"))|_Q
$

所以，输出电流和输入电压之间的关系应当为

$
  i_d = g_m dot u_("gs")
$

同样的，MOSFET 也有厄尔利效应，所以实际上有

$
  cases(
    i_d = g_m dot u_("gs") + u_("ds") / r_("ds"),
    r_("ds") = V_A / I_("DQ")
  )
$

#figure(image("images/电子电路/放大电路/低频交流小信号模型-5.png", width: 70%), caption: "最终简化模型图示")


其中有小信号输出电阻

$
  r_("ds") = V_A / I_("DQ")
$

#line(length: 100%)

#figure(image("images/电子电路/放大电路/低频交流小信号模型-6.png", width: 80%), caption: "BJT 的米勒电容")

受工艺限制，BJT 和 MOSFET 的极间均具有寄生电容，称其为米勒电容。

对于一个电容而言，当通过信号的频率很低，可以认为电容开路；当频率很高时，可以认为电容短路。但当频率处于中间范围时，电容相当于一个复阻抗，这对电路的分析带来了新的需要考虑的因素。

如上图所示，可以认为三极管的 B 极与 C 极之间存在一个寄生电容 $C_mu$，B 极与 E 极之间存在一个寄生电容 $C_pi$。这些电容极小（pF 级别），在极高频信号下会有明显影响。

同时，进入负载前存在一个隔直电容 $C_L$，该电容的作用是阻断直流分量通过，但在极低频信号下会影响交流信号的通过，表现为阻抗。

这使得实际的 BJT 放大电路具有带通特性，既不能放大过低频率的信号，也不能放大过高频率的信号。现考虑过低频与过高频下电路工作的两种情况。

#figure(image("images/电子电路/放大电路/低频交流小信号模型-7.png", width: 90%), caption: "米勒电容的等效化")

米勒等效定理指出，若一个放大器的增益为 $A$，则连接在输入端与输出端之间的电容 $C$ 可以等效为连接在输入端的电容 $C_1$ 和连接在输出端的电容 $C_2$，其中

$
  cases(
    C_1 = C / (1 - abs(A_v)),
    C_2 = C / (1 - 1/abs(A_v))
  )
$

故此处的 $C_mu$ 可以等效为输入端的电容 $C_mu' = C_mu / (1 - abs(A_v))$ 和输出端的电容 $C_mu'' = C_mu / (1 - 1/abs(A_v))$。

这样，高频工作下的 BJT 放大电路等效为有输入阻抗和输出阻抗的网络。

#theorem("米勒等效定理")[
  若在电路中，有两个结点 $phi_1$ 和 $phi_2$ 之间以阻抗 $Z$ 相连，且结点 $phi_2$ 相对于地的电压为 $A$ 倍的结点 $phi_1$ 相对于地的电压，则该阻抗 $Z$ 可以等效为连接在结点 $phi_1$ 与地之间的阻抗 $Z_1$ 和连接在结点 $phi_2$ 与地之间的阻抗 $Z_2$，其中
  $
    cases(
      Z_1 = Z / (1 - A),
      Z_2 = Z / (1 - 1/A)
    )
  $

  要推导该定理，可以考虑结点 $phi_1$ 和 $phi_2$ 的电流关系，有
  $
    i = (phi_1 - phi_2) / Z = phi_1 / Z_1 = phi_2 / Z_2, phi_2 = A phi_1
  $

  化简上述表达式，即可得到所需结论。注意该定理仅仅对增益确定的放大器适用。
]

=== 放大器的类别

放大器的类别是按照有源器件（如 BJT、MOSFET）在信号的一个正弦周期内导通的角度范围大小来划分的：称放大器在一个信号周期之内导通的角度范围大小为“导通角”。

#figure(image("images/电子电路/放大电路/谐振功率放大器-1.png", width: 75%),
  caption: [
    不同类放大器的导通角区别
  ]
)

上图中 (a) 情况即为基础 BJT / MOSFET 放大器的工作情况，其静态工作点位于负载线的中心区域，故该放大器在信号输入的周期内总是导通，称这种导通角 $theta = 2 pi$ 的放大器为 A 类放大器。

如图 (b)，称导通角 $theta = pi$ 的放大器为 B 类放大器，OTL 功放#footnote[即推挽输出放大器，具有上下两管，在信号拉高/拉低时分别导通]就属于这种类型，在一个周期内任何一个管子只会在半个周期内导通。

同样地，如图 (c)，称导通角 $theta in (pi, 2pi)$ 的功放为 AB 类放大器，这种放大器在一个周期内每个管子都会导通超过半个周期，但不会达到整个周期。

如图 (d)，C 类放大器的导通角 $theta < pi$，导通时间不足半个周期。它的输出信号相对于输入信号发生严重失真，这主要是因为管子的截止特性。

但是 C 类放大器也具有明显的优点，因为其导通角较小，故其在相同工作条件下较其它类型放大器具有更高的效率#footnote[放大器的效率定义为 $eta = P_"out" / P_"in"$，即输出功率与输入功率之比]，这使得 C 类放大器在一些对效率要求较高的场合（如射频功率放大器）得到应用。

=== A/B 类放大电路的搭建

==== 简单放大器

放大电路指的是利用电子器件，将输入信号进行变换，使得变换后信号的幅度增大，且波形与输入信号相似（放大效果具有线性性）的电路。

根据输入/输出信号的种类，可以将放大电路在种类上分为电压放大器（压对压）、电流放大器（流对流）、互导放大器（压对流）、互阻放大器（流对压）。

放大器有一些重要指标，以衡量其工作效果

#align()[
  - 增益：输出信号强度与输入信号强度之比，通常用分贝单位表示；#footnote[增益的分贝值定义为 $A_"dB" = 20 lg|A|$，其中 $A$ 是增益的比值。例如 20 dB 的增益表示输出信号是输入信号的 10 倍。]

  - 带宽：放大器能有效放大的频率范围，超出该范围的信号分量的放大效果有所衰减；

  - 线性性：放大器输出信号与输入信号的线性程度，即输出信号与输入信号的波形相似程度；
]

#line(length: 100%)

从模拟电路角度构建放大电路，可以采用 BJT 或 FET 等有源器件来设计。考虑一个工作在放大区的三极管，有其 $i_B$ 和 $i_C$ 的关系为

$
  i_C = beta i_B
$

利用输出电流和输入电流的比值关系，可以尝试用之设计一个电流放大器。

#figure(image("images/电子电路/放大电路/放大电路-1.png", width: 70%), caption: "三极管电流放大器")

图示的电路中，向 BJT 基极输入信号 $V_"in"$ (100mV, 40Hz)，为三极管提供驱动电压 VCC 为 5V，发现图中的电路设计并未使得三极管发挥放大作用，这是因为三极管的基极电压太小，其直接截止，并未工作在放大区。

为了使得三极管始终工作在放大区，发挥其线性放大作用，可以设置一偏置电路，使得三极管的基极电压保持在一个适当的水平。

#figure(image("images/电子电路/放大电路/放大电路-2.png", width: 40%), caption: "偏置电路")

通过构建偏置，该三极管（$beta = 100$）的基极就获得了足够的电压，使得三极管现工作在放大区，此时可以在该正常工作的三极管电路上再引入小信号。

#figure(image("images/电子电路/放大电路/放大电路-3.png", width: 65%), caption: "带偏置的三极管电流放大器")

为了引入该小信号，我们采用了隔直电容将 VIN 和基极隔绝开，对于直流分量，电容相当于开路，这使得基极仍然能保持在适当的偏置电压，而对于交流小信号，电容相当于短路，这使得小信号能够有效地加到基极上。

接下来，对该电路的集电极进行采样

#figure(image("images/电子电路/放大电路/放大电路-4.png", width: 65%), caption: "集电极采样")

即可采集到放大后电流的信息，但是直接采集测试点的电压会包含一个直流偏置，所以可以再采用一个隔直电容将其隔绝开，这样就能采集到纯净的交流小信号。#footnote[所谓的隔直电容实际上是一种 RC 高通滤波器，与后方电路的电阻器进行联动，直流分量作为 $omega = 0$ 的信号被滤掉，而交流分量则能通过。上图中与信号源相连的电容和与测试点相连的电容都是起到上述作用的隔直电容。]

#figure(image("images/电子电路/放大电路/放大电路-5.png", width: 65%), caption: "隔直电容采样")

有时，电源可能会具有一定的纹波#footnote[详见文档《线性稳压、开关稳压电源简述》]，这会导致电源电压并非一个纯净的直流电压，而是包含了一定的交流分量，这会影响放大器的工作状态，导致输出信号失真/含有噪音。为此，可以视情况添加旁路电容来滤波，确保放大器获得稳定的直流电源。

#line(length: 100%)

同样的，MOSFET 也可以用来设计放大器。

#figure(image("images/电子电路/放大电路/放大电路-6.png", width: 65%), caption: "MOSFET 电压放大器")

MOSFET 不同于三极管拥有 $i_c = beta i_b$ 的直接线性关系，它能够线性放大信号主要是因为输入信号非常小，在工作点附近的变化可以近似被看作是线性的。#footnote[具体见《低频交流小信号模型》]

==== 差分放大器

现介绍差分放大器，这是一种放大两个输入量差值的放大器。

#figure(image("images/电子电路/放大电路/放大电路-7.png", width: 65%), caption: "差分放大器")

差分放大器有两个输入端 $V_1$ 和 $V_2$，其输出端输出的信号与 $V_1 - V_2$ 成正比，即放大了两个信号之间的差值。差分放大器可以用 BJT 或 MOSFET 来设计，图示为一个基于 NMOS 的差分放大器。

通过施加足够的驱动电压，两个 NMOS 都将工作在放大区，我们假设两个 NMOS 的参数完全相同。#footnote[在现实设计中完全不可能，但可以通过选择同型号同一盘上的器件、选择大尺寸器件、降低增益和后期校准等方案来尽量使得器件的工作同步。]那么，可以导出流过两路 NMOS 的电流分别为

$
  I_1 = K (V_1 - V_T)^2, quad I_2 = K (V_2 - V_T)^2
$

两路电流的差值为

$
  I_1 - I_2 = K (V_1^2 - V_2^2 - 2 V_T (V_1 - V_2)) = K (V_1 - V_2) (V_1 + V_2 - 2 V_T) prop (V_1 - V_2)
$

所以两路电流的差值与两路输入电压的差值成正比，进而可以通过负载电阻将电流差值转换为电压差值，从而实现对两个输入信号差值的放大。

// 差模放大器在理论上可以实现无温漂的放大器设计，对于输入信号 $f(t)$ 而言，将 $v_1 = f(t)$，而 $v_2 = -f(t)$，

// 补充共模抑制比的定义

// 差分放大器的差分&共模增益可以通过绘制交流小信号模型来分析，以此来计算共模抑制比。

// 差分放大器还有单端输入，双端输出的接法；是将一个输入端接地，另一个输入端接信号源，输出端则分别从两个 NMOS 的漏极采样。这是双端输入的一个特例，两个信号的共模部分为零。

// 也有双端输入，单端输出的接法；是将两个输入端分别接入信号源，输出端则只从其中一个 NMOS 的漏极采样。这种接法下，输出信号包含了共模部分。（可以分析小信号模型来看出）；同理单输入单输出。

==== 电流镜

// 上述差分放大器，R_e 可以被恒流源替代，从而提升差模增益和共模抑制比。

// 介绍参考电流的重要性，所以电流镜大有用处

在上述差动放大器电路中，若两输入端输入信号完全相同，则两条路上所流过的电流也完全相同，利用该特性，可以构建“电流镜”电路，一种二端电路，可以复制输入端子的电流并在输出端子产生完全相同的电流。

将差动放大器的两路输入短接，并接入合适的工作电压，如下图所示。

#figure(image("images/电子电路/放大电路/放大电路-8.png", width: 60%), caption: "电流镜")

此时，两路输入端的电压相同，两个 NMOS 的工作状态也相同，流过两路 NMOS 的电流也相同，即 $I_1 = I_2$。所以，若给定 $I_1$，则 $I_2$ 也被确定了，这就实现了电流复制。

电流镜不仅可以原样复制电流，还可以通过调整器件参数来实现电流的放大/缩小。

对于工作在放大区的理想 MOSFET 而言，其满足平方律

$
  I_D = mu_n C_("ox") (W/L) (V_("GS") - V_T)^2
$

如果上图中两个 NMOS 的 $W/L$ 比例不同#footnote[$mu_n$ 和 $C_("ox")$ 是与材料相关的参数，在同工艺的不同 MOSFET 中该部分参数基本相同。]，则流过两路 NMOS 的电流之比即为其 $W/L$ 比例之比，即

$
  I_2 / I_1 = (W/L)_2 / (W/L)_1
$

#figure(image("images/电子电路/放大电路/放大电路-9.png", width: 50%), caption: "LM324 中的电流镜")

利用电流镜的上述原理，可以在集成电路中设计出高精度的受控电流源，LM324 中就包含了多个电流镜电路，在不同的放大器单元中提供精确的偏置电流。

#line(length: 100%)

MOSFET 具有厄利现象，表现为当其两端的漏源电压 $V_("DS")$ 增大时，其漏极电流 $I_D$ 会有所增加，这会导致电流源的输出电流并非完全与参考侧相等。

为了克服该问题，可以采用 Cascode 接法，这是将两个 MOSFET 级联使用的一种接法，如下图所示。

#figure(image("images/电子电路/放大电路/放大电路-10.png", width: 60%), caption: "Cascode 接法示意图")

这种接法可以增大在电流源一侧的输出电阻，这使得因为厄利现象造成的电流变化变得更小，从而提升电流源的精度。#footnote[这实际上也等价于在输出 MOSFET 的漏极多加了一个负反馈电阻。]

==== 推挽输出电路

接下来介绍带隔离作用的推挽输出电路，也是一个放大器，具有较强的驱动能力。

#figure(image("images/电子电路/放大电路/放大电路-11.png", width: 50%), caption: "推挽输出电路示意图")

// 推挽输出电路利用了 NPN 和 PNP 两个互补型的 BJT 来构建，其工作原理如下，这样就将输出的责任分给了三极管，而不是信号本身

// 上图中有失真，称为交越失真，因为 NPN 和 PNP 三极管的导通电压不同，导致在信号过零点附近会有一段区域没有任何三极管导通，从而导致输出信号失真。

// 可以用二极管带来的偏置电路来改善交越失真问题。

==== 达林顿管

// 达林顿管

==== 功率放大器

==== 在放大器中应用负反馈系统

实际工程中，对于一个人为设计的系统而言，我们总是希望系统的输入和输出之间能够满足某种特定的关系，以信号放大器为例，输出 $Y(s)$ 和 输入 $X(s)$ 之间满足如下关系
$
Y(s) = A X(s)
$

但是，在实际的电路设计中，出于温漂、元件参数不准确等各种因素的影响，很难使得设计出的电路的增益为准确的 $A$。

#figure(image("images/电子电路/放大电路/负反馈系统-1.png", width: 80%), caption: "两个放大器示例（假设三极管都位于放大区，它们的偏置电路未画出）")

观察上面两个示例放大器，注意左边的放大电路，通过交流小信号模型可以推导若以 $R_2$ 作为输出电阻，则该放大器的增益为
$
  A_v = - (beta R_2)  / r_("be")
$

可以预见到，如果三极管的参数 $beta$ 和 $r_("be")$ 发生变化，则放大器的增益也会相应发生相应幅度的变化。这使得精确控制放大器的增益变得非常困难。

注意右边的放大器，在 BJT 的发射级引入了一个电阻 $R_5$，绘制其交流小信号模型又可以得到
$
  A_v^' = - (beta R_2)  / (r_("be") + (beta + 1) R_5)
$

这是因为 $R_5$ 在发射级，所以其等效电阻为 $(beta + 1) R_5$。

观察上式，出于分母的影响，$beta$ 参数对于增益的影响似乎被减小了，再对上式作整理
$
  A_v^' = - ((beta R_2) / (r_("be")))  / (1 + ((beta + 1) R_5) / r_("be")) = A_v  / (1 + T); quad T = ((beta + 1) R_5) / r_("be").
$

这验证了上面的猜想，对于原放大器，若其增益发生 $Delta A_v$ 的变化，则对于 $R_5$ 改进后的放大器而言，其增益变化为
$
  Delta A_v^' = (Delta A_v) / (1 + T)
$

相对于原放大器而言，增益变化被缩小到原来的 $1 / (1 + T)$，这意味着放大器的增益变得更加稳定。更不容易因为元件参数的漂移而引起增益的变化。

仅仅是添加一个电阻 $R_5$，就能够实现这样的功能，那么该电阻是如何做到稳定增益的呢？观察电路，可以发现交流通路中 $R_5$ 的上游电压应当为
$
  V_e = i_C R_5 (beta + 1) / (beta)
$

这使得 BJT 的基极输入电流为
$
  i_b = (v_i - V_e) / r_("be") = v_i - i_C R_5 (beta + 1) / (beta r_("be"))
$

可以发现，放大器的工作状态受到了目标负载上的电流 $i_C$ 的影响，这种影响通过 $R_5$ 反馈到了输入端，从而影响了输入电流 $i_b$。这种将输出端的信息反馈到输入端的机制称为反馈。

通过反馈机制，输出端元件的实时状态就可以被传导回到输入端，放大电路就可以根据输出端的实际状态来调整输入端的工作状态，从而使得输出端的工作状态更加接近设计目标。这样就抑制了由于元件参数漂移等因素引起的输出端工作状态的变化。

===== 反馈系统的分析

反馈的流程可以抽象为下图所示的形式

#figure(image("images/电子电路/放大电路/负反馈系统-2.png", width: 70%), caption: "反馈系统的流程")

列出以下方程组
$
  cases(
    x_i^' = x_i - x_f,
    x_o = A x_i^',
    x_f = k_f x_o
  )
$

解得 $x_o$ 关于其它量的表达式
$
  x_o = A / (1 + x_f / x_i^') x_i
$

如果我们定义 $x_f / x_i^' = T$，那么就有
$
  x_o = A / (1 + T) x_i; quad T = x_f / x_o dot x_o / x_i^' = k_f A
$

所以原式化为 $x_o = A / (1 + k_f A) x_i$，综上所述，带有负反馈的系统的增益 $G_f$ 为
$
  G_f = x_o / x_i = A / (1 + k_f A)
$

当 $k_f > 0$ 时，可以发现当参数 $A$ 漂移时，其对于增益 $G_f$ 的影响被缩小了一个比例 $1 / (1 + k_f A)$。这使得该系统具有相对不错的抗干扰能力；若 $k_f < 0$，则该系统的参数漂移会被放大，系统变得更不稳定。

我们称前者为负反馈系统，后者为正反馈系统。本文主要讨论前者，研究其抗干扰能力。后者构成的反馈系统另有作用，被用于振荡器等系统中。

===== 反馈放大器的组态

取决于采样对象，可以选择将目标负载的电压或者电流作为反馈信号，通过反馈线路传导回到输入端。例如下面所示的两种放大器组态。

#figure(image("images/电子电路/放大电路/负反馈系统-4.png", width: 50%), caption: "采集电压的负反馈")

#figure(image("images/电子电路/放大电路/负反馈系统-5.png", width: 50%), caption: "采集电流的负反馈")

而又根据信号传递回到信号源的接线方式，可以分反馈为串联反馈和并联反馈两种组态。

#figure(image("images/电子电路/放大电路/负反馈系统-6.png", width: 50%), caption: "采集电压，串联到信号源的负反馈")

#figure(image("images/电子电路/放大电路/负反馈系统-4.png", width: 50%), caption: "采集电压，并联到信号源的负反馈")

综合两类两种采集-接线的方式，可以得到四种基本的负反馈组态，分别为电压串联负反馈、电压并联负反馈、电流串联负反馈和电流并联负反馈。

#figure(image("images/电子电路/放大电路/负反馈系统-3.png", width: 70%), caption: "四种基本的负反馈组态")

当采用串联反馈接法时，就有输入放大器的输入信号 $u_i^' = u_i - u_f$，这体现了串联接法的分压特点；同理，对于并联的反馈接法，有输入放大器的输入电流 $i_i^' = i_i - i_f$，这体现了并联接法的分流特点。

为契合我们的模型，可以认为串联反馈接法时，输入信号是电压源，反馈回来的信号也是电压信号；而并联反馈接法时，输入信号是电流源，反馈回来的信号也是电流信号。

实际的信号输入源是电压源还是电流源可不是由我们说了算的，但是根据戴维南/诺顿等效定理，我们总是可以将任意的实际信号源等效为电压源或者电流源，从而使得上述分析成立。#footnote[需要注意，理想的电压源和电流源之间不能相互转化，该结论只对于实际的源有效，因为它的输出阻抗是存在且有限的。]

#figure(image("images/电子电路/放大电路/负反馈系统-7.png", width: 60%), caption: "戴维南与诺顿电路的转化")

综上所述，我们得以列出四种组态放大器的反馈系数表达式
#align(center)[
  #block(
    inset: 8pt,
    radius: 6pt,
    table(
      columns: (1fr, 1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[组态类型]],
        [#text(weight: "bold")[增益系数 $A$]],
        [#text(weight: "bold")[反馈系数 $k_f$]]
      ),
      [电压串联], [$v_o div v_i^'$], [$v_f div v_o$],
      [电压并联], [$v_o div i_i^'$], [$i_f div v_o$],
      [电流串联], [$i_o div v_i^'$], [$v_f div i_o$],
      [电流并联], [$i_o div i_i^'$], [$i_f div i_o$],
    )
  )
]

===== 反馈网络的阻抗效应

对于本来开环的原放大器而言，若为其引入反馈网络，则会对其输入输出阻抗产生影响。进而影响其基本性能，如增益、输入输出阻抗。


考虑一个串联反馈电路，由一个基本放大器 $A$ 和反馈网络 $k_f$ 组成，假设单独从基本放大器看进去的输入电阻为 $R_i$，那么接入反馈网络后，其输入电阻 $R_i^'$ 为 #footnote[下面的公式对于导纳放大器也成立，只需要替换 $v_o$ 为 $i_o$ 即可。并联组态的，对于阻抗放大器也同理成立。]
$
  R_i^' = v_i / i_i = (v_i^' + v_f) / i_i = v_i^' / i_i (1 + v_f / v_i^') = v_i^' / i_i (1 + v_f / v_o dot v_o / v_i^') = R_i (1 + k_f A)
$

同理也可以推导对于并联反馈电路的输入阻抗 $R_i^'$ 为
$
  R_i^' = v_i / i_i = v_i / (i_i^' + i_f) = v_i / i_i^' / (1 + i_f / i_i^') = v_i / i_i^' / (1 + i_f / i_o dot i_o / i_i^') = R_i / (1 + k_f A)
$

所以反馈网络对于输入阻抗的影响仅仅取决于其输入端连接方式（串联或并联）。对于串联而言，输入阻抗增大到原来的 $1 + k_f A$ 倍；而对于并联而言，输入阻抗变为原来的 $1 / (1 + k_f A)$ 。

可以发现，对于输入信号为电压的放大器，串联反馈组态能够增大输入阻抗；而对于输入信号为电流的放大器，并联反馈组态能够减小输入阻抗。这使得放大器的输入端能够更好地适应其工作环境，这是引入反馈网络的又一大优点。

同样地，定义基本放大器（未接入反馈网络）在输出端看到的等效输出电阻为 $R_o$，接入反馈后的输出电阻为 $R_o^'$。分析时令输入源为零（便于测量输出端口特性），在输出端施加测试信号。

考虑一个电压采样电路，以基本放大器的戴维南模型表示：$v_o = A x_i^' - i_o R_o$。输入源置零后，$x_i^' = - x_f$；电压采样有 $x_f = k_f v_o$。代入得
$
  v_o = A(-x_f) - i_o R_o = -A k_f v_o - i_o R_o
$
移项并按定义 $R_o^' = v_o / i_o$ 得
$
  (1 + A k_f) v_o = - i_o R_o quad -> quad
  R_o^' = v_o / i_o = - R_o / (1 + A k_f)
$
取幅值可写为
$
  R_o^' = R_o / (1 + k_f A)
$
因此，电压采样会使输出电阻降低到原来的 $1 / (1 + k_f A)$ 倍。

同理以基本放大器的诺顿模型表示电流采样电路：$i_o = A x_i^' - v_o / R_o$。输入源置零后，$x_i^' = - x_f$；电流采样有 $x_f = k_f i_o$。代入得
$
  i_o = A(-x_f) - v_o / R_o = -A k_f i_o - v_o / R_o
$
移项并按定义 $R_o^' = v_o / i_o$ 得
$
  (1 + A k_f) i_o + v_o / R_o = 0 quad -> quad
  R_o^' = v_o / i_o = - R_o (1 + A k_f)
$
取幅值可写为
$
  R_o^' = R_o (1 + k_f A)
$
因此，电流采样会使输出电阻增大为原来的 $(1 + k_f A)$ 倍。

所以反馈网络对于输出阻抗的影响仅仅取决于其输出端连接方式（电压采样或电流采样）。对于电压采样而言，输出阻抗减小到原来的 $1 / (1 + k_f A)$ 倍；而对于电流采样而言，输出阻抗变为原来的 $(1 + k_f A)$ 。

===== 增益系数

在前文中已经讨论过，引入反馈系数为 $k_f$ 的反馈网络后，放大器的增益系数 $G_f$ 为
$
  G_f = A / (1 + k_f A)
$

其中 $A$ 为基本放大器的增益系数，因反馈网络组态不同而具有不同的意义。

#figure(image("images/电子电路/放大电路/负反馈系统-8.png", width: 100%), caption: "四种基本组态的增益系数意义")

===== 输入输出电阻的等效求法

求一个带反馈网络的放大器的输入输出电阻时，本质是从反馈放大器中分离出基本放大器，此时实际的反馈放大器的输入/输出回路就是计及反馈网络负载效应后的基本放大器的输入/输出回路。

为此，总结出以下方法求解带反馈网络中基本放大器的输入/输出电阻
#align(center)[
  #block(
    inset: 8pt,
    radius: 6pt,
    table(
      columns: (1fr, 1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[组态类型]],
        [#text(weight: "bold")[输入电阻 $R_i$ 求法]],
        [#text(weight: "bold")[输出电阻 $R_o$ 求法]]
      ),
      [电压串联], [将输出端短接], [将输入端开路],
      [电压并联], [将输出端短接], [将输入端短接],
      [电流串联], [将输出端开路], [将输入端开路],
      [电流并联], [将输出端开路], [将输入端短接],
    )
  )
]

表中的做法完全消除了反馈网络对基本放大器输入输出电阻的影响，使得在测量时可以直接得到基本放大器的输入输出电阻值。

===== 深度负反馈

观察增益表达式
$
  G_f = A / (1 + k_f A)
$

如果 $k_f A >> 1$，则增益表达式可简化为
$
  G_f approx 1 / k_f
$

这表明在该条件下，放大器的增益和基本放大器的增益 $A$ 无关，而仅仅取决于反馈网络的反馈系数 $k_f$，反馈系数的大小不容易受到工作环境的影响。这使得深度反馈放大器的增益变得非常稳定，不容易受到基本放大器参数漂移的影响。

同时，深度反馈放大器具有以下特性，同时观察 $k_f$ 和 $A$ 的表达式
$
  k_f = x_f / x_o; quad A = x_o / x_i
$

出于在深度负反馈中 $A approx 1 / k_f$，所以有
$
  x_i = x_o / A approx k_f x_o = x_f
$

可以发现，深度反馈放大器中，输入量 $x_i$ 与反馈量 $x_f$ 大小几乎相等，这使得

- 串联负反馈下，净输入电压 $x_i^' = x_i - x_f approx 0$；这表明输入的两端电压几乎相等；

- 并联负反馈下，净输入电流 $x_i^' = x_i - x_f approx 0$；这表明输入的两端电流为 0。

上述的两个结论可以被抽象为 “虚短（电压相等）” 和 “虚断（电流为 0）”，这就是深度负反馈放大器的虚短虚断特性。#footnote[虚短虚断概念曾出现在运算放大器的分析中，因为运算放大器具有极高的开环增益，其就是深度负反馈的一个应用例子。]


=== C 类放大器的工作原理

==== 选频滤波特性

C 类放大器的输出信号严重失真，无法直接使用，但是可以通过选频滤波的方法来提取出有用的信号分量。

#figure(image("images/电子电路/放大电路/谐振功率放大器-2.png", width: 75%),
  caption: [
    C 类放大器的输入输出波形示意图
  ]
)

假设输入信号 $v_b = V_("bm") cos (omega t)$，那么理想情况下，输出信号 $v_c = V_("cm") cos (omega t)$。本部分信号频率分量并未因为截止失真而被消除，而是被其它频率的谐波覆盖，构成了上图中的余弦脉冲波形。

为了提取本部分分量，可以设计带通滤波器到放大器电路中，将期望的放大信号提取出来。

#figure(image("images/电子电路/放大电路/谐振功率放大器-3.png", width: 75%),
  caption: [
    选频滤波提取有用信号分量
  ]
)

添加一个 RLC 电路，对于图中的电路，作以下推导

右边支路的阻抗由电容 $C_r, C_L$ 与电阻 $R_L$ 贡献，首先先令串联等效电容为
$
  C_t = (C_r^(-1) + C_L^(-1))^(-1)
$

然后可以知道两条支路的阻抗分别为
$
  Z_1 = j omega L, Z_2 = R - j / (omega C_t)
$

所以带通滤波器的总阻抗为
$
  Z = (Z_1 Z_2) / (Z_1 + Z_2) = (j omega L (R - j / (omega C_t))) / (R + j(omega L - 1 / (omega C_t))) = (L / (C_t) + j omega R L) / (R + j(omega L - 1 / (omega C_t)))
$

该式相当复杂，但是我们大可以专注于仅仅求解阻抗角，上下两个向量的幅角应当相等#footnote[当出现谐振时，电路呈现纯阻性，且表现出的阻抗大小最小，根据共射极放大电路的常识，这将导致最大的增益和输出信号相位基本不变。]，所以又有

$
  (omega L R) / (L / C_t) = (omega L - 1 / (omega C_t)) / R
$

解得谐振角频率 $omega_0$
$
  omega_0 = 1 / sqrt(L C_t - R^2 C_t^2)
$

如果回路的品质因数 $Q = (omega_0 L_r) / R_L$ 很高，那么可以近似地认为
$
  omega_0 = 1 / sqrt(L C_t)
$

将数据代入上方阻抗表达式 $Z$，此时的谐振等效纯电阻就约为#footnote[此处忽略了 $R$ 项对结果的影响，因为品质因数很高，所以 $R$ 相对于其它影响项就没那么重要]
$
  R_("eq") = L / (R C_t) = V_("cm") / I_("c1m")
$

此类放大器的效率可以如此计算：先计算由直流电源提供的功率 $P_D$，再计算集电极输出信号的功率 $P_C$，对两者进行作比即可得到效率 $eta$，有
$
  P_D = V_"CC" I_"C0", quad P_C = 1 / 2 I_("c1m") V_("cm"), quad eta = P_C / P_D
$

==== 谐振功放的工作状态

C 类谐振功放的工作状态分为三种：欠载、适载和过载#footnote[也叫做欠压、临界和过压状态，《电子线路（第六版）》课本上就采用了此类称呼。]。不同的工作状态刻画了放大器输出信号的形态良好程度和输出功率的大小。

先假设上图谐振功放的管子上的电压参数
$
  cases(
    V_("BE") = V_("BB") + V_("bm") cos(omega t),
    V_("CE") = V_("CC") - V_("cm") cos(omega t),
  )
$

因为是共射放大器，故输出电压和输入电压反向。

根据管子的输入特性和输出特性，我们可以知道对于管子而言，每个 $V_("BE")$ 对应唯一的 $I_B$，而每组唯一的 $I_B, V_("CE")$ 再在输出曲线上对应唯一的 $I_C$，所以，管子的集电极电流 $I_C$ 可以表示为输入电压 $V_("BE")$ 和输出电压 $V_("CE")$ 的函数，做出对应图形

#figure(image("images/电子电路/放大电路/谐振功率放大器-4.png", width: 85%),
  caption: [
    谐振功放管子的输入输出特性曲线
  ]
)

上图中，左上角的图为 $V_("BE") - V_("CE") - I_C$ 的三维关系曲线。此时，根据先前提到的 $V_("BE")$ 与 $V_("CE")$ 的关系
$
  cases(
    V_("BE") = V_("BB") + V_("bm") cos(omega t),
    V_("CE") = V_("CC") - V_("cm") cos(omega t),
  )
$

令 $omega$ 从 $[-pi / 2, pi / 2]$ 扫描变化，可以得到点列 $(V_("BE"), V_("CE"))$，将其带入到上方的三维关系曲线中，可以确定数据点 $(V_("BE"), V_("CE"))$ 对应的 $I_C$ 的值，于是可得到 $omega - I_C$ 的关系曲线，如上图右上角所示。
$
  omega quad -> quad (V_("BE"), V_("CE")) quad -> quad I_C
$

如图中 1, 2, 3 不同样例所示，若改变 $V_("cm")$ 的值，那么 $omega - I_C$ 曲线的形态特征也会发生变化。

- 过压状态
当 $V_("cm")$ 较大时，这导致 $omega = 0$ 时的 $V_("CE")$ 过小，以至于管子进入饱和区，$I_C$ 不增反减。$omega - I_C$ 图中出现中央凹陷。这对应图中的负载线 3。

- 欠压状态
当 $V_("cm")$ 较小时，管子始终工作在放大区，$I_C$ 随 $omega$ 单调变化。$omega - I_C$ 图中呈现单峰形态。这对应图中的负载线 1。

- 临界状态
当 $V_("cm")$ 取适中值时，管子刚好在 $omega = 0$ 时进入饱和区，$I_C$ 曲线在峰值处变得平坦。$omega - I_C$ 图中呈现平顶形态。这对应图中的负载线 2。

根据直觉，$I_C$ 的脉冲宽度越宽，高度越高，对应的基波分量 $I_("c1m")$ 和直流偏置 $I_("C0")$ 也会越大；而一旦出现凹陷，则凹陷深度越大，基波分量和直流偏置反而会越小。

==== 负载特性

$V_("cm")$ 的大小和带通滤波器的谐振等效电阻 $R_("eq")$ 有关，$R_("eq")$ 越大，$V_("cm")$ 越大，反之亦然。这是因为有表达式
$
  V_("cm") = I_("c1m") R_("eq")
$

而在先前的讨论中，已经知道当 $V_("cm")$ 增大时，放大器更容易进入过压状态，$I_("c1m")$ 随之减小，这就使得该式中 $R_("eq")$ 必须增大以保持平衡。

于是，$V_("cm")$ 对于放大器的工作状态影响可以被等价为 $R_("eq")$ 对于放大器工作状态的影响，就称此类特性为负载特性。

#figure(image("images/电子电路/放大电路/谐振功率放大器-5.png", width: 95%),
  caption: [
    谐振功放的负载特性曲线
  ]
)

左边的图表示随着 $R_("eq")$ 的增大，输出电流 $I_C$ 的变化情况，从欠压到过压，这在之前的讨论中已经有所体现。

右上的图片表示随着 $R_("eq")$ 的增大，基波分量 $I_("c1m")$ 和偏置信号分量 $I_("C0")$ 的变化情况，两者随着 $R_("eq")$ 的增大而减小。

右下的图片表示随着 $R_("eq")$ 的增大，放大器的各个参量的变化关系，包含效率 $eta$，直流电源功率 $P_D$，输出功率 $P_O$ 和损耗功率 $P_C$。值得关注的一点时输出功率 $P_O$，其存在一极大值点，这意味着可以通过调节负载电阻 $R_L$ 来使得谐振功放的输出功率最大。我们称此时的负载电阻为最佳负载阻抗 $R_("eopt")$。

==== 调制特性

调制特性意味着对于功放的的某些参量而言，它们的变化可以用于波形的调制。接下来讨论集电极调制特性和基极调制特性。

===== 集电极调制特性

#figure(image("images/电子电路/放大电路/谐振功率放大器-4.png", width: 55%),
  caption: [
    重新观察谐振功放管子的输入输出特性曲线
  ]
)

上图中，若增大 $V_("CC")$，将左下角表示 $v_c$ 的图线整体右移，那么对应的 $omega - I_C$ 曲线也会逐渐脱离饱和区，于是，管子的工作状态将逐渐从过压状态脱离，变为欠压状态。

#figure(image("images/电子电路/放大电路/谐振功率放大器-6.png", width: 65%),
  caption: [
    集电极调制特性曲线#footnote[注意这张图有一个标记错误，将 $V_("C0")$ 改为 $I_("C0")$ 即可。]
  ]
)

观察上图，若谐振功放工作在过压区域，那么 $V_("cm")$ 将随着 $V_("CC")$ 的增大而近似线性增大，回想振幅调制的表达式#footnote[参见《信号调理电路》的相关内容。]
$
  v_"AM"(t) = [A + m cos(omega_"m" t)] cos(omega_"c" t)
$

于是，可以通过在集电极电压上增加一个小的交流分量 $v_Omega$ 来线性影响输出电压 $V_("cm")$ 的幅值，进而实现振幅调制。

#figure(image("images/电子电路/放大电路/谐振功率放大器-7.png", width: 85%),
  caption: [
    集电极偏置电压实现振幅调制
  ]
)

其中 $v_b$ 构造高频载波信号，$v_Omega$ 构造低频调制信号，用于控制前者的幅值，以实现振幅调制。

===== 基极调制特性

#figure(image("images/电子电路/放大电路/谐振功率放大器-8.png", width: 55%),
  caption: [
    基极调制特性曲线
  ]
)

当基极偏置电压 $V_("BB")$ 增大时，这使得管子的 $v_("BE")$ 曲线整体上移，导致在同样的 $v_("CE")$ 下，管子更容易进入饱和区，导致过压。

故如上图，随着 $V_("BB")$ 的增大，放大器输出 $i_C$ 幅值增大，但凹陷程度也增大。下图的调制特性曲线更清晰地展示了这一点。

同集电极调制特性，基极调制特性也可以用于实现振幅调制，当管子处于欠压状态时，$V_("BB")$ 的增大将导致输出电压 $V_("cm")$ 的近似线性增大，从而实现振幅调制。

#figure(image("images/电子电路/放大电路/谐振功率放大器-9.png", width: 85%),
  caption: [
    基极偏置电压实现振幅调制
  ]
)

==== 放大特性
谐振功放本质上是带有带通滤波器的共射极 BJT 放大器，它当然具有放大输出信号的作用，接下来具体分析其放大特性。

#figure(image("images/电子电路/放大电路/谐振功率放大器-10.png", width: 65%),
  caption: [
    基极放大特性曲线
  ]
)

若增大输入信号 $v_b$ 的幅值 $V_("bm")$，那么相当于增大了管子的输入电压 $v_("BE")$ 的幅值，这使得若增大 $V_("bm")$，那么功放将逐渐逼近饱和区，从欠压状态变为过压状态。

处于和上面调制特性类似的线性特性，可以认为在欠压状态下，输出信号幅值 $V_("cm")$ 近似线性地随着输入信号幅值 $V_("bm")$ 的增大而增大。

所以，可以利用本部分近似线性的特性构建良好的线性放大器；也可以利用过压区域中，$V_("cm")$ 的大小不再随着 $V_("bm")$ 的增大而增大的特性构建限幅器。

#figure(image("images/电子电路/放大电路/谐振功率放大器-11.png", width: 90%),
  caption: [
    利用谐振功放构建线性放大器和限幅器
  ]
)

=== C 类放大器的直流馈电电路

在 A 类放大器中，BJT 总是需要合适的静态偏置电压才能工作，对于 C 类放大器而言，也是同理，上方的讨论已经确定有
$
  cases(
    V_("BE") = V_("BB") + V_("bm") cos(omega t),
    V_("CE") = V_("CC") - V_("cm") cos(omega t),
  )
$

故功放需要基极偏置电压 $V_("BB")$ 和集电极偏置电压 $V_("CC")$ 才能正常工作。称提供这两个偏置电压的电路为直流馈电电路。

==== 集电极馈电电路

#figure(image("images/电子电路/放大电路/谐振功率放大器-12.png", width: 90%),
  caption: [
    集电极直流馈电电路示意图
  ]
)

先讨论提供 $V_("CC")$ 的集电极直流馈电电路，如上图所示。特殊地，在具有选频特性的 C 类功放中，$V_("CC")$ 并非直接接入直流电源，而是先通过一个电源滤波电路 $L_C$ 与 $C_C$，再接入网络中。

$L_C$ 是一个高频扼流圈，相当于感抗很大的电感元件，以一个电感符号加上一条横线表示，横线表示该电感元件的电感量很大，对于任何交流信号而言都相当于断路，仅仅允许直流信号通过。

$C_C$ 是一个高频旁路电容，相当于容抗很小的电容元件，对于任何交流信号而言都相当于短路，仅仅阻断直流信号通过。

利用这两个元件，直流电源可以很好地将 $V_("CC")$ 提供给功放电路，同时交流信号也可以无损地通过回路，而不受到直流电源的影响。

上图中，(a) 与 (b) 两图展示了不同的集电极直流馈电电路结构，(a) 图中，$L_C$ 与 $C_C$ 将 $V_("CC")$ 接入负载下游；(b) 图中，$L_C$ 与 $C_C$ 将 $V_("CC")$ 直接接入集电极。称前者为串联式直流馈电电路，后者为并联式直流馈电电路。它们都可以起到良好的直流馈电作用。

==== 基极馈电电路

#figure(image("images/电子电路/放大电路/谐振功率放大器-13.png", width: 90%),
  caption: [
    基极直流馈电电路示意图
  ]
)

为基极提供 $V_("BB")$，可以沿用集电极放大电路的偏置思路，如上图所示。图中 (a) 展示了电阻分压偏置电路，通过将两个电阻 $R_("B1"), R_("B2")$ 串联接入直流电源 $V_("CC")$，在它们的分压点提供稳定的基极偏置电压 $V_("BB")$。

通常来说，对于 C 类放大器，$V_("BB")$ 是一个负值，因为管子需要在截止区工作。而通常来说，处于集电极直流偏移电流 $I_("C0")$ 的存在，基极偏置电流 $I_B$ 也应当存在一个小的正向偏置电流 $I_("B0")$，以保证管子能够正常工作。

如果我们此时在基极输入位置并接一个电阻 $R_B$，那么 $I_("B0")$ 流过该电阻将导致一个额外的压降 $I_("B0") R_B$，这将带来一个直流压降 $V_("BB")$，刚好起到了基极直流馈电的作用，如上图 (b) 所示。称这样的偏置方案为自偏置电路。

高频扼流圈是由线圈绕制而成，故在通过直流分量时，也会产生等效电阻 $R_("LB")$，故可以进一步简化电路为如上图 (c) 所示。直接以电感替代高频扼流圈，也能起到隔离作用。

=== C 类放大器的滤波匹配网络

上文已经提到，C 类功放必须具有带通滤波器滤出基波分量才得以正常工作，完成本部分工作的网络被称为滤波匹配网络。上文中提到的 RLC 电路即为一种滤波匹配网络。

滤波匹配网络最好具有以下特点

- 具有良好的选频特性，能够有效滤除谐波分量，仅保留基波分量。为此，定义对 $n$ 次谐波的谐波抑制比
$
  H_n = 20lg (I_("Lnm") / I_("L1m"))
$

其中 $I_("Lnm")$ 为负载端口的第 $n$ 次谐波分量电流幅值，$I_("L1m")$ 为负载端口的基波分量电流幅值。谐波抑制比 $H_n$ 越小，说明滤波匹配网络的选频特性越好。通常使用二阶谐波 $H_2$ 来衡量滤波匹配网络的选频特性。

- 具有阻抗匹配特性，使得等效输入电阻 $R_("eq")$ 等于最佳负载阻抗 $R_("eopt")$，以实现功率的最大传输，令 $P_O$ 取得最大值。

- 有较高的传输效率，即 $eta = P_L / P_O$ 较大，输出管尽量多承接输入该网络的功率。

#figure(image("images/电子电路/放大电路/谐振功率放大器-14.png", width: 75%),
  caption: [
    四种滤波匹配网络示意图
  ]
)

上图中，称前两种网络为 $"T"$ 型滤波匹配网络，后两种网络为 $pi$ 型滤波匹配网络。这些网络都可以通过调节电感和电容的参数来实现良好的选频特性和阻抗匹配特性。


== 信号调制

=== 调制与解调

对于长距传输，不同波长的电磁波，波长越短，信号在传输过程中衰减越严重。这是因为电磁波在长距传输中实际经受了地球的电离层的反射，而电离层对不同频率的电磁波有不同的反射率，频率越低，信号越容易被吸收而不是反射，信号衰减越严重，这可以被阿普尔顿-哈特里公式表现。#footnote[未经笔者验证，还需要更多资料佐证]

$
  ϗ prop 1 / (f^2)
$

其中 $ϗ$ 是信号的衰减常数，$f$ 是信号的频率。

以广播节目为例，一般节目包含人声和乐声，声源振动频率大约在 100Hz 到 5000Hz，若以该频率范围的电磁波进行传输，信号会被电离层严重吸收，导致信号衰减过大，无法被接收机接收。且若复数个广播节目同时播放音调相近的主播人声，那么接受该频率上的收音机将无法分辨出不同节目的信号，造成严重的干扰。

因此，可以应用调制技术。将原始信号调制到一个更高的频率范围内进行传输，这样可以减少信号在传输过程中的衰减，同时也可以通过选择不同的载波频率来区分不同的广播节目，避免干扰。

=== 用于频谱搬移的常见系统

==== 相乘器具有频谱搬移特性
// 课本上针对相乘器有非常多的叙述，主要介绍了其非线性性和大量的关于谐波抑制的内容，如有必要，稍后补充。

相乘器，顾名思义是将信号之间进行乘法运算的器件，其具有抽象表达式

#figure(image("images/电子电路/信号调制/振幅调制、解调与混频-3.png", width: 35%),
  caption: [
    相乘器
  ]
)

$
  v_o = A_m (v_1 dot v_2)
$

相乘器具有频谱搬移特性，先假设 $v_1$ 和 $v_2$ 是单音信号，在这种情况下输出信号应当为
$
  v_o = A_m V_1 V_2 cos(omega_1 t) cos(omega_2 t) \
= (A_m V_1 V_2) / 2 [cos((omega_1 + omega_2) t) + cos((omega_1 - omega_2) t)]
$

如果认为 $omega_1$ 是载波信号，$omega_2$ 是调制信号，那么调制信号的频谱成分就被搬移到了 $omega_1 + omega_2$ 和 $omega_1 - omega_2$ 处。当调制信号是复合信号时，其频谱成分和 $omega_2$ 一样也会被搬移到载波频率 $omega_1$ 的两侧。

#figure(image("images/电子电路/信号调制/振幅调制、解调与混频-4.png", width: 85%),
  caption: [
    相乘器的频谱搬移特性，注意 $v_Omega (t) $ 的频谱成分被搬移到了 $omega_c$ 附近，且出于原式中信号成分在 $omega_1$ 的两侧都有，所以搬移后的信号是沿 $omega_c$ 对称的。
  ]
)

利用相乘器的频谱搬移特性，可以实现振幅调制和解调。
// 顺手给个乘法器的例子

==== 开关函数具有调制作用

开关函数指的是
$
  s(t) = cases(1 quad t in [0, T / 2), 0 quad t in [T / 2, T))
$

该函数的傅里叶级数展开为
$
  s(t) = 1 / 2 - (2 / pi) sum_(n = 1, 3, 5, ...)^oo (1 / n) sin(n omega_s t)
$

这使得任何信号与该开关函数相乘后，其信号的频谱都会被搬移到 $n omega_s$ 处，其中 $omega_s$ 处的频谱成分最强，其他 $n = 3, 5, 7, ...$ 处的频谱成分依次减弱。

==== 混频器

#figure(image("images/电子电路/信号调制/振幅调制、解调与混频-7.png", width: 85%),
  caption: [
    混频器
  ]
)

混频器的作用是将一个高频信号的频率“搬移”到另一个新的频率上，同时保留其携带的信息，实际上也是具有频谱搬移特性系统的另一个说法。

===== 二极管混频器

#figure(image("images/电子电路/信号调制/振幅调制、解调与混频-8.png", width: 85%),
  caption: [
    二极管混频器
  ]
)

二极管混频器的工作原理是：从 $v_("S2")$ 输入的高频载波信号使得二极管在导通和截止间切换，令后半部分电路等价为一个开关电路，从而使得 $v_("S1")$ 的信号与开关函数相乘，达到频谱搬移的目的。

===== Gilbert 混频器

#figure(image("images/电子电路/信号调制/振幅调制、解调与混频-9.png", width: 85%),
  caption: [
    Gilbert 混频器
  ]
)

Gilbert 混频器是一种常见的集成电路混频器，其核心原理仍然是通过外界输入信号模拟开关函数，从而实现频谱搬移。

对于上图，根据差动放大器的特性，有
$
  i_1 - i_2 = i_5 "th"(v_1 / (2 V_T)) \
  i_3 - i_4 = i_6 "th"(v_1 / (2 V_T))
$

出于 $i_("I") = i_1 + i_3, i_("II") = i_2 + i_4$，所以有
$
  i_("I") - i_("II")
  = (i_5 - i_6) "th"(v_1 / (2 V_T))
$

又因为最下方的差动放大器有 $i_5 - i_6 = I_0 "th"(v_2 / (2 V_T))$，所以有
$
  i_("I") - i_("II")
  = I_0 "th"(v_2 / (2 V_T)) "th"(v_1 / (2 V_T))
$

===== 模拟乘法器芯片

// 暂略

=== 幅度调制

==== AM 调制

先介绍 AM 调制方法，即普通振幅调制。假设 $m(t)$ 是我们需要传递的信号，那么对其进行如下变换

$
  s(t) = [A + m(t)] cos(2 pi f_c t)
$

那么变换后的信号 $s(t)$ 就是原信号的振幅调制信号。

变换后的信号的频域成分从原始信号的低频率频域成分被拉高到高频率 $f_c$ 附近，且变换后的信号仍然包含原信号 $m(t)$ 的成分。这就使得信号在不丢失信息的情况下可以被传输到更远的距离。且类似的 $m(t)$ 可以被调制到不同 $f_c$ 分频传输，避免干扰。

信号源要调制该信号，可以使用以下流程

#figure(image("images/电子电路/信号调制/信号调理技术-1.png", width: 75%),
  caption: [
    AM 信号调制流程
  ]
)

从模拟电路角度，可以使用集成运放构建加法器，并采用模拟乘法器（例如 AD633）#footnote[模拟乘法器的构成也采用集成运放，但是复杂得多。原理上，可以采用三极管的半导体性质，构造输出电流和电压具有指数关系的指数运算电路和对数运算电路；并将两个模拟量通过取对后相加再取指数来实现乘法运算，现在市面上已经有了成熟的模拟乘法集成电路售卖。]来实现该调制过程。

当然，通过编写程序逻辑，DSP芯片/FPGA 也可以实现该过程，且精度更高得多。

#theorem("AM 调制信号的频域成分")[
  接下来分析 AM 调制信号的频域成分

  考虑原信号 $m(t)$ 的傅里叶变换为 $M(j omega)$，那么调制信号 $s(t)$ 有

  $
    s(t) = cal(F)([A + m(t)] cos(2 pi f_c t)) quad #footnote[规定 $omega_c = 2 pi f_c$，下同] \

 = 1 / (2 pi) (cal(F)(A + m(t)) * cal(F)(cos(omega_c t))) \
 = 1 / (2 pi) (2 pi A delta(omega) + M(j omega)) * (pi [delta(omega - omega_c) + delta(omega + omega_c)]) \

 = A pi [delta(omega - omega_c) + delta(omega + omega_c)] + 1/2 [M(j (omega - omega_c)) + M(j (omega + omega_c))]
  $

  观察表达式，原本位于 $M(j omega)$ 处的频域成分被平移到了 $omega_c$ 和 $-omega_c$ 处，且仍然包含了原信号的频域成分。所以 AM 调制实际上是在频域上将信号的频域成分平移到更高频率处。

  #figure(image("images/电子电路/信号调制/信号调理技术-2.jpg", width: 75%),
    caption: [
      AM 调制的频域示意图
    ]
  )
]

接下来讨论 AM 信号的解调方法，从模拟电路的角度，可以采用整流电路和包络提取电路来实现。

回顾 AM 信号的表达式 $s(t) = (A + m(t))cos(omega_c t)$，高频信号振动的幅值为 $A + m(t)$，故我们可以通过提取该高频信号振动的包络线（表现振动幅值的成分）来近似得到原信号 $m(t)$（加上一个直流偏置 $A$）。

#figure(image("images/电子电路/信号调制/信号调理技术-3.png", width: 75%),
  caption: [
    AM 调制的简易解调电路
  ]
)

首先，采用全桥整流，将 AM 信号的负半周翻转为正半周，得到一个全正的波形。

接下来，如图所示，先使用一个较大电容来进行滤波，滤除及其高频的成分（图中左方电容）；接下来采用一个 C-R 电路来近似提取包络（图中右方结构）。

#figure(image("images/电子电路/信号调制/信号调理技术-4.jpg", width: 75%),
  caption: [
    包络提取电路的近似原理。
  ]
)

包络提取电路之所以能够提取该 AM 信号的包络线，是利用了电容的电压保持特性。如图所示，选用容值较小的电容，可以使得外信号在达到峰值后，电容迅速充电到峰值电压；而当外信号开始下降时，电容由于电压保持特性，电压不会立刻下降，而是缓慢放电，保持电压在峰值附近，直到下一个峰值到来。

所以，该电路就通过电容的充放电特性，近似实现了包络提取的功能，将 AM 信号的有用部分提取出来了。

实际上，如果有DSP芯片/FPGA，还可以用数字信号的运算方式进行解调，且能够达到高得多的精度。

将 $s(t)$ 与本地振荡器 $cos(omega_c t + phi)$ 相乘，有

$
  s(t) cos(omega_c t + phi) = (A + m(t)) cos(omega_c t) cos(omega_c t + phi) \

  = (A + m(t)) / 2 [ cos(phi) + cos(2 omega_c t + phi) ]
$

原信号化为一低频分量 $(A + m(t)) / 2 cos phi$ 和另一高频 AM 调制波 $(A + m(t)) / 2 cos(2 omega_c t + phi)$ 的叠加。此时，对该系统进行低通滤波，就可以滤除高频成分，得到信号的低通部分 $(A + m(t)) / 2 cos phi$，从而解算得到原信号 $m(t)$。

#line(length: 100%)

课本上更常见的 AM 信号的表达式为
$
  u_("AM")(t) = [V_("m0") + k_a v_Omega (t)] cos(omega_c t)
$

为了便于讨论，令 $v_Omega (t) = V_(Omega m) cos (Omega t)$ 为单音信号，那么 AM 调制信号可以表示为
$
  u_("AM")(t) = [V_("m0") + k_a V_(Omega m) cos (Omega t)] cos(omega_c t) \
  = V_("m0") [1 + M_a cos (Omega t)] cos(omega_c t)
$

其中 $M_a = (k_a V_(Omega m)) div V_("m0")$，被称为调幅度。

==== DSB 调制

DSB 调制指代双边带调制，它的一大特点就是搬移后的频谱没有载波频率冲激，其表达式如下所示
$
  u_("DSB") (t) = k_a v_Omega (t) cos (omega_c t)
$

如果 $v_Omega (t) = V_(Omega m) cos (Omega t)$ 是单音信号，那么
$
  u_("DSB") (t) = (k_a V_(Omega m)) / 2 [ cos((omega_c + Omega) t) + cos((omega_c - Omega) t) ]
$

可以发现，DSB 调制信号的频谱成分仅包含 $omega_c + Omega$ 和 $omega_c - Omega$ 处的两个冲激，不包含位于 $omega_c$ 处的冲激信号，且其带宽 $"BW"_("DSB") = 2 F_("max")$。

同时可以发现，DSB 调制信号的得到过程仅和相乘（搬移）有关。

==== SSB 调制

SSB 调制指代单边带调制，它的特点是仅仅取 DSB 调制信号的一个边带，从而节省了频谱资源，其表达式如下所示
$
  u_("SSB") (t) = (k_a V_(Omega m)) / 2 cos((omega_c + Omega) t) \ 或 \
  u_("SSB") (t) = (k_a V_(Omega m)) / 2 cos((omega_c - Omega) t)
$

要获得 SSB 调制信号，可以先用相乘器获得 DSB 调制信号，然后使用窄带带通滤波器滤除不需要的边带；或采用 Hartley 调制法通过相移获取单边带信号。

SSB 调制信号的带宽为 $"BW"_("SSB") = F_("max")$。

==== 利用 C 类功放的实际振幅调制电路

实际的振幅调制电路的一个典型例子是高电平调幅电路，其主要利用 C 类功放的振幅调制特性实现振幅调制。例如下方是利用集电极调制特性的高电平调幅电路

#figure(image("images/电子电路/信号调制/振幅调制、解调与混频-5.png", width: 95%),
  caption: [
    一个带批注的高电平调幅电路，其核心是 C 类功放。通过在集电极施加调制信号，调控载波的振幅，实现振幅调制。
  ]
)

此时 C 类功放正工作在过压状态，这使得 $V_("cm")$ 将随着 $V_("CC")$ 的增大而近似线性增大。该调制电路具有不错的线性度，同时处于 C 类功放过压状态，所以效率也相对高。

#figure(image("images/电子电路/信号调制/振幅调制、解调与混频-6.png", width: 85%),
  caption: [
    同理，基极调制特性也能用于振幅调制
  ]
)

==== 包络检波振幅调制解调器

#figure(image("images/电子电路/信号调制/振幅调制、解调与混频-10.png", width: 85%),
  caption: [
    包络检波解调器
  ]
)

对于该二极管解调电路而言，若输入信号 $v_s (t)$ 的表达式为
$
  v_s = V_("m0") (1 + M_a cos(Omega t)) cos(omega_c t)
$

那么该电路会具有一个电压传递系数 $eta_d$，将使得输出信号 $u_("AV")$ 为
$
  u_("AV") = V_("AM") + V_(Omega "M") cos (Omega t)
$

其中有
$
  cases(V_("AM") = eta_d V_("m0"), V_(Omega "M") = eta_d M_a V_("m0"))
$

上图中检波器的输入电阻和负载有关，如果认为二极管导通时的压降相较于信号没有什么影响，那么该电路大致满足
$
  R_i approx 1/2 R_L
$

该解调器有两种主要的失真形式

1. 惰性失真：当 RC 电路的时间常数过大时，输出信号无法及时跟随输入信号的包络线变化，造成失真。

#figure(image("images/电子电路/信号调制/振幅调制、解调与混频-11.png", width: 85%),
  caption: [
    惰性失真
  ]
)

这要求二极管检波器的电容放电速率高于包络线变化速率，经验公式表示时间常数应当满足
$
  R C <= sqrt(1 - M_a^2) / (Omega M_a)
$

其中 $M_a$ 是调幅度，$Omega$ 是调制信号的角频率。

2. 底部切割失真：当包络检波电路后方接入一阻容耦合的电路时，可能产生该失真。

#figure(image("images/电子电路/信号调制/振幅调制、解调与混频-12.png", width: 70%),
  caption: [
    底部切割失真
  ]
)

$
  M_a <= (R_L parallel R) / R
$

// ...

#line(length: 100%)

要设计实际的包络检波器，器件参数应当满足以下几个特性

1. 品质因数：$Q_L = omega_c C_s (R_s parallel R_("id")) >> 1$，其中 $R_s, C_s$ 是等效的输入电流源的并联负载值和容值，$R_("id")$ 是输入电阻。

==== 同步检波振幅调制解调器

// ...


// P64 3-2 3-3, 4, 6
// 4-14 15 16
// 5-1 2 3 8 9 11
// 7-2 5 6 7 8

// P221 - 228 混频器

=== 角度调制

角度调制主要分为两种，频率调制（FM）和相位调制（PM）。其基本原理是通过改变载波信号的频率或相位来传递信息。它们都是非线性调制，因为其频谱结构将会改变。

设载波信号 $v = V_m cos phi(t)$，那么可以通过改变 $phi(t)$ 的变化率来实现频率调制，通过直接改变 $phi(t)$ 来实现相位调制。

*频率调制定义*为
$
  phi(t) = omega_c t + k_f integral_0^t m(tau) d tau + phi_0
$

如果定义 $w(t) = (d phi(t)) / (d t)$，那么频率调制也可以用其瞬时频率来描述
$
  w(t) = omega_c + k_f m(t)
$

其中 $k_f$ 被称作频率灵敏度，$Delta omega(t) = k_f m(t)$ 被称作频偏，根据输入信号变化，该值具有最大值 $k_f abs(m(t)_("max"))$，被称作最大频率偏移。

$k_f$ 越大，频率调制信号的频谱成分越宽，同时抗干扰能力越强。

*相位调制定义*为
$
  phi(t) = omega_c t + k_p m(t) + phi_0
$

其中 $k_p$ 被称作相位灵敏度，$Delta phi(t) = k_p m(t)$ 被称作相位偏移，根据输入信号变化，该值具有最大值 $k_p abs(m(t)_("max"))$，被称作最大相位偏移。

同理，相位调制也具有频率灵敏度和最大频率偏移的概念；频率调制也具有相位灵敏度和最大相位偏移的概念，其计算同理。

#line(length: 100%)

调频信号的带宽有工程近似公式
$
  B_("FM") = 2(m_f + sqrt(m_f) + 1) dot Omega/(2 pi)
$

其中 $m_f$ 是调频指数，$Omega$ 是调制信号的最高角频率。

调频信号的功率有工程近似公式
$
  P_("FM") = 1/2 U_c^2 / R_L = P_c
$

// 这是根据 Parseval 定理计算的结果，将各个频谱的功率相加得到的总功率。

==== 频率调制

生活中更常用的调制方式是频率调制 FM，FM 调制的信号表达式为

$
  s(t) = A cos[omega_c t + k_f integral_(-oo)^(t) m(tau) d tau]
$

其中 $k_f$ 是调频灵敏度，$m(t)$ 是原始信号。

该信号的调制可以采用正交调制法实现，具体流程如下

#figure(image("images/电子电路/信号调制/信号调理技术-5.png", width: 85%),
  caption: [
    FM 信号调制流程
  ]
)

依据三角函数的和差化积公式，有

$
  s(t) = A cos(omega_c t) cos(k_f integral_(-oo)^(t) m(tau) d tau) - A sin(omega_c t) sin(k_f integral_(-oo)^(t) m(tau) d tau)
$

称该和式的两项分别为 $I$ 路分量和 $Q$ 路分量，通过两个正交的载波 $cos(omega_c t)$ 和 $sin(omega_c t)$ 分别与 $I$ 路和 $Q$ 路分量相乘，再将两路信号相加，就可以得到调制信号。

该信号的解调也分模拟和数字两种方式。从模拟电路角度，可以采用微分电路对信号进行微分，有

$
  (d s(t))/(d t) = -A(omega_c + k_f m(t)) sin[omega_c t + k_f integral_(-oo)^(t) m(tau) d tau]
$

该信号转化为一个高频振荡信号 $sin(omega_c t + k_f integral_(-oo)^(t) m(tau) d tau)$ 和一个低频包络 $A(omega_c + k_f m(t))$ 的乘积。类似于 AM 信号的解调，可以采用包络提取电路来提取该信号的包络，从而近似得到原信号 $m(t)$。

#figure(image("images/电子电路/信号调制/信号调理技术-6.png", width: 85%),
  caption: [
    FM 调制的简易解调电路
  ]
)

也可以采用数字正交解调法来解调 FM 信号，具体原理是通过数学运算求出 I 路和 Q 路分量。

将原信号 $s(t)$ 与本地振荡器 $cos(omega_c t + phi)$ 相乘，有

$
  s(t)cos(omega_c t + phi) = A/2 cos(k_f integral_(-oo)^(t) m(tau) d tau - phi) + \ A/2 cos(2 omega_c t + k_f integral_(-oo)^(t) m(tau) d tau + phi)
$

可以发现原信号化为一低频分量和另一高频 FM 调制波的叠加。此时，对该系统进行低通滤波，就可以滤除高频成分，得到信号的低通部分 $A/2 cos(k_f integral_(-oo)^(t) m(tau) d tau - phi)$。

$
  "LPF"(s(t) cos(omega_c t + phi)) = A/2 cos(k_f integral_(-oo)^(t) m(tau) d tau - phi) prop I(t)
$

同理也有#footnote[LPF 算符指代使用低通滤波器过滤]

$
  "LPF"(s(t) sin(omega_c t + phi)) = A/2 sin(k_f integral_(-oo)^(t) m(tau) d tau - phi) prop Q(t)
$

要解算 $m(t)$，可以应用两者作比，有

$
  (Q(t)) / (I(t)) = tan(k_f integral_(-oo)^(t) m(tau) d tau - phi)
$

从而有

$
  m(t) = (1)/(k_f) [ (d)/(d t) arctan((Q(t))/(I(t))) ]
$

就这样，我们通过数学运算，解算出了原信号 $m(t)$。

接下来更具体地介绍与 FM 调频电路相关的电路结构，调频电路主要分为直接调频电路和间接调频电路两种，直接调频是通过直接控制振荡器的频率来改变振荡频率的电路，本质是通过电压控制产生变化的震荡电压，从而实现频率调制。

===== 变容二极管调频电路

PN 结实际上具有电容效应，当 PN 结反向偏置时，PN 结呈现势垒电容效应，且容值随反向偏置电压变化而变化。
$
  C_j (v) = (C_j (0)) / (1 + V / V_B)^n
$

其中 $C_j (v)$ 表明 PN 结在反向偏置电压 $v$ 下的结电容，$C_j (0)$ 是零偏压下的结电容，$V_B$ 是导通电压；$n$ 是指数，取决于 PN 结的结构。

如果在变容二极管上加静态工作电压 $V_Q$ 和一个单频调制信号 $v_Omega (t) = V_Omega cos Omega t$，那么结电容将随时间变化，根据一些数学计算后有
$
  C_j = C_0 / (1 + V_Q / V_B)^n dot [1 + m cos Omega t]^(-n)
$

其中前部分 $C_0 / (1 + V_Q / V_B)^n$ 被称作静态结电容 $C_("jQ")$ ，在调制过程中是常数；而其中的 $m$ 指代调制系数，调制系数的表达式为
$
  m = V_(Omega m) / (V_B + V_Q)
$

#figure(image("images/电子电路/信号调制/角度调制、解调和混频-1.png", width: 65%),
  caption: [
    变容二极管调频电路
  ]
)

然后在前半段的 Colpitts 振荡电路中，有谐振频率应该为 $omega = 1 / sqrt(L C)$，如果认为 $C_j >> C_1, C_2, C_3$，那么谐振频率可以近似为
$
  omega_0 = 1 / sqrt(L C_j) = 1 / sqrt(L C_("jQ")) dot (1 + m cos Omega t)^(n/2)
$

于是，Colpitts 振荡器的输出信号频率就受到 $C_j$ 控制，通过 $u_Omega$ 给予 $C_j$ 外部电压改变其容值，以改变谐振频率，从而实现频率调制。

如果 $n = 2$，那么谐振频率就仅包含单一调制频率 $Omega$ 的成分，从而实现理想的频率调制。但是若 $n != 2$，那么作后式的泰勒展开，会发现式子中包含偏移的中心频率 $Delta w_0$ 和各类高次谐波如 $cos 2 Omega t$。

省去数学推导，这里只列写结论，有

1. 中心频偏 $Delta w_0 = n/8 (n/2 - 1) m^2 omega_0$；
2. 目标调频频率的最大频偏 $Delta omega_m = n/2 m omega_0$；
3. 计算可以得到调频灵敏度 $S_f = n/2 omega_0 / (V_B + V_Q)$。

#line(length: 100%)

上面的电路存在一个缺陷，Colipitts 振荡器的输出直接接到变容二极管两端，实质上也会引入对 $V$ 的影响，进而影响 $C_j$，从而引入非线性失真。为了解决这个问题，可以引入变容二极管的部分接入电路。

#figure(image("images/电子电路/信号调制/角度调制、解调和混频-2.png", width: 45%),
  caption: [
    改进的变容二极管调频电路
  ]
)

当变容二极管受到来自振荡器的输入时，两个变容二极管会近似均摊振荡器的输出电压，且由于两者接入方向相反，故它们的电容变化一个变大一个变小，从而抵消了对振荡器输出的影响，减小了非线性失真。

#line(length: 100%)

也有使用 Pierce 振荡器的变容二极管调频电路，如下图所示。

#figure(image("images/电子电路/信号调制/角度调制、解调和混频-3.png", width: 45%),
  caption: [
    Pierce 振荡器变容二极管调频电路
  ]
)

此类振荡器构成的调频电路的中心频率更加稳定，但是调频灵敏度较低。

===== 通过调相电路实现间接调频

在上文中提到，通过改变变容二极管的容值，振荡器的振荡频率将发生改变，从而实现频率调制。这种直接改变振动频率的调制方式被称为直接调频。

我们知道，调频和调相信号在信号相位上的影响之间相差一个积分，如果将调相信号进行积分，就可以得到一个频率调制信号；反之，如果将频率调制信号进行微分，就可以得到一个调相信号。

如果将输入信号接入积分器，将积分器的输出作为振荡器的控制电压，进行相位调制，然后再通过振荡器的频率特性实现频率调制，也可以实现频率调制，这种方式被称为间接调频。

#figure(image("images/电子电路/信号调制/角度调制、解调和混频-4.png", width: 75%),
  caption: [
    间接调频电路
  ]
)

间接调频电路的核心，即可控相移网络，是由电感和变容二极管构成的 LC 并联谐振网络，该网络的阻抗随变容二极管的结电容变化而变化，从而引起相移的变化。

具体来说如果

===== 通过控制时延实现间接调频

===== 通过矢量合成法实现间接调频

=== 角度解调
解调指的是从调频波中恢复出原始的调制信号。

==== 常用解调方法介绍
如果存在一个网络，使得网络输出的信号幅度和输入信号的频率成某种线性函数关系，那么就可以通过该网络实现频率解调，这种网络被称作斜率鉴频器。

也有对应的相位鉴频器，指的是存在一个网络，使得网络输出的信号幅度和输入信号的相位成某种线性函数关系。

还有脉冲计数鉴频器，先通过某种非线性方法，将调频波通过非线性变换转换为脉冲序列，然后通过计数脉冲的个数来实现解调。

==== 鉴频器与鉴频特性曲线
鉴频器的鉴频特性曲线描述了鉴频器输出信号幅度与输入信号频率的关系。

// 有待补充，朋友

== 传输线变压器

传输线变压器是一种特殊的耦合元器件，通过将传输线绕在磁芯上所构成。

#figure(image("images/电子电路/放大电路/传输线变压器与魔T混合网络-1.png", width: 75%),
  caption: [
    传输线变压器的图例和实物图
  ]
)

在合适的工作频率下，传输线变压器上的传输线具有*两条线上输入电压和输出电压相同、两条线上电流大小相等且反向的特性*，即

$
  cases(
    v_13 = v_24 = v,
    i_12 = -i_34 = i,
  )
$

利用这个特性，可以构建如下的具有一定功能的拓扑。

=== 倒相器

#figure(image("images/电子电路/放大电路/传输线变压器与魔T混合网络-2.png", width: 55%),
  caption: [
    传输线变压器构成的倒相器
  ]
)

负载 $R_L$ 上的电压和信号源的电压相位相反。

=== 阻抗变换网络

#figure(image("images/电子电路/放大电路/传输线变压器与魔T混合网络-3.png", width: 95%),
  caption: [
    传输线变压器构成的阻抗变换网络
  ]
)

以 4:1 变换网络为例，设负载处的电压为 $v_2 = v_0$，流过负载的电流为 $2i$；那么出于 $v_3$ 和 $v_2$ 短接，那么应当有
$
  v_3 = v_2
$

而因为传输线变压器的特性，有
$
  v_13 = v_24, v_14 = v_12 + v_34 = v_13 + v_24 = 2v_24 = 2v
$

所以从 13 口看入的输入电阻阻值应当为
$
  R_i = (2v) / i = 4 v / (2i) = 4 R_L
$

=== 魔 T 混合网络

#figure(image("images/电子电路/放大电路/传输线变压器与魔T混合网络-4.png", width: 85%),
  caption: [
    传输线变压器构成的阻抗变换网络
  ]
)

魔 T 混合网络是一种可以实现信号功率的合成与分配的网络结构。在射频电路中有着广泛的应用。

观察上面的网络结构，注意 $R_c$ 和 $R_d$，现推导它们的工作状态

列写节点方程，所以有
$
  cases(
    i_d = 1 / 2 (i_a + i_b),
    i = 1 / 2 (i_a - i_b),
    i_c = 2i
  )
$

由 KVL，可以知道 $v = v_d / 2$；然后推导出他们和输入信号 $v_a, v_b$ 之间的关系
$
  cases(
    v_a = 1 / 2 i_d R_d + 2i R_c,
    v_b = 1 / 2 i_d R_d - 2i R_c
  )
$

所以最后可以推导出
$
  cases(
    i_a = v_a (R_d / 4 + R_c) / (R_d R_c) - v_b (R_d / 4 - R_c) / (R_d R_c),
    i_b = v_b (R_d / 4 + R_c) / (R_d R_c) - v_a (R_d / 4 - R_c) / (R_d R_c)
  )
$

观察该式，可以发现以下特点

- 当 $v_a = v_b = v$，输入信号等幅反相#footnote[注意：图中的 $v_b$ 输入极中，正极在地，负极在信号线，所以 $v_a = v_b$ 实际上表示信号反相。]，此时有
$
  i_a = i_b = (2v) / R_d
$

此时所有功率全部由 $R_d$ 消耗，与 $R_c$ 无关，且两端分别的等效输入电阻都为 $R_d / 2$。

- 当 $v_a = -v_b = v$，输入信号等幅同相，此时有
$
  i_a = -i_b = v / (2R_c)
$

此时所有功率全部由 $R_c$ 消耗，与 $R_d$ 无关，且两端分别的等效输入电阻都为 $2R_c$。

特殊地，如果控制 $R_d = 4 R_c$，那么无论输入信号之间存在何种关系，总有式子的后项为 0，即 $i_a, i_b$ 分别只和 $v_a, v_b$ 有关，互不影响。

因此，我们称 $R_d = 4 R_c$ 为该网络的隔离条件，它使得两输入端口的输入电阻相互隔离，互不影响。

#figure(image("images/电子电路/放大电路/传输线变压器与魔T混合网络-5.png", width: 55%),
  caption: [
    双传输线变压器构成的魔 T 混合网络变种
  ]
)

该拓扑具有上图的常见变种，它的参数不再做详细推导，在此直接列出

- 同相 $v_a = v_b = v$ 时，输入等效负载
$
  R_i = 2 R_c
$

- 反相 $v_a = -v_b = v$ 时，输入等效负载
$
  R_i = 2 R_d
$

- 隔离条件为 $R_d = R_c$。

出色的隔离与变换能力，使得魔 T 混合网络可以轻易地将多个放大器输出合并到目标负载上，且实现阻抗匹配，这使得它可以用作一个良好的功率合成器。

#figure(image("images/电子电路/放大电路/传输线变压器与魔T混合网络-6.png", width: 95%),
  caption: [
    功率合成电路
  ]
)


// 6-1 2 3 4
// 6-5 6 7
// 6-9 11 12 14 15
== 振荡器

振荡器指的是在没有外部信号输入的条件下，能够产生一定参数的交流信号的电子电路。振荡器本质上也是一个能量转换器，将输入的直流能量转换为振荡信号的交流能量输出。

实现振荡器的一类方案是采用反馈结构，利用振荡器的输出信号的一部分经过反馈网络送回输入端，从而在没有外部输入信号的条件下维持振荡。

=== 放大器正常工作的必要条件

先介绍反馈式放大器的系统框图

#figure(image("images/电子电路/振荡器/振荡器-1.png", width: 65%),
  caption: [
    反馈式放大器系统框图
  ]
)

该系统的最终目的是通过反馈网络产生稳定的定参交流信号 $X_o$，且使得 $X_o$ 能通过反馈网络稳定自身的输出状态。为此，该反馈网络要经过以下步骤来达到这个状态：

1. 起振：系统从截止状态到产生振荡信号，要经过一个启动过程，这个过程需要满足一定的条件，才能使系统从静止状态进入振荡状态。

2. 稳振：系统在起振后，输出信号幅度会逐渐增大，直到达到一定的稳定状态，此时系统的状态趋于稳定，输出信号幅度不再变化。

3. 维持振荡：系统在稳振后，在受到外界或内部的噪声信号的干扰后，稳振的状态仍然能够维持下去，而不会因此被破坏。

#figure(image("images/电子电路/振荡器/振荡器-2.png", width: 60%),
  caption: [
    方波振荡器的输出波形，注意振荡器从红色箭头后方开始起振，并在一定时间后达成稳定振动，且能在之后时间中维持振荡状态
  ]
)

为了保证上述三个步骤的顺利进行，反馈式放大器需要满足以下条件

==== 起振条件

振荡器在起振阶段，要求反馈信号能够使放大器的输出信号逐渐增大，即应当有
$
  overbracket(dot(X_0) dot dot(A) dot dot(K_f), "反馈信号的输出效果") + overbracket(0, "没有输入信号") > dot(X_0)
$

所以应当有 $dot(A) dot dot(K_f) > 1$，这也可以被描述为
$
  T(j omega) = dot(A) dot dot(K_f) > 1
$

这便是系统的起振条件，名为巴克豪森判据，有
$
  cases(
    abs(T(j omega)) > 1,
    angle(T(j omega)) = 2 k pi quad (k in bb(Z))
  )
$

增益绝对值大于 1 保证了系统具有充分的启动动力，相位了保证该反馈为严格的正反馈，从而使得反馈信号能够正确叠加到输入信号上。

==== 平衡条件

如果振荡器总是工作在 $abs(T(j omega)) > 1$ 状态下，那么反馈振荡器的输出信号幅值会总在增大，而不会达到预想的稳定状态；所以，随着 $abs(dot(X_0))$ 的逐渐增大，$abs(T(j omega))$ 应当逐渐趋向于 1，从而使得系统达到平衡状态，即
$
  T(j omega) = dot(A) dot dot(K_f) = 1
$

这便是振荡器的平衡条件。
$
  cases(
    abs(T(j omega)) = 1,
    angle(T(j omega)) = 2 k pi quad (k in bb(Z))
  )
$

设计者在设计振荡器时，通常会设定振荡器的目标输出频率 $omega_o$，使得该频率下振荡器满足对应相位关系
$
  angle(T(j omega_o)) = 2 k pi quad (k in bb(Z))
$

然后利用器件的非线性特性或人为设计衰减电路，使得振荡器随着输出信号幅值的增大，$abs(T(j omega))$ 的值逐渐减小。

#figure(image("images/电子电路/振荡器/振荡器-3.png", width: 50%),
  caption: [
    振荡器的增益幅度特性曲线示意图
  ]
)

这样，振荡器就会在指定输出频率 $omega_0$ 处开始起振，然后随着输出幅值的增大，从起振状态逐渐趋向于平衡状态，最终在指定幅值达到平衡。

振荡器根据其相位特性和幅度特性，分别被钳位到了指定的输出频率 $omega_0$ 和输出幅值 $V_("iA")$，从而输出指定参数的交流信号。这便是振荡器维持振荡的原理。

==== 稳定条件

一个倒立的酒杯在没有外力干扰的情况下，能够保持稳定离起的状态；但是如果有风吹过，酒杯就会倒下。而一个不倒翁在相当的外力干扰下，都能够重新恢复到稳定的站立状态。

同理类比，振荡器光能够到达平衡状态是不够的，好的振荡器系统还需要在受到扰动后，系统能够重新回到平衡状态。称振荡器能够在受到扰动后重新回到平衡状态为振荡器的稳定性。振荡器是否稳定的判据被称为振荡器的稳定条件。

#figure(image("images/电子电路/振荡器/振荡器-4.png", width: 60%),
  caption: [
    另一个振荡器的增益幅度特性曲线示意图
  ]
)

上图是另一个系统的增益幅度特性曲线示意图，其具有两个平衡点 $V_("iA"), V_("iB")$。当系统工作在 $V_("iA")$ 时，如果出于噪声，输出幅值增大，工作点右移，那么系统的 $abs(T(j omega))$ 就将下降，系统的反馈信号变小，输出幅值将因此减小，重新回到 $V_("iA")$ 点；同理，如果输出幅值减小（左移），反馈信号变大，输出幅值将增大，也将重新回到 $V_("iA")$ 点。所以工作点 $V_("iA")$ 是稳定的。

但是，工作点 $V_("iB")$ 不具备该特性，输出幅值增大（右移）将使得 $abs(T(j omega))$ 增大，反馈信号增大，输出幅值继续增大，远离 $V_("iB")$ 点。

所以，工作点 A 具备抗干扰能力，是稳定的，而工作点 B 则是不稳定的。观察发现，稳定工作点的输出信号的变化和 $T(j omega)$ 的变化是反向的，互相起到抑制作用，这表明此处工作点稳定的必要条件为
$
  (d abs(T(j omega))) / (d V_i) |_(V_("iA")) < 0
$

同样地，相位特性也应当满足类似条件，才能保证系统的稳定性
$
  (d angle(T(j omega))) / (d omega) |_(omega_o) < 0
$

称这组公式为振荡器的稳定条件。
$
  cases(
    (d abs(T(j omega))) / (d V_i) |_(V_("iA")) < 0,
    (d angle(T(j omega))) / (d omega) |_(omega_o) < 0
  )
$

=== 三点式振荡器

先介绍 LC 串联回路和 LC 并联回路的谐振特性。

对于 LC 串联回路，其阻抗为
$
  Z_("series") = j (omega L - 1/(omega C))
$

当 $omega = 1 / sqrt(L C)$ 时，有 $Z_("series") = 0$，此时回路谐振，回路相当于短路，称这时的频率为谐振频率 $omega_("0")$。当 $omega > omega_0$，回路呈现感性特性；当 $omega < omega_0$，回路呈现容性特性。

对于 LC 并联回路，其阻抗为
$
  Z_("parallel") = (L / C) / (j (omega^2 L C - 1))
$

当 $omega = 1 / sqrt(L C)$ 时，有 $Z_("parallel") -> oo$，此时回路谐振，回路相当于开路，称这时的频率为谐振频率 $omega_("0")$。当 $omega > omega_0$，回路呈现容性特性；当 $omega < omega_0$，回路呈现感性特性。

利用 LC 回路的谐振特性，可以设计出包含 LC 回路的三点式振荡器。其具有两种常见的结构，分别是 Colpitts 振荡器和 Hartley 振荡器。

==== Colpitts 振荡器

Colpitts 振荡器又名电容三点式振荡器，之所以被命名为“电容式”，是因为该振荡器的 BJT 发射级和选频网络中的两个电容直接连接。

#figure(image("images/电子电路/振荡器/振荡器-5.png", width: 90%),
  caption: [
    Colpitts 振荡器电路示意图（左为完整电路图，右为交流通路）
  ]
)

图中的 $R_("B1"), R_("B2")$ 是偏置电路，$C_C$ 是耦合电容隔离直流，$C_B$ 是旁路电容以保证三极管工作点稳定；$L, C_1, C_2$ 构成了电路的选频网络。

#figure(image("images/电子电路/振荡器/振荡器-6.png", width: 60%),
  caption: [
    Colpitts 交流通路的反馈网络示意
  ]
)

同时，从选频网络的两个电容的中间抽取反馈信号 $x_f$ 送回三极管的基极，形成正反馈回路，从而构成串联正反馈振荡器。

#line(length : 100%)

1. 依据相位条件推算振荡时的频率

因为目标是共射极放大器，所以 $v_i^'$ 和 $v_o$ 反相，又因为这是 $v_i -> 0$ 的串联反馈放大器，所以 $v_i^' = v_i - v_f$，可以得到$v_i^'$ 和 $v_f$ 也反相。

所以 $v_f$ 和 $v_o$ 应当同相，出于巴克豪森判据的相位条件，要求反馈网络的相移为 $2 k pi$。所以应当有
$
  angle(dot(K_f)) = dot(V_f) / dot(V_o) = 2 k pi
$

出于此，谐振回路应当表现出纯阻性#footnote[当两纯电抗并联时，如果两阻抗共轭，那么电路就表现出纯阻性]，所以有
$
  j (- 1 / (omega C_1)) = -j (omega L - 1 / (omega C_2))
$

因此满足 $angle(T(j omega)) = 2 k pi$ 的特征角频率 $omega_0$ 为
$
  omega_0 = 1 / sqrt(L C_t); quad C_t = (C_1 parallel C_2)
$

2. 分析反馈振荡器的起振和平衡条件

分析 $dot(K_f)$，那么有
$
  dot(K_f) = dot(V_f) / dot(V_o) = X_("C2") / (X_("C1") + X_("C2"))
$

出于纯阻性结论，应该有 $X_L + X_("C1") + X_("C2") = 0$，所以代换应该有
$
  dot(K_f) = - X_("C2") / X_L
$

又因为 $X_L = j omega L, X_("C2") = -j 1 / (omega C)$，所以计算可以得到
$
  dot(K_f) = 1 / (omega^2 L C_2) = C_t / C_2
$

该反馈系数的相位正好为 0，且总是小于 $1$。推导同样也说明了选频网络本身是线性的，在特定工作频率下给出线性正反馈。

但光有 $dot(K_f)$ 仍然不够，其值小于 $1$，不足以满足起振条件，为了满足之，考虑放大器增益 $dot(A)$，要满足 $abs(T(j omega)) > 1$，应当有
$
  -dot(A) dot dot(K_f) = -dot(A) C_t / C_2 > 1
$

之所以添加负号，是出于 $v_i^' = v_i - v_f$，净输入量为相反相位的反馈量，所以加负号以表示这一相位关系，接下来分析共射振荡器的增益 $dot(A)$

分析 BJT，其放大系数 $A$ 应当为
$
  A = - g_m / g_L
$

其中 $g_m$ 是 BJT 本身的跨导，而 $g_L$ 是放大器后方所接的整个负载对 BJT 集电极的等效导纳。如果进一步分析，$g_L$ 应当由两部分组成
$
  g_L <- g_L', g_i
$

其中 $g_L$ 是出于负载 $R_L$ 和选频网络的等效电阻 $R_("eq") = w_o L Q$ 所产生的；而 $g_i$ 是出于 $R_E, C_(b'e), r_("ce")$ 等元件产生的等效电阻 $R_i$ 所产生的

略去推导过程，给出以下结论，要满足起振条件，应当有
$
  g_m n / (g_L^' + n^2 g_i) > 1; quad n = C_1 / (C_1 + C_2^')
$

其中 $C_2^' = C_2 parallel C_(b'e)$；$n$ 约等于反馈系数 $dot(K_f)$；$(g_L^' + n^2 g_i)$ 约为放大器看出去的输入电阻。该表达式的实质是
$
  A_v(omega_0) dot k_f > 1
$

考虑到输出端本质上是阻抗，这意味着放大器的放大信号和输入信号是具有相位差的，这说明输出信号对谐振回路一定会略有失谐，不过这类失谐的程度不大，工程中可以近似认为
$
  omega_0 = 1 / sqrt(L C_t)
$

工程设计中，通常也会选择合适的工作参数来满足起振条件。例如 $I_("CQ") approx (1 - 5)"mA"$，振荡管 $f_T > (5 omega_0) / (2 pi)$，$R_L > 1 "kOhm"$。

工程中还有起振条件近似判断公式
$
  beta > C_1 / C_2 + r_("be") / R_L' dot C_2 / C_1
$

空载时，$R_L^' = r_("ce")$，有载时，$R_L^' = R_L parallel r_("ce") parallel r_("be")$。

==== Hartley 振荡器

Hartley 振荡器又名电感三点式振荡器，之所以被命名为“电感式”，是因为该振荡器的 BJT 发射级和选频网络中的两个电感直接连接。

#figure(image("images/电子电路/振荡器/振荡器-7.png", width: 90%),
  caption: [
    Hartley 振荡器电路示意图（左为完整电路图，右为交流通路）
  ]
)

同理，此类振荡器具有谐振频率
$
  omega_0 = 1 / sqrt(L_t C); quad L_t = (L_1 parallel L_2)
$

==== Clapp 振荡器

Clapp 振荡器是 Colpitts 振荡器的改进型，主要区别在于其在选频网络中添加了一个电容 $C_3$，从而使得振荡器的频率稳定性更好。

#figure(image("images/电子电路/振荡器/振荡器-8.png", width: 90%),
  caption: [
    Clapp 振荡器电路示意图（左为完整电路图，右为交流通路）
  ]
)

该电路有以下结论，电路的谐振频率为
$
  omega_0 = 1 / sqrt(L C_3);
$

这在 $C_1, C_2$ 显著大于 $C_3$ 时成立。因为回路的总电容 $1 / C = 1 / C_1 + 1 / C_2 + 1 / C_3$，所以当 $C_1, C_2$ 显著大于 $C_3$ 时，其余两项的影响很小，有 $C approx C_3$。

该振荡器的振荡谐振频率和 $C_1, C_2$ 的变换关系不大，这使得三极管的寄生电容（如图 (b)）所示对振荡频率的影响减小，从而提升了振荡器的频率稳定性。

=== 石英晶体振荡器

石英的主要成分是 $"Si""O"_2$，按照一定切割加工方式将其加工为晶体薄片，可以使其表现出压电效应：即在晶体两端施加电压时，晶体会发生机械形变；这种机械形变将会使得晶体产生交变电场，从而使得晶体两端产生交变电压。

#figure(image("images/电子电路/振荡器/振荡器-9.png", width: 90%),
  caption: [
    石英晶体振荡器
  ]
)

石英振荡器有等效电路，它可以被等效为 $C_0$ 与 $L_q, C_q, R_q$ 串联回路的并联组合。其中 $C_0$ 是晶体的静态电容，$L_q, C_q, R_q$ 是晶体的动感参数。

这使得石英晶体具有以下特性

1. 有两个谐振频率

当左路串联通路构成谐振时，右边支路表现为串联谐振，等效为纯电阻
$
  f_s = 1 / (2 pi sqrt(L_q C_q))
$
晶振电路为纯电阻，约等于短路。#footnote[$R_q$ 在晶振电路中相当小，在接下来的分析中省略。]

当整个电路构成并联谐振时，电路等效为纯电阻
$
  f_p = 1 / (2 pi sqrt(L_q (C_q parallel C_0))) = f_s sqrt(1 + C_q / C_0)
$
晶振电路为纯电阻，约等于开路。

2. 晶振的电感/电容特性
当外部输入信号的频率 $f$ 介于 $f_s$ 和 $f_p$ 之间时，晶振表现为感性元件；而当 $f$ 小于 $f_s$ 或大于 $f_p$ 时，晶振表现为容性元件。

这是因为回路的阻抗
$
  Z = 1 / (j C_0) dot (omega L_q - 1 / (omega C_q)) / (omega^2 L_q - 1 / (C_q) + 1 / (C_0))
$

分析后项分母，当 $omega > omega_p$，有其项为正；当 $omega < omega_p$，有其项为负；分析分子，当 $omega > omega_s$，有其项为正；当 $omega < omega_s$，有其项为负。所以当 $omega_s < omega < omega_p$ 时，一正一负分数为负，乘以 $1 / (j C_0)$ 后，为正纯虚数，表现为感性元件；在范围之外反之同理。

$(f_s, f_p)$ 的区间长度是很小的，因为 $f_p = f_s sqrt(1 + C_q / C_0)$，其中 $C_0 >> C_q$，故 $f_p approx f_s$，该频带长度可能仅有几十或几百 Hz。

当晶振等效为电感时，晶振的电感值约为
$
  L_("eq") approx - 1 / ((2 pi f)^2 C_0) dot (1 - (f_s / f)^2) / (1 - (f_p / f)^2)
$

3. 高品质因数
晶振的选频网络的品质因数很高，具体在串联谐振臂中，有
$
  Q = 1 / R_q sqrt(L_q / C_q)
$

由于 $R_q$ 很小，所以 $Q$ 很大，通常在 $10^4 - 10^6$ 之间。这使得晶振能够实现很好的频率选择特性，从而实现高稳定度的振荡频率。

==== Pierce 晶体振荡器

在 Colpitts 振荡器的基础上，将选频网络中的电感替换为石英晶体，就构成了 Pierce 晶体振荡器。

#figure(image("images/电子电路/振荡器/振荡器-10.png", width: 90%),
  caption: [
    Pierce 晶体振荡器电路示意图（左为完整电路图，右为交流通路
  ]
)

出于此处的晶体被等效为 Q 值很好的电感，所以其原理和 Colpitts 振荡器类似。

要求解该振荡器的振荡频率，应当通过晶体的数据手册查阅其负载电容值和标称频率，有以下结论：当实际接入电容值和负载电容值相等时，电路振荡频率为标称频率。

此处接入的负载电容为
$
  C_L = (C_1 C_2) / (C_1 + C_2)
$

==== 串联式晶体振荡器

除了 Pierce 晶体振荡器之外，还有一种串联式晶体振荡器，其选频网络为晶体和电容的串联回路。

#figure(image("images/电子电路/振荡器/振荡器-11.png", width: 45%),
  caption: [
    串联式晶体振荡器电路示意图
  ]
)

此类振荡器也利用了晶体的谐振特性，当信号的频率 $f$ 偏离其串联谐振频率 $f_s$ 时，晶体表现为电感或电容，从而使得选频网络表现出相应的感性或容性特性，破坏对应信号的起振相位条件。

这样一来，仅有 $f = f_s$ 的频率能够满足起振条件，从而实现高稳定度的振荡频率输出。

// 可以介绍文氏电桥振荡器

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

== 电源转换

逆变器指的是将直流电转换为交流电的装置，在各个工业生产领域皆有应用。

例如，光伏发电系统中，太阳能电池板输出的为直流电，而家庭用电为交流电，所以需要逆变器将直流电转换为交流电后才能并入电网；

在交流三相电机的驱动中，也需要使用逆变器将直流电转换为交流电以驱动电机；

以及有被称作变频器的设备，可以将固定频率的交流电转换为可调频率的交流电以调节电机转速，这类设备本质上是 AC-DC-AC 的变换过程。

#line(length: 100%)

// 全桥逆变器，半桥逆变器

直流稳压电源在电子线路中有着重要的作用，主要用于为电路提供指定电压大小的稳定直流电压。例如一块电机驱动板，输入 9V DC 电源，既要给 7.4V 的舵机供电，又要给 3.3V 的单片机供电，这时就需要稳压电源将较大的输入电压转换为较小的输出电压。

为了满足这类需求，有以下两个经过工程验证，且常用的直流稳压电源设计方案

==== 线性稳压电源

最容易想到的办法是偏置电路，使用电阻分压来获得所需的电压

#figure(image("images/电子电路/电源转换/线性与开关稳压电源.png", width: 65%),
  caption: [
    偏置电路
  ]
)

但是这种方法有非常明显的缺点，若外电路有负载接入，则偏置电路的接地电阻相当于并联在分压电阻上，新的分压状态会导致输出电压下降，无法保证输出电压的稳定性。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-2.png", width: 65%),
  caption: [
    受到负载影响的偏置电路
  ]
)

我们知道稳压二极管可以在被击穿时维持其两端压差不变，因此可以使用稳压二极管来设计稳压电源，以 BZT52C3V3S 为例，其反向击穿电压为 3.3V

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-3.png", width: 65%),
  caption: [
    应用稳压二极管的降压电路
  ]
)

在这种情况下，负载接入时，稳压二极管的电流会相应变化以维持其两端电压不变，离实现需求又近了一步。

但是，稳压二极管的反向击穿电压一般仅为一个固定值，且市场上售卖的稳压二极管击穿电压也是离散的；若我希望能自主调节输出电压，购买一堆不同击穿电压的稳压二极管显然不现实。所以可以在稳压二极管电路上再加入一个偏置电路。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-4.png", width: 55%),
  caption: [
    使用偏置电路调节输出电压
  ]
)

理论上，A 点的电压将等于 B 点电压，即稳压二极管的击穿电压；同时偏置电路遵循串联分压原理，所以 R1 左端的电压理应为

$
  U_("out") = U_("bz") dot (R_1 + R_2) / R_2
$

这样，只需调节电阻大小，就可以自定义输出电压了。

但是可以发现，上图的偏置电路并未正常工作，这是因为上方的偏置电路调节电压依靠的是电阻的串联分压原理，而很明显 R1 不可能流过电流，而 R2 显然因为导线 AB 的向上分流流过了电流。两者电流不相等，故偏置电路无法工作。

为了让偏置电路发挥效用，我们希望：1) R1 和 R2 流过相同的电流；2) A 点的电压和 B 点的电压相等。为了实现这些需求，利用运算放大器的虚短特性，我们得以满足 A 点和 B 点电压相等的条件；同时，依据其虚断特性，我们可以令 A, B 两点电压相等的同时，中间不流过电流。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-5.png", width: 60%),
  caption: [
    使用运算放大器让偏置电路发挥作用
  ]
)

这样，我们就通过偏置电路，将稳压二极管的 3.3V 稳压通过偏置提高到了 5V，实现了自定义稳压值的需求。但是上述电路仍然有问题：运算放大器的电流输出能力很差，以 MCP6002T-I/SN 为例，其最大输出电流为 23mA，稳压电源很难输出较大的电流。

为了解决这个问题，传统的方法是采用三极管作电流放大电路（也有电路设计采用达林顿管，即三极管级联放大，其原理类似）。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-6.png", width: 60%),
  caption: [
    使用三极管放大运放的输出电流
  ]
)

将上述设计的部分采用集成电路技术进行封装，就得到了线性稳压模块，又称 LDO。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-7.png", width: 80%),
  caption: [
    AMS1117 是典型的线性稳压模块，在自定义偏置电路后即可工作
  ]
)

线性稳压模块简单易用，且精度较高。不过其缺点在于当输出电压远低于输入电压时，三极管上的压降较大，导致三极管功耗较高，严重发热，故 LDO 不适合大压差的工作场景，且不适合走较大电流。

针对上述问题，现在市面上更常见的设计方案是采用 NMOS 的线性稳压模块，原理类似，且较三极管损耗更小，输出电流更大。即便如此，LDO 在大压差，大电流场景下的缺点仍然存在，不可忽略。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-8.png", width: 80%),
  caption: [
    使用 NMOS 的线性稳压模块
  ]
)

==== 开关稳压电源

===== Buck 电路

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-9.png", width: 80%),
  caption: [
    开关稳压电源示意图
  ]
)

如上图所示，该电路中含有开关、电容、电感，且有一个电阻模拟外接负载。当前状态下，开关正处于闭合状态，且其它元件皆处于稳态。

若此时开关断开，不再向元器件供电，则电容将有通过二极管-电感-电容回路与电容-电阻-地回路放电的趋势，但由于电感存在，流过电感的电流不允许突变，故电感暂时将产生反向电动势阻止电容放电，电容两端电压不会立刻下降，而是会缓慢下降。

更准确地说，若电容值为 $C$，电感值为 $L$，二极管为理想二极管，负载阻值为 $R$，那么列出以下放电方程

$
  u + L C (d^2 u) / (d t^2) + L / R (d u)/(d t) = 0
$

其中 $u$ 指的是测试点处的电压，容易发现该方程形式类似于弹簧振子的阻尼振动方程，故分析该方程可知，电容放电时电压将以过阻尼/临界阻尼/欠阻尼形式下降。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-10.png", width: 60%),
  caption: [
    断开开关后，电压过阻尼缓慢下降
  ]
)

当开关闭合时，电容将通过电感-电容-地回路充电，且由于电感的存在，流过电感的电流不允许突变，故电容两端电压不会立刻上升，而是会缓慢上升。

当电容值为 $C$，电感值为 $L$，二极管为理想二极管，负载阻值为 $R$，那么列出以下充电方程

$
  U_0 - u - L C (d^2 u) / (d t^2) - L / R (d u)/(d t) = 0
$

可以发现这是非齐次二阶微分方程，而其齐次部分与放电方程相同，故分析该方程可知，电容充电时电压将以过阻尼/临界阻尼/欠阻尼形式上升，并最终趋近于 $U_0$。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-11.png", width: 60%),
  caption: [
    闭合开关后，电压欠阻尼缓慢上升
  ]
)

现在，如果我们让开关周期性闭合与断开，那么测试点处的电压将会周期性上升与下降。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-12.png", width: 60%),
  caption: [
    手动开关开关的电压波形，上升段时开关闭合，下落段时开关断开
  ]
)

现在，不妨想象我们以非常高的频率周期性闭合与断开开关，那么测试点处的电压将会在一个很小的范围内波动，几乎可以被看做是一个稳定的电压。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-13.png", width: 100%),
  caption: [
    高频率周期性闭合与断开开关的电压波形
  ]
)
我们称开关闭合的时间段占一个周期的比例为占空比，而如果在一个周期中，占空比变大，则我们可以知道电压上升的时间段变长，故输出的电压将变大；反之，占空比变小，则输出的电压将变小。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-14.png", width: 100%),
  caption: [
    在 80% 占空比和 20% 占空比下的电压波形对比
  ]
)

所以，我们就可以通过控制开关的占空比来调节输出电压的大小，这便是开关稳压电源的基本原理。图中所示的拓扑结构被称为 Buck 电路，一种降压式开关稳压电源。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-15.png", width: 100%),
  caption: [
    LM2596 是 TI 公司设计的开关稳压模块，图为其典型应用，注意右方的电感、电容、二极管构成的充放电回路
  ]
)

虽然理清了开关稳压电源的基本原理，但实际设计中仍然有很多问题需要解决。

1. 要控制开关，就必须存在一种器件，可以给出周期性闭合与断开的信号。常见的做法是使用单片机的 GPIO 口输出 PWM 信号#footnote[又称脉宽调制信号，是一种方波脉冲，其中高电平和低电平交替出现]来控制开关。

现代的许多开关稳压模块中，已经集成了 PWM 信号发生器，用户只需调节外部电路，就可以调节输出电压的大小。

2. 开关稳压电路的关键就在于开关元件，为了达成上述高频的闭合和断开，使用物理开关显然不现实，常见的做法是使用场效应管（MOSFET）作为开关元件。

将场效应管的栅极接入 PWM 信号，源极接入电路，漏极接通电源，当 PWM 信号为高电平时，场效应管导通，开关闭合；当 PWM 信号为低电平时，场效应管截止，开关断开。以此实现周期性闭合与断开。

3. 根据上述开关电源工作原理，开关稳压电源的输出总有一个小幅度的周期性波动，这种现象被称为纹波。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-16.png", width: 70%),
  caption: [
    输出电压的纹波现象
  ]
)

纹波现象是无法避免的，这是该系统的固有特性；通常情况下，合理选择电感和电容的数值，可以将纹波控制在一个较小的范围内。

此外，增加旁路电容也可以有效抑制纹波现象。

#figure(image("images/电子电路/电源转换/线性与开关稳压电源-17.png", width: 70%),
  caption: [
    增加旁路电容抑制纹波现象
  ]
)

#line(length: 100%)

// 再介绍 Boost 电路

开关电源的显著优点在于其效率较高，尤其在大压差，大电流场景下，线性稳压电源的功耗会非常大，而开关稳压电源的功耗则小得多，因为开关元件在导通时压降较小，不会产生过多的热量。

其缺点也很明显，开关电源的电路复杂；且输出电压会有纹波，稳定性和精确度不如线性稳压电源。

// 以后补充其它设计经验
=== 开关管

==== 开关管的介绍

这是物理意义上的开关，它可以控制电路的通断，通常由用户手动控制。

#figure(image("images/电子电路/电源转换/开关管与其驱动与半桥-1.png", width: 75%),
  caption: [
    机械开关
  ]
)

时常有需求，使得电路的打开与关闭不仅受到用户的控制，也受到诸如单片机、DSP、或其它逻辑系统的控制，这些系统通常不通过机械结构来控制开关，而是通过电信号来控制开关的通断，这就需要用到电子开关。

#figure(image("images/电子电路/电源转换/开关管与其驱动与半桥-2.png", width: 55%),
  caption: [
    运用 NMOS 管作为电子开关
  ]
)

使用 NMOS 管，利用其栅极电压来控制其导通与关闭，可以实现电子开关的功能。我们称这种用作开关的晶体管为开关管。

开关管的典型应用有 Buck 电路#footnote[详情请见笔记《线性稳压、开关稳压电源简述》]，开关电源依靠开关管的周期性导通与关闭，使得电压周期性上升与下降，并维持在相对稳定的范围，从而实现对输出电压的调节。

#figure(image("images/电子电路/电源转换/开关管与其驱动与半桥-3.png", width: 75%),
  caption: [
    Buck 电路，运用了开关管控制输入线路的通断，开关管接受占空比为 70% 的 3.3V PWM 信号，信号的占空比决定了输出电压的高低。
  ]
)

可以看出，在电子信号控制的逻辑电路中，开关管的开关频率可以非常高，远高于机械开关，这使得电子开关可以应用于高频电路中，例如开关电源。

==== 开关管的驱动

上方的 Buck 电路存在一个明显问题，我们知道，对于一个 Buck 开关电源而言，其输出电压 $U_("out")$ 和输入电压 $U_("in")$，PWM 信号的占空比 $D$ 之间有关系

$
  U_("out") = alpha times D times U_("in")
$

其中 $alpha$ 是一个小于 $1$ 的系数，是电路的效率因数。

而上方图中，该 Buck 电路的输出仅有 1.6V，这对于 24V 的输入电压而言过低了，究其原因，是开关管没有得到足够的驱动电压。

不妨假设 NMOS 的三极电压（对于同一个地而言）分别为 $u_("G")$、$u_("D")$ 和 $u_("S")$，则有当 NMOS 导通时，有

$
  u_("D") - u_("S") > V_("TH")
$

这就意味着，对于导通的 NMOS 而言，$u_("S") < u_("D") - V_("TH")$ 总是成立的，与 $u_("G")$ 的值无关。对于目标输出电压在 $24"V" times 70% = 16.8"V"$ 的 Buck 电路而言，若 $u_("G")$ 仅能达到 3.3V，那么其输出电压 $u_("D")$ 最多只能达到 $3.3"V" - V_("TH")$，这显然远低于 16.8V。使得该 Buck 电路无法正常工作。

所以，为了使得该 Buck 电路正常工作，必须使得 $u_("G")$ 的 PWM 波的峰值能够达到目标输出电压之上，即 $u_("G") > U_("out") + V_("TH")$，这样才能保证 NMOS 管的导通与正常输出。但是对于大部分单片机而言，其 GPIO 口的输出电压通常仅为 3.3V 或 5V，远低于目标输出电压，这就需要一个电路来提升 PWM 信号的电压，这个电路称为开关管驱动电路。

#figure(image("images/电子电路/电源转换/开关管与其驱动与半桥-4.png", width: 70%),
  caption: [
    基础的开关管驱动电路
  ]
)

上图是一个简单的开关管驱动电路示例，下方的 NMOS 栅极链接 3.3V 的 PWM 信号（示波器中绿色折线）。当 PWM 信号为高电平时，NMOS 导通，使得上方的结点接地，测试点处（示波器中红色折线）即为低电平；当 PWM 信号为低电平时，NMOS 截止，使得上方的结点通过 24V 电源和上拉电阻 10k 拉高至 24V，测试点处即为高电平。

采用这个输出 24V PWM 信号的电路去驱动开关管的栅极，可以使得开关管的栅极电压达到 24V，从而保证开关管的正常导通。

#line(length: 100%)

该电路仍然存在一些缺陷，考察 MOSFET 的结构，我们知道场效应管具有寄生电容。

#figure(image("images/电子电路/半导体器件/开关管与其驱动与半桥-5.png", width: 60%),
  caption: [
    MOSFET 的寄生电容
  ]
)

这就意味着，若要使得 MOSFET 从完全截止到导通，必须要首先给栅极上的寄生电容充电，而充电需要时间，这就导致 MOSFET 无法瞬间导通。为了保证 MOSFET 能够快速响应 PWM 信号的变化，栅极上的驱动电路必须有充足的电流输出能力，才能在短时间内给栅极电容充电，从而使得 MOSFET 快速导通。

为提高上图基础的开关管驱动电路的输出电流能力，可以向驱动电路中再加入一个推挽输出电路。

#figure(image("images/电子电路/电源转换/开关管与其驱动与半桥-6.png", width: 90%),
  caption: [
    添加推挽输出电路后的开关管驱动电路
  ]
)

推挽输出电路由上下两个 PMOS 和 NMOS 构成。如图所示，当输入 PWM 信号为高电平时，PMOS 导通，NMOS 截止，使得输出端接近 24V；当输入 PWM 信号为低电平时，PMOS 截止，NMOS 导通，使得输出端接近 0V。仍然保持了 PWM 信号的逻辑。

与此同时，得益于推挽输出电路的特性，推挽输出电路可以提供较大的电流输出能力，从而使得 MOSFET 的栅极电容能够在较短时间内充电，保证 MOSFET 快速导通。

#figure(image("images/电子电路/电源转换/开关管与其驱动与半桥-7.png", width: 100%),
  caption: [
    有推挽电路和无推挽电路的开关管驱动电路驱动考虑寄生电容的 MOSFET 栅极电压波形对比（注意后者的上升沿和下降沿，有明显充电过程）
  ]
)

所以，综合基础驱动电路和推挽输出电路，将其模块化封装为一个集成电路，这类集成电路就被称为栅极驱动器。栅极驱动器给予弱电逻辑电路足够的驱动能力，使得其可以控制相对强电的开关管，起到桥梁作用。

#figure(image("images/电子电路/电源转换/开关管与其驱动与半桥-8.png", width: 60%),
  caption: [
    栅极驱动器在开关管和控制器之间起到桥梁作用
  ]
)

IR2104 就是一类常见的栅极驱动器集成电路，其内部集成了上述推挽输出电路，可以给出 270mA 的灌电流与 130mA 的拉电流，可以驱动一个完整的电压高至 600V 的半桥结构#footnote[半桥结构指的是由一个上拉开关管和一个下拉开关管构成的电路结构，详见笔记《推挽电路与半桥结构》]。

#figure(image("images/电子电路/电源转换/开关管与其驱动与半桥-9.png", width: 90%),
  caption: [
    IR2104 栅极驱动器的典型应用电路
  ]
)

除此之外，IR2104 还集成了死区时间控制功能，防止上拉开关管和下拉开关管同时导通，导致短路；在外部 MOS 管发生短路时，IR2104 也能通过其过流保护功能保护 MOS 管不被烧坏。栅极驱动器的这些功能使得它能够提供额外的保护，提升可靠性。


= 计算机与工程知识

计算机，20 世纪以来最具革命性的发明，已经深刻地改变了人类的生活方式和工作方式。在今后的社会发展中，学会利用计算机和各项相关技术作为生产力工具是必要的。

== 计算机的基本结构与运行原理

=== 计算机的基本结构

计算机是一种能够执行程序和进行数据处理的电子设备，由硬件和软件两大部分组成。

硬件指的是计算机的物理组件，基础的计算机硬件主要包括以下三个部分
#align(center)[
  #block(
    table(
      columns: (1fr, 2fr),
      align: center,
      table.header(
        [#text(weight: "bold")[组件名称]],
        [#text(weight: "bold")[描述]],
      ),
      [中央处理器], [即 CPU，主要由控制器、运算器和寄存器组成，负责执行指令和处理数据。],
      [储存设备], [主要储存设备分为两类，RAM（随机访问储存器） 和 ROM（只读储存器）。前者在有电时能够保存数据，可随时读写；后者无论是否上电都能保存数据，但只能读取，无法写入。此外还包括其它辅助储存设备，如机械硬盘、固态硬盘。],
      [IO 设备], [输入输出设备，指的是计算机与外界进行交互的接口设备，例如键盘、鼠标、显示器、打印机等。],
    )
  )
]


软件指的是计算机上运行的程序和数据。

=== 中央处理器的运行原理

==== 指令与程序

要控制计算机硬件，就必须为其规定一套操作语言，这套语言被称为指令集，其中用于操作的语句和单词被称为指令。

常见的指令集设计理念主要分类为 CISC（复杂指令集设计）和 RISC（精简指令集设计）。CISC 指令集包含大量复杂的指令，能够直接执行高级语言中的复杂操作；RISC 指令集则包含较少的简单指令，可通过组合这些简单指令来实现复杂操作。

对于上述两类指令集设计理念分类，衍生出了不同的指令集架构（ISA）。以 RISC 为例，常见的 RISC 指令集架构有 ARM家族、RISC-V、MIPS。对于每种 ISA 而言，又有各类独立的硬件实现，例如用于 STM32 单片机的 ARM Cortex-M 系列处理器，使用 RISC-V 指令集架构的 SiFive 处理器等。针对各类硬件实现，有不同的电子产品集成，如 STM32F 系列单片机。

$
  "设计理念(CISC/RISC)" -> "指令集架构(ISA)" -> "硬件实现" -> "电子产品"
$

出于作者对嵌入式开发的兴趣，接下来以 RISC-V 指令集架构为例，进一步介绍指令的设计与程序的执行原理。

===== 指令的操作范围
中央处理器具有处理指令的能力，对于每条指令而言，其可覆盖的操作范围包含寄存器、内存。

寄存器是中央处理器内部的高速储存单元，对于 RISC-V 指令集架构而言，中央处理器一般包含 32 个 64 位#footnote[在下文中，称 64 位储存单元为【双字】，32 位储存单元为【字】，8 位储存单元为【字节】]通用寄存器，记作 $x_0, x_1, ..., x_31$，其中 $x_0$ 寄存器的值恒为 0，只读；其他寄存器的地位相同，值可以被指令读写。

内存指的是计算机的主储存器，可以被视作一个巨大的一维数组，每个元素为一个字节，每个元素的索引被称作其地址；对于 RISC-V 指令集架构而言，内存地址为 64 位，且每个地址对应一个字节。

通过访问内存，指令的可控范围可以间接扩展至其它设备。

- 对于 IO 设备，可以通过内存映射的方式将 IO 设备的寄存器映射到内存地址空间中，这样指令就可以通过访问特定的内存地址来控制 IO 设备的行为；
- 对于辅助储存设备（如硬盘），可以通过内存映射或 DMA（直接内存访问）的方式来实现对辅助储存设备的数据写入/读取；
- 对于显卡，其驱动 DMA，将内存中的数据通过高速 PCIe 总线传输到显卡的显存中，从而进一步实现图像的渲染。

===== 指令的能力
在 RISC-V 指令集架构中，每一条指令由一个固定长度#footnote[RV32I, RV64I 以及一些常见指令子集都采用 32 位作为指令长度，下方举例同理。]的二进制编码表示，该编码可以被中央处理器解析为一个特定的操作，这些操作#footnote[以最基础的 RV32I 指令集为例，其是 RISC-V 指令集架构的一个子集，包含 47 条指令，是任何 RISC-V 标准指令集所必须实现的模块。]包含

#align(center)[
  #block(
    table(
      columns: (1fr, 2fr),
      align: (center, left),
      table.header(
        [#text(weight: "bold")[汇编指令与调用格式]],
        [#text(weight: "bold")[作用]]
      ),
      table.cell(colspan: 2, fill: luma(230))[#text(weight: "bold")[整数运算（寄存器#footnote[注意，本部分整数运算中的指令仅能对寄存器或立即数之间进行运算，要对内存中的数据进行运算总是需要先将它们移动到寄存器，而不能直接操作。]与立即数#footnote[立即数指的是在指令中直接列出的常数。]）]],
      [`ADDI rd, rs1, imm`], [立即数加法：`rd = rs1 + imm`],
      [`SLTI rd, rs1, imm`], [有符号立即数比较：若 `rs1 < imm`，则 `rd = 1`，否则 `rd = 0`],
      [`SLTIU rd, rs1, imm`], [无符号立即数比较：若 `rs1 < imm`（无符号比较），则 `rd = 1`，否则 `rd = 0`],
      [`ANDI rd, rs1, imm`], [立即数按位与：`rd = rs1 & imm`],
      [`ORI rd, rs1, imm`], [立即数按位或：`rd = rs1 | imm`],
      [`XORI rd, rs1, imm`], [立即数按位异或：`rd = rs1 ^ imm`],
      [`SLLI rd, rs1, shamt`], [逻辑左移（立即数）：`rd = rs1 << shamt`，低位补 0],
      [`SRLI rd, rs1, shamt`], [逻辑右移（立即数）：`rd = rs1 >> shamt`，高位补 0],
      [`SRAI rd, rs1, shamt`], [算术右移（立即数）：`rd = rs1 >> shamt`，高位补符号位],
      [`LUI rd, imm`], [加载 20 位立即数#footnote[RISC-V 中，一条指令的长度为 32 位，这意味着当指令被编译为机器码后，用于储存立即数的位宽有限，当要写 32 位立即数时，出于其它含立即数的指令中，立即数的位宽上限为 12 位，故要额外再写 20 位数据，应当执行该命令。]：`rd = imm << 12`，低 12 位置 0],
      [`AUIPC rd, imm`], [PC 加高位立即数：`rd = PC + (imm << 12)`],
      table.cell(colspan: 2, fill: luma(230))[#text(weight: "bold")[整数运算（寄存器型）]],
      [`ADD rd, rs1, rs2`], [加法：`rd = rs1 + rs2`],
      [`SUB rd, rs1, rs2`], [减法：`rd = rs1 - rs2`],
      [`SLL rd, rs1, rs2`], [逻辑左移：`rd = rs1 << rs2`，低位补 0],
      [`SLT rd, rs1, rs2`], [有符号比较：若 `rs1 < rs2`，则 `rd = 1`，否则 `rd = 0`],
      [`SLTU rd, rs1, rs2`], [无符号比较：若 `rs1 < rs2`（无符号比较），则 `rd = 1`，否则 `rd = 0`],
      [`XOR rd, rs1, rs2`], [按位异或：`rd = rs1 ^ rs2`],
      [`SRL rd, rs1, rs2`], [逻辑右移：`rd = rs1 >> rs2`，高位补 0],
      [`SRA rd, rs1, rs2`], [算术右移：`rd = rs1 >> rs2`，高位补符号位],
      [`OR rd, rs1, rs2`], [按位或：`rd = rs1 | rs2`],
      [`AND rd, rs1, rs2`], [按位与：`rd = rs1 & rs2`],
      table.cell(colspan: 2, fill: luma(230))[#text(weight: "bold")[控制流转移（条件跳转）]],
      [`JAL rd, offset`], [无条件跳转（Jump And Link）：保存返回地址 `rd = PC + 4`，跳转至 `PC += offset`，用于函数调用#footnote[注意此处的 PC 指代当前命令的地址，而一条指令有 4 字节长，`offset` 指代后跳字节数，其值应当为跳过指令条数的 4 倍。此外，此处可以将 `offset` 替换为标签名，标签名会被汇编器解析为对应的字节偏移。]],
      [`JALR rd, rs1, offset`], [间接跳转（Jump And Link Register）：保存返回地址 `rd = PC + 4`，跳转至 `PC = rs1 + offset`，用于函数返回],
      [`BEQ rs1, rs2, offset`], [相等时分支：若 `rs1 == rs2`，则 `PC += offset`],
      [`BNE rs1, rs2, offset`], [不等时分支：若 `rs1 != rs2`，则 `PC += offset`],
      [`BLT rs1, rs2, offset`], [有符号小于时分支：若 `rs1 < rs2`，则 `PC += offset`],
      [`BGE rs1, rs2, offset`], [有符号大于等于时分支：若 `rs1 >= rs2`，则 `PC += offset`],
      [`BLTU rs1, rs2, offset`], [无符号小于时分支：若 `rs1 < rs2`（无符号），则 `PC += offset`],
      [`BGEU rs1, rs2, offset`], [无符号大于等于时分支：若 `rs1 >= rs2`（无符号），则 `PC += offset`],
      table.cell(colspan: 2, fill: luma(230))[#text(weight: "bold")[加载（内存 → 寄存器）]],
      [`LB rd, offset(rs1)`], [加载字节（符号扩展）：从 `mem[rs1 + offset]` 读取 1 字节，符号扩展至 32 位存入 `rd`],
      [`LH rd, offset(rs1)`], [加载半字（符号扩展）：从 `mem[rs1 + offset]` 读取 2 字节，符号扩展至 32 位存入 `rd`],
      [`LW rd, offset(rs1)`], [加载字：从 `mem[rs1 + offset]` 读取 4 字节存入 `rd`],
      [`LBU rd, offset(rs1)`], [加载字节（零扩展）：从 `mem[rs1 + offset]` 读取 1 字节，零扩展至 32 位存入 `rd`],
      [`LHU rd, offset(rs1)`], [加载半字（零扩展）：从 `mem[rs1 + offset]` 读取 2 字节，零扩展至 32 位存入 `rd`],
      table.cell(colspan: 2, fill: luma(230))[#text(weight: "bold")[存储（寄存器 → 内存）]],
      [`SB rs2, offset(rs1)`], [存储字节：将 `rs2` 的低 8 位写入 `mem[rs1 + offset]`],
      [`SH rs2, offset(rs1)`], [存储半字：将 `rs2` 的低 16 位写入 `mem[rs1 + offset]`],
      [`SW rs2, offset(rs1)`], [存储字：将 `rs2` 的全部 32 位写入 `mem[rs1 + offset]`],
      table.cell(colspan: 2, fill: luma(230))[#text(weight: "bold")[内存屏障]],
      [`FENCE pred, succ`], [内存屏障：保证 `pred` 类内存操作在 `succ` 类操作之前对其它核心可见，用于多核同步],
      [`FENCE.I`], [指令缓存同步：保证写入内存的数据对后续取指操作可见（自修改代码后使用）],
      table.cell(colspan: 2, fill: luma(230))[#text(weight: "bold")[系统调用与调试]],
      [`ECALL`], [环境调用：触发异常#footnote[异常指 CPU 在指令执行过程中遇见的非正常事件，除了 ECALL 可以主动触发异常请求特权，其它如指令地址未对齐也会触发异常。]，请求操作系统提供服务（如文件读写、进程控制）],
      [`EBREAK`], [调试断点：触发调试中断#footnote[中断指的是由硬件或软件引发的信号，用于暂停程序执行并转交控制权给中断处理程序。详细的异常/中断的处理将在后文介绍。]，挂起当前程序以供调试器检查],
      table.cell(colspan: 2, fill: luma(230))[#text(weight: "bold")[控制状态寄存器（CSR）#footnote[CSR 是一系列需要用 12 位地址来访问的特殊寄存器，包含了系统控制、状态信息等内容，在本部分指令中，`csr` 处填写需要操作的 CSR 地址。]]],
      [`CSRRW rd, csr, rs1`], [CSR 读写：先读 `rd = csr`，再写 `csr = rs1`],
      [`CSRRS rd, csr, rs1`], [CSR 读置位：先读 `rd = csr`，再将 `rs1` 中为 1 的位在 `csr` 中置 1],
      [`CSRRC rd, csr, rs1`], [CSR 读清位：先读 `rd = csr`，再将 `rs1` 中为 1 的位在 `csr` 中清 0],
      [`CSRRWI rd, csr, imm`], [CSR 立即数读写：先读 `rd = csr`，再写 `csr = imm`（imm 为 5 位零扩展立即数）],
      [`CSRRSI rd, csr, imm`], [CSR 立即数读置位：先读 `rd = csr`，再将 `imm` 中为 1 的位在 `csr` 中置 1],
      [`CSRRCI rd, csr, imm`], [CSR 立即数读清位：先读 `rd = csr`，再将 `imm` 中为 1 的位在 `csr` 中清 0],
    )
  )
]

综上所述，RISC-V 的基础指令子集 RV32I 提供运算、条件跳转、内存访问、系统调用、CSR 访问的功能。通过这些指令的组合，可以实现各种复杂的算法和功能。

在上表中，每一条指令被采用一种特定的格式来表示，例如 `ADDI rd, rs1, imm`，这种用短英文单词表示指令类型的格式被称为汇编指令格式；经过汇编编译器#footnote[从汇编指令翻译为机器指令、以及机器指令的格式将在后文叙述。]翻译成机器码后，这些指令都可以被表示为一串 32 位二进制数字，这种格式被称为机器指令格式。

这些机器指令可以被储存于内存中供 CPU 解读并执行，CPU 有两个特殊的寄存器，称作程序计数器（PC）和指令寄存器（IR）。当 CPU 要执行程序时，CPU 将从 PC 指向的内存地址中取出指令，存入 IR 中进行解析和执行；执行完当前指令后，PC 将自动加 4，指向下一条指令的地址#footnote[一般而言，RISC-V 中一条指令的长度为 32 位，即 4 字节]，以此类推。

===== 使用汇编指令实现基本程序结构

====== 条件分支
```c
if (i == j) {
  f = g + h;
} else {
  f = g - h;
}
```
假设 `i`、`j`、`f`、`g`、`h` 分别存储在寄存器 `x19`、`x20`、`x21`、`x22`、`x23` 中，那么上述 C 语言代码可以被翻译为如下的汇编指令
```asm
  bne x22, x23, Else
  add x19, x20, x21
  beq x0, x0, End
  Else: sub x19, x20, x21
  End:
```

====== 循环结构
```c
while (save[i] == k) {
  i++;
}
```
假设 `save` 是一个储存 64 位数据的数组（双字），`i` 和 `k` 对应于寄存器 `x22` 和 `x24`，数组的基址#footnote[数组本质是储存于内存中的一片连续的数据，其基址即为指向其首个元素的内存地址]位于 `x25`，那么对应的汇编代码为
```asm
Loop: slli x10, x22, 3  // x10 现在是 i * 8，下标每加一，地址就加 8，跳过 8 个字节即一个双字
add x10 x10, x25  // x10 现在是 &save[i]
ld x11, 0(x10)  // x11 现在是 save[i]
bne x11, x24, End
addi x22, x22, 1  // i++
beq x0, x0, Loop
End:
```

====== 在栈上分配内存
在数据结构的概念中，栈是一种后进先出的数据结构；而在计算机系统中，栈是一种用于处理函数调用和局部变量的内存区域。每当一个函数被调用时，系统会在栈上为该函数分配一个新的栈帧，用于储存该函数的局部变量、参数以及返回地址等信息。

栈的底部是高地址，顶部是低地址；当函数被调用时，栈帧会被压入栈中，栈指针（SP）会向下移动以分配空间；当函数返回时，栈帧会被弹出，栈指针会向上移动以释放空间。

例如，对于一个 C 语言函数
```c
int64_t complex_func(int64_t g, int64_t h, int64_t i, int64_t j) {
  int64_t f;
  f = (g + h) - (i + j);
  return f;
}
```

其运行中，将产生中间结果 `g + h` 、 `i + j` 和 `f`，本部分结果也将存储在寄存器中供后续指令使用；但对于寄存器紧张的情况，有时希望寄存器在用于此类计算，储存了临时值后，能够恢复为原来的值，以供后续指令使用，这时就可以将栈用作缓冲区。
假设参数变量 `g`、`h`、`i` 和 `j` 对应于参数寄存器 x10、x11、x12 和 x13，`f` 对应于 x20。

```asm
complex_func:
  addi x2, x2, -24  // 在栈上分配 3 个双字
  sd x5, 0(x2)
  sd x6, 8(x2)
  sd x20, 16(x2)
  // 将这些寄存器的原本值保存在栈上，以便后续恢复

  add x5, x10, x11
  add x6, x12, x13
  sub x20, x5, x6
  addi x10, x20, 0
  // 将结果 f 存入 x10 以供返回

  ld x5, 0(x2)
  ld x6, 8(x2)
  ld x20, 16(x2)
  addi x2, x2, 24
  // 从栈中读取之前保存的寄存器值恢复到寄存器，并恢复栈指针

  jalr x0, 0(x1)  // 返回函数调用处
```

值得注意的是，上面的代码使用 `x1` 寄存器来存储返回地址#footnote[当上面函数被调用，PC 将指向 complex_func: 位置，开始执行其内容，执行完毕后，程序应当返回调用语句所在的位置，此时 `x1` 就可以指明该返回位置]，用 `x2` 来储存栈的顶部地址，这些都是 RISC-V 指令集架构中规范的寄存器用法。实际上，虽然 31 个可读写寄存器地位相同，但是在实际的程序设计中，通常会约定一些寄存器的特定用途，以规范其使用，具体信息见下表

#align(center)[
  #block(
    table(
      columns: (1fr, 1fr, 3fr),
      align: center,
      table.header(
        [#text(weight: "bold")[寄存器编号]],
        [#text(weight: "bold")[别名]],
        [#text(weight: "bold")[规范用途]],
      ),
      [x0], [zero], [零寄存器，读取永远为 0，写入无效],
      [x1], [ra], [返回地址寄存器，函数调用时保存返回地址],
      [x2], [sp], [栈指针寄存器，指向当前栈顶地址],
      [x3], [gp], [全局指针寄存器，指向全局数据区的基地址],
      [x4], [tp], [线程指针寄存器，指向当前线程的线程局部存储区的基地址],
      [x5-x7 & x28-x31], [t0-t6], [临时寄存器，函数调用时不需要保存其值],
      [x10-x11], [a0-a1], [返回值寄存器，函数调用时用于返回值传递],
      [x12-x17], [a2-a7], [参数寄存器，函数调用时用于参数传递],
      [x8-x9 & x18-x27], [s0-s1], [保存寄存器，函数调用时需要保存其值，即在函数调用前后需要将其值保存在栈上以供恢复。特别的，x8 也可以用作帧指针寄存器（fp），指向当前栈帧的底部地址]
    )
  )
]

上述可读写寄存器中，除了 t0-t6 作为临时寄存器不需要在函数调用前后进行保存和恢复之外，其它寄存器在规范上，应当在函数调用前后进行保存和恢复#footnote[临时寄存器之所以临时，是因为其无需在函数嵌套/反复调用中保留，这意味着其不保证跨函数调用保持不变；而保存寄存器反之。另外，在中断和线程切换时，寄存器组的全量状态（无论临时/保存）会被保存，以供稍后恢复到同样的程序执行上下文。]；

别名可以用来代替寄存器编号来指代寄存器，这样可以更清晰地表达寄存器的用途，例如
```asm
addi sp, sp, -24  // 在栈上分配 3 个双字
```

====== 在嵌套调用中使用栈
有阶乘计算程序涉及到递归调用
```c
int64_t factorial(int64_t n) {
  if (n < 1) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}
```
在该函数的执行过程中，一段汇编代码将被反复进入以求 `n`, `n-1`, `n-2`, ... 的阶乘值，且每次进入时，当时的 `n` 都应当被保留以供后续的乘法计算使用，这时就需要将 `n` 的值保存在栈上以供后续恢复。
```asm
factorial:
  addi sp, sp, -16
  sd x1, 8(sp)
  sd x10, 0(sp)

  addi x5, x10, -1
  bge x5, zero, L1

  addi x10, x0, 1
  addi sp, sp, 16
  jalr x0, 0(x1)

  L1:
    addi x10, x10, -1
    jal x1, factorial

  addi x6, x10, 0
  ld x10, 0(sp)
  ld x1, 8(sp)
  addi sp, sp, 16

  mul x10, x6, x10
  jalr x0, 0(x1)
```

以上是上述 C 代码编译后的汇编代码，该汇编代码体现的思路是将每次执行 factorial 函数时的 `n` 压栈，然后将此时的 `x1` 也压栈，保存好状态后，将输入参数 `x10` 减一再调用函数求 `n-1` 阶乘的值。

一旦这种压栈进行到了 `n` 的值小于 1 的情况时，函数将返回 1，此时程序就将从栈中恢复之前保存的 `n` 的值和返回地址 `x1`，逐个从先前程序跳出执行 `factorial(n - 1)` 的位置继续，带着算好的 `factorial(n - 1)` 的值，执行 `n * factorial(n - 1)` 的计算，最终返回 `factorial(n)` 的值。

这种情况可以推广到不同函数之间发生的嵌套调用，例如函数 A 调用函数 B，函数 B 又调用函数 C，那么在函数 C 中就需要将函数 B 的状态压栈以供后续恢复；同样的，在函数 B 中也需要将函数 A 的状态压栈以供后续恢复。总而言之，栈可以用于保存函数调用的状态，以支持函数的嵌套调用和递归调用。

====== 在堆上分配内存
对于栈而言，栈底是高地址，栈顶是低地址；这使得在内存空间中，栈的占用增长方向是从高地址向低地址；与此同时，为了提高低地址的利用率，设计堆这一内存区域来支持动态内存分配。

在数据结构中，堆是一棵完全二叉树，且总有子节点的值不大于父节点的值；而在内存分配中，堆并不指代它在数据结构中的含义，堆是指一种用于动态内存分配的内存区域，程序可以在运行时根据需要从堆上请求分配任意大小的内存块，并在使用完毕后释放这些内存块以供后续使用。

```c
 int64_t* arr = (int64_t*)malloc(10 * sizeof(int64_t));
```

当使用 `malloc`，`new`关键字，或在一些高级编程语言中创建对象时，考虑到相应的数据可能占用较大内存，一块连续的内存区域会被分配在内存中，供本部分数据使用，这被称作堆分配；堆的分配由内存管理器负责，一个指向该内存区域的指针就会被返回，被压入栈中以供后续引用读取。在 C 语言中，存储该地址的变量通常是指针类型。

堆的内存部分在不用时需要手动释放，不像栈中在调用结束时会自动释放；
```c
free(arr);
```

如果程序员忘记释放堆内存，或者在释放后继续使用该内存，就会导致内存泄漏或悬空指针等问题。在 C 语言中，这些问题需要程序员手动管理；而  Java、Python 等语言中，内存管理器会自动进行垃圾回收（GC），帮助程序员管理堆内存。

====== 构建互斥锁

当两个不同的线程访问同一共享资源时，若两线程中至少有一个线程对该资源进行写操作，就会产生竞态条件，这使得数据被读取的值/最终结果取决于线程调度的时序，这通常是不可预测的，且可能导致程序出现错误的行为。

同步操作是指在多线程环境中，协调多个线程对共享资源的访问，以避免竞态条件和数据不一致的问题。互斥锁是一种常用的同步机制，用于保护共享资源，使得同一时间只有一个线程能够访问该资源。

考虑汇编指令 `ld` 和 `sd`，前者用于从内存加载数据到寄存器，后者用于将寄存器中的数据存储到内存中；如果在执行 `ld` 和 `sd` 之间的指令序列中，另一个线程对同一内存地址进行了修改，那么就会导致竞态条件。为此，介绍指令 `lr.{w/d}` 和 `sc.{w/d}`，其为 RISC-V A 扩展中定义的原子操作语句，用于构建单条不可断的读取/写入操作。

两条指令的调用格式如下
```asm
lr.d rd, (rs1)  // 从内存地址 rs1 处加载一个双字到 rd 中
sc.d rd, rs2, (rs1)  // 如果之前对 rs1 地址的 lr.d 的内容和执行该行时内存地址 rs1 处的内容相同，则将 rs2 中的值存储到内存地址 rs1 处，并将 rd 设置为 0；否则，不进行存储操作，并将 rd 设置为非 0 值。
```

当要构建一个锁变量，以值为 1 表明锁被占用，为 0 表明锁可用时，可以使用如下的汇编代码
```asm
addi x12, x0, 1 // copy locked value

again:
lr.d x10, (x20) // load-reserved to read lock
bne x10, x0, again // check if it is 0 yet

sc.d x11, x12, (x20) // attempt to store new value
bne x11, x0, again // branch if store fails
```

`x20` 储存一个地址，对应于锁变量在内存中的位置；`x12` 储存锁被占用时的值 1；`x10` 用于读取锁变量的当前值；`x11` 用于检查 `sc.d` 指令是否成功执行。

本部分代码在锁被占用时会不断地执行 `lr.d` 来读取锁变量的值，直到其变为 0；当锁可用时，执行 `sc.d` 来尝试将锁变量设置为 1，如果在此过程中另一个线程占用了锁，那么 `sc.d` 将失败并返回非 0 值，此时程序会再次进入循环继续检查锁变量的状态。依照上述逻辑，仅有在锁可用时，该代码段下方的操作才会被执行，从而保证了对共享资源的互斥访问。

===== 内存的使用情况
上文中提到，内存可以被视作一个巨大的一维数组，每个元素为一个字节，每个元素的索引被称作其地址；与此同时，程序本身的指令和数据都被储存在内存中，当程序运行时，CPU 会从内存中取出指令并执行，同时也会访问内存中的数据。

这就引出了内存的使用情况问题，一般而言，在内存的使用过程中，数据的分布如下所示

#align(center)[
  #block(
    width: 60%,
    table(
      columns: (1fr),
      align: center,
      table.cell(fill: luma(230))[#text(weight: "bold")[内存使用情况（从上到下地址由高到低）]],
      [*栈储存区域* \ 向下压栈],
      [未被分配的内存区域],
      [向上分配 \ *堆储存区域*],
      [*静态数据*],
      [*程序*],
      [保留区域]
    )
  )
]

===== 翻译与启动程序

处理器能够直接解读并执行的指令是机器指令，即二进制编码的指令；而程序员编写的代码通常是高级语言代码，如 C 语言，这些代码需要经过编译器的翻译，才能被转换为机器指令供处理器执行。完成这一翻译过程的工具被称为编译器。

以 GNU Compiler Collection（GCC）编译器套件为例，GCC 是一个支持包括 C 在内的多种编程语言的编译器套件，介绍其在 RISC-V 架构上编译 C 语言代码的过程。

1. 预处理
编译器前端先处理所有以 `#` 开头的预处理指令
- 头文件展开：把 `#include` 指定的头文件内容直接插入源文件。
- 宏替换：把 `#define` 定义的宏按文本规则替换到使用处。
- 条件编译裁剪：根据 `#if/#ifdef/#ifndef` 等条件保留或删除对应代码片段。
这将将 C 语言文件转化为不带预处理器命令的 C 语言代码，后缀为 `.i`。

2. 编译
GCC 对上述预处理后的代码进行编译，将其转换为汇编代码。

本部分的编译过程在上文使用汇编语言实现基本程序结构的示例中已经有所体现，例如对于 C 语言中的条件分支、循环结构、函数调用等语句，编译器会生成相应的汇编指令来实现这些功能。

这将将 C 语言代码转化为汇编代码，后缀为 `.s`。

3. 汇编
GCC 使用汇编器将上述生成的汇编代码转换为机器码，即二进制编码的指令，这些指令可以被处理器直接解读和执行。

大部分的 RISC-V 基础指令集和扩展中的命令都可以被编码为 32 位的机器指令，因为其和一个操作码与指令格式有一对一的对应关系。但值得一提的是，除此之外，还有一些本身不对应任何机器操作码的汇编指令，它们在被汇编器翻译成机器码时，会被转换为一系列的机器指令来实现其功能。

`li` 就是一个例子，上文曾提及 `lui`，其可以将一 20 位的立即数加载到寄存器，并将寄存器左移 12 位；类似地，`li` 可以实现将 12 位立即数直接转移到寄存器，实际上，`li` 指令有等价关系
```asm
li rd, imm
addi rd, x0, imm
// 这两行是等价的
```
故当汇编代码中出现 `li` 指令时，汇编器会将其翻译为 `addi` 指令来实现其功能。这类需要被翻译为多条机器指令的汇编指令被称为伪指令。

在该步骤中，汇编代码将被解析，以生成目标文件，后缀为 `.o`。

目标文件是一种以一定格式表示可执行机器码的文件，包含了机器指令以及一些符号表和重定位信息等内容；它是编译器生成的中间产物，不能直接被执行，但可以被链接器处理以生成最终的可执行文件。

在 Linux 系统上，目标文件通常采用 Executable Linkable Format（ELF）格式，其包含的内容如下

// 以后再具体谈谈 ELF 文件的内容

4. 链接
GCC 将上述生成的机器码与所需的库文件进行链接，生成最终的可执行文件。

// 以后再谈谈链接器的工作原理和链接过程

在上述四个步骤后，即可得到一个可执行文件，该文件包含了机器指令和相关的元数据，可以被操作系统加载到内存中并由 CPU 执行。

// 如何加载和启动程序也应该谈一谈

==== 算术运算原理

上文曾谈到汇编语言能够进行各类整数算术运算，如 `add` `sub` 命令可以实现寄存器整数加减法；这使得以下问题得以提出：

- 计算机实现加减运算的原理是什么？何种物理电路能够实现加法和减法的功能？
- 计算机如何在此基础上衍生出乘法、除法等更复杂的算术运算？
- 计算机如何处理浮点数、极大数的表示和运算？

===== 算术逻辑单元（ALU）

ALU（Arithmetic Logic Unit） 是中央处理器的核心组件之一，负责执行算术和逻辑运算。ALU 接收来自寄存器的数据输入，并根据指令的要求执行相应的运算，对于 RISC-V 指令集而言，ALU 被要求做到以下功能

- 计算加法、减法
- 计算 AND，OR，XOR
- 计算 SLT（有符号小于）
- 当有符号计算出现溢出，输出 Overflow
- 当结果为零，输出 Zero

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/RISC-V的ALU.png", width: 90%),
  caption: [RISC-V 的算术逻辑单元（ALU）示例
  ]
)

为了实现上述功能，可以按照以下顺序一步一步构建之。

1. 多选器（Multiplexer，MUX）
多选器是一种具有多条数据 $A, B, C, ...$ 输入，一条选择信号 $S$ 和一条数据输出 $F$ 的数字电路，其输出数据满足以下关系式
$
  F = (A dot.op (S=0)) + (B dot.op (S=1)) + (C dot.op (S=2)) + ...
$
其中 $S=i$ 表示当选择信号 $S$ 等于对应输入的编号时，输出该输入的数据，否则输出 0。

该组件可以用于 ALU 中的指令译码部分，根据指令类型选择相应的运算模块进行计算。

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/多选器示意图.png", width: 40%),
  caption: [多选器
  ]
)

2. 全加器（Full Adder）
全加器是一种数字电路，用于计算两个二进制位的和以及进位

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/全加器示意图.png", width: 40%),
  caption: [全加器
  ]
)

其逻辑表达式如下所示
$
  "CarryOut" = (A and B) or (B and "CarryIn") or (A and "CarryIn") \
  "Sum" = A xor B xor "CarryIn"
$

3. 1 位基础 ALU

将全加器，与门与或门，以及多选器组合，可以得到一个 1 位基础 ALU，用于执行两个 1 位数据的加法、AND、OR。
#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/1位基础ALU.png", width: 40%),
  caption: [1 位 ALU，当 Operation 选择不同信号，输出结果在两个量的加法、AND、OR 之间切换
  ]
)

4. 64 位基础 ALU

将 64 个 1 位基础 ALU 组合在一起，将 A 和 B 的每一位分别输入到对应的 1 位 ALU 中，并将前一位的 CarryOut 连接到后一位的 CarryIn，就可以得到一个 64 位基础 ALU，用于执行两个 64 位数据的加法、AND、OR。

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/64位基础ALU.png", width: 40%),
  caption: [按照上述方式组合得到的 64 位基础 ALU
  ]
)

5. 添加非单元来实现减法与 NOR

在上述 64 位基础 ALU 的基础上，添加 Ainvert 和 Binvert 两个多选器来反转 A 和 B 的输入

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/1位基础ALU-2.png", width: 40%),
  caption: [添加 Ainvert 与 Binvert 多选器
  ]
)

出于在有符号二进制中，一个数的相反数是其补码（反码加 1），故当将最低位 ALU 的 CarryIn 置 1，将 B 反转，就能计算 A - B；

又有德摩根定律，有 $A "nor" B = not (A or B) = not A and not B$，所以，将 A 与 B 反转通过与门，就能计算或非。先前的讨论中，可以知道任何逻辑表达式都能被表达为合取范式，故当 AND，OR，NOR 三种运算都能被 ALU 执行时，ALU 就能够执行任意的逻辑表达式。

6. 添加 Zero 单元

在上述 64 位 ALU 的基础上，添加一个 Zero 单元来检查输出结果是否为零，这可以用简单的 NOR 门实现
$
  "Zero" = not ("Result"[0] or "Result"[1] or ... or "Result"[63])
$
其中 Result[i] 表示输出结果的第 i 位的值。

7. 实现 SLT（有符号小于）判断

在数学中，当 `a - b < 0`，那么可以断言 `a < b`；ALU 也可以以该逻辑判断 `a < b`，但当 ALU 执行减法逻辑时，若产生减法溢出，那么结果的符号位将不再可靠；例如对于 4 位二进制数，`a = -7 (1001)`，`b = 6 (0110)`，则 `a - b = 0b1001 + 0b1010 = 0b0011`，结果为正数，表明 `a - b > 0` 但实际上 `a < b`。

为了规避溢出问题，可以采用以下逻辑表达式
$
  "Less" = ("A"[63] and not "B"[63]) or (("A"[63] == "B"[63]) and "Result"[63])
$
其中 `A[63]` 和 `B[63]` 分别表示输入数据 A 和 B 的符号位；`Result[63]` 表示 A - B 的结果的符号位；当 A 和 B 的符号位不同且 A 的符号位为 1 时，说明 A 是负数而 B 是正数，此时 A < B；当 A 和 B 的符号位相同且 A - B 的结果的符号位为 1 时，说明 A < B。

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/有符号小于模块.png", width: 40%),
  caption: [扩展多选器，使得 ALU 还能够输出 SLT（有符号小于）判断结果，用 Less 表示
  ]
)

8. 实现 Overflow 判断

Overflow 是指在执行加法或减法时，结果超出了数据类型所能表示的范围；对于有符号数而言，当进位或借位超出 64 位数据的上限时，进/借位数据将被损失，这被称作溢出。

对于加法（CarryIn 和 Binvert 无效）而言，当 A 和 B 的符号位相同且结果的符号位与 A 和 B 的符号位不同，则说明发生了溢出；对于减法（CarryIn 和 Binvert 有效）而言，当 A 和 B 的符号位不同且结果的符号位与 A 的符号位不同，则说明发生了溢出。

综上所述，可以得到 Overflow 的表达式为

$
  "Overflow" = "Binvert" dot.op ((not A[63] and not B[63] and "Result"[63]) or & \ (A[63] and B[63] and not "Result"[63])) & \
  + (not "Binvert") dot.op ((not A[63] and B[63] and "Result"[63]) or & \ (A[63] and not B[63] and not "Result"[63])) &
$

9. 将 Less 和 Overflow 扩展到无符号情况

在无符号情况下判断 `a < b` 时，若 `a - b` 产生了最高位 CarryOut 有效，那么说明最终减法运算没有发生借位，即 `a - b >= 0`，此时 Less 为假；否则当未借位，Less 为真。

在无符号情况下判断 Overflow 时，对于加法，如果产生了最高位 CarryOut，则有数据在进位中丢失（第 65 位数据）；在减法中，如果未产生最高位 CarryOut，则可判定发生了借位。这两种情况都对应 Overflow 的发生。

综上所述，ALU 是实现加减法运算和逻辑运算的硬件电路实现。

===== 实现乘法运算

此处讨论的乘法运算指整数乘法，按照定义来说，乘法相当于乘数个被乘数相加。且乘法是一种满足交换律，结合律，分配律的运算。

假设对于两个二进制数 A = a[n-1]a[n-2]...a[0]，B = b[n-1]b[n-2]...b[0]，那么
它们之间的乘法将被表示为
$
  A times B = (a[n-1] times B times 2^(n-1)) + (a[n-2] times B times 2^(n-2)) + ... \ + (a[1] times B times 2^1) + (a[0] times B times 2^0)
$

同时，在二进制中，$times 2^i$ 相当于将数向高位移动 i 位；所以可以将乘法拆分为加法和位移的混合运算。由此设计下列乘法器
#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/乘法器.png", width: 80%),
  caption: [乘法器的一种设计
  ]
)

该乘法器按照以下步骤进行计算：
1. 初始化：被乘数 $B$ 被存储在图中 64 位寄存器中；图中的 129 位寄存器的左边是低地址，右边是高地址；乘数 $A$ 的内容被存储在第 65 到第 128 位中，该寄存器的其余部分置零。

2. 控制 ALU：图中控制检测模块检查当前 129 位寄存器最高位，当其为 1 时，向 ALU 发送控制信号，命令其进行一次加法运算；当其为 0 时，不进行加法运算；

3. ALU 若在上一步骤中被控制进行加法运算，则将 129 位寄存器中第 0 到第 63 位的内容与被乘数 $B$ 的内容进行加法运算，并将结果存储回寄存器的第 0 到第 63 位中；否则保持寄存器不变；

4. 控制检测模块令 129 位寄存器向高位移动一位，并在最低位补 0；

5. 回到第二步，将本部分过程重复 64 次；如此一来，129 位寄存器中将存储乘积 $A times B$ 的结果，而第 128 位将储存是否进位的情况。

这个设计很巧妙的把和式中高位位移和取乘数指定位的操作合二为一，通过每次移动寄存器来实现乘数的位移，同时通过检测最高位来决定是否进行加法运算，从而实现了上述乘法的功能。

可以注意到，该算法似乎仅适用于无符号乘法，因为对于有符号乘法，其位权发生改变，最高位位权为负，故移位操作对最高位无效
$
  A times B = (a[n-1] times B times -2^(n-1)) + (a[n-2] times B times 2^(n-2)) + ... \ + (a[1] times B times 2^1) + (a[0] times B times 2^0)
$
一个折中的解决方案是，先记录两个乘数的符号，后将其中的负数转化为正数，然后使用上述算法计算出绝对值的乘积，最后根据之前记录的符号信息来确定最终结果的符号。


// 下面是性能优化内容，有时间再研究
#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/乘法器-2.png", width: 95%),
  caption: [乘法器的并行设计
  ]
)

实际上，出于性能的考虑，可以尝试使用多个 ALU 来并行计算乘积的不同部分，换得更高的计算效率。如图是一树型乘法器，其计算方法如下

// 我真的无法理解这个树形乘法器的计算方法
// 一说是这里的乘数都是提前位移好的，例如乘数 63 就已经向高位移动了 63 位，但是这个 ALU 才 64 位，怎能处理位移后的数据？
// 我猜测可能是通过自定义接线的方式，将乘数的不同位连接到不同 ALU 的输入端来实现的

===== 实现除法运算
此处讨论的除法是带余数的整数除法，不得不回顾一下，对于整数除法而言，有以下关系式成立
$
  "被除数" div "除数" = "商" + "余数"
$
且余数满足 $0 <= "余数" < |"除数"|$，这使得对于确定的被除数和除数，商和余数唯一。

如果被除数和除数都是正整数，那么上式和小学数学中学到的除法关系式完全一致；但当计算对象中有负数，情况会相对棘手，大部分编程语言中对于负数的除法关系式中有规定
#theorem("计算对象中有负数的余数除法")[
  $
  "被除数" div "除数" = "商" + "余数" \
  "sgn"("余数") = "sgn"("被除数")，"且满足" |"余数"| < |"除数"|
  $
  即在满足上述关系式的前提下，还有除法中余数的符号与被除数的符号相同。
]


接下来介绍除法的硬件实现方法，先假设输入的被除数和除数都是正整数，那么可以按照以下步骤进行计算
#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/除法器.png", width: 95%),
  caption: [除法器的一种设计
  ]
)
上述是除法器的一个简单设计，其计算方法如下
1. 初始化：被除数，除数和被写入图中的余数寄存器和除数寄存器中，用于储存商的寄存器置零；
2. 控制测试模块发送指令，令 ALU 执行从余数中减去除数的操作，并检查减法后余数寄存器的正负
- 若余数寄存器为负值，则说明这一位不能上除数（类比竖式计算除法），令商寄存器左移一位，并补位 0；然后在余数寄存器中加上除数的值以恢复到之前的状态；
- 若余数寄存器为非负值，则说明这一位可以上除数，令商寄存器左移一位，并补位 1；继续进行下一轮的计算；
3. 将除数寄存器向右移动一位，并在最高位补 0；
4. 重复步骤 2 和 3 共 64 次；如此一来，商寄存器中将存储商的值，而余数寄存器中将存储余数的值。

仍然注意到本装置仅适用于无符号除法；对于带符号除法，可以先记录被除数和除数的符号信息，将它们转化为绝对值大小对应的正数进行计算。对于以下不同情况有
- 当被除数为负数而除数为正数时，商的符号反转，余数的符号反转；
- 当被除数为正数而除数为负数时，商的符号反转，余数的符号不变；
- 当被除数和除数均为负数时，商的符号不变，余数的符号反转。

// 除法也有性能优化算法，可以今后研究

#line(length: 100%)

在上述除法器设计中，若除数为 0，则在计算中将有除数寄存器永远小于余数，这将使得商寄存器的每一位都被置为 1，且余数寄存器总是不改变其值。

上述操作没有任何意义，且在实际应用中，除数为 0 的情况通常被视作错误，因此在实际的除法器设计中，通常会添加一个检测模块来检查除数是否为 0。对于 RISC-V 架构计算机而言，除 0 一般不引起异常，对于除 0 情况，返回商总是全置为 1 的值，余数总是被除数的值。

===== 在汇编指令中计算整数乘除法

依据 RISC-V 指令集规范，乘法和除法指令被定义在 M 扩展中，对于支持 M 扩展指令的硬件实现而言，以下指令可以直接被处理器解读并执行

#align(center)[
  #block(
    table(
      columns: (1fr, 2fr),
      align: (center, left),
      table.header(
        [#text(weight: "bold")[汇编指令与调用格式]],
        [#text(weight: "bold")[作用]]
      ),
      [`MUL rd, rs1, rs2`], [寄存器乘法：`rd = rs1 * rs2`],
      [`MULH rd, rs1, rs2`], [寄存器乘法：`rd = (rs1 * rs2) >> 64`，即乘积的高 64 位],
      [`MULHU rd, rs1, rs2`], [寄存器乘法：`rd = (rs1 * rs2) >> 64`，即乘积的高 64 位，且 rs1 和 rs2 被视作无符号数],
      [`MULHSU rd, rs1, rs2`], [寄存器乘法：`rd = (rs1 * rs2) >> 64`，即乘积的高 64 位，且 rs1 被视作有符号数而 rs2 被视作无符号数],
      [`DIV rd, rs1, rs2`], [寄存器除法：`rd = rs1 / rs2`],
      [`DIVU rd, rs1, rs2`], [寄存器除法：`rd = rs1 / rs2`，且 rs1 和 rs2 被视作无符号数],
      [`REM rd, rs1, rs2`], [寄存器取余：`rd = rs1 % rs2`],
      [`REMU rd, rs1, rs2`], [寄存器取余：`rd = rs1 % rs2`，且 rs1 和 rs2 被视作无符号数]
    )
  )
]

===== 浮点数表示法

上述所有的讨论都是基于整数的算术运算，但在实际应用中，还会出现小数的运算需求，这就引入了浮点数的概念。浮点数是一种用于表示实数的数值类型，目前最流行的浮点数表示规范是 IEEE 754 标准，该标准定义了单精度（32 位）和双精度（64 位）两种浮点数格式，其结构如下

#align(center)[
  #block(
    table(
      columns: (1fr, 2fr, 2fr, 4fr),
      align: (center),
      table.header(
        [#text(weight: "bold")[类型]],
        [#text(weight: "bold")[符号位（S）]],
        [#text(weight: "bold")[阶码（E）]],
        [#text(weight: "bold")[尾数（M）]]
      ),
      [float], [a[31]], [a[30:23]], [a[22:0]],
      [double], [a[63]], [a[62:52]], [a[51:0]]
    )
  )
]
其中符号位 S 用于表示数值的正负，阶码 E 用于表示数值的大小范围，尾数 M 用于表示数值的精度。对于单精度浮点数而言，符号位占 1 位，阶码占 8 位，尾数占 23 位；对于双精度浮点数而言，符号位占 1 位，阶码占 11 位，尾数占 52 位。

对于单精度浮点数而言，数值的表示形式为
$
  (-1)^S times 1.M times 2^(E - 127)
$
其中 $1.M$ 是由 1 和小数点与 M 拼接得到的二进制小数#footnote[更严谨的说法，是将 M 的位权从高位到低位分别设置为 $2^(-1), 2^(-2), 2^(-3), ...$，将由 M 表示的二进制数加上 1 得到 1.M。]；E 是一个无符号整数，令其减去 127 后的数值为一个有符号整数，作为 2 的指数；S 是一个二进制位，令其为 0 时表示正数，为 1 时表示负数。

对于双精度浮点数而言，数值的表示形式为
$
  (-1)^S times 1.M times 2^(E - 1023)
$

参数意义同上。

可以发现，这类表示浮点数的表示方法范围广，借助指数部分可以表示非常大的数值或非常小的数值；但仍有限制，主要表现在两类情况上

1. 当数值的绝对值极大，以至于阶码 E 的值超过了其最大值时，数值将无法被准确表示，此时会发生溢出，这被称作上溢。

2. 当数值的绝对值极小，以至于阶码 E 的值小于其最小值时，数值将无法被准确表示，此时会发生下溢。

此外，IEEE 754 还定义了一系列特殊数值，见下表
#align(center)[
  #block(
    table(
      columns: (1fr, 1fr, 2fr),
      align: (left),
      table.header(
        [#text(weight: "bold")[阶码 E]],
        [#text(weight: "bold")[尾数 M]],
        [#text(weight: "bold")[数值意义]]
      ),
      [0], [0], [表示数值 0，仅有这一种组合表示数字 0],
      [0], [不是 0], [这类数被称为非规格化数],
      [255（单精度）\ 2047（双精度）], [0], [+Infinity 或 -Infinity，表示无限，正负取决于符号位],
      [255（单精度）\ 2047（双精度）], [0], [NaN，表示未定义的数值#footnote[当发生 0 除以 0，或无穷大减去无穷大等异常数学情况时，NaN 即作为运算结果]],
    )
  )
]

这些特殊数值仅在阶码取极端值（极大或极小）时得到，分别表示不同的含义，后文将会详细阐述。

===== 浮点数加减法

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/浮点加法单元.png", width: 95%),
  caption: [实现浮点数加法的一种硬件设计
  ]
)

上图展示了一个实现浮点数加法单元的硬件设计，其计算方法如下
1. 确定对齐阶码，对于两个浮点数，仅当两者的阶码相同时，才能直接进行尾数的加减运算；因此首先需要对齐两个数，使得它们的阶码相同。图中，小 ALU 将对两个数的指数作减法，控制单元读取结果，选取较大者作为对齐后的阶码。

2. 对齐尾数，控制单元根据上一步骤选取的阶码，控制多选器，将较小阶码的尾数右移相应的位数以对齐到较大阶码的尾数，并使用图中的 大 ALU 将两者的尾数进行加法运算，得到一个新的尾数。

3. 准备规格化：虽然上面得到的尾数和阶码已经满足了加法的结果，但它们可能不满足 IEEE 754 标准中对于规格化数的要求，在此介绍 IEEE 754 的浮点数规格化的两条规则

- 左规则：当浮点数的尾数的最高位为 0 时，应当将尾数左移一位，并将阶码减 1；当尾数的最高位为 1 时，停止左移操作——这是为了提高尾数的精度，最大程度地利用尾数的位数来表示有效数字。
- 右规则：当浮点数出于任何原因，在修改（例如加法）的过程中发生了进位，那么应当将尾数右移一位（包含进位），并将阶码加 1；当尾数没有发生进位时，停止右移操作，这是为了防止进位信息溢出。

为了达成上述规范，具体的过程是，控制单元检查加法结果，当加法结果有进位或首位为 0，则说明结果未规格化，控制单元控制图中多选器对阶码通过“加或减”模块，并将尾数通过“左移或右移”以尝试规格化；直到结果满足规格化要求为止。

4. 舍入，当加法结果的尾数超过了其位数限制时，需要对结果进行舍入以适应尾数的位数限制；最常用的舍入方式是 RNE，又称就近舍入，遵循如下规则
- 当舍弃部分的最高位为 0 时，直接舍弃；
- 当舍弃部分的最高位为 1 时，且舍弃部分中至少还有一个 1 时，将舍入结果加 1 后舍弃；
- 当舍弃部分的最高位为 1 时，且舍弃部分中没有其他 1 时，且舍入结果的最低位为 1 时，将舍入结果加 1 后舍弃；否则直接舍弃。

对于浮点数的减法而言，其实现原理与加法类似，唯一的区别在于第二步中对齐尾数时，控制单元控制大 ALU 进行减法运算而非加法运算；后续的规格化和舍入步骤与加法完全相同。

===== 浮点数乘法

浮点数的乘法可以被拆成阶码的加减法与尾数的乘法两部分来实现。对于两个浮点数而言，其乘积的结果可以表示为
$
  (-1)^(S_1 xor S_2) times ((1 + M_1) times (1 + M_2)) times 2^((E_1 - "Bias") + (E_2 - "Bias"))
$
其中 $S_1$ 和 $S_2$ 分别是两个浮点数的符号位，$M_1$ 和 $M_2$ 分别是两个浮点数的尾数，$E_1$ 和 $E_2$ 分别是两个浮点数的阶码，Bias 是阶码的偏置值，对于单精度而言为 127，对于双精度而言为 1023。

由此，乘法的计算方法可以遵循以下步骤
1. 计算符号位，乘积的符号位为两个乘数的符号位的异或结果，即 $S_1 xor S_2$。

2. 计算新的阶码，新的阶码为两个乘数的阶码之和减去 Bias，即
$
  E = E_1 + E_2 - "Bias"
$

3. 计算新的尾数，新的尾数为两个乘数的尾数加 1 后的积，即
$
M = (1 + M_1) times (1 + M_2)
$
因为 1 + 尾数 的本质也是具有位权的二进制数（$1, 2^(-1), 2^(-2), ...$），所以可以使用前文介绍的乘法器来计算尾数的乘积。

4. 进行规格化：规格化的过程与前文介绍的浮点数加法中的规格化过程完全相同。

5. 进行舍入：舍入的过程与前文介绍的浮点数加法中的舍入过程完全相同。

===== 浮点数除法

相较于乘法而言，除法的实现更为复杂，回顾上文所述，整数除法是带有余数的除法，而不像乘法结果仅有一个积，这使得在尾数的计算中，不能简单地将两个尾数相除来得到结果的尾数，丢弃的余数会产生精度损失。

一种流行的方法是，若要计算 $frac(a, b)$ 的值，可以先求 $b^(-1)$，即除数的倒数，再乘法计算 $a dot.op frac(1, b)$。

这就不得不引出求倒数的方法，求倒数的方法有很多种，其中一种常用的方法是牛顿迭代法，其基本思想是通过迭代的方式来逼近 $frac(1, b)$ 的值。

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/牛顿迭代法.png", width: 75%),
  caption: [牛顿迭代法的示意图
  ]
)
牛顿迭代法指的是，对于一个函数 $f(x)$，如果我们想要找到一个数 $x$ 使得 $f(x) = 0$，可以通过以下迭代公式来逼近这个数
$
  x_(n+1) = x_n - frac(f(x_n), f'(x_n))
$
其中 $f'(x)$ 是函数 $f(x)$ 的导数，$x_n$ 是第 n 次迭代的结果，观察公式不难发现迭代法具有几何意义：下一个迭代结果 $x_(n+1)$ 是在当前迭代结果 $x_n$ 处的切线与 x 轴的交点。#footnote[牛顿迭代法和泰勒级数有一定联系，对于 $f(x)$ 的泰勒展开，若忽略二阶及以上小项，且令 $f(x) = 0$，那么 $Delta x$ 的值就是 $-frac(f(x_n), f'(x_n))$。这使得牛顿收敛法的收敛常为二次收敛，且仅当条件足够好（二阶及以上项的影响可以忽略）时才会收敛。]

如此，要逼近一个数的倒数，可以假设有函数 $f(x) = 1/x - b$，其唯一零点即为 $frac(1, b)$，其导数为 $f'(x) = -1/x^2$，将其代入迭代公式中，可以得到
$
  x_(n+1) = x_n - frac(1/x_n - b, -1/x_n^2) = x_n + (1 - b x_n) x_n = x_n (2 - b x_n)
$

故可以仅利用已有的浮点数乘法和加减法来实现求倒数的功能；再将被除数与求得的倒数相乘，即可得到除法的结果。

此外，为了开始迭代，通常要选择值合适的初始值，对于尾数 M 而言，其值介于 $[0.5, 1)$ 之间，$1.5$ 是最简单且易用的。在更高性能的硬件实现中，初始值会根据目标进行打表选择。

为此，通常有专门的硬件结构来实现上述倒数逼近算法，进而完成除法的计算。

===== 浮点寄存器与汇编计算浮点数乘除法

对于支持 F 和 D 扩展指令的 RISC-V 架构计算机而言，通常其会具有 32 个独立的 64 位寄存器，专门用于存储浮点数，命名为 f0 - f31。

在此基础上，以下指令可以直接被处理器解读并执行

#align(center)[
  #block(
    table(
      columns: (1fr, 2fr),
      align: (center, left),
      table.header(
        [#text(weight: "bold")[汇编指令与调用格式#footnote[对于花括号，从其中的选项中选择一个以构成完整的指令]]],
        [#text(weight: "bold")[作用]]
      ),
      [`F{ADD/SUB/MUL/DIV/SQRT}.{S/D} f0 f1 f2`], [对浮点数 `f1` `f2` 进行对应运算，其中 S 代表两者为 float，D 代表 double，将结果存储到 f0],
      [`F{EQ/LT/LE}.{S/D} x5 f0 f1`], [对浮点数 `f0` `f1` 进行逻辑判断，其中 S 代表两者为 float，D 代表 double，将结果存储到 x5（一个整点计数器）],
      [`F{LW/LD/SW/SD} f0 {4/8}(x5)`], [将浮点数写入内存或读取内存中的浮点数，float 配合 4 字节，double 配合 8 字节使用],
    )
  )
]

==== 处理器的实现

===== 简单数据通路

在上文的介绍中，中央处理器的各类核心功能得到了具体的介绍，现要构建 CPU，则需要将这些功能模块按照一定的结构组合在一起，形成一个完整的处理器设计。

考虑 RISC-V 处理器的核心指令：
- `ld`，`sd` 用于链接内存和寄存器
- `and`, `or`, `add`, `sub` 用于计算
- `slt` 用于比较

具体来说，上述所有指令的计算步骤都大概遵循以下流程
1. PC（程序计数器）寄存器中的地址被送入指令内存中，指令内存根据地址读取指令并将其送入 IR（指令寄存器）中；
2. 根据指令的字段，选择相应的寄存器进行读取（通常是一个/两个）。
3. 将读取到的寄存器值送入 ALU 中进行计算，根据前文描述，这些核心指令都可以在 ALU 中实现，ALU 根据指令类型选择相应的运算模块进行计算，并将结果送回寄存器中；4. 条件跳转指令会根据 ALU 的计算结果来更新 PC 寄存器中的地址，而对于其余指令，PC 寄存器中的地址将自动加 4，以指向下一条指令。

在上述执行过程中，许多单元的数据可能来自多个来源，例如 PC 寄存器中的地址可能来自于 PC 寄存器的自动加 4，或来自于 ALU 的计算结果（例如条件跳转指令）；为此，复数个多选器需要被部署，以帮助这些单元选择正确的数据来源。

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/RISC-V子集基本实现.png", width: 95%),
  caption: [RISC-V 指令子集的一个简单通路基本硬件实现
  ]
)

上图展示了一个简单的 RISC-V 指令子集的数据通路硬件设计，我们逐个分析其作用

1. 最左边的 PC、Instruction Memory 和 Add 4 模块构成了指令获取单元，PC 寄存器中的地址被送入指令内存中，指令内存根据地址读取指令并将其送入下一模块；同时 Add 4 模块将 PC 寄存器中的地址加 4 后送回 PC 寄存器中，以获取下一指令。

2. 接下来，有 Registers（寄存器堆）和 ALU 模块，寄存器堆是一个允许输入 2 个寄存器读地址和 1 个寄存器写地址，并输出两个读寄存器值与当 RegWrite 信号有效时将写寄存器值写入寄存器堆的模块；ALU 模块则和先前讨论的 ALU 模块相同，允许输入两个操作数和一个控制信号，并输出一个结果。

  在下一步中，根据 Instruction Register 中指令的类型，控制单元会控制寄存器堆的读地址和写地址，以及 ALU 的输入和控制信号，以完成指令的执行。这个过程中，如果涉及到立即数，那么 imm Gen 模块将读取指令中的立即数，并用 ALUSrc 信号控制 ALU 的第二个输入是寄存器值还是立即数。

3. 对于一般的计算和读写指令，ALU 的输出将输入 Data Memory 模块，当指令为读内存指令，MemRead 信号有效，Data Memory 将 ALU 的输出作为地址读取内存中的数据并送回寄存器堆；当指令为写内存指令，MemWrite 信号有效，Data Memory 将 ALU 的输出作为地址，将寄存器堆中读出的数据写入内存中。

4. 特别的，对于条件跳转指令，当 PCSrc 信号有效时，PC 寄存器中的地址将被更新为 imm Gen 的输出，用于跳转到条件指令指定的位置；当 PCSrc 信号无效时，PC 寄存器中的地址将被更新为 Add 4 模块的输出，表明正常顺序执行。

可以发现，要实现上述数据通路正常工作，RegWrite、ALUSrc、MemRead、MemWrite、PCSrc 等控制信号的正确生成是至关重要的，这些控制信号的生成与操作指令的类型密切相关。因此，有必要设置一个控制单元，通过读取 Instruction Register 中的指令类型，即操作码（Opcode），来决定这些控制信号的值，以确保指令能够正确执行。

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/RISC-V子集基本实现-2.png", width: 95%),
  caption: [加入控制单元 Control 后的 RISC-V 指令子集的一个简单通路基本硬件实现，注意所有的控制线都来自于 Control 模块，而 Control 模块如何控制控制线完全取决于 Instruction Register 中指令的 Opcode 操作码
  ]
)

这里多了一个与门，位于 Control 输出的 Branch 信号和 ALU 输出的 Zero 信号之间；当 Opcode 表明指令是条件跳转指令时，Branch 信号有效，Opcode 令 ALU 切换到 Less 模式，当 ALU 的输出为 0 时，Zero 信号有效，表明 SLT 指令的条件满足，此时 PCSrc 信号有效，PC 寄存器中的地址将被更新为 imm Gen 的输出，实现条件跳转。

===== 时钟同步方法
计算机中的数据通路包含两种不同的逻辑单元，它们可以分作组合逻辑单元和状态逻辑单元两类。

组合逻辑单元是指输出完全由当前输入决定的单元，例如 ALU；在给定的参数和运算指令下，ALU 的输出是完全确定的，这样的单元内部不包含任何储存功能。

状态逻辑单元是指输出不仅由当前输入决定，还受到之前状态的影响的单元，例如寄存器；寄存器内部包含储存功能，其输出不仅取决于当前输入，还取决于之前储存的值。所以状态逻辑单元是时序的，或者说是时间相关的。

不得不提到的是，对于时序器件，如果没有任何时钟同步机制，那么读数据和写数据将可能发生在任意时间点，此时读数据可能是写前的旧数据，也可能是写后的新数据，这将导致数据的不确定性。为解决该问题，引入时钟信号来同步数据的读写操作

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/时钟同步方法.png", width: 95%),
  caption: [时序工作示意图
  ]
)

时钟信号是一个周期性的方波信号，通常由一个振荡器产生，其周期被称为时钟周期。为了简化分析，现规定对于时钟周期而言，所有写入操作仅发生在时钟的上升沿，时钟周期的剩余时间内用于执行所有组合逻辑单元的计算。这可以使得数据的读写操作在时钟周期内得到明确的划分。

===== 流水线设计

根据前文的介绍，RISC-V 指令的执行步骤主要分为以下五个阶段
1. 取指（IF）：从指令内存中读取指令并将其存储到指令寄存器中；
2. 译码（ID）：根据指令寄存器中的指令类型，读取相应的寄存器值，并进行必要的立即数扩展；
3. 执行（EX）：将译码阶段得到的寄存器值和立即数送入 ALU 中进行计算，得到结果；
4. 访存（MEM）：对于需要访问内存的指令，根据 ALU 的计算结果进行内存的读写操作；
5. 写回（WB）：将 ALU 的计算结果或内存的读出数据写回寄存器中。

先前的设计表明，在一个时钟周期内，处理器只能按照顺序依次执行上述五个阶段中的一个阶段，这被称作单周期模型（简单数据通路）；但实际上，这个过程有硬件资源被浪费，例如在访存时，用于计算的 ALU 已经空闲了，此时完全可以在访存的同时为下一条指令执行取指、译码和执行等阶段的操作，以提高处理器的效率。

流水线设计就是基于上述想法的一种处理器设计方法，其核心思想是将指令的执行过程划分为多个阶段，并在每个阶段中使用独立的硬件资源来处理不同的指令，从而实现指令的并行执行。这将提高一个时钟周期内的指令吞吐量，即每个时钟周期内完成的指令数量。

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/流水线设计.png", width: 95%),
  caption: [流水线设计中的指令执行时序图
  ]
)
注意上图，流水线设计的时钟周期为 200ps，每个时间周期中，不同的硬件都在并行处理不同命令的对应操作。可以发现，为了并行指令的同步执行，时钟周期的时长取决于耗时最大的阶段。

通过提高吞吐量，流水线设计可以显著提升处理器的性能。

===== 流水线冒险

尽管流水线技术能够提高效率，其带来的新问题也是不容忽视的，统称这些新问题为流水线冒险，主要分为以下三类情况。

1. 结构冒险

结构冒险指的是硬件结构不支持多条指令在同一时钟周期内执行，例如在单周期模型中，ALU 只能处理一条指令的计算，如果在流水线设计中有两条指令同时需要使用 ALU，那么就会发生结构冒险。

对于该问题，良好的时序设计可以避免结构冒险的发生。

2. 数据冒险

数据冒险指的是当一条指令需要使用先前指令的计算结果时，如果先前指令的计算结果尚未写回寄存器，那么就会发生数据冒险。

```asm
ld x1 0(x4)
ld x2 8(x4)
add x3 x1 x2
```

在执行 `add` 调用 ALU 前必须要 `ld` 命令写寄存器完毕，这使得流水线在执行 `add` 时会发生停滞，等待 `ld` 写就绪，由此造成的停滞称作气泡。

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/数据冒险.png", width: 95%),
  caption: [数据冒险示意图
  ]
)


为了避免数据冒险，在程序编译时，可以在不影响原程序执行逻辑的情况下，优化程序结构以规避之，例如对于代码

```asm
ld x1 0(x4)
addi x2 x1 5
ld x3 0(x4)
```

由于在 `addi` 之前执行 `ld x3` 不影响其结果，且不影响后来代码，故可以替换顺序为
```asm
ld x1 0(x4)
ld x3 0(x4)
addi x2 x1 5
```

3. 控制冒险

控制冒险指的是，当程序读取到条件跳转命令时，若条件跳转的判据不确定（如需要用于判断的寄存器还在流水线上计算），则程序无法明确下一条指令是什么，因此导致流水线停滞。

也可以像数据冒险一样，通过不干扰逻辑地调整指令顺序来尽量规避控制冒险，但若无法避免，那么处理控制冒险的方法之一是老老实实等待先前的指令执行完毕，再执行跳转。不过针对该问题也有更主动的处理方式，被称作预测：

当程序执行到条件控制语句时，其下一指令只可能为跳转后位置指令和顺序下一指令；不妨先假设该指令必然发生跳转，执行跳转后指令；这样，若程序真的执行跳转后指令，那么该决策不造成任何气泡，但程序若不执行之，那么撤销先前操作，转而重新从应当执行的命令开始执行。

预测可以使用“总是猜测跳转”的静态预测，也可以采用动态预测方案，即通过判断跳转的状况（是向前还是后？是用于构建循环还是跳出逻辑？）、历史上跳转发生占比来决定预测的策略。

优化流水线冒险是一种重要且复杂的处理器设计问题，好的设计可以显著提升处理器的性能。

===== 流水线设计的硬件实现

笔者并非专业的硬件设计者，故在此仅对流水线设计中的关键硬件进行简单介绍。

为了实现流水线设计，处理器需要在每个阶段之间设置寄存器来存储指令的中间结果，这些寄存器被称作流水线寄存器。

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/流水线寄存器.png", width: 95%),
  caption: [流水线寄存器的示意图，共有四个，介于五个阶段之间，分别为 IF/ID、ID/EX、EX/MEM、MEM/WB
  ]
)

对于每一条指令而言，一般而言其指令和数据（包括计算结果，与控制单元提供的多选器控制信号）都会依次通过 IF/ID、ID/EX、EX/MEM、MEM/WB 四个寄存器；以供在 IF、ID、EX、MEM、WB 五个阶段中顺序使用。

但是，有两类特殊状况，使得数据会在一个步骤回流到前面的步骤中
- 对于 WB 步骤，数据结果将会被写回 Regsiters，以供写寄存器使用；
- 对于 EX 步骤，数据结果可能将加上 PC 的值后被写回 PC，以供条件跳转指令使用；
这两个逆流步骤也是数据冒险和控制冒险的根源所在。

为此，除了简单实现中的控制单元以外，还有一些关键的控制硬件需要被部署

1. 冒险检测单元
冒险检测单元读取当前指令的类型和寄存器使用情况，以及流水线中前面指令的类型和寄存器使用情况，以判断是否存在冒险，它可以在必需时发出控制信号，手动制造气泡以解决冒险问题。

2. 前递单元
前递单元是针对数据冒险的一种优化方案：对于 WB 而言，它要么将 ALU 的计算结果直接前递到寄存器堆中供写寄存器使用，要么将内存的读出数据直接前递到寄存器堆中供写寄存器使用；这两种不同数据来源的数据冒险分别被称作 EX 冒险和 MEM 冒险；

在数据被读取，且明确命令是写回命令时，下一个命令不需要等到数据写回寄存器后再使用它，而是可以直接从前递单元中获取该数据，即将 EX 步骤或 MEM 步骤的结果直接旁路到下一条指令的 EX 输入中，以供下一条指令的 ALU 使用。

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/数据前递旁路.png", width: 95%),
  caption: [数据前递旁路示意图，注意其中的 Forwarding Unit，其控制 ALU 前的两个多选器，当其认为数据有必要前递时，多选器会直接选择前递单元的输出而非寄存器堆的输出
  ]
)

3. 分支处理单元
分支处理单元是针对控制冒险的一种优化方案：对于一条条件跳转指令，其要么跳转，要么不跳转，当是否跳转没有把握（对应值还未读取/计算完成），可以先假定其跳转情况，执行跳转后的指令；

假设预测跳转情况的算法可分为静态预测和动态预测两类，前者指的是总是假设跳转发生或不发生，后者指的是根据历史跳转情况来预测当前跳转情况。

一个流行的预测方法是 2 位状态机，其状态转移图如下
#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/2位状态机转移图.png", width: 85%),
  caption: [2 位状态机转移图示意
  ]
)


当后续指令的执行结果表明该假设正确，那么就不需要做任何处理。但若后续指令的执行结果表明该假设错误，那么就需要撤销之前的操作，可以被撤销的操作包含 IF、ID、EX；当指令被认定为需要撤销时，分支处理单元会控制 IF/ID、ID/EX、EX/MEM 三个寄存器中的指令被替换为 NOP（无操作指令），以使得这些指令不对处理器的状态产生任何影响；同时，分支处理单元会控制 PC 寄存器中的地址被更新为正确的地址，以供下一条指令的正确执行。

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/分支处理单元.png", width: 95%),
  caption: [包含分支处理单元的流水线设计示意图
  ]
)

上图中，Hazard Detection Unit 负责检测冒险，当回溯需要被进行时，IF Flush 线路、IF/ID 寄存器、ID/EX 寄存器的 M 部分将会被该单元的指令线控制，以写入 NOP；同时 PCSrc 线路（图中直接连接 PC 的那条）将会被该单元的指令线控制，以更新 PC 寄存器中的地址，从另一个跳转情况开始执行。


总而言之，处理器的实现是一个复杂的系统工程：首先，控制单元需要足够巧妙，以正确调动组合逻辑单元执行指定计算、状态逻辑单元执行指定存储，并通过时钟周期同步；其次，流水线设计需要足够合理，以提高指令的并行执行效率，在同一时刻充分利用硬件资源；最后，冒险检测单元、前递单元、分支处理单元等控制硬件需要足够智能，以优化冒险问题带来的性能损失。

=== 储存设备的运行原理

储存设备指的是用于存储数据的设备，上文所讨论的寄存器和内存都是储存设备的例子。储存设备的重要性对于计算机不言而喻，计算机的运行离不开数据的存储和访问。

==== 储存设备的类型及其硬件实现

===== 寄存器
对于寄存器而言，一个流行的实现方式是采用 D 触发器，D 除法器是一种具有特殊循环依赖的逻辑电路，其实现如下图
#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/D触发器.png", width: 75%),
  caption: [D 触发器门电路
  ]
)

单独观察其中的两个 NOR 门，发现它们的输出将作为对方的输入之一，这使得它们形成了一个循环依赖关系，这种拓扑结构被称为 S-R 锁存器；
#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/SR锁存器.png", width: 45%),
  caption: [S-R 锁存器
  ]
)

当 R 和 S 都被置为 0，那么 S-R 锁存器有两种稳态情况：Q = 0，Q' = 1 或 Q = 1，Q' = 0；这两种状态都能够自洽。

当 R = 1，S = 0 时，S-R 锁存器被置为 Q = 0，Q' = 1 的状态；当 R = 0，S = 1 时，S-R 锁存器被置为 Q = 1，Q' = 0 的状态；这两类输入可以使得 S-R 锁存器在两种稳态之间切换，这就使得该结构可以在输入信号的控制下，保持或切换状态，从而实现数据的存储功能。

为了实现写同步，希望仅在时钟信号的上升沿进行数据写，所以在 S-R 锁存器前增加时钟控制的 AND 门，得到 D 触发器；D 触发器有 C （时钟）输入，D （数据）输入。

以下是 C 和 D 与 S 和 R 的真值表
#align(center)[
  #block(
    table(
      columns: (1fr, 1fr, 1fr, 1fr),
      align: (center),
      table.header(
        [#text(weight: "bold")[C]],
        [#text(weight: "bold")[D]],
        [#text(weight: "bold")[S]],
        [#text(weight: "bold")[R]]
      ),
      [0], [0], [0], [0],
      [0], [1], [0], [0],
      [1], [0], [0], [1],
      [1], [1], [1], [0],
    )
  )
]

可以发现，仅当 C 有效，D 的值才会被传递到 S 和 R 中，从而控制 S-R 锁存器的状态；当 C 无效时，无论 D 的值如何，S 和 R 都为 0，此时 S-R 锁存器保持当前状态不变。以此，即可实现寄存器的写同步。

接下来，将多个寄存器组合，即可实现寄存器堆，实现读/写寄存器的地址选择功能；
#align(center)[
  #block(
    table(
      stroke: none,
      columns: (1fr, 1fr),
      align: (center),
      [
      #figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/寄存器堆-读.png", width: 100%),
        caption: [实现寄存器堆读功能的硬件设计，使用多选器来选择要读的寄存器]
      )
      ], [
      #figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/寄存器堆-写.png", width: 100%),
        caption: [实现寄存器堆写功能的硬件设计，使用译码器将数据总线分配到要写的寄存器上]
      )
      ]
    )
  )
]

寄存器是一种读写速度非常快的储存设备，读写寄存器通常在一个时钟周期内完成，考虑到现代 CPU 的工作频率，寄存器堆的读端口访问延迟通常小于 1ns，写延迟也在同一数量级内。

===== SRAM 内存
SRAM（静态随机存取存储器）是一种常见的内存类型，是一种阵列储存电路，其输入输出结构如下图所示
#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/SRAM.png", width: 65%),
  caption: [SRAM 内存的输入输出结构示意图（以 16 位数据[x 16] 和 21 位地址[2M] 的 SRAM 示例）
  ]
)

当 Chip Select（CS，片选信号）有效，SRAM 的读/写功能才会被激活；在此基础上，输入 Output Enable 或 Write Enable 将控制 SRAM 进行读或写操作；对于读操作而言，SRAM 将根据输入的地址输出对应的数据；对于写操作而言，SRAM 将根据输入的地址将输入的数据写入对应的位置。

为了实现对应的大规模储存，一个最小的存储单元将被建立，在寄存器堆中，这个单元是一个 D 触发器；而在 SRAM 内存中，对应的最小储存单元是 6T Cell，
#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/6TCell.png", width: 65%),
  caption: [一个 6T Cell 的示意图]
)
观察中央结构，两个推挽电路各自的输出与对方的输入端连接，这构成了一个双反相器互连结构。这使得电路仅包含两种稳态情况 Q = VDD，QB = 0 与 Q = 0，QB = VDD；

与此同时，Q 和 QB 分别通过两个 MOS 连接到两个位线 BL 和 BLB 上；而这两个 MOS 的通断又受到 WL 的控制，这使得该装置可以进行以下操作：

- 状态保持
当 WL 无效，那么两个 MOS 都处于断开状态，6T Cell 内部的双反相器互连结构将保持当前状态不变，无论外部的位线 BL 和 BLB 的电压如何变化；

- 写入数据
当 WL 有效时，两个 MOS 都处于导通状态，此时位线 BL 和 BLB 的电压将直接影响 6T Cell 内部的状态；例如，当 BL = VDD，BLB = 0 时，6T Cell 内部的状态将被写入 Q = VDD，QB = 0；当 BL = 0，BLB = VDD 时，6T Cell 内部的状态将被写入 Q = 0，QB = VDD；以设定其中的稳态状态情况。

- 读取数据
当 WL 有效时，两个 MOS 都处于导通状态，此时位线 BL 和 BLB 的电压将受到 6T Cell 内部状态的影响；读取 BL 和 BLB 的电压差可以判断 6T Cell 内部的状态是 Q = VDD，QB = 0 还是 Q = 0，QB = VDD；以此来读取其中的稳态状态情况。

相较于 D-Latch，6T Cell 的设计使得其在保持状态时不需要持续的电流输入，这使得 SRAM 内存具有较低的功耗；且对应的晶体管设计有利于阵列化，使得 SRAM 内存能够实现大规模的储存。

最后，为了组织如此大规模的储存，二级译码技术将被应用于地址线的解码

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/SRAM译码.png", width: 85%),
  caption: [一个 4M x 8 SRAM 的译码示意图]
)
对于 22 位的地址，先分离上 12 位输入进 4096 位译码器中，对于每一个数据位，都选中 4096 列中的一个，每一列包含 1024 个 6T Cell；再分离下 10 位输入进 1024 位译码器中，对于每一列中的 1024 个 6T Cell，都选中其中的一个，组合拼凑 8 个选中的数据位，以完成对单个字节的访问。

通常而言，SRAM 板上芯片的读写延迟在 10ns 数量级；而集成在片上的 SRAM 内存的读写延迟则仅有几纳秒或更少，这类 SRAM 也称作 Cache，将在后文提及。

===== DRAM 内存
DRAM（动态随机存取存储器）是另一种常见的内存类型，但其最小储存单元原理和前两者都不同，DRAM 仅依靠一个晶体管和一个电容就能储存 1 位数据。

#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/DRAM单元.png", width: 65%),
  caption: [DRAM 储存单元示意图]
)

上图中的装置可以进行以下操作，以实现数据的存储和访问
- 状态保持
当 WL（字线） 无效时，DRAM 储存单元处于非选中状态，此时 MOS 关闭，电容器保存当前的电荷状态，从而保持储存的数据不变；

- 写入数据
当 WL 有效时，MOS 导通，此时 BL（位线） 的电压将直接传递到电容器上；例如，当 BL = VDD 时，电容器将被充电，储存的数据为 1；当 BL = 0 时，电容器将被放电，储存的数据为 0；以设定其中的状态情况。

- 读取数据
当 WL 有效时，MOS 导通，此时电容器的电荷状态将影响 BL 的电压；一般的读取方式是，先将位线 BL 预充电到 VDD/2 的电压水平，然后根据电容器的状态，BL 的电压将被拉高或拉低，而这种电压的变化可以被检测到，从而判断储存的数据是 1 还是 0；以此来读取其中的状态情况。
#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/DRAM读取电路.png", width: 95%),
  caption: [DRAM 读取电路图]
)

VDD/2 的预充电是由图中的 Voltage eq.circuit 模块实现的，VDD/2 通过晶体管连接到 BL，且其栅极都连接到 EQ 信号线上；当 EQ 信号有效时，晶体管导通，BL 被预充电到 VDD/2 的电压水平；

当预充电完成后，WL 信号被激活，相关 BL 上的电压将根据储存的数据被拉高或拉低；并被 Sensing circuit 检测，以判断储存的数据是 1 还是 0。

- 数据的刷新
特别的，据前文所述，读取数据将会造成电容器发生充放电，这实际上是一种破坏性读取，会使得电容的电平逐渐归中，从而损失数据；

为此，DRAM 内存需要定期进行刷新操作，即重新写入数据以恢复电容器的电荷状态；刷新操作通常由内存控制器自动管理，确保数据的完整性。对于现代成熟的 DRAM 技术而言，为刷新所占用的 DRAM 工作时长占比在 1% ~ 2% 之间。

通常而言，DRAM 的读写延迟在 50ns 数量级；但由于其简洁的储存单元设计，DRAM 非常利于集成，使得其能够实现大规模的储存，且成本较低，因此被广泛应用于计算机系统中作为主内存。

#line(length: 100%)

DDR（Double Data Rate）技术是现代 DRAM 内存的一种重要发展，不同于传统技术（SDR）仅在时钟周期的上升沿进行数据传输，DDR 技术允许在时钟周期的上升沿和下降沿都进行数据传输，从而实现了数据传输速率的翻倍。

Bank 是现代 DDR 内存中的一个重要概念，指的是内存被划分成的多个独立区域，每个 Bank 都有自己的控制逻辑和数据总线，这使得内存控制器可以同时访问多个 Bank，从而提高内存的并行访问能力和整体性能。
#figure(image("images/计算机与工程知识/计算机的基本结构与运行原理/DRAM-Bank.png", width: 95%),
  caption: [DRAM 的 Bank 结构示意图，Pre 指可以向某个 Bank 发送预充电命令，Act 指可以将 Bank 中某行的数据输入到缓冲区]
)

===== Flash / EEPROM 储存设备
Flash 是一种 EEPROM（Electrically Erasable Programmable Read-Only Memory，电可擦除可编程只读储存器），是一种非易失性储存设备，能够在断电后保持数据的完整性。

// 原理在今后需要时再调查补上

对于 Flash 而言，其读写操作的延迟通常在 5us ~ 50us 级别，显著低于 RAM，但其单位存储成本较低，且具有非易失性，因此仍然被广泛应用。

采用 Flash 储存方式的产品除了专门的 Flash 芯片，还包括 SSD（Solid State Drive，固态硬盘）、USB 闪存驱动器（U盘）、eMMC（embedded Multi-Media Card，嵌入式多媒体卡）

===== 磁盘
磁盘是一种传统的非易失性储存设备，由一个或多个旋转的盘片组成，每个盘片表面都覆盖有磁性材料，用于存储数据；磁盘通过磁头来读写数据，磁头在盘片上方飞行，通过改变磁性材料的极性来存储数据。

// 原理在今后需要时再调查补上

磁盘的单位数据容量成本是上述储存介质中最低的，但其读写延迟通常在 5ms ~ 20ms 级别，显著高于 Flash，因此在现代计算机系统中，磁盘主要被用作大容量静态数据的长期存储，而不适合频繁访问的数据。


==== Cache 技术


=== IO 设备的运行原理


== 计算机操作系统基本知识


== 现代计算机高级编程语言


== 常见程序设计模式


== 常用软件设计算法


= 嵌入式开发知识



= 娱乐



