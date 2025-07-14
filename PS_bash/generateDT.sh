echo ""
echo ""
echo "#############################################################################"
echo "Creacion del device tree"
echo "#############################################################################"
echo ""
echo ""

source /tools/Xilinx/Vitis/2022.2/settings64.sh
# cd /home/fabian/GitHub/KRIA_Starter_Guide/Xilinx_Prjs/Kria_XDMA/
xsct xsct_script.tcl

echo ""
echo ""
echo "#############################################################################"
echo "Compilacion del device tree"
echo "#############################################################################"
echo ""
echo ""

dtc -@ -O dtb -o ./dtg_kr260_v0/dtg_kr260_v0/kr260_xdma/psu_cortexa53_0/device_tree_domain/bsp/pl.dtbo ./dtg_kr260_v0/dtg_kr260_v0/kr260_xdma/psu_cortexa53_0/device_tree_domain/bsp/pl.dtsi
cd file_transfer/
cp ../dtg_kr260_v0/dtg_kr260_v0/kr260_xdma/psu_cortexa53_0/device_tree_domain/bsp/pl.dtbo ./ & cp ../kria_bd_wrapper.bit ./
mv kria_bd_wrapper.bit kr260_xdma.bit.bin
mv pl.dtbo kr260_xdma.dtbo

echo ""
echo ""
echo "#############################################################################"
echo "Envio de archivos a la Kria"
echo "#############################################################################"
echo ""
echo ""

echo petalinux | scp kr260_xdma.bit.bin kr260_xdma.dtbo shell.json petalinux@192.168.1.7:/home/petalinux
