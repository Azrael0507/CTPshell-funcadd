# CTPshell-funcadd

CTPshell脚本更新文档

	本文档用于指导使用通用ctpshell脚本修改优化包，对于通用ctp的shell脚本版本进行功能更新处理，当前增加功能如下：

	1、增加pigz多线程打包支持

	2、增加numactl的组件cpuid与nodeid绑定支持

	3、调整ssh参数，使其在网络延迟下更加稳定

	4、增加showall.sh --sp功能，用于检查当次新合约上市情况


一、pigz功能更新

a、修改pigzupdate.sh脚本中的shelldir变量，指向生产shell目录

b、在脚本包下执行脚本

c、会在destfile目录下生成新backup.sh脚本，或手动拷入覆盖，或使用脚本注释内容直接刷入生产目录


二、taskset&numactl功能更新

a、将addsh.cfg内容加入生成sh.cfg文件中

b、修改numa-shell-gen.sh脚本中的shelldir变量，指向生产shell目录, 在脚本包下执行脚本

c、会在destfile目录下生成numastart.sh与numarestart.sh脚本，或手动拷入覆盖，或使用脚本注释内容直接刷入生产目录

d、修改ecallupdate.sh脚本中的shelldir变量，指向生产shell目录, 在脚本包下执行脚本

e、会在destfile目录下生成新ecall.sh脚本，或手动拷入覆盖，或使用脚本注释内容直接刷入生产目录

f、将范例的numalist拷贝入生产目录，根据具体绑核方案以及numa节点情况进行配置

20211116更新内容

三、ssh参数调整

a、根据chsh.cfg里的内容，调整sh.cfg文件中的内容，这里为ssh命令增加-f这个选项，用作处理一部分ssh链接超时而导致的程序启动不正常情况，-f参数会将远程执行的命令，挂靠到远程主机的init（pid=1）进程下。

四、showall.sh增加新合约检查功能

a、修改showallupdate.sh脚本中的shelldir变量，指向生产shell目录，在脚本包下执行脚本

b、会在destfile目录下生成新的showall.sh脚本，或手动拷入覆盖，或使用脚本注释内容直接刷入生产目录

c、可以使用showall.sh --sp来调用查看本次初始化时的新合约快照情况
