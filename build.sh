export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
# make msm8916_defconfig
make -j32
cat arch/arm64/boot/Image arch/arm64/boot/dts/qcom/msm8916-benq-t47.dtb > payload
cp arch/arm64/boot/dts/qcom/msm8916-benq-t47.dtb ~/skales/dtdir/
~/skales/dtbTool -o dt.img ~/skales/dtdir/
/media/umer/SN720/omnitwrp6/out/host/linux-x86/bin/mkbootimg --base 0x80000000 --pagesize 2048 --tags_offset 0x100 --ramdisk_offset 0x02000000 --ramdisk '/home/umer/Downloads/Telegram Desktop/ramdisk'  --kernel payload --dt dt.img -o boot.img
rm ~/skales/dtdir/*
rm dt.img
