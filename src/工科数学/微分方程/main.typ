#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style

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

