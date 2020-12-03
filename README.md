使用说明：


1、vps需安装docker,v2ray必须使用专用的config.json;
2、主机上创建配置文件如/home/$user/v2proxy/proxy.yaml，设置好必要的参数;
3、创建v2proxy容器：docker run -d --restart=always --name v2proxy -v /home/$user/v2proxy:/opt/jar/config --net=host sequent5/v2proxy
4、为nginx新建配置文件，如v2proxy.conf,参考例子v2proxy.conf.example。
