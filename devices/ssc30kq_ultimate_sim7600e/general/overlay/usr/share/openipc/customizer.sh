#!/bin/sh
#
# First-boot customizer for SSC30KQ + IMX335 + SIM7600E (RNDIS) + WireGuard.
# Runs once via S30customizer.
#
# Sets u-boot environment variables that the standard OpenIPC init scripts
# read to wire up the camera:
#   - sensor  -> selects IMX335 sensor driver
#   - wlandev -> S40network -> /etc/wireless/modem picks the sim7600g handler
#   - wg_*    -> /usr/sbin/wireguard (called by S98wireguard) reads these
#                and builds /tmp/wireguard.conf at boot.

# --- Hardware: sensor + modem ---
fw_setenv sensor   imx335
fw_setenv wlandev  sim7600g

# --- Network fallback (camera LAN IP when usb0 is not up) ---
# fw_setenv netaddr_fallback  192.168.1.10
# fw_setenv ethaddr           00:00:23:34:45:66

# --- WireGuard — UNCOMMENT AND FILL AFTER FLASHING ---
# Generate keys on your VPN server, then on the camera:
#   fw_setenv wg_privkey   "<camera_private_key_base64>"
#   fw_setenv wg_pubkey    "<peer_public_key_base64>"
#   fw_setenv wg_sharkey   "<preshared_key_base64>"
#   fw_setenv wg_endpoint  "<server_ip>:51820"
#   fw_setenv wg_address   "10.8.0.X/24"
#   fw_setenv wg_allowed   "0.0.0.0/0"
#   fw_setenv wg_alive     "25"
#   reboot

# --- Optional: upgrade URL ---
# fw_setenv upgrade 'https://github.com/OpenIPC/builder/releases/download/latest/ssc30kq_ultimate_sim7600e-nor.tgz'

exit 0
