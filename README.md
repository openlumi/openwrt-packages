# OpenWrt custom packages feed Openlumi

## Description

GitHub Pages repository for own OpenWrt binary packages feed.

## Usage

```sh
[ -f /lib/libustream-ssl.so ] && echo "libustream already installed" || opkg install libustream-mbedtls
(! grep -q openlumi /etc/opkg/customfeeds.conf) && (
wget -q https://openlumi.github.io/openwrt-packages/public.key -O /tmp/public.key && 
opkg-key add /tmp/public.key && rm /tmp/public.key &&
echo 'src/gz openlumi https://openlumi.github.io/openwrt-packages/packages/19.07/arm_cortex-a9_neon' >> /etc/opkg/customfeeds.conf &&
echo "Feed added successfully!"
) || echo "Feed added already. Skip."

# then
opkg install [package-name]

#or for snapshot
echo 'src/gz openlumi https://openlumi.github.io/openwrt-packages/packages/snapshot/arm_cortex-a9_neon' >> /etc/opkg/customfeeds.conf
```

[List packages](./packages/)


## Based on
* [hnw/openwrt-packages](https://github.com/hnw/openwrt-packages)

## Supporting platforms and packages

* OpenWrt 19.07
  * [arm_cortex-a9_neon](https://github.com/openlumi/openwrt-packages/tree/gh-pages/packages/19.07/arm_cortex-a9_neon)
* OpenWrt snapshot
  * [arm_cortex-a9_neon](https://github.com/openlumi/openwrt-packages/tree/gh-pages/packages/snapshot/arm_cortex-a9_neon)
  
## Packages

- [nodejs](https://github.com/openlumi/openwrt-node-packages)
- [node-red](https://github.com/openlumi/openwrt-node-packages)
- [zigbee2mqtt](https://github.com/openlumi/openwrt-node-packages)
- and more...

## License

See [LICENSE](LICENSE) file.
