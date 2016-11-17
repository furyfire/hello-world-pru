#!/bin/bash
cd /var/lib/cloud9
#git clone https://github.com/MarkAYoder/BeagleBoard-exercises
# P9.31 / hdmi audio clk           100 A13 fast rx down 5 pru 0 out 0      ocp/P9_31_pinmux (pinmux_P9_31_pruout_pin)
#echo pruout > /sys/devices/platform/ocp/ocp\:P9_31_pinmux/state 
# P8.15                             15 U13 fast rx  up  6 pru 0 in 15      ocp/helper (pins)
#echo pruin > /sys/devices/platform/ocp/ocp\:P8_15_pinmux/state 
config-pin -a P9_27 pruout
config-pin -a P9_28 pruin