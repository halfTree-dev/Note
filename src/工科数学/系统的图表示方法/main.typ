#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style

== 系统的图表示方法

=== 系统框图表示法

==== LTI 系统的表示

对于一个二阶连续 LTI 系统而言，它的系统方程总可以被表示为
$
  y^'' (t) + a_1 y^' (t) + a_0 y(t) = b_2 f^'' (t) + b_1 f^' (t) + b_0 f(t)
$

为此，可以画出以下系统框图来描述它
#figure(image("images/连续系统的图示法-1.png", width: 95%),
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

#figure(image("images/连续系统的图示法-2.png", width: 70%),
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

#figure(image("images/连续系统的图示法-3.png", width: 70%),
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
#figure(image("images/连续系统的图示法-4.png", width: 40%),
  caption: [
    边的示例
  ]
)

节点表示系统中的变量，所有指向该节点的边的信号值经过求和后，作为该节点的输出信号。所以节点相当于一个累加器。#footnote[有时从一个节点会引出多个输出，这种情况下每个输出信号的值都等于该节点的输出信号值，即输入信号值的求和，是相同的。]
#figure(image("images/连续系统的图示法-5.png", width: 60%),
  caption: [
    节点的示例
  ]
)

所以 LTI 系统也可以用信号流图表示

#figure(image("images/连续系统的图示法-6.png", width: 80%),
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

#figure(image("images/连续系统的图示法-7.png", width: 70%),
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
#figure(image("images/连续系统的图示法-8.png", width: 100%),
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
#figure(image("images/连续系统的图示法-9.png", width: 70%),
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

