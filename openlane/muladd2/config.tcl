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

set ::env(PDK) $::env(PDK)
set ::env(STD_CELL_LIBRARY) "sky130_fd_sc_hd"

set script_dir [file dirname [file normalize [info script]]]

set ::env(DESIGN_NAME) MULADD_2

# ---------------------------------------------------------------------------------------------
# Core

set ::env(VERILOG_FILES) "\
	$::env(CARAVEL_ROOT)/verilog/rtl/defines.v \
	$script_dir/../../verilog/rtl/a2p/MULADD_2.v \
   "
# ---------------------------------------------------------------------------------------------
# Macros


# ---------------------------------------------------------------------------------------------

set ::env(DESIGN_IS_CORE) 0

# no clock port - no cts but also no sta
#set ::env(CLOCK_PORT) "clk"
#set ::env(CLOCK_NET) "clk"
set ::env(CLOCK_PERIOD) "5"

set ::env(FP_SIZING) absolute
set ::env(DIE_AREA) "0 0 100 100"

#set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg

# Maximum layer used for routing is metal 4.
# This is because this macro will be inserted in a top level (user_project_wrapper)
# where the PDN is planned on metal 5. So, to avoid having shorts between routes
# in this macro and the top level metal 5 stripes, we have to restrict routes to metal4.
#
set ::env(RT_MAX_LAYER) {met4}

# You can draw more power domains if you need to
set ::env(VDD_NETS) [list {vccd1}]
set ::env(GND_NETS) [list {vssd1}]

set ::env(DIODE_INSERTION_STRATEGY) 0
set ::env(RUN_CVC) 1

## Synthesis
set ::env(SYNTH_STRATEGY) {DELAY 4}
set ::env(SYNTH_MAX_FANOUT) 8
set ::env(STA_REPORT_POWER) 0

## Floorplan

# Floor plan tuning
#set ::env(FP_TAP_HORIZONTAL_HALO) 40
#set ::env(FP_PDN_HORIZONTAL_HALO) 40
#set ::env(FP_TAP_VERTICAL_HALO) 10
#set ::env(FP_PDN_VERTICAL_HALO) 10

set ::env(FP_PIN_ORDER_CFG) $script_dir/pin_order.cfg
#set ::env(FP_SIZING) absolute
#set ::env(DIE_AREA) "0 0 2000 740"
#
#set ::env(MACRO_PLACEMENT_CFG) $script_dir/macro_placement.cfg
#set ::env(PL_TARGET_DENSITY) 0.25
#set ::env(CELL_PAD) 0

#set ::env(LEFT_MARGIN_MULT) 22
#set ::env(RIGHT_MARGIN_MULT) 22

## PDN
#set ::env(FP_PDN_CORE_RING) 1
#set ::env(FP_PDN_VPITCH) 50
#set ::env(FP_PDN_HPITCH) 130

#set ::env(FP_PDN_VWIDTH) 1.6
#set ::env(FP_PDN_CORE_RING_VWIDTH) 1.6

## Placement
set ::env(PL_BASIC_PLACEMENT) 0
set ::env(PL_TARGET_DENSITY) 0.75

set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) 0
set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) 0

set ::env(CELL_PAD) 2

set ::env(PL_RESIZER_MAX_SLEW_MARGIN) 2
set ::env(PL_RESIZER_MAX_CAP_MARGIN) 2

## Routing
#set ::env(GLB_RT_ALLOW_CONGESTION) 0
#set ::env(GLB_RT_OVERFLOW_ITERS) 1000
#set ::env(GLB_RT_ADJUSTMENT) 0.2

#set ::env(GLB_RT_MINLAYER) 2
#set ::env(GLB_RT_MAXLAYER) 6


set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) 0



