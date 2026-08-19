#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style

== 三大变换与系统的频域、复频域、Z域分析方法

=== 傅里叶变换
这是一个定义在 $\[ - 1 \, 1 \]$ 上的方波函数

#figure(image("images/fourier.png"),
  caption: [
    方波
  ]
)

现在，我们定义一系列的正弦波函数

$ f_k \( x \) = frac(2 \( 1 - cos \( k pi \) \), k pi) s i n \( k pi x \) $

令其前 $N$ 项的和为 $F \( N \)$

$ F \( N \) = sum_(k = 1)^N f_k \( x \) $

我们来把 $F \( 1 \)$ 的图像画出来看看

#figure(image("images/fourier-2.png"),
  caption: [
    F(1) 的图像
  ]
)

看起来正弦波和方波之间没什么联系，我们把 $F \( 11 \)$
的图像画出来，和方波比较看看

#figure(image("images/fourier-3.png"),
  caption: [
    F(11) 的图像
  ]
)

看起来正弦波有点向方波靠拢的趋势了，继续增加 $N$ 的值，看看 $F \( 31 \)$
的图像

#figure(image("images/fourier-4.png"),
  caption: [
    F(31) 的图像
  ]
)

图像和真正的方波越来越接近了

#figure(image("images/fourier-5.png"),
  caption: [
    F(100) 的图像
  ]
)

叠加到 $F \( 100 \)$ 的时候，图像已经和方波几乎重合了，我们把
$F \( 100 \)$ 单独画出来看看。

#figure(image("images/fourier-6.png"),
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

#figure(image("images/fourier-7.png"),
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

#figure(image("images/fourier-8.png"),
  caption: [
    锯齿波频谱图
  ]
)

就像这样，我们取一个非周期函数的一部分，将其看作是一个函数的一个周期，再对该周期函数做傅里叶展开，得到的频谱图就可以看作是该非周期函数在该部分的频域特性，这就是周期延拓。

==== 离散傅里叶变换
对于一个连续的函数，例如
$y = frac(1, 1 + x^2)$，我们可以用傅里叶变换来分析其频域特性，通常可以得到一个连续的频谱图。

#figure(image("images/fourier-9.png"),
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

#figure(image("images/fourier-10.png"),
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

#figure(image("images/fourier-11.png"),
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

#figure(image("images/fourier-12.png"),
  caption: [
    频谱图
  ]
)

虽然通过散点已经很难看出来这是正弦波叠加而成的波形了，但是傅里叶变换却精确指出了其频率成分（每个三角函数对应正负一对频率冲激），我们仍然可以知道波形由四个频率成分组成，分别是
$w = 3 \, 2 \, 7 \, 11$。

现在，以 $f = 9 / pi$ 对信号进行采样，做傅里叶变换，得到的频谱图如下

#figure(image("images/fourier-13.png"),
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

#box(image("images/fourier-14.png"))

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

#figure(image("images/拉普拉斯变换.png", width: 75%),
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

#figure(image("images/离散信号的时域分析-1.png", width: 85%),
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
