#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style

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

#figure(image("images/离散信号的频域分析.png", width: 85%),
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

#figure(image("images/离散信号的频域分析-2.png", width: 75%),
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

#figure(image("images/离散信号的频域分析-3.png", width: 75%),
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

#figure(image("images/离散信号的频域分析-4.png", width: 100%),
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


