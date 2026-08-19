#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style

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
