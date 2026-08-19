#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style

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

#figure(image("images/differential-connection.png"),
  caption: [
    关系图
  ]
)

// 以后学到了在补充矢量场的微分，这涉及到 Jacobian 矩阵

==== 场的积分

===== 取场的微分元

在一元函数的概念中，积分指的是函数在一个区间上的累积量，或者说是函数图像与 $x$ 轴之间的有向面积。多元函数的积分概念与一元函数类似，其也与累积量有关

在积分中，微分元的定义至关重要，例如对于一个一元函数而言，微分元 $d x$ 表示一个无穷小的增量
$
  I = integral_0^(+oo) f(x) d x
$

而积分号表明在指定范围内，将函数值和微分元的乘积进行累加，得到一个数值。

对于 N 元函数而言，其自变量有 N 个自由度，所以 N 元函数的微分元由 N 个无穷小增量组成，例如对于一个二元函数而言，总将它表达为
$
  I = integral.double_D f(x, y) d sigma
$
其中 $D$ 是平面 $cal(R)^2$ 上的有界可求面积闭区域，$f(x, y)$ 是定义在 $D$ 上的二元函数，$d sigma$ 是一个无穷小的面积增量#footnote[依据黎曼和的积分定义形式，将整个区域分解为许多个无穷小区域，无穷小区域的直径的最大值趋于零，那么此时积分也可定义为 $lim_(lambda -> 0) sum_(i=1)^n f(x_i, y_i) Delta sigma_i$，在黎曼和表达式中，$Delta sigma_i$ 即用以表示小区域的面积，在转写的积分表达式中，$d sigma$ 即也用于表示小区域的面积，表示面积微元。]。在直角坐标系中，$d sigma$ 可以是一个矩形的面积微元，依据矩形的面积公式，若小区域在 x 方向上的增量长度为 $d x$，在 y 方向上的增量长度为 $d y$，则面积微元 $d sigma$ 可以表示为 $d x d y$。

$
  I = integral.double_D f(x, y) d x d y
$

要完成对于上述二元函数的积分，可以将一个二元函数的积分转化为两个一元函数的积分来完成；例如说对于一个二元函数 $f(x, y)$，可以先固定 $y$ 的值，将其看作一个一元函数 $f(x, y_0)$，对 $x$ 进行积分，即可得到对于指定 $y$ 位置，在 x 方向上的累积量；接着再对 $y$ 进行积分，即可得到整个区域内的累积量。

$
  I = integral.double_D f(x, y) d x d y = integral_(y_1)^(y_2) d y integral_(x_1)^(x_2) f(x, y) d x
$

有时，要积分的平面也不一定平行于 xOy 平面，而是一个倾斜的平面，此时可以将其看作是一个函数 $z = z(x, y)$ 的图像，那么对于该平面上的一个微小区域而言，其面积微元 $d sigma$ 可以表示为
$
  d sigma = sqrt(1 + (frac(partial z, partial x))^2 + (frac(partial z, partial y))^2) d x d y
$
利用投影的原理，倾斜平面上的微小区域也是一个平面，该平面对于 xOy 平面之间的夹角为 $theta$，则有其面积为其在 xOy 投影上的面积除以倾斜角的余弦值 $d sigma = frac(d x d y, cos theta)$，又因为 $cos theta = frac(1, sqrt(1 + (frac(partial z, partial x))^2 + (frac(partial z, partial y))^2))$，所以就得到了上面的表达式。以此可以完成对于倾斜平面上的二元函数的积分。

===== 场的第二类积分

上述的讨论是基于标量积分的，先前提到多元函数的值域可以是标量集，也可以是向量空间，那么对于后者而言，也可以定义矢量积分，例如说对于一个二元函数 $F(x, y) = P(x, y) hat(i) + Q(x, y) hat(j)$，可以定义其在区域 $D$ 上的第二类积分形为
$
  I = integral.double_D F(x, y) d sigma = integral.double_D P(x, y) hat(i) d sigma + integral.double_D Q(x, y) hat(j) d sigma
$
即对于区域内进行矢量的黎曼和。

有两类在三维空间中常用的矢量积分，分别是曲面积分和线积分，它们的积分结果分别称为通量和环量

通量的定义是，对于一个三维空间中的矢量场 $F(x, y, z) = P(x, y, z) hat(i) + Q(x, y, z) hat(j) + R(x, y, z) hat(k)$，以及一个曲面 $Sigma$，则 $F$ 在 $Sigma$ 上的通量定义为
$
  W = integral.double_Sigma F(x, y, z) dot.op hat(n) d S
$
即在曲面 $Sigma$ 上，矢量场 $F$ 与曲面法向量 $hat(n)$ 的点乘积分。

环量的定义是，对于一个三维空间中的矢量场 $F(x, y, z) = P(x, y, z) hat(i) + Q(x, y, z) hat(j) + R(x, y, z) hat(k)$，以及一个闭合曲线 $Gamma$，则 $F$ 沿着 $Gamma$ 的环量定义为
$
  I = integral.cont_Gamma F(x, y, z) dot.op d r
$
即在闭合曲线 $Gamma$ 上，矢量场 $F$ 与曲线的切向量 $d r$ 的点乘积分。

===== 其它坐标系下的场积分与拉梅系数

除了直角坐标系，常用的坐标系还有柱面坐标系和球面坐标系，要在这两个三维坐标系下进行积分，应当确认微分元的表达式。

#figure(image("images/其他坐标系.webp", width: 80%),
  caption: [
    柱面坐标系和球面坐标系示意图
  ]
)

可以发现，此时在三维坐标系下，体积微元不在仅和坐标增量的乘积有关，还和坐标增量所在位置的坐标值有关。在直角坐标系中，体积微元可以看作是小立方体，$d V = d x d y d z$，但在柱面坐标中，明显当 $r$ 越大，同样的 $d theta$ 所对应的弧长就越大，经过一些数学推导，可以认为在这些坐标系下，微元的表达式分别为
$
  cases(
    d V = d x dot d y dot d z quad text("直角坐标系") &,
    d V = d r dot r d theta dot d z quad text("柱面坐标系") &,
    d V = d r dot r d theta dot r sin theta d phi quad text("球面坐标系")
  )
$

可以发现，对于复杂的球面坐标系，在 $phi$ 方向上的微分元不仅和 $d phi$ 有关，还和 $r$ 和 $theta$ 的值有关；因为 $phi$ 角度变化对于小体积元边长的影响要首先乘上在变化方向上的半径，而本部分半径为 $r sin theta$，因此微分元的表达式中就包含了 $r sin theta$ 这一项。

#figure(image("images/球面坐标系微分元.jpg", width: 35%),
  caption: [
    球面坐标系中的微分元示意图
  ]
)

由此，方向微分对于微分元的变化的影响系数被称作拉梅系数，记作 $h_i$，对于上述三种坐标系而言，拉梅系数分别为
$
  cases(
    h_x = 1 \, h_y = 1 \, h_z = 1 quad text("直角坐标系") &,
    h_r = 1 \, h_theta = r \, h_z = 1 quad text("柱面坐标系") &,
    h_r = 1 \, h_theta = r \, h_phi = r sin theta quad text("球面坐标系")
  )
$

在积分中，若要将积分微元转写为在各个方向上的变化分量的乘积积分形式，则需要将微分元乘上对应方向的拉梅系数，以显示表达变化元对于微分元大小的影响
$
  I = integral.triple_V f(r, theta, phi) d V = integral.triple_V f(r, theta, phi) h_r h_theta h_phi d r d theta d phi
$

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

直接计算该积分略显复杂，为了更好地研究矢量场的通量，引入散度的概念，散度是一个标量场，定义为

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

==== 在其它常见坐标系中梯度、散度和旋度的表达式

先前对于梯度、散度和旋度的定义都是在直角坐标系下的表达式，在其它常见坐标系中，这些算子的表达式会有所不同

===== 梯度表达式

梯度描述场沿着某个方向的变化率，但在柱面坐标系中，$d theta$ 所对应的弧长可能因为 $r$ 的不同而不同，这导致微分所对应的实际空间变化量不同，因此在计算在 $theta$ 方向上的变化率时，不能直接套用偏导数的公式来表示，而是要将偏导数的值除以拉梅系数 $h_theta$ 来修正。
$
  "grad" f = 1/h_1 frac(partial f, partial u_1) hat(a_1) + 1/h_2 frac(partial f, partial u_2) hat(a_2) + 1/h_3 frac(partial f, partial u_3) hat(a_3)
$

===== 散度表达式

散度描述了场的发散程度，在其它三维坐标系中散度的定义如下
$
  "div" F = 1/(h_1 h_2 h_3) (frac(partial, partial u_1) (h_2 h_3 F_1) + frac(partial, partial u_2) (h_3 h_1 F_2) + frac(partial, partial u_3) (h_1 h_2 F_3))
$

要推导该公式，首先取得微元体积 $h_1 d u_1 h_2 d u_2 h_3 d u_3$；然后计算三个方向的通量，以穿过 $u_1$ 方向为例，穿过的面积理应为 $S_1 = h_2 h_3 d u_2 d u_3$，所以总的来说，从此方向穿出的通量应当为
$
  W_1 = (partial (F_1 dot S_1)) / (partial u_1) d u_1 = frac(partial, partial u_1) (h_2 h_3 F_1) d u_1 d u_2 d u_3
$

另外两个方向也同理，最后将三个方向的通量相加，并除以体积微元 $h_1 d u_1 h_2 d u_2 h_3 d u_3$，就得到了上面的散度表达式。

===== 旋度表达式

旋度描述了场的旋转性质，在其它三维坐标系中旋度的定义如下
$
  "rot" F = 1/(h_1 h_2 h_3) det(vec(
    h_1 hat(a_1) quad & h_2 hat(a_2) quad & h_3 hat(a_3) &,
    frac(partial, partial u_1) quad & frac(partial, partial u_2) quad & frac(partial, partial u_3) &,
    h_1 F_1 quad & h_2 F_2 quad & h_3 F_3 &
  ))
$

要推导该公式，首先取一个方向如 $u_3$，计算在 $u_1 u_2$ 平面上的旋转强度，设有有一在 $u_1, u_2$ 方向上的小矩形，边长为 $h_1 d u_1$ 和 $h_2 d u_2$，则该矩形的面积为 $S = h_1 h_2 d u_1 d u_2$，

考虑 $u_1$ 方向的两条边，这两条边上的环量贡献为 $((F_1 h_1)|_(u_2) - (F_1 h_1)|_(u_2 + d u_2)) dot d u_1$，减号表明两条边的贡献方向相反；同时，有泰勒展开的公式表明
$
  (F_1 h_1)|_(u_2 + d u_2) = (F_1 h_1)|_(u_2) + frac(partial, partial u_2) (h_1 F_1) d u_2 + o(d u_2)
$

同理，$u_2$ 两条边上的环量贡献为 $((F_2 h_2)|_(u_1 + d u_1) - (F_2 h_2)|_(u_1)) dot d u_2$，同样有泰勒展开的公式表明
$
  (F_2 h_2)|_(u_1 + d u_1) = (F_2 h_2)|_(u_1) + frac(partial, partial u_1) (h_2 F_2) d u_1 + o(d u_1)
$

然后，根据此与计算旋度的定义，进一步计算得到该方向上的旋度为
$
  lim_(d u_1, d u_2 -> 0) frac( (frac(partial, partial u_1) (h_2 F_2) d u_1 + o(d u_1)) d u_2 - (frac(partial, partial u_2) (h_1 F_1) d u_2) d u_1 + o(d u_2) d u_1, h_1 h_2 d u_1 d u_2) \ = frac(1, h_1 h_2) (frac(partial, partial u_1) (h_2 F_2) - frac(partial, partial u_2) (h_1 F_1))
$

同理对于另外两个方向也可以得到相应的旋度表达式，最后将三个方向的旋度表达式分别乘上该方向上的基向量 $a_i$ ，组合在一起，就得到了上面的旋度表达式。

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


