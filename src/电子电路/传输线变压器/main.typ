#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style

== 传输线

=== 传输线波导模型

传输线指的是一对导线，其两端各具有一对接口，用于连接信号源或负载。

理想的导线中，电压和电流处处相等，但是实际的导线并非如此，其具备分布参数，传输线上处处有寄生电感，处处有寄生电容#footnote[寄生电感和寄生电容是可以通过麦克斯韦方程组求解得到的，对于常见的双绞线模型而言，线之间可以存储电磁场能量，等效有寄生电容电感。]，还可能有线阻和漏电跨导，传输线可以等效为如下的电路

#figure(image("images/传输线-1.png", width: 75%),
  caption: [
    传输线等效模型
  ]
)

对于直流或低频的信号而言，电感近似短路，电容近似开路，此时传输线的寄生参数对信号几乎没有影响，传输线仍然遵循电压电流处处相等的规律。称工作在此种条件下的电路为集总参数电路，该电路中的元件长度 $d$ 远小于信号的波长 $lambda$，即
$
d << lambda = c / f
$

当信号频率较高时，寄生参数对于电压的影响不可忽略，此时传输线不再遵循电压电流处处相等的规律，为进一步分析传输线上的信号，接下来将传输线分为多个下图所示的“线元”

#figure(image("images/传输线-2.png", width: 65%),
  caption: [
    传输线的线元
  ]
)

设单位长度的线阻、漏电跨导、寄生电感、寄生电容为 $R, G, L, C$，这段线元的长度为 $Delta z$，依靠 KVL 和 KCL，可以列得方程
$
cases(
  v(z) - (R + j omega L) i(z) Delta z = v(z + Delta z),
  i(z) - (G + j omega C) v(z + Delta z) Delta z = i(z + Delta z)
)
$

令 $frac(v(z + Delta z) - v(z), Delta z) = frac(d v(z), d z)$，$frac(i(z + Delta z) - i(z), Delta z) = frac(d i(z), d z)$，移项并整理方程，可以得到以下微分方程

$
cases(
  frac(d v(z), d z) = - (R + j omega L) i(z),
  frac(d i(z), d z) = - (G + j omega C) v(z)
)
$

对上述方程继续对 $z$ 求导，可以得到以下亥姆霍次方程组
$
cases(
  frac(d^2 v(z), d z^2) = - (R + j omega L)(G + j omega C) v(z),
  frac(d^2 i(z), d z^2) = - (R + j omega L)(G + j omega C) i(z)
)
$

对于该方程而言，其具有以下通解
$
v(z) = V^+ e^(- gamma z) + V^- e^(gamma z) \
i(z) = 1/(Z_0) [V^+ e^(- gamma z) - V^- e^(gamma z)]
$

其中 $gamma$ 为传输线的传播常数，$Z_0$ 为传输线的特征阻抗，其表达式为
$
gamma = sqrt((R + j omega L)(G + j omega C)) \
Z_0 = sqrt((R + j omega L)/(G + j omega C)) \
gamma = j omega sqrt(L C) "（介质没有线损时）" \
Z_0 = sqrt(L / C) quad "（介质没有线损时）"
$

所以，在传输线上的信号传递具有波的性质，且传输线上的波可以正向传播 $e^(- gamma z)$ 或负向传播 $e^(gamma z)$。其中连接传输线的信号源是波的发起者，负载是波的接收者。

在无损传输线上传输时，波的速率可以通过以下方程组推导
$ v(z) - v(z + dif z) = L dif z frac(partial i, partial t)
  arrow.r frac(partial v, partial z) = -L frac(partial i, partial t) $
$ i(z) - i(z + dif z) = C dif z frac(partial v, partial t)
  arrow.r frac(partial i, partial z) = -C frac(partial v, partial t) $

联立可得
$
frac(partial^2 v, partial z^2) = L C frac(partial^2 v, partial t^2)
$

可以推得在无损传输线上传输的波，其波速为
$
v_p = 1 / sqrt(L C)
$

给定传输信号的角频率 $omega$ 时，可以计算出传输波的波长
$
lambda = 2 pi v_p / omega = (2 pi) / (omega sqrt(L C)) = (2 pi) / (beta)
$
其中 $gamma = alpha + j beta$。

=== 传输线的信号传导效果与阻抗匹配

要求解信号在传输线上传播的模式，实际上是求解该通解在以下两个约束条件：负载处满足 $v(z) / i(z) = Z_L$ 和信号源处满足 $v(z) = V_s$ 的特解。

假定长为 $l$ 的传输线接入负载 $Z_L$ 位于 $z = 0$，信号源 $V_s$ 位于 $z = -l$，则可以得到以下方程组

$
cases(
  V^+ e^(gamma l) + V^- e^(- gamma l) = V_s,
  Z_0 frac(V^+ + V^-, V^+ - V^-) = Z_L
)
$

第二个方程整理后表明
$
V^- = Gamma_L V^+
$

其中 $Gamma_L$ 为负向传播波和正向传播波的比值，称为负载反射系数，其表达式为
$
Gamma_L = frac(Z_L - Z_0, Z_L + Z_0)
$

代入该比值到第一个方程有最终表达式
$
cases(
  V^+ = frac(V_s e^(-gamma l), 1 + Gamma_L e^(-2 gamma l)),
  V^- = frac(V_s Gamma_L e^(-gamma l), 1 + Gamma_L e^(-2 gamma l)),
)
$

负载位置的电压 $V_L = V^+ + V^-$ 为
$
  V_L = frac(V_s (1 + Gamma_L) e^(-gamma l), 1 + Gamma_L e^(-2 gamma l))
$

可以发现，若 $Gamma_L != 0$，则 $V_L != V_s e^(-gamma l)$，也就意味着当反射系数不为 0 时，负载处的电压波形会产生失真，这种现象被称作“反射”。

要想不发生反射，反射系数必应为 0，对应 $Z_L = Z_0$，即负载阻抗与传输线特性阻抗相等。此时 $V_L = V_s e^(-gamma l)$，即传输线的信号传导效果最佳（仅有相位移动），这称作“阻抗匹配”。

#line(length: 100%)

当信号源并非理想信号源，而是具备 $Z_s$ 的内阻时，输入端边界条件变为分压关系 $v(z) = V_s - Z_s i(z)$

经过类似的计算，可以解得
$ cases(
  V^+ = frac(Z_0 V_s, Z_S + Z_0) dot frac(e^(-gamma l), 1 - Gamma_S Gamma_L e^(-2 gamma l)),
  V^- = frac(Z_0 V_s, Z_S + Z_0) dot frac(Gamma_L e^(-gamma l), 1 - Gamma_S Gamma_L e^(-2 gamma l)),
) $

其中信号源反射系数 $Gamma_S = frac(Z_S - Z_0, Z_S + Z_0)$，结合 $V^- = Gamma_L V^+$。

负载处的电压 $V_L = V^+ + V^-$ 为
$
  V_L = frac(Z_0 V_s (1 + Gamma_L), Z_S + Z_0) dot frac(e^(-gamma l), 1 - Gamma_S Gamma_L e^(-2 gamma l))
$

可以发现，只要源与负载任一端与 $Z_0$ 匹配（$Gamma_S = 0$ 或 $Gamma_L = 0$），多次反射项 $Gamma_S Gamma_L e^(-2 gamma l)$ 即消失，传递到负载端的信号不会发生除幅度改变、信号延迟以外的其它失真。在真实的信号传递业务中，进行阻抗匹配的策略有“单端匹配”（仅源/负载端与 $Z_0$ 匹配），“双端匹配”（两端都与 $Z_0$ 匹配）。

=== 从传输线看进去的阻抗

假设传输线的长度为 $l$，接入终端电阻为 $Z_L$，那么从传输线的输入端看进去的阻抗 $Z_"in"$ 可以通过公式计算得出

看进去的等效负载由电压和电流之比得出
$
Z_i = frac(v(-l), i(-l)) \
v(-l) = V^+ e^(gamma l) + V^- e^(-gamma l) \
i(-l) = frac(V^+ e^(gamma l) - V^- e^(-gamma l), Z_0)
$

代入 $Gamma_L = frac(V^-, V^+) = frac(Z_L - Z_0, Z_L + Z_0)$，所以有

$
Z_i (-l) = Z_0 frac(e^(2 gamma l) + Gamma_L, e^(2 gamma l) - Gamma_L) = Z_0 frac(Z_L (e^(2 gamma l) + 1) + Z_0 (e^(2 gamma l) - 1), Z_L (e^(2 gamma l) - 1) + Z_0 (e^(2 gamma l) - 1))
$

整理为双曲正切函数形式

$
Z_i (-l) = Z_0 frac(Z_L + Z_0 tanh(gamma l), Z_0 + Z_L tanh(gamma l))
$

当传输线是无损的，即 $gamma = j beta = j omega sqrt(L C)$ 仅包含虚部，上式简化为
$
Z_i (-l) = Z_0 frac(Z_L + j Z_0 tan(beta l), Z_0 + j Z_L tan(beta l))
$

当阻抗严格匹配，看入的阻抗 $Z_i = Z_0 = Z_L$，如若不匹配，则阻抗 $Z_i$ 视终端电阻和特征阻抗以及传输线长度而定。

当传输线有损且无限长，那么 $tanh(gamma l) -> 1$，所以看入的阻抗 $Z_i -> Z_0$，此时看入的等效阻抗与终端阻抗无关。

当传输线的末端开路或短路，$Z_L = 0$ 或 $Z_L -> oo$，看入的阻抗为纯电抗 $Z_i = j Z_0 tanh(gamma l)$ 或 $Z_i = -j Z_0 coth(gamma l)$。

当传输线的长度为 $lambda / 2$ 或 $lambda / 2 + k lambda / 2$，则 $tan(beta l) = 0$，从传输线输入处的输入阻抗 $Z_i(-l) = Z_L$。相当于从信号源直接看到终端负载，这被称作半波长阻抗变换器。

当传输线的长度为 $lambda / 4$ 或 $lambda / 4 + k lambda / 2$，则 $tan(beta l) -> oo$，从传输线输入处的输入阻抗 $Z_i(-l) = Z_0^2 / Z_L$，当需要阻抗匹配时，指定负载和等效输入阻抗的几何平均值等于特征阻抗即可，这被称作1/4波长阻抗变换器。合适的阻抗变换器可以匹配前节消除反射。

=== 行波、驻波状态与反射系数变换

上方的推导表明传输线中的传导波由两部分方向相反的行波合成而得
$
v(z) = V^+ e^(-gamma z) + V^- e^(gamma z)
$

在终端 $z = 0$ 可以导出
$
Gamma(0) = (V^- e^(0)) / (V^+ e^(0)) = V^- / V^+ = (Z_L - Z_0) / (Z_L + Z_0)
$

从终端向信号源处推，发现可以定义传输线上各点的等效反射系数，为该点处反射电压和入射电压的比值
$
Gamma(-l) = (V^- e^(-gamma l)) / (V^+ e^(gamma l)) = Gamma(0) e^(- 2 gamma l)
$

对于无损线，$gamma = j beta = j omega sqrt(L C)$，此时
$
Gamma(-l) = Gamma(0) e^(- 2j beta l)
$

所以，沿线的反射系数模长不变，沿线推进改变相位。以 $lambda / 2$ 为周期循环。

根据上述理论，传播线上各点的反射系数幅值处处相等（包括负载），所以可以根据反射系数幅值定义以下几种波形在传输线上传播的状态

- 行波状态：$abs(Gamma(l)) = 0$

行波状态下传输线上处处完全没有反射波，各点电压幅值处处相等。

- 驻波状态：$abs(Gamma(l)) = 1$

驻波状态在负载为纯电抗（$abs(Z_L - Z_0) = abs(Z_L + Z_0)$），短路（$Gamma_L = -1$）或开路（$Gamma_L = 1$）时出现，此时在传输线上形成纯驻波，对终端的净功率流为 0。

- 行驻波状态：$abs(Gamma(l)) in (0, 1)$


电压驻波比（VSWR）$rho$ 定义为传输线上电压最大值和电压最小值的比值，由于传输线上的电压解为
$
v(z) = V^+ e^(-gamma z) + V^- e^(gamma z)
$
代入 $(V^- e^(-gamma l)) / (V^+ e^(gamma l)) = Gamma(0) e^(- 2 gamma l)$，总电压可以表示为
$
abs(v(z)) = abs(V^+) abs(1 + abs(Gamma_L) e^(j (phi - 2 beta z)))
$

可以发现，最大电压和最小电压（绝对值）的比值为
$
rho = frac(1 + abs(Gamma), 1 - abs(Gamma))
$

电压驻波比在行波状态时达到 $1$，为最好的传输状态；在纯驻波达到 $oo$，为最差。其取值在 $[1, +oo)$ 之间。

另外，根据上文等效阻抗推断，有
$
Z_i (-l) = Z_0 frac(e^(2 gamma l) + Gamma_L, e^(2 gamma l) - Gamma_L)
$

进一步整理为
$
Z_i (-l) = Z_0 frac(1 + Gamma(-l), 1 - Gamma(-l))
$

发现当 $Gamma(-l)$ 为实数时，阻抗也为实数，一些证明指出，电压波腹点和波节点#footnote[即电压震荡幅度最大位置和最小位置]正好对应 $Gamma(-l) = +abs(Gamma_L)$ 和 $Gamma(-l) = -abs(Gamma_L)$ 的情况，即电压波腹点和波节点处的等效阻抗恰巧为实数，且
$
Z_("antinode") = Z_0 rho \
Z_("wavenode") = Z_0 / rho
$

电压波腹点/波节点恰巧对应电流波节点/波腹点，性质同理。

=== 传输线的功率传导效果

在负载端的复功率可以由以下公式计算
$
S(z) = 1/2 V(z) I(z)^*
$

考虑传输线通解公式
$
v(z) = V^+ e^(- gamma z) + V^- e^(gamma z) \
i(z) = 1/(Z_0) [V^+ e^(- gamma z) - V^- e^(gamma z)]
$

位于 $z = 0$，负载位置的电压电流大小为
$
  V_L = V^+ (1 + Gamma_L), quad I_L = frac(V^+ (1 - Gamma_L), Z_0)
$

因此，负载处的复功率为
$
  S_L = abs(V^+)^2 / (2 Z_0) (1 + Gamma_L) (1 - Gamma_L^*)
$

代入实际信号源与负载在传输线中的解
$ cases(
  V^+ = frac(Z_0 V_s, Z_S + Z_0) dot frac(e^(-gamma l), 1 - Gamma_S Gamma_L e^(-2 gamma l)),
  V^- = frac(Z_0 V_s, Z_S + Z_0) dot frac(Gamma_L e^(-gamma l), 1 - Gamma_S Gamma_L e^(-2 gamma l)),
) $

有 $V^+$ 的表达式
$
abs(V^+)^2 = frac(Z_0^2 |V_s|^2, |Z_S + Z_0|^2) frac(e^(-2 alpha l), |1 - Gamma_S Gamma_L e^(-2 gamma l)|^2)
$

其中 $gamma = sqrt((R + j omega L)(G + j omega C)) = alpha + j beta$，顺带有 $|e^(-gamma l)|^2 = e^(-2 alpha l)$

$ S_L = frac(Z_0 |V_s|^2, 2 |Z_S + Z_0|^2) dot frac(e^(-2 alpha l), |1 - Gamma_S Gamma_L e^(-2 gamma l)|^2) [(1 - |Gamma_L|^2) + 2 j "Im"(Gamma_L)] $

将视在功率拆解为有功和无功两部分
$ P_L = frac(Z_0 |V_s|^2, 2 |Z_S + Z_0|^2) dot frac(e^(-2 alpha l) (1 - |Gamma_L|^2), |1 - Gamma_S Gamma_L e^(-2 gamma l)|^2) $
$ Q_L = frac(Z_0 |V_s|^2, |Z_S + Z_0|^2) dot frac(e^(-2 alpha l) "Im"(Gamma_L), |1 - Gamma_S Gamma_L e^(-2 gamma l)|^2) $

观察可以得到以下规律

1. 阻抗不匹配时，有功功率具有衰减因子 $(1 - |Gamma_L|^2)$，所以阻抗匹配对功率传输有重要作用。
2. 存在线损时（即特征阻抗具有虚部），功率具有衰减因子 $e^(-2 alpha l)$，线损对功率传输具有阻碍作用。
3. 功率源的内阻会阻碍功率传输。
4. 功率因数
$
cos Phi_L = P_L / abs(S_L) = frac(1 - |Gamma_L|^2, sqrt((1 - |Gamma_L|^2)^2 + (2 "Im"(Gamma_L))^2))
$

经过复杂的推导，上式实际上可以简化为
$
cos Phi_L = R_L / abs(Z_L)
$

其中 $R_L$ 表明 $Z_L$ 的实数部分，当终端负载是纯阻性的，功率因数为 1，否则功率因数因电抗而下降。

=== 阻抗圆图

上文所述关于传输线有诸多公式，性质，非常复杂。阻抗圆图是传输线计算的可视化工具，用于在已知某点等效输入阻抗（例如终端负载已知）的情况下，分析传输线上反射系数的变化、驻波比等性质；同时还能够在传输线上模拟信号的传导情况；还能够辅助工程师进行阻抗匹配。#footnote[这种描述方法由菲利普·黑格·史密斯（Philip Hagar Smith）、水桥东作、阿米尔·拉法伊洛维奇·沃尔佩特三人分别独立发明。所以阻抗圆图也称作 Smith 圆图，水桥图，沃尔佩特图。]

可以在以下在线连接体验：#link("https://faymek.github.io/smith-chart/")

下文将先介绍阻抗是如何在图中表示的，其数学原理为何，再介绍图的常见用法。

#figure(image("./images/smith.pdf", width: 120%),
  caption: [
    阻抗圆图
  ]
)



==== 阻抗圆图数学原理

阻抗圆图是一个特殊坐标系，基于对表示某点等效输入阻抗的笛卡尔坐标系进行复变换得到，其映射过程如下所示

首先，对于某个需要分析的某点阻抗 $Z$，将其进行归一化处理，对于特征阻抗为 $Z_0$ 的传输线，计算
$
z = Z / Z_0
$

该阻抗是一个复数，可以将其置放在复平面中，当 $z = 1$，阻抗完全匹配；当 $z = 0$，相当于该点短路；当 $z$ 的实部无穷大，相当于该点开路。

可以证明，复平面上的任何一个点与一个阻抗值一一对应，接下来，对该复平面应用以下数学变换
$
w = (z - 1) / (z + 1)
$

由于反射系数定义为 $Gamma = (Z_L - Z_0) / (Z_L + Z_0)$，所以变换后的平面 $w$ 各点对应的复数值就对应该阻抗 $Z$ 对应的反射系数值。且由于对于任何实部不为负的阻抗 $Z_L$，反射系数 $abs(Gamma) in [0, 1]$，所以整个右复平面都被投影到新平面 $w$ 的一个单位圆内。

接下来分析更具体的投影规则，假设原阻抗平面有某点 $z = r + j x$，投影后该点投影到 $w = u + j v$，代入变换表达式，且根据实部和虚部相等，有
$
r = frac(1 - abs(w)^2, (1 - u)^2 + v^2) \
x = frac(2 v, (1 - u)^2 + v^2)
$

现在，对两个方程分别进行整理，可以得到
$
(u - r / (1 + r))^2 + v^2 = (1 / (1 + r))^2 \
(u - 1)^2 + (v - 1/x)^2 = (1/x)^2
$

仔细观察，发现原来在阻抗复平面上的阻抗点 $z = r + j x$ 在变换后的平面上投影点 $w = u + j v$ 的位置由两个圆的交点决定，它们分别是

- 圆心位于 $(r / (1 + r), 0)$ 经过 $(1, 0)$ 的圆

- 圆心位于 $(1, 1 / x)$ 经过 $(1, 0)$ 的圆

这便是阻抗图中许多圆弧线的由来，它们本质上是坐标轴，用来定位一个阻抗值。

#figure(image("./images/smith圆图坐标系.png", width: 95%),
  caption: [
    由两个圆的交点确定归一化阻抗 $z = 0.60 + 0.61 j$
  ]
)

称所有第一类圆，即圆心位于实轴上的为电阻圆；称所有第二类圆，即圆心位于 $x = 1$ 上的圆为电抗圆。

所以，一系列电阻电抗圆的交点即表明一个阻抗值，又表明对应该点的反射系数。

==== 阻抗圆图实用使用方法


== 传输线变压器

传输线变压器是一种特殊的耦合元器件，通过将传输线绕在磁芯上所构成。

#figure(image("images/传输线变压器与魔T混合网络-1.png", width: 75%),
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

#figure(image("images/传输线变压器与魔T混合网络-2.png", width: 55%),
  caption: [
    传输线变压器构成的倒相器
  ]
)

负载 $R_L$ 上的电压和信号源的电压相位相反。

=== 阻抗变换网络

#figure(image("images/传输线变压器与魔T混合网络-3.png", width: 95%),
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

#figure(image("images/传输线变压器与魔T混合网络-4.png", width: 85%),
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

#figure(image("images/传输线变压器与魔T混合网络-5.png", width: 55%),
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

#figure(image("images/传输线变压器与魔T混合网络-6.png", width: 95%),
  caption: [
    功率合成电路
  ]
)


// 6-1 2 3 4
// 6-5 6 7
// 6-9 11 12 14 15

