# A2P Efabless

* A2P core

* toysram GPR, I/D Dir, I/D cache

   * can i implement some of the config options as spr bits (bypass, etc.)?
   * can i implement force i/d miss (i=1)?
   * how is i=1 for i/o implemented now????
   ```
   new StaticMemoryTranslatorPlugin(
            ioRange      = _(31 downto 28) === 0xF
          ),
   ```
   * set up cocotb test env for a2p (iverilog and verilator???) and do software .tst execution

* https://github.com/efabless/caravel_user_project/blob/main/docs/source/quickstart.rst

```
mkdir dependencies

export PDK=sky130A
# you need to export these whenever you start a new shell
export OPENLANE_ROOT=$(pwd)/dependencies/openlane_src
export PDK_ROOT=$(pwd)/dependencies/pdks

make setup
```

* all logic is in macros
   * core
   * uncore
   * arrays

* user_project_wrapper is final build of all submodules (maybe only one, the 'site' macro)


## Macros


### Core

* get the config'd a2p (128B I/D); it does run litex in sim SLOWLY

```
cp -r openlane/user_proj_example openlane/a2p
mkdir verilog/rtl/a2p
cp ~/projects/a2p-openpowerwtf/core/A2P_MPW7.v verilog/rtl/a2p/a2p.v  #ymmv
```

* edit to change module name to a2p
```
code verilog/rtl/a2p/a2p.v
```

* the arrays need to be manually replaced for now; make components at source level someday
* replace regs with modules
* some source needs to be updated to do reads/writes

* gpr is straight replacement and hook up to correct ins/outs
```
  reg [31:0] RegFilePlugin_regFile [0:31] /* verilator public */ ;      <- gpr.v
```

```
  #ic (module InstructionCache)
  reg [26:0] ways_0_tags [0:3];                                         <- icdir.v
  reg [31:0] ways_0_datas [0:31];                                       <- icdata.v

  #dc (module DataCache)
  reg [26:0] DC_DIR_tags [0:3];                                         <- dcdir.v
  reg [7:0] DC_DIR_data_symbol0 [0:31];                                 <- dcdata.v
  reg [7:0] DC_DIR_data_symbol1 [0:31];                                 <-   "
  reg [7:0] DC_DIR_data_symbol2 [0:31];                                 <-   "
  reg [7:0] DC_DIR_data_symbol3 [0:31];                                 <-   "
```

* try ```make a2p```

```
[STEP 3]
[INFO]: Running Initial Floorplanning...
[ERROR]: Floorplanning failed
[ERROR]: module $_ALDFFE_PPP_ not found in /data/projects/a2p-mpw7/openlane/a2p/runs/22_08_31_03_30/tmp/merged.nom.lef
[ERROR]: Check whether EXTRA_LEFS is set appropriately
```

* edit to sync reset
```
  //always @ (posedge clk or posedge reset) begin
  always @ (posedge clk) begin
```


# edit DESIGN_NAME, VERILOG_FILES, CLOCK_PORT, CLOCK_NET, CLOCK_PERIOD, DIE_AREA, PL_TARGET_DENSITY
code openlane/a2p/config.tcl

 make a2p
```

### Arrays

* toysram is 32x32_2R1W
* assume core build using 32B/line

* GPR requires 3R1W; implement as 2x2R1W (1 unused read port)
* I/D dirs use 22b entries for 4K, 27b for 128B; implement as 1x2R1W gives up to 32 cache lines (1KB max)
* I/D data use 8x4B per cache line; implement each 4 cache lines as 1x2R1W

* minimal config is 6 toysrams (2 GPR, ICDIR, ICDATA, DCDIR, DCDATA): IC/DC=128B
* max single-dir config is 20 toysrams (2 GPR, ICDIR, 8xICDATA, DCDIR, 8xDCDATA): IC/DC=1KB
* 4K IC/DC is 2+4+32+4+32=74 toysrams

* a single toysram could do both i+d dir for < 32line cases, but only if the single write port is ok (may not be since separate buses)

