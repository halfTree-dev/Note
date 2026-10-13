#import "../../../lib.typ": theorem, definition, example, chapter-style
#show: chapter-style

== 计算机操作系统基本知识

上文已经介绍过，对于处理器而言，通过依照其指令集实现，对其进行编程，即可令其处理各式各样的任务。尽管如此，直接对处理器进行编程是非常复杂且困难的，为提高工作效率，一类被称作操作系统（OS）的软件系统被开发出来，配置在计算机硬件上，以提供一个抽象层，使得程序员能够更方便地编写程序来控制计算机的行为。

作为计算机硬件上运行的最底层软件系统，操作系统具有以下核心功能

- 进程管理与调度

  进程是一个具有独立功能的程序关于某个数据集合的一次运行活动；一个/多个应用程序会发起一个/多个进程的运行；操作系统负责管理这些进程的生命周期，包括创建、调度、终止等。

- 内存管理

  要同时支持多个进程的运行，操作系统需要管理内存的分配与保护；同时需要引入虚拟内存机制，以提供每个进程一个独立的地址空间，使得对应的程序可以独立运行，而不出现访问地址的冲突。

- 文件系统

  文件是用于访问外部存储设备数据的数据结构，其提供一套规范以方便对于储存器资源的访问。操作系统提供文件系统来管理文件的增删查改等操作，以便程序能够方便地访问和存储数据。

- 用户接口

  操作系统提供用户接口，如终端、图形用户界面，以使得用户能够与计算机进行交互。

=== 进程管理和调度

==== 进程的创建与终止

进程是一个具有独立功能的程序关于某个数据集合的一次运行活动，是操作系统进行管理的基本单位；

===== 创建进程

在 Linux 中，创建进程一般出于以下目的

- 执行一个新的程序

- 将同一个程序分出多个进程进行处理

为了

==== 由进程发起系统调用

前文提及，在 RISC-V 架构下，处理器具有特权等级机制，一般的用户程序运行在用户态（User Mode），当用户程序需要访问更高权限的资源时（如向终端打印信息），则需要发起系统调用以提权到监管态（Supervisor Mode）或机器态（Machine Mode）来执行相应的操作；

在 Linux 系统下，有一命令 `strace`，可以用于跟踪一个进程的系统调用（System Calls）和接收到的信号（Signals），以追踪进程的行为；以 `strace` 跟踪前文中“翻译与启动程序”中的 A+B 程序为例，执行
```sh
strace -o strace-output.txt -T ./main
```

得到以下抓取内容
```sh
execve("./main", ["./main"], 0x3fc934a108 /* 28 vars */) = 0 <0.001201>
brk(NULL)                               = 0x2cdacbc000 <0.000041>
faccessat(AT_FDCWD, "/etc/ld.so.preload", R_OK) = -1 ENOENT (No such file or directory) <0.000058>
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3 <0.000062>
fstat(3, {st_mode=S_IFREG|0644, st_size=24003, ...}) = 0 <0.000089>
mmap(NULL, 24003, PROT_READ, MAP_PRIVATE, 3, 0) = 0x326abfb000 <0.000083>
close(3)                                = 0 <0.000043>
openat(AT_FDCWD, "/lib/riscv64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) = 3 <0.000086>
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0\363\0\1\0\0\0Ry\2\0\0\0\0\0"..., 832) = 832 <0.000047>
fstat(3, {st_mode=S_IFREG|0755, st_size=1534120, ...}) = 0 <0.000043>
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x326abf9000 <0.000058>
mmap(NULL, 1572280, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x326aa79000 <0.000057>
mmap(0x326abe8000, 20480, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x16f000) = 0x326abe8000 <0.000089>
mmap(0x326abed000, 48568, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x326abed000 <0.000061>
close(3)                                = 0 <0.000039>
set_tid_address(0x326abf9d50)           = 8234 <0.000039>
set_robust_list(0x326abf9d60, 24)       = 0 <0.000037>
mprotect(0x326abe8000, 12288, PROT_READ) = 0 <0.000079>
mprotect(0x2cd145d000, 4096, PROT_READ) = 0 <0.000072>
mprotect(0x326ac29000, 8192, PROT_READ) = 0 <0.000065>
prlimit64(0, RLIMIT_STACK, NULL, {rlim_cur=8192*1024, rlim_max=RLIM64_INFINITY}) = 0 <0.000042>
munmap(0x326abfb000, 24003)             = 0 <0.000081>
fstat(0, {st_mode=S_IFCHR|0620, st_rdev=makedev(0x88, 0x1), ...}) = 0 <0.000046>
getrandom("\x5c\x1f\x3f\x27\xef\x98\x8a\x7a", 8, GRND_NONBLOCK) = 8 <0.000041>
brk(NULL)                               = 0x2cdacbc000 <0.000037>
brk(0x2cdacdd000)                       = 0x2cdacdd000 <0.000055>
read(0, "1 2\n", 1024)                  = 4 <1.853887>
fstat(1, {st_mode=S_IFCHR|0620, st_rdev=makedev(0x88, 0x1), ...}) = 0 <0.000052>
write(1, "The result of 1 + 2 is 3 \n", 26) = 26 <0.000060>
lseek(0, -1, SEEK_CUR)                  = -1 ESPIPE (Illegal seek) <0.000047>
exit_group(0)                           = ?
+++ exited with 0 +++
```

分析抓取内容，可以如下总结程序运行的过程

- 启动和装载

  `execve()` 函数用于执行一个程序，此时操作系统将加载 `./main` 可执行文件到内存中；随后，操作系统将解析可执行文件的头部信息，确定需要加载哪些库文件（如 libc.so.6），并将这些库文件通过 `openat()` 等函数加载到内存中；在加载过程中，操作系统还会进行内存映射（`mmap()`）以分配必要的内存空间，并设置相应的权限；

- 运行时环境准备

  操作系统将为程序设置必要的运行时环境，例如设置线程局部存储（`set_tid_address()`）和线程安全机制（`set_robust_list()`）；同时，操作系统还会调整内存保护（`mprotect()`）以确保程序的安全运行；`fstat()` 和 `getrandom()` 等函数用于获取系统信息和随机数，以满足程序的运行需求；

- 业务逻辑

  程序通过 `read()` 从标准输入读取用户输入的数据（如 "1 2\n"），并通过 `write()` 将计算结果输出到标准输出；

- 退出

  当程序执行完成后，调用 `exit_group()` 来终止程序的运行，并返回一个退出状态码。

观察耗时数据，可以发现每个系统调用的耗时基本都在微秒级别。同时，所谓 `execve()` `openat()` 等函数都不是 RISC-V 汇编语言标准的定义函数，可见这是由 Linux 操作系统提供的系统调用接口；这便是操作系统封装性的一大重要体现，为程序提供一套抽象的接口，以便程序能够方便地访问系统资源，而不需要直接操作底层硬件。

应用程序除了调用系统接口以外，更多时候是处于用户态，以处理应用程序业务逻辑，可以使用 `sar` 命令来监控程序的 CPU 使用率；以 `sar` 监控以下随机数生成与输出程序
```c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main() {
    srand((unsigned)time(NULL));
    while (1) {
        int num = rand() % 99;
        if (num == 1) {
            printf("Strange!");
        }
    }
    return 0;
}
```

使用 `sar 1 > output.log` 命令检查程序的 CPU 使用率，得到以下输出
```sh
07:10:01        CPU     %user     %nice   %system   %iowait    %steal     %idle
07:10:02        all     46.98      0.00      2.51      0.00      0.00     50.50
07:10:03        all     46.17      0.00      2.04      0.00      0.00     51.79
07:10:04        all     47.37      0.00      2.26      0.00      0.00     50.38
07:10:05        all     47.36      0.00      2.27      0.00      0.00     50.38
07:10:06        all     46.33      0.00      2.78      0.00      0.00     50.89
07:10:07        all     47.45      0.00      1.53      0.00      0.00     51.02

Average:        all     46.94      0.00      2.23      0.00      0.00     50.82
```

这表明程序花费大量的 CPU 时间在用户态（%user）来执行应用程序的业务逻辑，并在某些时候发起系统调用（%system）来访问系统资源。

==== Linux 系统包装的系统调用与 C 标准库函数

为了在 Linux 系统上提供编程接口，Linux 内核包装了一套系统调用接口，以供所有的程序可以通过同一规定好的抽象层发起调用；这些接口以 C 语言函数的形式暴露给用户程序，C 标准库（如 glibc）提供了一套丰富的函数库，这些函数库在内部调用 Linux 系统调用来实现其功能。

可以说，Linux 系统将负责系统调用的核心代码实现在其内核中，而 C 语言提供了一套用户态封装。可以使用 `ldd` 命令来查看一个可执行文件依赖的共享库，以 `ldd` 查看前文中 A+B 程序的依赖库，得到以下输出
```sh
ldd main
        linux-vdso.so.1 (0x0000003598be6000)
        libc.so.6 => /lib/riscv64-linux-gnu/libc.so.6 (0x0000003598a57000)
        /lib/ld-linux-riscv64-lp64d.so.1 (0x0000003598be8000)
```




=== Linux 终端工作流

终端的概念存在已久，在计算机发明之初，要将信息输入计算机，人们依靠电传打字机（Teletype）通过串口链接到计算机设备以输入命令，并在打印的纸带上查看设备输出结果。

电传打字机作为终端输入的象征，在命名上被 Linux 系统所采纳。现代 Linux 系统将将终端维护为终端设备，位于其文件目录的 `/dev/tty*`，这些设备接受标准输入，并提供标准输出，充当用户的操作接口。

当用户在输入设备（如键盘）上输入内容，输入设备将通过如总线的传输渠道将输入信息传递给主板，引起主板触发系统中断。内核中键盘的驱动程序提供中断处理函数，并将键盘的内容进行行规程处理#footnote[行规程是一种输入信息从输入设备到驱动程序的转义处理，例如按下退格键会被解读为删除缓冲区字符操作。]（Line Discipline）；处理后的信息（即用户指令）将被输入到 TTY 设备，以供终端执行。

与此同时，内核中的显卡驱动程序将读取终端设备的输出，输出内容经处理，将被转化为图像信息写入显卡 FrameBuffer 显存，显卡再通过扫描显存将数据通过 HDMI 或 DP 线缆输送到显示器，设备即可显示画面。

==== 关键终端设备

- `/dev/tty0`
  当前用户正在使用中的终端设备，对该设备进行 `echo` 写入将会在当前终端中看到自己写入的内容

- `/dev/tty[1-6]`
  系统提供的 6 个虚拟终端设备，每个设备都是一个独立工作的终端。

- `/dev/ttyUSB*`
  通过 USB 总线链接的其它终端设备，例如另一台提供终端的计算机，或者正常工作中的 CH340，等等。

- `/dev/pts/N`
  通过如 telnet，SSH 等虚拟终端协议创建的虚拟终端设备，用于远程主机对本设备终端的访问。

==== 控制符、管道符、重定向符

控制符指的是控制命令执行流程和顺序的符号

#align(center)[
  #block(
    inset: 8pt,
    radius: 6pt,
    table(
      columns: (1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[控制符]],
        [#text(weight: "bold")[作用]], 
      ),
      [;], [被分号分隔的各个命令将依次执行],
      [&& ||], [被分号分隔的各个命令将依次执行，且具有短路作用],
      [&], [命令末尾放置将使得指定进程运行在后台],
      [() {}], [被 () 括起的命令将被移动到新的 Shell 中执行，{} 括起的命令将在这个 Shell 中成组执行。]
    )
  )
]

管道符，即 `|`，可以将其左方命令的标准输出作为右方命令的标准输入。

重定向符则可用于操作文件，将内容在文件和标准流之间传输

#align(center)[
  #block(
    inset: 8pt,
    radius: 6pt,
    table(
      columns: (1fr, 1fr),
      align: center,
      table.header(
        [#text(weight: "bold")[重定向符]],
        [#text(weight: "bold")[作用]], 
      ),
      [< << <<<], [从右方目标读入文件所有内容/多行文本/单行字符串输入左方],
      [> >>], [从左方目标读入内容写入/追加到右方文件],
    )
  )
]
在符号前加上数字 `0` `1` `2` 可以指定令某类型的内容（标准输入/正常输出/错误输出）进行传输。

读取多行文本时，有必要取一个自定义符号，以标记多行文本的终结，一般使用 `EOF`

```sh
cat << EOF
内容第一行
内容第二行
EOF
```

可以采用诸如 `2>&1` 的形式，将错误输出的内容也重定向到正常输出，统一处理。

==== 终端内容的过滤器家族

终端的工作一般遵循：获取 stdin，对信息进行处理，然后输出 stdout 的三步流程。以下常用终端工具可以在这些流程方面起到帮助

- `read`
```sh
read -p "Enter your name: " name
```
read 将读取一行 stdin 输入并存储到变量中

- `printf`
```sh
printf "%s %d\n" "name" 42
```
printf 将按照格式符输出字符串

- `cat`
cat 意为 concatenate，其接受多个文件参数和 stdin，并将它们拼合后输出为 stdout。该命令也可以用于中转输入输出内容。
```sh
cat a.txt b.txt > all.txt
cat > script.sh << 'EOF'
#!/bin/bash
echo "hello"
EOF
```

- `head` 和 `tail`
这两个命令可以从 stdin 中取得头部或尾部几行，输出到 stdout
```sh
head -n 20 file.txt
tail -n 20 file.txt
```

- `wc`
wc 意为 word count，接受一个文件作为输入，并返回该文件的行数、单词数、字节数和文件名。

- `sort`
sort 接收文件或 stdin 作为输入，将会对文件进行按照行的重排序
```sh
sort -t: -k3 -n /etc/passwd # 以:分隔，按第3字段数值排序
```

- `uniq`
uniq 接收文件或 stdin 作为输入，将会去除相邻重复行，或可使用参数显示重复的行数
```sh
uniq file.txt               # 去除相邻重复行
uniq -c file.txt            # 显示每行重复次数
uniq -w 5 file.txt          # 只比较前 5 个字符
```

- `grep`
grep 接收文件或 stdin 作为输入，指定单词，将在内容中寻找匹配该单词的内容
```sh
grep "pattern" file
grep -f keywords.txt bigfile.txt # 从文件读模式
grep -e "error" -e "warning" -e "fatal" log.txt # 多模式 OR
```

- `sed`
sed 意为 stream editor，可以对输入进行多项用户自定义的处理操作
```sh
sed 's/old/new/' file   # 每行替换第一个 old 为 new
```


- `xargs`
xargs 将从 stdin 读取内容并将其作为参数传递给后续命令
```sh
echo "file1.txt file2.txt" | xargs cat          # cat file1.txt file2.txt
find . -name "*.log" | xargs rm                  # 删除找到的文件
```

- `tee`
tee 将从 stdin 获取输入，将输入写入传入文件参数的同时，将内容同时输出到 stdout，起到同时向文件和输出写的作用。
```sh
make 2>&1 | tee build.log       # 编译输出同时显示并保存
tee file1 file2                 # 在两个文件中复制内容 
```

==== 使用 tmux 管理终端

tmux 是一个终端复用器，可以在单个终端窗口中创建多个会话，并在会话之间切换。tmux 可以在终端窗口关闭后继续运行，并且可以在多个终端窗口中共享同一个会话。

tmux 的基本操作如下：
- `tmux new -s session_name` 创建一个新的会话
- `tmux attach -t session_name` 连接到一个已存在的会话
- `tmux ls` 列出所有会话

- `tmux kill-session -t session_name` 杀死一个会话
- `tmux switch -t session_name` 切换到一个会话

在 tmux 中，可以使用以下快捷键进行操作
- `Ctrl + b` 进入 tmux 命令模式
- `d` 分离出当前会话
- `s` 列出所有会话

- `c` 创建一个新的窗口
- `w` 列出所有窗口
- `&` 删除当前窗口

- `%` 纵向分割当前窗口
- `"` 横向分割当前窗口

- `z` 暂时全屏/恢复当前窗口
- `x` 关闭当前窗口

- `[` 在当前窗口进入滚屏模式，按下 `q` 退出

==== 在终端中确认系统基本信息

===== 内核版本

```sh
root@lubancat:~# lsb_release -a
No LSB modules are available.
Distributor ID: Debian
Description:    Debian GNU/Linux 10 (buster)
Release:        10
Codename:       buster
root@lubancat:~# hostnamectl
   Static hostname: lubancat
         Icon name: computer
        Machine ID: 031ed1f58e49423da35c647bbcf5eeff
           Boot ID: 8630b72e80014a30b9837e56e791c460
  Operating System: Debian GNU/Linux 10 (buster)
            Kernel: Linux 4.19.232
      Architecture: arm64
```

===== 驱动信息

可以通过读取 `/proc/config.gz` 来检查内核编译时的驱动配置
```sh
zcat /proc/config.gz
```

例如查询 USB 串口设备驱动的编译情况
```sh
zcat /proc/config.gz | grep -E "USB_SERIAL|CH341|USB_ACM"
```

`/proc` 目录是一个伪文件系统，提供诸多和内核数据结构的接口。

===== 用户信息

对于系统中的用户，可以使用 `usermod` 来更改其信息（作为 root）
```sh
# 将 oldname 用户更名为 newname 并迁移 /home/oldname 到 /home/newname
usermod -l newname -d /home/newname -m oldname
# 将用户 alice 加入到 sudo 组中
usermod -aG sudo alice
```

可以使用 `useradd` 来添加新用户
```sh
useradd -m -s /bin/bash bob
passwd bob
```

使用 `passwd` 来更改指定用户的密码
```sh
passwd charlie
```

==== 在终端中操作进程

===== 查询进程
- `htop`

  `htop` 允许用户实时查看 CPU、内存的使用情况和系统中正在运行的进程；

- `sar`

  `sar` 可以监控系统的性能指标，如 CPU 使用率、内存使用率、磁盘 IO 等；除实时调用，其也可以查看历史性能数据；

- `lsof`

  `lsof` 可以查看系统中打开的文件和对应的进程信息；

  ```sh
  lsof -i [option] # 查看与网络相关的打开文件，option 可以是端口号或协议类型
  lsof -p [pid] # 查看指定进程打开的文件
  lsof -u [user] # 查看指定用户打开的文件
  ```

===== 服务管理器和系统守护进程

systemd 是现代 Linux 系统的服务管理器，是内核启动运行的首个进程（PID = 1）。

守护进程是值一系列在后台长期运行且无需控制终端的进程，如 `sshd`。所有的守护进程都受到 `systemd` 管理，`systemd` 自己也是一个守护进程。

====== systemctl

`systemctl` 是一个命令行工具，用于控制 `systemd` 以管理其它的系统守护进程。常用的管理命令如下
```sh
# 控制
sudo systemctl start [服务名]
sudo systemctl stop [服务名]
sudo systemctl restart [服务名]
sudo systemctl reload [服务名]

# 查询
systemctl status [服务名]

# 启停
sudo systemctl enable [服务名]
sudo systemctl disable [服务名]
systemctl is-enabled [服务名]
```

在系统启动时启动的守护进程由一系列单元文件 `*.service` 定义，单元文件一般存放在 `/etc/systemd/system`（管理员定义） 或 `/usr/lib/systemd/system`（软件包定义）。一个典型的 Service 文件模板如下
```ini
[Unit]
Description=说明文本
Documentation=文档链接

# 服务在什么服务激活完成后启动
After=network-online.target
Wants=network-online.target

[Service]
# 启动成功模型
Type=simple

# 服务用户与组
User=用户
Group=用户组

# 工作目录
WorkingDirectory=/path/to/workingdir

# 启动时执行命令
ExecStart=/usr/bin/python3 /opt/myapp/server.py
# 重载时执行命令
ExecReload=/bin/kill -HUP $MAINPID

# 重启策略
Restart=on-failure
RestartSec=5s

# 最大打开文件/套接字数量
LimitNOFILE=65536
# 禁止提权
NoNewPrivileges=true

# 日志与标准输入输出目标
StandardOutput=journal
StandardError=journal

Environment="VAR1=value1"
Environment="VAR2=value2"

[Install]
# 服务在哪个运行级别启动（如在多用户命令行启动时启用）
WantedBy=multi-user.target
```

以下命令可以令 `systemd` 重载单元文件，新加载的单元文件对应的进程需要手动启动
```sh
sudo systemctl daemon-reload
```

此外，可以用 `systemctl` 开关机或挂起休眠
```sh
sudo systemctl poweroff
sudo systemctl reboot

# 挂起
sudo systemctl suspend
# 休眠
sudo systemctl hibernate
```

还有一点，`systemctl` 可以切换系统的运行级别，在桌面模式、终端模式以及安全模式等切换
```sh
systemctl get-default
sudo systemctl set-default [目标名]
sudo systemctl isolate [目标名]
```

- graphical.target： 图形界面模式
- multi-user.target： 多用户文本模式
- rescue.target： 救援模式
- emergency.target： 紧急模式

====== journalctl

```ini
# 日志与标准输入输出目标
StandardOutput=journal
StandardError=journal
```

未特别指明输出位置的 daemon，其标准输出总会重定向到 journalctl 工具，可以利用该工具查看守护进程的情况
```sh
journalctl -u nginx.service
```

====== networkctl

networkctl 命令是 systemd-networkd 的一个命令行工具，用于查询网络连接的状态。它可以显示所有连接的状态，也可以显示指定接口的状态。

查询状态
```sh
networkctl list
```

重新阅读配置文件
```sh
sudo systemctl restart systemd-networkd
```

由 systemd-networkd 进行网络配置的网络配置文件位于 `/etc/systemd/network`

```ini
[Match]
Name=enp2s0

[Network]
DHCP=yes
```

```ini
[Match]
Name=enp2s0

[Network]
Address=192.168.1.100/24
Gateway=192.168.1.1
DNS=8.8.8.8
# 当有 Domains=~. 字段时，域名查询将优先通过该字段
Domains=~.
```

有多个网卡设备时，要指定流量通过优先级，使用 `RouteMetric`，字段越小优先级越大，仅在一些新版本内核上有
```ini
[DHCPv4]
RouteMetric=300
# 当有 UseDNS 时，手动设置的 DNS 地址将优先生效
UseDNS=yes
```

systemd-networkd 可以配置某设备为 DHCPv4 Server
```ini
[Match]
Name=eth1

[Network]
Address=192.168.137.1/24
DHCPServer=yes
IPv6AcceptRA=no

[Link]
RequiredForOnline=no

[DHCPServer]
# 指定地址池
# 此处为 192.168.137.100~199（相对接口地址的偏移+数量）
PoolOffset=99
PoolSize=100
DefaultLeaseTimeSec=43200
MaxLeaseTimeSec=43200

# 按 MAC 锁定设备并分配指定地址（需要 Ubuntu 22.10+ 或 Debian 12+）
DHCPServerStaticLease=5a:5a:02:7f:ba:ad 192.168.137.50

# 网关通告默认开启
# 这表明本机无 DNS
EmitDNS=no
```

可以通过
```sh
man systemd.network
```
来查找可用的字段。

有时，当 NetworkManager 被关闭，而 networkd 又没有显示指定某设备的管理规则，则设备会被弃置。

====== dnsmasq

DNS 系统是将域名和 IP 相互映射的数据库，使用 TCP 与 UDP 协议，默认端口为 53

dnsmasq 可以在设备上运行一个 DNS 服务器，可以使用 `sudo apt install dnsmasq` 进行安装，其配置文件位于 `/etc/dnsmasq.conf`

```ini
# 指定设备
interface=enp2s0
bind-interfaces

# 解析指定域名地址
address=/peiranluo.com/192.168.1.100
address=/www.peiranluo.com/192.168.1.100

# 添加其它 DNS 服务器
server=8.8.8.8
server=114.114.114.114
```

`systemd-resolved` 服务默认占用 53 端口。要启用 `dnsmasq`，必须关闭该服务
```sh
sudo systemctl stop systemd-resolved
sudo systemctl disable systemd-resolved
```

位于 `/etc/resolv.conf` 的配置文件用于定义本机上的 DNS 客户端行为，关闭该服务后应当确认其完好，可以将其指向本机的 `dnsmasq` 服务，继承本机的 DNS 服务器配置
```ini
nameserver 127.0.0.1
```

可以使用 `nslookup` 来在 DNS 服务器上查询域名的 IP 地址
```sh
nslookup www.bing.com 8.8.8.8
```

====== isc-dhcp-server

DHCP 是一种动态主机配置协议，用于自动分配 IP 地址和其他网络配置信息。

DHCP 服务端占据 67 端口，DHCP 客户端占据 68 端口。DHCP 服务器可以使用 `sudo apt install isc-dhcp-server` 进行安装，其配置文件位于 `/etc/dhcp/dhcpd.conf`

```ini
authoritative;

subnet 192.168.56.0 netmask 255.255.255.0 {
  range 192.168.56.20 192.168.56.120;
  option routers 192.168.56.4;
}
```

==== 在终端中检查网络通信

===== curl

curl 支持通过包含 HTTP、HTTPS、FTP、SFTP 在内的绝大部分网络通信传输层协议来进行数据传输。

例如请求指定网站的内容
```sh
curl http://www.baidu.com
```

发送 POST 或者 GET 请求到网站，附带消息头#footnote[GET 是一种附带在 URL 上的请求方法，用于向服务器以 HTTP 为传输协议请求信息。POST 是一种放置于 HTTP 正文中的请求方法，一般用于提交数据并发起请求的场合。]
```sh
# POST
curl -d "name=John" https://example.com
# GET
curl -G -d "q=keyword" https://search.com
# Header
curl -H "Content-Type: application/json" https://api.com
```

保存到文件
```sh
curl -o output.html http://info.cern.ch/
```

查看细节过程
```sh
curl -v http://info.cern.ch/
```

指定网络设备发起并接受流量
```sh
sudo curl --interface 'if!wwan0' --connect-timeout 10 -v http://223.5.5.5
```

===== ping

ping 将向目标主机发送 ICMP 回显请求#footnote[ICMP，互联网控制报文协议，是 IP 协议的一部分；其不直接传递信息，而是通过发送和接收控制消息，如网络是否通畅、主机是否可达、路由是否可用等信息帮助网络管理员维护网络的正常运行。由于其是网络层协议，故没有特定的端口号绑定。]，并接收回显应答来判断网络是否可达。被测试的目标可以是 IPv4 地址，也可以是域名（若网络中有 DNS 服务器可以解析）。

```sh
ping 192.168.50.1
```

可以通过 `-c` 参数指定发送数据包数量，`-i` 指定发送间隔秒数。`-I` 指定发送接口设备（如 `eth0`）。

===== ip

ip 是网络配置工具

要操作网络接口，可以使用
```sh
ip link show
ip link set eth0 up
ip link set eth0 down
```

要查看设备分配的 IP 地址
```sh
ip addr show
ip addr show eth0
```

要添加/删除 IP 地址
```sh
ip addr add 192.168.0.10/24 dev eth0
ip addr del 192.168.0.10/24 dev eth0
```

要操作路由
```sh
ip route show
ip route add default via 192.168.1.1
ip route add default via 192.168.10.1 dev eth0 metric 500
ip route del default
```

要查看 ARP 表#footnote[ARP 协议是获取对应当前局域网中 IP 地址的 MAC 地址的协议，当要通过 IP 访问指定设备时，首先通过查表来获取设备的 MAC 地址；若没有，那么 ARP 数据包将广播给所有连接的主机，以寻求帮助来获取指定设备的 MAC 地址，当某一设备的 IP 地址符合请求，那么 ARP 回传数据包将包含该设备的 MAC 地址]以观察邻居
```sh
ip neigh show
```

===== dig 与 nslookup

dig 与 nslookup 用于检查 DNS 解析是否可用

```sh
sudo apt update && sudo apt install dnsutils
```

常用的命令格式为
```sh
nslookup www.bing.com 8.8.8.8
dig @8.8.8.8 www.baidu.com +short +time=2 +tries=1
```

===== 检查 SSH 终端

SSH是一种网络协议，用于计算机之间的加密登录。Ubuntu 上用于主持 SSH 服务的进程为 `ssh`，由 `openssh-server` 包提供。

```sh
systemctl status ssh
```

正常运行的服务应当监听 22 端口。

```sh
root@lubancat:~# sudo ss -tlnp | grep :22
LISTEN    0         0                  0.0.0.0:22               0.0.0.0:*        users:(("sshd",pid=1702,fd=3))
LISTEN    0         0                        *:22                     *:*        users:(("sshd",pid=1702,fd=4))
```

===== tcpdump 检查网络数据流

`tcpdump` 是一个网络数据包分析工具，可以捕获和分析网络流量（不仅是 TCP），其命令格式为
```sh
tcpdump [option] [proto] [dir] [type] addr
```

其中 type 可以填写 host, net 等选项，表明 addr 的目标地址类型，是一个主机地址（如 192.168.137.1）或一个网段#footnote[网段指的是一个 IP 地址范围，其中的 /24 代表前 24 位固定，即子网掩码为 255.255.255.0]地址（如 192.168.137.0/24）。也可以填写 port 选项，表明 addr 是一个端口号（如 80）；

dir 可以填写 src, dst, src or dst 等选项，表明 addr 的目标地址方向，是一个源地址还是一个目的地址；

proto 可以填写 tcp, udp, icmp 等选项，表明要捕获的协议类型；

上述过滤条件可以使用 `and` `or` `not` 关键字进行逻辑组合。使用 `-w` 可以将输出结果写入文件。

分析指定 Host 上的数据流
```sh
sudo tcpdump -ni wwan0 'tcp and host 223.5.5.5'
```

分析指定网络设备的指定数据流
```sh
sudo timeout 12 tcpdump -ni wwan0 tcp &
```

```sh
sudo tcpdump -i eth1 -nn -e -v
```

例：从其他设备抓取得到 ARP 请求如下：
```sh
22:29:22.400482 5a:5a:02:7f:ba:ad > ff:ff:ff:ff:ff:ff, ethertype ARP (0x0806), length 60: Ethernet (len 6), IPv4 (len 4), Request who-has 192.168.0.1 tell 192.168.0.114, length 46
```
表明该设备正在以 `192.168.0.114` 请求网关 `192.168.0.1` 的地址。

例：从其它设备抓取得到 DHCP Discovery 请求如下：
```sh
0.0.0.0.68 > 255.255.255.255.67: BOOTP/DHCP, Request from 5a:5a:02:7f:ba:ad, length 300, xid 0xdd4dbc72, secs 3, Flags [none]
      Client-Ethernet-Address 5a:5a:02:7f:ba:ad
      Vendor-rfc1048 Extensions
        Magic Cookie 0x63825363
        DHCP-Message Option 53, length 1: Discover
        Client-ID Option 61, length 7: ether 5a:5a:02:7f:ba:ad
        MSZ Option 57, length 2: 576
        Parameter-Request Option 55, length 7: 
          Subnet-Mask, Default-Gateway, Domain-Name-Server, Hostname
          Domain-Name, BR, NTP
        Vendor-Class Option 60, length 12: "udhcp 1.26.2"
        Hostname Option 12, length 5: "IPCAM"
```
表明该设备正在作为 DHCP 客户端，以 Option = 53（即 Discovery Mode）搜索对面的 DHCP 服务器。


==== 在终端中传输数据和文件

===== scp

scp 指代 Secure Copy Protocol，即安全复制协议，通过 SSH 协议进行远程文件传输，运行于 22 端口上。

类似于进行文件复制的 cp 指令，scp 指明位于本地或者远程的文件与地址，进行跨设备传送

```sh
# Linux → Linux
scp /local/path/file user@l_addr:/path/to/target/
# Linux → Windows
scp /local/path/file user@w_addr:/C:/path/to/target/
# Windows → Linux
scp C:\local\path\file user@l_addr:/path/to/target/
# Windows → Windows
scp C:\local\path\file user@w_addr:/C:/path/to/target/
```

对于 SSH 开放在非 22 端口上的设备，使用 `-P` 参数
```sh
scp -P 22 /local/path/file user@l_addr:/path/to/target/
```

==== 使用 Python subprocess 进行 CLI 调用


