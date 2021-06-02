#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/172.17.0.1/g' package/base-files/files/bin/config_generate

mkdir package/community
pushd package/community

# Add luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
rm -rf ../lean/luci-theme-argon

git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner.git
# Add Buaa-login
git clone --depth=1 https://github.com/SincereXIA/buaa-login.git
popd

# remove openvpn script security level limit
sed -i '/--script-security/d' package/network/services/openvpn/files/openvpn.init
