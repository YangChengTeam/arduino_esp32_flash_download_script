@echo off
esptool.exe --chip esp32 --port COM%~1 --baud 921600 --before default_reset --after hard_reset write_flash -z --flash_mode dio --flash_freq 80m --flash_size detect 0xe000 boot_app0.bin 0x1000 bootloader_qio_80m.bin 0x10000 %~2 0x8000 wc.ino.partitions.bin 0x290000 %~3

echo flash download success , waiting for exit.

ping www.baidu.com -n 3 > nul
exit