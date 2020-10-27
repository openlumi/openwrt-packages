# OpenWrt custom packages feed Openlumi

## Description

GitHub Pages repository for own OpenWrt binary packages feed.

## Usage

```
$ [ -f /lib/libustream-ssl.so ] && echo "libustream already installed" || opkg install libustream-mbedtls
$ wget https://openlumi.github.io/openwrt-packages/public.key
$ opkg-key add public.key
$ echo 'src/gz openlumi https://openlumi.github.io/openwrt-packages/packages/arm_cortex-a9_neon/' >> /etc/opkg/customfeeds.conf
$ opkg update
$ opkg install [package-name]
$
$
$ #or
$ echo 'src/gz openlumi-node https://openlumi.github.io/openwrt-packages/packages/arm_cortex-a9_neon/node' >> /etc/opkg/customfeeds.conf
```

[List packages](./packages/)


## Based on
* [hnw/openwrt-packages](https://github.com/hnw/openwrt-packages)

## Supporting platforms and packages

* OpenWrt 5.4
  * [arm_cortex-a9_neon](https://github.com/openlumi/openwrt-packages/tree/gh-pages/packages/arm_cortex-a9_neon)
  
## Packages

- [nodejs](https://github.com/openlumi/openwrt-node-packages)
- [node-red](https://github.com/openlumi/openwrt-node-packages)
- [zigbee2mqtt](https://github.com/openlumi/openwrt-node-packages)

## License

See [LICENSE](LICENSE) file.
