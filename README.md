SweetMocker
===========

在项目开发过程中，客户端与后台通常是并行的，就经常存在客户端等待后台接口的情况。

我们可以在后台ready之前先定好协议，客户端按照协议先行，等到后台OK了再联调。

某些情况程序流程可能需要数据才能继续进行，所以要求客户端能模拟后台数据使流程提前走通，尽量减少联调时的问题。

SweetMocker是应用在此场景下的一个数据模拟文件的编辑器，目前支持HTTP请求返回json数据的模拟。

支持特性有：

1.含全局开关和针对URL的开关，方便控制模拟是否开启

2.针对一个url能保存多个mock结果，方便调试服务器不同返回的逻辑(正常或异常等)

3.格式化json，方便对模拟数据的编辑


