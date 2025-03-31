## 固件下载

**Rockchip: https://openwrt.kejizero.online/ZeroWrt/Rockchip**

**X86_64: https://openwrt.kejizero.online/ZeroWrt/X86_64**

## 默认信息

- **管理地址：[http://10.0.0.1](http://10.0.0.1) 或 [http://openwrt.lan](http://openwrt.lan)**
- **账户：root**
- **密码：password

## 官方讨论群

如有技术问题需要讨论或者交流，欢迎加入以下群：

1. QQ 讨论群：路由器交流群，号码 579896728，加群链接：[点击加入](https://qm.qq.com/q/oe4EAtvPIO "路由器交流群")
2. TG 讨论群：路由器交流群，加群链接：[点击加入](https://t.me/kejizero "路由器交流群")

## 固件说明
- 基于原生 OpenWrt 24.10 编译，默认管理地址 10.0.0.1   默认密码：password
- AdguardHmoe默认账号：admin 默认密码：admin
- 默认关闭一键DNS，如需一键开启mosdns-adguardhome、smartdns-adguardhome请前往ZeroWrt选项菜单进行一键配置
- 切换Uhttpd为Nignx
- 内置ZeroWrt选项菜单方便用户设置OpenWrt
- 默认打开了wan口防火墙
- 默认所有网口可访问网页终端
- 默认设置所有网口可连接 SSH
- 默认已经切换了docker源，国内网络即可拉取镜像
- GPU 硬件加速、BBRv3 拥塞控制、Shortcut-FE（支持 UDP 入站）、	NAT6、全锥型 NAT（NFT、BCM 双方案）相关支持
