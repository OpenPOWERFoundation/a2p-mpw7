# SPDX-FileCopyrightText: 2020 Efabless Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# SPDX-License-Identifier: Apache-2.0

# mgmt-core: https://github.com/efabless/caravel_mgmt_soc_litex/blob/main/openlane/mgmt_core/config.tcl

# a2p_top (core with inner macros)
#

set ::env(PDK) $::env(PDK)
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) a2p
set ::env(OPENLANE_VERBOSE) 5

# ---------------------------------------------------------------------------------------------
# Core

set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/a2p/a2p_top_gpr.v \
	$script_dir/../../verilog/rtl/a2p/gpr.v \
   "

# include one of these above for inferred or dffram for now (instantiated as GPR or gpr, could change this and just select correct underlying macro)
#	$script_dir/../../verilog/rtl/a2p/a2p_top.v \
#	$script_dir/../../verilog/rtl/a2p/a2p_top_gpr.v \

# ---------------------------------------------------------------------------------------------
# Macros

# empty modules (specifying I/O)

   set ::env(VERILOG_FILES_BLACKBOX) "\
      [glob $script_dir/../../verilog/rtl/a2p/wrapper/*.v] \
   	$script_dir/../../verilog/rtl/DFFRAM/wrapper/DFFRF_3R1W.v \
   "

# generated lef, gds, lib
#set ::env(EXTRA_LEFS) "[glob $::env(DESIGN_DIR)/../../macros/a2p/lef/*.lef]"
#set ::env(EXTRA_GDS_FILES) "[glob $::env(DESIGN_DIR)/../../macros/a2p/gds/*]"

# dffram gpr
set ::env(EXTRA_LEFS) "[glob $::env(DESIGN_DIR)/../../macros/a2p/lef/*.lef] $::env(DESIGN_DIR)/../../macros/DFFRAM/lef/DFFRF_3R1W.lef"
set ::env(EXTRA_GDS_FILES) "[glob $::env(DESIGN_DIR)/../../macros/a2p/gds/*] $::env(DESIGN_DIR)/../../macros/DFFRAM/gds/DFFRF_3R1W.gds"

#set ::env(EXTRA_LIBS) [glob $::env(DESIGN_DIR)/../../macros/DFFRAM/lib/*.lib]

# instantiated macro names
#set ::env(FP_PDN_MACRO_HOOKS) "\
#	RegFilePlugin_regFile.gpr.rf 	vccd1 vssd1 \
#	IBusCachedPlugin_cache 	vccd1 vssd1 \
#   dataCache_1_ vccd1 vssd1 \
#   "

# placement coords for all macros
set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro.cfg

# ---------------------------------------------------------------------------------------------

set ::env(DESIGN_IS_CORE) 0

set ::env(CLOCK_PORT) "clk"
set ::env(CLOCK_NET) "clk"
set ::env(CLOCK_PERIOD) "20"

set ::env(FP_SIZING) absolute
#set ::env(FP_SIZING) relative
set ::env(DIE_AREA) "0 0 1600 3000"

# Maximum layer used for routing is metal 4.
# This is because this macro will be inserted in a top level (user_project_wrapper)
# where the PDN is planned on metal 5. So, to avoid having shorts between routes
# in this macro and the top level metal 5 stripes, we have to restrict routes to metal4.
#
set ::env(RT_MAX_LAYER) {met4}

# You can draw more power domains if you need to
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

# If you're going to use multiple power domains, then disable cvc run.
set ::env(RUN_CVC) 1

# mgmt-core: https://github.com/efabless/caravel_mgmt_soc_litex/blob/main/openlane/mgmt_core/config.tcl

## Synthesis
set ::env(SYNTH_STRATEGY) {DELAY 4}
set ::env(SYNTH_MAX_FANOUT) 12

set ::env(STA_REPORT_POWER) 0

## Floorplan

# Floor plan tuning
#set ::env(FP_TAP_HORIZONTAL_HALO) 40
#set ::env(FP_PDN_HORIZONTAL_HALO) 40
#set ::env(FP_TAP_VERTICAL_HALO) 10
#set ::env(FP_PDN_VERTICAL_HALO) 10

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

## PDN
#set ::env(FP_PDN_CORE_RING) 1
#set ::env(FP_PDN_VPITCH) 50
#set ::env(FP_PDN_HPITCH) 130

#set ::env(FP_PDN_VWIDTH) 1.6
#set ::env(FP_PDN_CORE_RING_VWIDTH) 1.6

## CTS
set ::env(CTS_CLK_BUFFER_LIST) "sky130_fd_sc_hd__clkbuf_4 sky130_fd_sc_hd__clkbuf_8 sky130_fd_sc_hd__clkbuf_16"
#set ::env(CTS_SINK_CLUSTERING_MAX_DIAMETER) 50
#set ::env(CTS_SINK_CLUSTERING_SIZE) 20
set ::env(CTS_DISABLE_POST_PROCESSING) 1
set ::env(CTS_SINK_CLUSTERING_MAX_DIAMETER) 200

set ::env(CTS_DISTANCE_BETWEEN_BUFFERS) 1000

## Placement

#set ::env(PL_MAX_DISPLACEMENT_X) 500
#set ::env(PL_MAX_DISPLACEMENT_Y) 500
set ::env(TAP_DECAP_INSERTION) 0
set ::env(FILL_INSERTION) 0
set ::env(DIODE_INSERTION_STRATEGY) 0

# a2p_top needs this or global place fails
# then if you set it you get thesein detailed:
#   TAP_18658 overlaps RegFilePluginComp_regFile
# try changing target density wtf???
set ::env(PL_BASIC_PLACEMENT) 1
set ::env(PL_TARGET_DENSITY) 0.3

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 1
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 1

set ::env(CELL_PAD) 6

set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) "0.3"
set ::env(PL_RESIZER_MAX_SLEW_MARGIN) 2
set ::env(PL_RESIZER_MAX_CAP_MARGIN) 2

## Routing
#set ::env(GLB_RT_ALLOW_CONGESTION) 0
#set ::env(GLB_RT_OVERFLOW_ITERS) 1000
set ::env(GLB_RT_ADJUSTMENT) 0.2
set ::env(GLB_RT_ALLOW_CONGESTION) 1
set ::env(GLB_RT_OVERFLOW_ITERS) 5
set ::env(PL_ROUTABILITY_DRIVEN) 1
set ::env(DRT_OPT_ITERS) 1

#set ::env(GLB_RT_MINLAYER) 2
#set ::env(GLB_RT_MAXLAYER) 6

set ::env(PL_RESIZER_HOLD_SLACK_MARGIN) 0.15
set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 0
set ::env(GLB_RESIZER_HOLD_SLACK_MARGIN) 0.3

#set ::env(GLB_RT_OBS) "\
#	li1 0 0 10.16500 740.00,\
#	li1 0 0 2000 10.74000,\
#	li1 0 728.20000 2000.06000 740,\
#	li1 1988.99000 0 2000 740,\
#	met5 84.46000 88.23500 555.01500 94.50000,\
#	li1 75.19000 79.12500 778.05000 519.26500"


