#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style

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

#figure(image("images/麦克斯韦方程组-1.png", width: 70%),
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


#figure(image("images/麦克斯韦方程组-3.png", width: 50%),
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

#figure(image("images/麦克斯韦方程组-4.png", width: 50%),
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

#figure(image("images/麦克斯韦方程组-5.png", width: 50%),
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

这仅对于静电场成立，因为在非静电场中，时变电场产生的时变磁场将对电场强度产生影响，使得电场强度不再仅仅由电位的梯度决定。

在更一般的电磁场中，有法拉第定律
$
  nabla times upright(bold(E)) = - frac(partial upright(bold(B)), partial t) = -nabla times frac(partial upright(bold(A)), partial t)
$

结合矢量磁位#footnote[矢量磁位的定义请在下文查阅]在表达式中，所以在非静电场中，应当有
$
  nabla times (arrow(E) + frac(partial upright(bold(A)), partial t)) = 0
$

对于一个旋度为 $0$ 的场，根据矢量分析的相关定理，我们可以知道该场可以表示为某个标量场的梯度，此时的梯度是场的势，定义为一般场的电位
$
  E + frac(partial upright(bold(A)), partial t) = - nabla V
$


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

根据这个定义定义传导电流密度 $j$ 为
$
  arrow(j) = lim_(S -> 0) (d arrow(I))/(d S)
$

其中 $arrow(I)$ 是电流矢量，长度为电流强度，方向为电流方向；而 $d S$ 是面积元的面积，方向为面积元的法线方向。这样也有关系式
$
  I = integral.double_S arrow(j) dot d arrow(S)
$

麦克斯韦提出，电流除了由实际的电荷移动形成的传导电流以外，还可以由电场的变化形成位移电流，位移电流密度定义为
$
  arrow(j_d) = epsilon_0 (d arrow(E))/(d t)
$

事实证明，传导电流和位移电流在产生磁场方面是等效的，后文将会介绍安培-麦克斯韦定律来说明这一点。

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

如果电场中存在位移电流，即因电场的变化而产生的电流，那么安培环路定律的表达式需要进行修正，修正后的表达式为
$
  integral_L arrow(B) dot d arrow(l) = mu_0 I + mu_0 epsilon_0 (d Phi_E)/(d t)
$

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

=== 媒质的电磁性质

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

极化现象的本质是非导体介质内部的电荷在外电场下发生位移，以构建抵消外电场的内部电场，从而使得介质内部的电场强度降低。

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

=== 电磁场的边界条件

实际情境中，往往会遇到由不同媒质构成的电磁系统，在两种不同媒质的边界面上，电磁场的分布会发生突变，称这种场量的变化规律为电磁场的边界条件。由麦克斯韦方程组，可以推导得到以下边界条件结论。

设有两种媒质，其分界面为 $S$，媒质 $1$ 和媒质 $2$ 分别位于 $S$ 的两侧，设 $n$ 是从媒质 $1$ 指向媒质 $2$ 的单位法向量，第一种媒质的介电常数、磁导率和电导率分别为 $epsilon_1$、$mu_1$ 和 $sigma_1$，第二种媒质的介电常数、磁导率和电导率分别为 $epsilon_2$、$mu_2$ 和 $sigma_2$。

那么，在边界上的电磁场满足以下边界条件

$
  cases(
    n dot (D_"2" - D_"1") = rho_S,
    n times (E_"2" - E_"1") = 0,
    n dot (B_"2" - B_"1") = 0,
    n times (H_"2" - H_"1") = J_S,
  )
$

其中 $D_"1"$ 和 $D_"2"$ 分别是媒质 $1$ 和媒质 $2$ 中的电位移强度，$E_"1"$ 和 $E_"2"$ 分别是媒质 $1$ 和媒质 $2$ 中的电场强度，$B_"1"$ 和 $B_"2"$ 分别是媒质 $1$ 和媒质 $2$ 中的磁感应强度，$H_"1"$ 和 $H_"2"$ 分别是媒质 $1$ 和媒质 $2$ 中的磁场强度，$rho_S$ 是边界面上的面电荷密度，$J_S$ 是边界面上的面电流密度。

要推导上述边界条件，对于法向分量，可以在边界面上取一个小的柱体作为高斯面，柱体的底面和顶面分别位于两种媒质中，柱体的母线和边界面垂直。对该区域使用高斯电/磁定理，可以得到电位移强度和磁感应强度的法向分量的边界条件；对于切向分量，可以在边界面上取一个小的矩形回路，矩形回路的一边和边界面平行，矩形回路的两条边分别位于两种媒质中。对该区域使用法拉第电磁感应定律和安培-麦克斯韦定律，可以得到电场强度和磁场强度的切向分量的边界条件。

此外，依据电流的连续性方程，还应当能推出
$
  n dot (J_"2" - J_"1") = - (d rho_S)/(d t)
$

由物态方程 $J = sigma E$ 也可以推导出
$
  n times (J_"2" / sigma_"2" - J_"1" / sigma_"1") = 0
$

#line(length: 100%)

值得注意的是，对于下列特殊媒质，边界条件较为特殊：

- 理想导体 $(sigma -> +oo)$

  理想导体是电导率无穷大的导体，其内部电场必定为 $0$（静电平衡），内部可以建立稳恒磁场或磁场为 $0$，导体表面可以具有 $rho_S$ 和 $J_s$，这就使得理想导体表面仅可能具有法向电场。

- 理想铁磁质 $(mu -> +oo)$

  理想铁磁质是磁导率无穷大的磁介质，其内部磁场必定为 $0$，内部可以建立稳恒电场或电场为 $0$，介质表面可以具有 $rho_S$ 和 $J_s$。

  由于 $n times (H_"2" - H_"1") = n times (B_"2" / mu_"2" - B_"1" / mu_"1") = J_S$，如果两种介质都为理想介质，那么 $J_S = 0$，这表明 $B_"1t" / mu_"1" = B_"2t" / mu_"2"$。

  又因为 $B_"2n" = B_"1n"$，磁场法向分量连续，所以 $tan theta_1 : tan theta_2 = mu_1 : mu_2$，当 $mu_1 -> +oo$ 时，$theta_2 -> 0$，即铁磁质表面磁场趋向于垂直于理想铁磁质的表面，这就使得理想铁磁质表面仅可能具有法向磁场。

=== 静态电磁场的分析

静态场指的是时变电磁场的特例，包含以下三种情况：

- 静电场

  由静止的、电量不随时间变化的电荷分布产生的电场。是有散无旋的电场。

- 恒定电场

  在导电媒质中，由恒定电流产生的电场。是无散无旋的电场。

- 恒定磁场

  由恒定电流或永久磁体产生的磁场。是无散有旋的磁场。

在上述条件下，麦克斯韦方程组中的时间导数项为零
$
  cases(
    (partial D)/(partial t) = 0,
    (partial B)/(partial t) = 0,
    (partial rho_V)/(partial t) = 0
  )
$

==== 静态电场的泊松方程和拉普拉斯方程

泊松方程指的是形如 $laplace F = f$ 的偏微分方程，其中 $laplace$ 是拉普拉斯算子，$F$ 是未知函数，$f$ 是已知函数。而拉普拉斯方程指的是泊松方程中 $f = 0$ 的偏微分方程。

在静电场中，有 $E = - nabla phi$，且根据高斯定律，$nabla dot E = rho_V / epsilon_0$。

将前者代入后者，得到#footnote[Laplace 算子定义为 $laplace F = nabla dot (nabla F)$。]
$
  laplace phi = - rho_V / epsilon_0
$

这便是静电场电位的泊松方程。特别的，在电荷分布为零的区域，泊松方程化为拉普拉斯方程 $laplace phi = 0$。

在恒定电场中，情况类似，考虑物态方程 $J = sigma E$，而 $nabla dot J = nabla dot (sigma E) = sigma nabla dot E = 0$。故恒定电场的电位也满足拉普拉斯方程 $laplace phi = 0$。

==== 矢量磁位和标量磁位

为了使得接下来的介绍可以平滑进行，现介绍两个新概念：矢量磁位和标量磁位，这两个场量不具有任何物理意义，但将作为计算工具被引入。

对于电场而言（静电场），有电位与其关系为 $E = - nabla V$，对于磁场而言，也有标量磁位的定义，有
$
  H = - nabla phi_m
$
其中 $phi_m$ 是标量磁位。#footnote[和电位一样，$E = -nabla V$ 仅对于静电场成立，这是因为静电场是无旋的，所以可以用一个标量函数来描述，有旋区域的电位需要加上矢量磁位对时间的变化率；而对于磁场而言，同理，$H = -nabla phi_m$ 仅适用于无电流区域，因为在有电流的区域，磁场是有旋的，所以不能用一个标量函数来描述。]

对于磁场而言，还有矢量磁位的定义，有
$
  B = nabla times A
$
其中 $A$ 是矢量磁位。

仔细观察会发现，能够使得上述矢量磁位方程成立的 $A$ 的取值并不唯一，因为对于任意一个标量函数 $f$，$nabla times (A + nabla f) = nabla times A$，所以 $A$ 和 $A + nabla f$ 都满足 $B = nabla times A$。因此，矢量磁位的定义并不能唯一确定一个矢量磁位，这种现象称为矢量磁位的规范不确定性。

一般而言，我们会选择满足 $nabla dot A = 0$ 的矢量磁位，这种选择被称为库仑规范（Coulomb 规范）。#footnote[另外，关于 $A$ 的选取还有另一种规范，称为洛伦兹规范（Lorenz 规范），满足 $nabla dot A + (1/c^2) (partial V)/(partial t) = 0$，其中 $c$ 是光速。]

==== 静态磁场的泊松方程和拉普拉斯方程

根据拉普拉斯方程应当有 $nabla times B = mu J_c$，将矢量磁位的定义 $B = nabla times A$ 代入有
$
  nabla times (nabla times A) = nabla (nabla dot A) - laplace A = mu J_c
$

如果 $A$ 的选取是满足库伦规范的矢量磁位，那么 $nabla dot A = 0$，上述方程化为
$
  laplace A = - mu J_c
$

这便是静态磁场的矢量磁位的泊松方程。特别的，在电流分布为零的区域，泊松方程化为拉普拉斯方程 $laplace A = 0$。

又有根据拉普拉斯方程，在静态磁场中 $nabla dot B = 0$，而将标量磁位的定义 $H = - nabla phi_m$ 代入有
$
  nabla dot (nabla phi_m) = laplace phi_m = 0
$

故静态磁场的标量磁位的拉普拉斯方程为 $laplace phi_m = 0$。

==== 分离变量法求解拉普拉斯方程

===== 拉普拉斯方程的通解

所以，为了分析电磁场，能够有效求出拉普拉斯方程的通解是必要的，分析二维情况下平面直角坐标系的拉普拉斯方程
$
  laplace F = 0 => (partial^2 F) / (partial x^2) + (partial^2 F) / (partial y^2) = 0
$

如果 $F$ 可以写作 $X(x)Y(y)$ 的形式，那么上述方程可以化为
$
  1/X (d^2 X) / (d x^2) + 1/Y (d^2 Y) / (d y^2) = 0
$

上式左边两项的和为 $0$，设它们为相反数，应该有下面的两个常微分方程成立
$
  cases(
    1/X (d^2 X) / (d x^2) = - k^2,
    1/Y (d^2 Y) / (d y^2) = k^2
  )
$

针对 $k$ 的不同取值，可以推导出以下三类通解
- $k = 0$ 时

  解是线性解，有 $F(x, y) = (A_"10" x + A_"20")(B_"10" y + B_"20")$

- $k^2 > 0$ 时

  $F(x, y) = sum_(m=1)^(+oo) [A_"1m" cos(k x) + A_"2m" sin(k x)][B_"1m" cosh(k y) + B_"2m" sinh(k y)]$

- $k^2 < 0$ 时

  $F(x, y) = sum_(m=1)^(+oo) [A_"1m"' cosh(k_m x) + A_"2m"' sinh(k_m x)][B_"1m"' cos(k_m y) + B_"2m"' sin(k_m y)]$
  其中 $j k_m = k$

三种解可以叠加为拉普拉斯方程的通解。

===== 叠加原理和唯一性原理

叠加原理指的是，若 $phi_1$ 和 $phi_2$ 都是拉普拉斯方程 $laplace phi = 0$ 的解，那么这两者的任意线性组合都会是拉普拉斯方程的解，即 $phi = a phi_1 + b phi_2$ 也是 $laplace phi = 0$ 的解。

利用叠加原理，可以将一个复杂的场问题拆解为多个简单问题的组合。

唯一性原理指的是，在满足一定边界条件的情况下，拉普拉斯方程的解是唯一的。边界条件指的是以下几种条件

- Dirichlet 边界条件

  即给定整个场的边界上的位函数值 $phi|_s = f(s)$

- Neumann 边界条件

  即给定整个场的边界上的位函数的法向导数值 $(partial phi) / (partial n) |_s = g(s)$

- 混合边界条件

  即给定整个场的边界上的位函数值和法向导数值的线性组合 $a phi + b ((partial phi) / (partial n)) |_s = h(s)$

当一个待求解区域的整个边界都被指定边界条件时，拉普拉斯方程的解是唯一的。

===== 求给定电位条件下的特解

假设有一金属槽，左下角位于原点，右上角位于 $(a, b)$，其顶盖电位为 $phi = U_0$，其余槽壁的电位为 $0$，槽壁之间绝缘，求槽内的电位分布。

由于槽内没有自由电荷分布，所以电位满足拉普拉斯方程 $laplace phi = 0$，又由于槽内的电位满足 Dirichlet 边界条件，所以根据唯一性原理，拉普拉斯方程的解是唯一的，槽内的电位有唯一的确定解。

分析先前提到的拉普拉斯方程的三类通解，线性通解仅有一个零点，三角函数通解有无数个零点，双曲函数通解最多仅有一个零点，考虑到在 x 方向上已经出现两个零点，所以通解仅可能是关于 x 的三角函数，同时对照通解形式，通解应该是关于 y 的双曲函数，所以最终的通解形式应当是
$
  F = sum_(m=1)^(+oo) C_m sin((m pi) / a x) sinh((m pi) / a y)
$

现在要求系数 $C_m$，如果取 $y = b$ 的情况，那么 $F = U_0$
$
  U_0 = sum_(m=1)^(+oo) (C_m sinh((m pi) / a b)) dot sin((m pi) / a x)
$

为了求出对于每个不同 $m$ 而言，$C_m$ 的应取值，可以利用三角函数的正交性，如果设 $n$ 是一个正整数，那么对两边乘上 $sin((n pi) / a x)$ 并在两边 $x$ 从 $0$ 到 $a$ 的区间上积分，那么右边就仅当 $n = m$ 时式子有值
$
  U_0 integral_0^a sin((n pi) / a x) d x = C_n sinh((n pi) / a b) integral_0^a sin^2((n pi) / a x) d x
$

最终可以解出
$
  C_n = cases(
    (4 U_0) / (n pi sinh((n pi) / a b))\, quad n = 1\, 3\, 5\, ...,
    0\, quad n = 2\, 4\, 6\, ...
  )
$

由此就可以确定最终解为
$
  phi = sum_(m=1, 3, 5, ...)^(+oo) (4 U_0) / (m pi sinh((m pi) / a b)) dot sin((m pi) / a x) sinh((m pi) / a y)
$

综上所述，涉及特解的求解时，应当分析待求区域的边界条件特点，选用合适形式的通解求解。

当边界条件较为复杂，例如上壁右壁同时电位不为 0，可以将情况拆分为两个子问题，一个仅有上壁电位不为 0 的问题，另一个仅有右壁电位不为 0 的问题，分别求解后将两者叠加即可得到最终解，这是利用场的叠加原理。

==== 镜像法求解静态电磁场

所以，对于特定的边界条件，可以列拉普拉斯方程求解电位分布。除此之外，还可以用镜像法来求解电位分布，镜像法的核心思想是，在待求区域外构建一个虚拟的电荷分布，使得该虚拟电荷分布在待求区域边界上产生的电位分布与实际边界条件相符，那么在待求区域内的电位分布就可以看作是由实际电荷分布和虚拟电荷分布共同产生的。

镜像法的理论根据是上文提到的唯一性原理，因为虚拟电荷产生的边界条件与实际边界条件相符，所以由虚拟电荷产生的待求区域内的电位分布和真实的电位分布是一致的，因此可以通过构建虚拟电荷分布来求解电位分布。

有以下几种常见的镜像法分析情况

===== 无限大导体平面

若在一自由空间中有一点电荷 $q$ 位于无限大导体平面上方，且该电荷与导体平面之间的距离为 $d$，那么可以在导体平面下方的对称位置处构建一个虚拟电荷 $-q$，则在导体平面上的电位分布为 $0$，满足边界条件。又由于虚拟电荷与实际电荷的距离相等，所以在导体平面上方的电位分布与实际电荷和虚拟电荷共同产生的电位分布一致。

值得一提的是，这样可以求解出自由区域导体表面的电场大小，再结合导体内部的电场为 $0$ 的边界条件，就可以求解出导体表面电荷的分布情况。

$
  rho_S = D_n = epsilon_0 E_n
$

===== 无限大介质平面

设一点电荷 $q$ 位于一无限大介质分界平面附近，且该电荷与介质平面之间的距离为 $d$，电荷所在部分的介电常数为 $epsilon_1$，另一部分的介电常数为 $epsilon_2$，那么要求介质一侧的电场分布或介质另一侧的电场分布，可以采取以下方案

- 求介质同一侧的电场分布

  出于两界面介电常数不一，故若求电场分布时，若仅考虑 $q$ 的影响，那么在分界面上，这是不满足边界条件的，因为 $D_"1n" != D_"2n"$，所以需要在介质另一侧部署一个虚拟电荷以使得边界条件得以满足。

  计算表明，若在介质另一侧的对称位置处构建一个虚拟电荷 $q' = q (epsilon_1 - epsilon_2) / (epsilon_1 + epsilon_2)$，则在分界面上满足边界条件，且在介质同一侧的电场分布与实际电荷和虚拟电荷共同产生的电场分布一致。

- 求介质另一侧的电场分布

  同理，计算表明，若将当前电荷 $q$ 的电荷量，更改为 $q'' = q - q'$，则在分界面上满足边界条件，且在介质另一侧的电场分布与实际电荷和虚拟电荷共同产生的电场分布一致。

要求得上述结论，可以使用分界面上电位连续以及电位移矢量连续的边界条件，取电荷到边界面的垂足分析，距离为 $R$

$
  phi = q/(4 pi epsilon_1 R) + q'/(4 pi epsilon_1 R) = q/(4 pi epsilon_2 R) + q''/(4 pi epsilon_2 R) \
  D_n = q/(4 pi R^2) - q'/(4 pi R^2) = q/(4 pi R^2) + q''/(4 pi R^2)
$

联立上述方程即可解得
$
  q' = q (epsilon_1 - epsilon_2) / (epsilon_1 + epsilon_2), quad q'' = q - q' = 2 q epsilon_2 / (epsilon_1 + epsilon_2)
$

===== 导体球面和导体柱面

设一点电荷 $q$ 位于一个半径为 $a$ 的接地导体球附近，与球心的距离为 $d$，待求球外的电场分布（球内的分布没意义，因为静电平衡为 $0$）

为了满足球面上电位为 $0$ 的边界条件，可以应用 Apollonius 圆/球的定理，假设当前球面是距离电荷位置和球内一点距离为定比的点的集合，那么在球面上满足边界条件的虚拟电荷位置应该位于球内，且与电荷位置和球内一点满足定比关系。

根据 Apollonius 圆/球和一些计算，可以得出虚拟电荷处在球心和电荷位置的连线上，且与球心的距离 $b$ 和电荷量满足以下表达式
$
  b = a^2 / d, quad q' = - q a / d
$

接下来讨论柱面，但讨论前先明确电轴一概念，假设空间中存在一无限长直线，直线的线电荷密度为 $rho$，那么称该电荷分布所在的直线为电轴。电轴向附近散发出的电场强度可以由以下公式计算
$
  E = 1/(4 pi epsilon_0) dot integral_(-oo)^(+oo) (rho d x) / (r^2 + x^2) dot r / sqrt(r^2 + x^2) = rho / (2 pi epsilon_0 r)
$

对于导体均匀带电柱面而言，其可以看作由许多根电轴组成，和点电荷与球类似，在柱面外的一点所处在的电场环境可以看作由柱心轴线作为电轴散发得到的电场环境。

设一无限长带电均匀导体柱面半径为 $a$，线电荷密度为 $rho$，待求柱面外还有一与圆柱母线平行的电轴，电轴距离柱心距离为 $d$，电轴线电荷密度为 $+rho_l$，求柱面外电场分布

与前文提及的球面类似，柱面上满足边界条件的虚拟电荷位置应该位于柱面内，且与柱心满足定比关系，根据 Apollonius 圆/球和一些计算，可以得出虚拟电荷处在柱心和电轴的连线上，且与柱心的距离 $b$ 和线电荷密度满足以下表达式
$
  b = a^2 / d, quad rho_l' = - rho_l
$

===== 对前文电位边界条件的补充

前文讨论的无限大导体平面接地，即电位 $phi = 0$，若其电位不为 $0$，例如整个平面的电位都为 $phi = U_0$，那么原空间中的电场分布不会改变，因为
$
  E = - nabla phi
$
而将整个空间的 $phi$ 都加上一个常数 $U_0$，并不会改变梯度即 $E$ 的分布，所以在这种情况下，镜像法的分析结果仍然适用。

但要注意，若空间中还有其它边界条件，其电位条件并不同步改变，那么上述结论就不适用了，总之，一切以满足边界条件为主。

另外，对于球边界而言，将球面电位从 $0$ 改为 $U_0$，可以看作在空间中叠加一个以球心为中心的点电荷分布，这个点电荷的值为
$
  q_0 = 4 pi epsilon_0 a U_0
$

=== 平面电磁波的性质

==== 电磁波的波动方程和基本性质

根据麦克斯韦方程组，在无界、线性、均匀、不存在自由电荷的理想介质中，应当有
$
  cases(
    nabla times H = epsilon (partial E) / (partial t),
    nabla times E = - mu (partial H) / (partial t)
  )
$
对两个式子两端再取旋度，得到的就是亥姆霍次方程，其描述电磁波的波动方程
$
  cases(
    laplace E = mu epsilon (partial^2 E) / (partial t^2),
    laplace H = mu epsilon (partial^2 H) / (partial t^2)
  )
$

光学部分的知识表明电磁波是横波，并且电场和磁场相互垂直，且与传播方向垂直，满足右手定则。假定电磁波的传播方向为 $z$ 轴，那么有以下方程的解
$
  E = E_0 e^(i (omega t plus.minus k z + phi_E)) hat(i), quad H = H_0 e^(i (omega t plus.minus k z + phi_H)) hat(j)
$
其中 $k = omega sqrt(mu epsilon)$，称为相位常数，由 $k = omega / c$ 确定，$c$ 为光速。

由麦克斯韦方程指出 $nabla times E = cases(
  j (partial E) / (partial z) = - j k E,
  - mu (partial H) / (partial t) = - j omega mu H
)$，代入上述解的形式，可以得出

$
  E_x / H_y = (omega mu) / k = sqrt(mu / epsilon)
$

可见电磁波的电场强度与磁场强度有比值关系，该比值与电磁波当前处在的媒质有关，被称为媒质的特征阻抗，记作 $eta$，有
$
  eta = sqrt(mu / epsilon)
$
真空中的特征阻抗约为 $377 Omega$。

电磁波传递的能量是使用坡印廷矢量来描述的，坡印廷矢量定义为 $S = E times H$，其大小表示电磁波单位时间内通过单位面积的能量（就是功率），方向表示电磁波的传播方向，具体推导详见下方光学部分。考虑到电磁波的传播是具有周期性的，类比于电路复分析中的焦耳定律，电磁波也有有功和无功之分，电磁波功率的有功部分是指电场和磁场同相位，损耗出去的电磁波能量
$
  S_"av" = 1/2 E_m times H_m times cos(phi_E - phi_H)
$

大多数情况下，特征阻抗是一个实数，电场和磁场同相位，但是在某些媒质中，特征阻抗是一个复数，电场和磁场存在相位差，这时电磁波功率就具有无功部分。

==== 有耗媒质对电磁波的影响

许多媒质对电磁波仍保持线性、均匀、各向同性，且不存在自由电荷，但具有电导率 $sigma$，这类媒质被称为有耗媒质，此时将麦克斯韦方程写作
$
  cases(
    nabla times H = sigma E + epsilon (partial E) / (partial t),
    nabla times E = - mu (partial H) / (partial t)
  )
$
这样可以推导出介质具有等效的复介电常数 $nabla times H = j omega (epsilon - j sigma/omega) E, quad epsilon' = epsilon - j sigma/omega$。同时，媒质的特征阻抗也变为复数 $eta' = sqrt(mu / epsilon')$，电场和磁场存在相位差。

将 $k' = omega sqrt(mu epsilon')$ 代入先前推导的平面电磁波公式，可以得到
$
  E_x = E_m e^(- alpha z) cos(omega t - beta z + phi_E), quad H_y = H_m e^(- alpha z) cos(omega t - beta z + phi_H)
$
其中 $j k' = alpha + j beta$，可以发现有衰减系数 $alpha$，故电磁波在有耗媒质中振幅会衰减。根据 $k' = omega sqrt(mu epsilon')$，可以进一步解出
$
  cases(
    alpha = omega sqrt(mu epsilon / 2) dot sqrt(sqrt(1 + (sigma / (omega epsilon))^2) - 1),
    beta = omega sqrt(mu epsilon / 2) dot sqrt(sqrt(1 + (sigma / (omega epsilon))^2) + 1)
  )
$
同时，还可以解出 $theta_eta = theta_E - theta_H$ 的表达式，为
$
  theta_eta = arctan(sigma / (omega epsilon)) / 2
$

常见的低损耗媒质 $(sigma / (omega epsilon)) < 1$ 诸如空气、玻璃等；而高损耗媒质 $(sigma / (omega epsilon)) > 1$ 诸如常见的金属等，在高损耗媒质中，磁场强度的相位滞后于电场约近 $pi / 4$，且由电磁波引起的感应电流因电磁波的衰减，仅存在于电磁波入射表面附近的区域，即趋肤效应。记电流幅值衰减为导体表面上幅值的 $1/e$ 时电磁波传播的距离为趋肤深度 $delta$，有
$
  delta = 1 / alpha approx sqrt(2 / (omega mu sigma))
$

==== 平面电磁波对边界的垂直入射

先讨论理想介质分界面的情况，设电磁波从介质 1 $(mu_1, epsilon_1)$ 入射到介质 2 $(mu_2, epsilon_2)$，令入射电磁波电场强度为 $E_i$，反射电磁波电场强度为 $E_r$，透射电磁波电场强度为 $E_t$，那么列出三部分电磁波的表达式（假设入射波的传播方向为 $z$ 方向）
$
  cases(
    E_i = E_"i0" e^(i (omega t - k_1 z + phi_i)) hat(i),
    E_r = E_"r0" e^(i (omega t + k_1 z + phi_r)) hat(i),
    E_t = E_"t0" e^(i (omega t - k_2 z + phi_t)) hat(i)
  ), quad cases(
    H_i = E_"i0" / eta_1 e^(i (omega t - k_1 z + phi_i)) hat(j),
    H_r = E_"r0" / eta_1 e^(i (omega t + k_1 z + phi_r)) hat(j),
    H_t = E_"t0" / eta_2 e^(i (omega t - k_2 z + phi_t)) hat(j)
  )
$
分界面有边界条件为 $E_"1t" = E_"2t", H_"1t" = H_"2t"$，所以可以列出
$
  cases(
    E_"i0" + E_"r0" = E_"t0",
    (E_"i0" - E_"r0") / eta_1 = E_"t0" / eta_2
  )
$

可以解得
$
  E_"r0" = E_"i0" dot (eta_2 - eta_1) / (eta_2 + eta_1), quad E_"t0" = E_"i0" dot (2 eta_2) / (eta_2 + eta_1)
$
其中 $eta_1$ 是入射媒质的特征阻抗，$eta_2$ 是透射媒质的特征阻抗。

令 $Gamma = (eta_2 - eta_1) / (eta_2 + eta_1)$，称为反射系数，$T = (2 eta_2) / (eta_2 + eta_1)$，称为透射系数，其描述了电磁波在边界上的反射和透射情况。

如果射入的介质是理想导体，那么 $eta_2 = 0$，所以 $Gamma = -1$，$T = 0$，电磁波完全被反射，且反射电场与入射电场相位相反。

如果射入的介质是有耗媒质，那么 $eta_2$ 是一个复数，$Gamma$ 和 $T$ 也是复数，电磁波部分被反射，部分被透射，且反射电场与入射电场存在相位差。要计算复数反射系数和透射系数，可以先计算出 $eta_2$ 的模长和相位，然后代入上述表达式即可。
$
  eta_2' = sqrt(mu_2 / epsilon_2'), quad epsilon_2' = epsilon_2 - j sigma_2 / omega, quad theta_eta_2 = arctan(sigma_2 / (omega epsilon_2)) / 2
$

==== 平面电磁波在多层介质分界面上的垂直入射

// 等效阻抗法

==== 平面电磁波在边界上的斜入射

当电磁波的入射方向和分界面法线方向不重合时，称为斜入射。在斜入射的情况下，反射和透射的情况会更加复杂，此时，定义入射面为入射电磁波的传播方向和分界面法线的夹角所在的平面，分界面为两种介质的交界面。

同时，出于电磁波的偏振情况不同，两种不同类型的偏振光值得讨论。称电场强度垂直于入射面的波为垂直极化波，电场强度平行于入射面的波为平行极化波，任意入射波都可以看作是垂直极化波和水平极化波的叠加。

===== 反射定律和折射定律

反射定律指的是，入射电磁波的传播方向、分界面法线和反射电磁波的传播方向三者处于同一平面，且入射电磁波的传播方向与分界面法线的夹角等于反射电磁波的传播方向与分界面法线的夹角。折射定律指的是，入射电磁波的传播方向、分界面法线和折射电磁波的传播方向三者处于同一平面，且入射电磁波的传播方向与分界面法线的夹角与折射电磁波的传播方向与分界面法线的夹角满足斯涅尔定律，即 $n_1 sin(theta_i) = n_2 sin(theta_t)$，其中 $n_1$ 和 $n_2$ 分别是入射媒质和透射媒质的折射率。

假设分界面是 $z = 0$，入射面是 $x - z$ 平面，等相位面是平面，垂直于入射电磁波的传播方向（常见的平面波），入射电磁波是垂直极化波（电场方向垂直于入射面），其传播方向与分界面法线的夹角为 $theta_i$，反射电磁波的传播方向与分界面法线的夹角为 $theta_r$，折射电磁波的传播方向与分界面法线的夹角为 $theta_t$。

此时要在 $x$ 轴上各点都满足电磁场边界条件 $E_"1t" = E_"2t"$，那么应当有#footnote[下面的公式中，各个电场的方向都一样，都垂直于入射面，所以在表达式中省略了电场的单位向量]
$
  E_"i0" e^(-j k_1 x sin(theta_i)) + E_"r0" e^(j k_1 x sin(theta_r)) = E_"t0" e^(-j k_2 x sin(theta_t))
$

由于等相位面和分界面的夹角为 $theta_i$，所以每在 $x$ 轴上偏移 $x$ 距离，入射电磁波都会额外经过 $x sin(theta_i)$ 的距离，故可以表示入射电磁波的相位为 $- k_1 x sin(theta_i)$，同理，反射电磁波的相位为 $j k_1 x sin(theta_r)$，折射电磁波的相位为 $- j k_2 x sin(theta_t)$。

代入 $x = 0$，有 $E_"i0" + E_"r0" = E_"t0"$，将其带入回到上述方程中，得到仅关于 $E_"i0", E_"r0"$ 的方程
$
  E_"i0" (e^(-j k_1 x sin(theta_i)) - e^(-j k_2 x sin(theta_t))) + E_"r0" (e^(j k_1 x sin(theta_r)) - e^(-j k_2 x sin(theta_t))) = 0
$

要使得上式总是成立，应当有 $k_1 x sin(theta_i) = k_1 x sin(theta_r) = k_2 x sin(theta_t)$，所以，可以得到
$
  theta_i = theta_r; quad k_1 sin(theta_i) = k_2 sin(theta_t), quad frac(sin(theta_t), sin(theta_i)) = frac(k_1, k_2) = sqrt(frac(mu_1 epsilon_1, mu_2 epsilon_2)) = frac(n_1, n_2)
$

这就是垂直极化波的反射定律和折射定律，对于平行极化波而言，可以利用磁场的边界条件 $H_"1t" = H_"2t"$，同样可以得到相同的反射定律和折射定律。

===== 反射系数和透射系数

当垂直极化波入射时，要满足边界条件 $H_"1t" = H_"2t"$，可以推导得到
$
  (E_"i0" / eta_1 - E_"r0" / eta_1) cos(theta_i) e^(-j k_1 x sin(theta_i)) = E_"t0" / eta_2 cos(theta_t) e^(-j k_2 x sin(theta_t))
$

代入 $k_1 sin(theta_i) = k_2 sin(theta_t)$，应当有
$
  (E_"i0" - E_"r0") / eta_1 cos(theta_i) = E_"t0" / eta_2 cos(theta_t)
$

如果代入 $E_"i0" + E_"r0" = E_"t0"$，分别解反射系数 $Gamma_perp = E_"r0" / E_"i0"$ 和透射系数 $T_perp = E_"t0" / E_"i0"$，可以得到
$
  cases(
    Gamma_perp = (eta_2 cos(theta_i) - eta_1 cos(theta_t)) / (eta_2 cos(theta_i) + eta_1 cos(theta_t)),
    T_perp = (2 eta_2 cos(theta_i)) / (eta_2 cos(theta_i) + eta_1 cos(theta_t))
  )
$

当平行极化波入射时，要满足边界条件 $E_"1t" = E_"2t"$，可以推导得到
$
  (E_"i0" - E_"r0") cos(theta_i) e^(-j k_1 x sin(theta_i)) = E_"t0" cos(theta_t) e^(-j k_2 x sin(theta_t))
$

代入 $k_1 sin(theta_i) = k_2 sin(theta_t)$，应当有
$
  (E_"i0" - E_"r0") cos(theta_i) = E_"t0" cos(theta_t); quad (H_"i0" + H_"r0") cos(theta_i) dot eta_1 = H_"t0" cos(theta_t) dot eta_2
$

如果代入 $H_"i0" + H_"r0" = H_"t0"$，可以解得平行极化波的反射系数和透射系数
$
  cases(
    Gamma_parallel = (eta_1 cos(theta_i) - eta_2 cos(theta_t)) / (eta_2 cos(theta_t) + eta_1 cos(theta_i)),
    T_parallel = (2 eta_2 cos(theta_i)) / (eta_2 cos(theta_t) + eta_1 cos(theta_i))
  )
$

===== 全反射和全透射

全反射指的是当电磁波从光密介质入射到光疏介质时，入射角大于某个临界角时，电磁波完全被反射，且没有透射。

由折射定律，$n_1 sin(theta_i) = n_2 sin(theta_t)$，若当 $n_1 > n_2$ 时，$theta_i$ 增大到 $theta_i > arcsin(n_2 / n_1)$，则 $theta_t$ 无实数解，此时电磁波无法透射到介质 2 中，电磁波完全被反射，这时称为全反射，$arcsin(n_2 / n_1)$ 被称为临界角。
$
  theta_c = arcsin(n_2 / n_1)
$

全透射指的是，当电磁波从光疏介质入射到光密介质时，入射角等于某个特定的角度时，电磁波完全被透射，且没有反射。

对于平行极化波而言，当 $eta_1 cos(theta_i) = eta_2 cos(theta_t)$ 时，$Gamma_parallel = 0$，电磁波完全被透射，这时称为全透射，满足全透射的入射角被称为布儒斯特角，记作 $theta_B$，有#footnote[下面的公式中，认为 $mu_r = 1$，因为大部分介质都是非铁磁质的。]
$
  cos(theta_t) = sqrt(epsilon_2 / epsilon_1) cos(theta_B) \
  sin(theta_t) = sqrt(epsilon_1 / epsilon_2) sin(theta_B) \
$

两边平方后两式相加有
$
  1 = (epsilon_2 / epsilon_1) (1 - sin^2(theta_B)) + (epsilon_1 / epsilon_2) sin^2(theta_B)
$

解出 $theta_B$ 的表达式为
$
  theta_B = arctan(eta_2 / eta_1) = arctan(sqrt((mu_2 epsilon_2) / (mu_1 epsilon_1)))
$

对于垂直极化波而言，可以证明斜入射的电磁波无法满足 $Gamma_perp = 0$ 的条件，所以不存在全透射的情况。

=== 电磁波的辐射

当波源电路开放，且有时变源存在时，电磁能量可能会脱离波源的束缚，向空间中传播，这被称作电磁辐射。专门产生电磁辐射的电磁辐射器是天线，其是实现导波和自由空间电磁波之间转换的装置。

==== 电偶极子的辐射场

通有高频电流的直导线，当导线长度远小于波长，且导线直径相较于导线长度很小时，可以近似认为导线上各点电流等幅同相。这种导线被称为电偶极子。

电偶极子的辐射场可以通过求解麦克斯韦方程组得到，最终，可以得到电偶极子在近场和远场的电场和磁场分布情况，近场指的是距离电偶极子较近的区域，远场指的是距离电偶极子较远的区域。

假设电偶极子的中心位于原点，以 $z$ 轴为偶极子轴线，电流正方向为 $+z$ 方向；$phi$ 方向定义为在 $"xOy"$ 平面内从 $x$ 轴正方向到 $y$ 轴正方向的夹角，$theta$ 方向定义为从 $z$ 轴正方向到 $"xOy"$ 平面的夹角，那么电偶极子在近场和远场的电场和磁场分布情况如下

- 近区场，$k R << 1$

$
  E_R = -j frac(I l cos theta, 2 pi omega epsilon R^3) \
  E_theta = -j frac(I l sin theta, 4 pi omega epsilon R^3) \
  H_phi = (I l sin theta) / (4 pi R^2)
$

其中 $l$ 是偶极子长度，$I$ 是电流幅值，$R$ 是距离偶极子中心的距离，$omega$ 是电磁波的角频率。在近场区，由于 $E_theta$ 和 $H_phi$ 的相位差为 $pi / 2$，所以电偶极子近场区的向外传播平均坡印廷矢量几乎为 0。

- 远区场，$k R >> 1$

$
  E_R = 0 \
  E_theta = j frac(I l eta sin theta, 2 lambda R) e^(-j k R) \
  H_phi = j frac(I l sin theta, 2 lambda R) e^(-j k R)
$

由此还可以得到电偶极子远场区的平均坡印廷矢量为
$
  S_"av" = 1/2 E_theta H_phi^* = 1/2 eta ((I l) / (2 lambda R))^2 sin^2(theta) hat(a_r)
$

==== 磁偶极子的辐射场

一流通电流的小圆环，当其周长远小于波长时，可以近似认为圆环上各点电流等幅同相，这种圆环被称为磁偶极子。

假设磁偶极子的中心位于原点，以 $z$ 轴为磁偶极子圆环面的法线方向，使用右手定则确认电流正方向和 $+z$ 方向的关系；$phi$ 方向定义为在 $"xOy"$ 平面内从 $x$ 轴正方向到 $y$ 轴正方向的夹角，$theta$ 方向定义为从 $z$ 轴正方向到 $"xOy"$ 平面的夹角，那么

磁偶极子的辐射场同理可以通过求解麦克斯韦方程组得到，可以得到磁偶极子的远区场为

$
  E_R = 0 \
  E_phi = frac(pi I S eta sin theta, lambda^2 R) e^(-j k R) \
  H_theta = frac(pi I S sin theta, lambda^2 R) e^(-j k R)
$

其中 $S$ 是磁偶极子圆环的面积，$I$ 是电流幅值，$R$ 是距离磁偶极子中心的距离，$omega$ 是电磁波的角频率。

==== 对称振子天线

对称振子天线指的是由两根长度为 $l$ 的细导线构成的中心馈电天线，振子两臂上的电流是对称的，且呈正弦分布。假设振子两臂平行于 $z$ 轴，且其中心馈电点位于原点，那么振子上的电流分布可表示为
$
  I = I_0 sin(k (l - abs(z)))
$

一个对称振子天线可以看作是由无数个相位不同的电偶极子天线拼合组成的，振子天线的辐射场可以看作是由这些电偶极子天线的辐射场叠加得到的。通过积分叠加，可以得到对称振子天线在远区的电场和磁场分布情况为
$
  E_R = 0 \
  E_theta = j eta frac(I_0, 2 pi R) e^(-j k R) dot frac(cos(k l cos theta) - cos(k l), sin(theta)) \
  H_phi = j frac(I_0, 2 pi R) e^(-j k R) dot frac(cos(k l cos theta) - cos(k l), sin(theta))
$

特别的，如果天线满足 $2l = lambda / 2$，则称天线为半波振子天线，此时将 $k = (2pi) / lambda, l = lambda / 4$ 代入上述表达式，有半波振子天线在远区的电场和磁场分布情况为
$
  E_R = 0 \
  E_theta = j eta frac(I_0, 2 pi R) e^(-j k R) dot frac(cos((pi / 2) cos theta), sin(theta)) \
  H_phi = j frac(I_0, 2 pi R) e^(-j k R) dot frac(cos((pi / 2) cos theta), sin(theta))
$

==== 天线的各项指标

天线的辐射特性可以使用若干技术参数来描述，常见的参数包括方向性函数 $F(theta, phi)$、辐射功率 $P_r$、辐射电阻 $R_r$、方向性系数 $D$、半功率波瓣宽度 $theta_"0.5"$、增益 $G$ 等。

===== 天线的方向性函数

方向性函数指的是
$
  F(theta, phi) = abs(E(theta, phi)) / max(abs(E(theta, phi)))
$

其中 $E(theta, phi)$ 是天线在远区的电场分布，$max(abs(E(theta, phi)))$ 是天线在远区（半径为 $R$ 的球面上）的电场分布的最大值。方向性函数描述了天线在不同方向上的辐射强度相对于最大辐射强度的比例。

对于几种常见的天线而言，它们的方向性函数分别为
$
  cases(
    F_"半波振子" = abs(cos((pi / 2) cos theta)) / sin(theta),
    F_"电偶极子" = abs(sin(theta)),
    F_"磁偶极子" = abs(sin(theta))
  )
$

从而，这三类天线的远场电场公式都可以被表达为
$
  E = E_m e^(-j k R) F(theta, phi) / R
$

===== 天线的辐射功率和辐射电阻

辐射功率可以用天线在远区场的坡印廷矢量积分来计算，令 $R$ 为半径（$R >> lambda$），天线中心为球心的球面为 $S$，则天线的辐射功率为
$
  P_r = integral_S S_"av" dot hat(a_r) d S
$

令天线上的驱动电流为 $I$（幅值），那么根据 $P_r = (1/2) R_r I^2$，可以得到等效辐射电阻 $R_r$。

===== 天线的方向性系数和半功率波瓣宽度

方向性系数指的是天线在某个特定方向上的辐射强度与天线平均辐射强度的比值，记作 $D$，有
$
  D = frac(P_0 (theta, phi), P_r (theta, phi)) |_(E_"max" = E_0)
$

其中 $P_r$ 是天线的总辐射功率，$P_0$ 满足 $P_0 = |S_"av"|_"max" times 4 pi R^2$，其中 $|S_"av"|_"max"$ 是当前天线在远场 $R$ 距离辐射坡印廷矢量的最大值，$P_0$ 相当于一个点源天线，在原天线最大辐射方向上产生相同场强，的对应辐射功率。

半功率波瓣宽度指的是天线在远区场的电场强度下降到最大值的 $1 / sqrt(2)$ 时，入射角的范围，记作 $theta_"0.5"$。

===== 天线的增益

增益指的是天线在某个特定方向上的辐射强度与一个理想无损耗全向天线在同一方向上的辐射强度的比值，记作 $G$，有
$
  G = eta D
$

其中 $eta = P_r / P_"in"$，在这里，$P_"in"$ 是天线的输入功率，$P_r$ 是天线的总辐射功率，$eta$ 被称为天线效率，描述了天线将输入功率转换为辐射功率的效率。

==== 天线阵

将若干个辐射单元在空间中进行一定排列，构成的天线系统被称为天线阵，天线阵的辐射特性可以通过阵因子分析法得到。

考虑两个特性完全相同的辐射单元，单元间距为 $d$，单元 1 中心位于原点，单元 2 中心位于 $(0, 0, d)$，沿 $z$ 轴排列，两个单元上的电流振幅相等，单元 $2$ 振荡相位超前单元 $1$ 的相位 $xi$，即 $I_2 = I_1 e^(j xi)$，那么它们对远场（$k R >> 1$）而言，应当有以下性质

- 天线阵中每个天线到目标位置的 $theta, phi$ 角几乎相同；

- 天线阵中，若天线单元 1 到目标位置的距离为 $R$，则天线单元 2 到目标位置的距离近似为 $R - d cos(theta)$（天线 2 所在中心到天线 1 到目标连线作垂线，垂线将连线分为两段，外部段和天线 2 到目标距离近似，而内部段则是两者的波程差）；

- 上述波程差对天线公式中的分母基本没有影响，但是对相位因子 $e^(j(k z + omega t + phi))$ 会产生影响，这将导致天线单元之间出现干涉。

如果令单元 1 的远场电场公式为 $E_1 = E_m e^(-j k R) F(theta, phi) / R$，那么单元 2 的远场电场公式为 $E_2 = E_m e^(-j k (R - d cos(theta))) F(theta, phi) / R dot e^(j xi)$，所以两个单元的总远场电场公式为

$
  E = E_1 + E_2 = E_m e^(-j k R) F(theta, phi) / R dot (1 + e^(j(k d cos(theta) + xi))) \
  = 2 E_m e^(-j k R) F(theta, phi) / R e^(j(k d cos(theta) + xi) / 2) cos((k d cos(theta) + xi) / 2) \ 
  = 2 E_m e^(-j k R) F(theta, phi) / R e^(j Phi / 2) cos(Phi / 2)
$

其中 $Phi = k d cos(theta) + xi$，$cos(Phi / 2)$ 即为阵因子。

对于沿着 $x$ 轴排列（单元 2 中心位于 $(d, 0, 0)$）的情况，阵因子中 $Phi = xi + k d sin(theta)$。

