#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style

== 电路的基本定律

当电路尺寸远远小于其工作波长，那么称这种电路为集总参数电路，集总参数的各类工作行为都可以用前文的电磁场理论推导得出

在集总参数电路中，有关键物理量 $U, I, R, C, L$，分别表示电压、电流、电阻、电容和电感。针对元件特性和电路性质，可以推导出以下基本定律

=== 欧姆定律

$
  U = I R
$
电阻两端的电压 $U$ 与通过电阻的电流 $I$ 成正比，比例系数为电阻 $R$。

在导电媒质中，其电导率为 $sigma$，那么有物态方程 $J = sigma E$，那么在长度为 $l$，横截面积为 $S$ 的导体中，电流密度 $J$ 与电流 $I$ 的关系为 $I = J S$，电压 $U$ 与电场强度 $E$ 的关系为 $U = E l$，所以有
$
  U = E l, quad I = J S = sigma E S, quad U/I = l / (sigma S) = R
$
出于 $l / (sigma S)$ 是常量，所以比例系数 $R$ 也是常量，这就是欧姆定律的物理意义。

定义电导率 $sigma$ 的倒数为电阻率 $rho$，那么有电阻表达式 $R = rho l / S$。

=== 焦耳定律

$
  P = U I quad & ("电功率") \
  P = I^2 R = frac(U^2, R) quad & ("热功率")
$

电子在运动的过程中总是不断与结晶点阵发生碰撞，碰撞过程中电子的动能转化为热能，假设电子在运动中的平均速度为 $v$，那么在电子在导体中位移时，可以视作其动能 $1/2 m v^2$ 不变，故其移动距离 $Delta l$ 上获得的电能全部转化为热能，即
$
  Delta W = -e E Delta l = -e E v Delta t \
  p = Delta W / Delta t = -e E v
$

在单位体积内，功率的总和为 $d P = sum p = N_e e v dot E d V$，其中 $N_e$ 是单位体积内的自由电子数密度，而 $J = N_e e v$，故有
$
  d P = J dot E d V
$

然而又由于 $J = sigma E$，所以 $(d P) / (d V) = sigma E^2$，对于截面宽为 $S$，长度为 $l$ 的导体来说，电压 $U = E l$，电流 $I = J S = sigma E S$，所以有
$
  P = integral_0^l sigma E^2 S d l = sigma E^2 S l = U I
$

=== 基尔霍夫定律

- 基尔霍夫电流定律：在电路的任一节点处，流入该节点的电流总和等于流出该节点的电流总和。

根据物态方程，即电流连续性定律，有
$
  J_c = - (partial rho) / (partial t)
$
由于电荷不在节点处积累，所以 $-(partial rho) / (partial t) = 0$，即 $J_c = 0$，表明流入节点的总电流密度总为 $0$，所以
$
  integral_S J_c dot d S = sum I = 0
$

- 基尔霍夫电压定律：在电路的任一闭合回路中，沿着回路的电压总和等于零。

由前文关于一般电磁场环境中关于电位的推导，以下表达式是成立的
$
  -nabla phi = (E + (partial A) / (partial t))
$

又分析电场的组成成分，电场应当由回路中电源造成的电场和电路中电流造成的电场两部分组成
$
  E = E_"source" + J_c / sigma
$

代换即有
$
  E_"source" = -nabla phi - (partial A) / (partial t) - J_c / sigma
$

分析等号右边的项目

- 第一项 $-nabla phi$ 是电位的梯度

  电容在工作时，两极板之间会形成电位差，电位差的存在使得电荷在两极板之间产生电场，电场的强度与电位差成正比，所以 $-nabla phi$ 是电容造成的电场。

- 第二项 $- (partial A) / (partial t)$ 是矢量磁位的时间变化率

  电感在工作时，电流的变化会引起磁场的变化，具体来说，有
  $
    integral.cont_l frac(partial A, partial t) dot d l = integral.cont_l (partial B) / (partial t) dot d S = frac((partial (L I)), partial t) = L (partial I) / (partial t) = U_L
  $
  所以电感也将对电场产生贡献，因为其有产生电压的能力，所以 $- (partial A) / (partial t)$ 是电感造成的电场。

- 第三项 $- J_c / sigma$ 是电流造成的电场

  由物态方程，电流密度 $J_c$ 与电场强度 $E$ 成正比，比例系数为电导率 $sigma$，所以 $- J_c / sigma$ 是电流造成的电场。

由此，右方的表达式涵盖了所有被动元件的电场贡献，而 $E_"source"$ 则是电源造成的电场，所以在一个闭合回路中，电源造成的电场与被动元件造成的电场相等，即
$
  U_"source" = U_"resistance" + U_"inductance" + U_"capacitance"
$

所以基尔霍夫电压定律成立。

=== 电阻的求解方法

要求解任意形状的导体的电阻，首先应定位两个等位面，等位面是指电位相同的面，电流在等位面上没有分布，电阻可以看作是从一个等位面到另一个等位面的电阻。

然后，从一个等位面到另一个等位面之间的电阻为
$
  R = U/I = frac(-integral_l E dot d l, integral_S J dot d S) = frac(-integral_l E dot d l, integral_S sigma E dot d S)
$

若电阻均匀但形状及其不规则，可以用拉普拉斯方程和边界条件求解电场分布，方程有两类边界条件，一类是等位面上电压固定的 Dirichlet 边界条件，另一类是边界绝缘区域电流密度为零的 Neumann 边界条件。
$
  laplace phi = 0 quad & ("拉普拉斯方程") \
  phi|_(S_1) = phi_0, phi|_(S_2) = phi_1 quad & ("Dirichlet 边界条件") \
  (partial phi|_("Border")) / (partial n) = 0 quad & ("Neumann 边界条件")
$


=== 电容的求解方法

孤立导体和导体之间都会产生电容效应，孤立导体的电容定义为其和无限远处的另一导体之间的电容。

高斯定理表明 $Q = integral_S epsilon E dot d S$，而 $U = - integral_l E dot d l$，所以可以计算得到电容
$
  C = Q/U = frac(integral_S epsilon E dot d S, - integral_l E dot d l)
$

要求算独立导体/导体之间的电容，应当先求解它们之间的电场分布，然后代入上式计算，求解步骤同上。

=== 电感的求解方法

电感一般针对线圈而言，线圈中电流的变化会引起磁场的变化，磁场的变化又会引起电场的变化，所以线圈具有产生电压的能力。对于单匝线圈，其电感定义为
$
  L = frac(integral.cont_l A dot d l, I)
$

若有 $N$ 匝线圈，那么有磁链的定义，同时线圈电感也为单匝线圈电感的 $N$ 倍，即
$
  Psi = N dot integral.cont_l A dot d l \
  L = frac(Psi, I) = N frac(integral.cont_l A dot d l, I)
$

=== 电场、磁场的能量和电容、电感的储能



