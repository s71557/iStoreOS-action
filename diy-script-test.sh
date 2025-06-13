#!/bin/bash

# Git稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

# 更新 golang 1.24 版本
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang

# 必要的库
git clone --depth=1 -b main https://github.com/linkease/istore-packages package/istore-packages
git clone --depth=1 -b master https://github.com/jjm2473/luci-app-diskman package/diskman
git clone --depth=1 -b dev4 https://github.com/jjm2473/OpenAppFilter package/oaf
git clone --depth=1 -b master https://github.com/linkease/nas-packages package/nas-packages
git clone --depth=1 -b main https://github.com/linkease/nas-packages-luci package/nas-packages-luci
git clone --depth=1 -b main https://github.com/jjm2473/openwrt-apps package/openwrt-apps

# 科学上网插件
# rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}
git_sparse_clone master https://github.com/vernesong/OpenClash luci-app-openclash
# git clone --depth=1 https://github.com/nikkinikki-org/OpenWrt-nikki package/nikki
# git clone https://github.com/sbwml/openwrt_helloworld package/helloworld
git clone https://github.com/xiaorouji/openwrt-passwall-packages package/passwall-packages
git clone https://github.com/xiaorouji/openwrt-passwall package/passwall

### 个性化设置
sed -i 's/iStoreOS/StoneOS/' package/istoreos-files/files/etc/board.d/10_system
sed -i 's/192.168.100.1/192.168.100.1/' package/istoreos-files/Makefile
sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate
# 加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='StoneOS-$(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' By Stone'/g" package/base-files/files/etc/openwrt_release
# TTYD
sed -i 's/services/system/g' feeds/luci/applications/luci-app-ttyd/root/usr/share/luci/menu.d/luci-app-ttyd.json
# 修改默认密码
sed -i 's/root:::0:99999:7:::/root:$1$5mjCdAB1$Uk1sNbwoqfHxUmzRIeuZK1:0:0:99999:7:::/g' package/base-files/files/etc/shadow
# 更换默认背景
cp -f $GITHUB_WORKSPACE/images/bg1.jpg feeds/third/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg
# 更换banner
# cp -f $GITHUB_WORKSPACE/images/banner package/base-files/files/etc/banner
# bash
# sed -i 's#ash#bash#g' package/base-files/files/etc/passwd
# sed -i '\#export ENV=/etc/shinit#a export HISTCONTROL=ignoredups' package/base-files/files/etc/profile
# mkdir -p files/root
# curl -so files/root/.bash_profile https://git.kejizero.online/zhao/files/raw/branch/main/root/.bash_profile
# curl -so files/root/.bashrc https://git.kejizero.online/zhao/files/raw/branch/main/root/.bashrc
# 载入脚本
# mkdir -p files/bin
# mkdir -p root/
# curl -s https://git.kejizero.online/zhao/files/raw/branch/main/bin/ZeroWrt > files/bin/ZeroWrt
# curl -s https://git.kejizero.online/zhao/files/raw/branch/main/bin/version.txt > files/root/version.txt
# chmod -R 777 files/bin/ZeroWrt
# chmod -R 777 files/root/version.txt

# iStoreOS-settings
git clone --depth=1 -b main https://github.com/s71557/istoreos-settings package/default-settings
# 更新Feeds
./scripts/feeds update -a
./scripts/feeds install -a
