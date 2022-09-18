# A2P-FAF

## decompose to macros

   * make it simple for OR toolchain

   * macros can eventually be optimized for freq/area

   * currently inferred rf (have dffram 3r1w)
   * (3) 32x4 bypass RA/RB/RS
   * ALU (adder)
   * ALUL (logical)
   * IC/DC (dir/data and local logic)

```
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 12.0000 [current_design]
[INFO]: Setting signal min routing layer to: met1 and clock min routing layer to met1.
[INFO]: Setting signal max routing layer to: met4 and clock max routing layer to met4.
-congestion_iterations 50 -verbose
[INFO GRT-0020] Min routing layer: met1
[INFO GRT-0021] Max routing layer: met4
[INFO GRT-0022] Global adjustment: 30%
[INFO GRT-0023] Grid origin: (0, 0)
[INFO GRT-0043] No OR_DEFAULT vias defined.
[INFO GRT-0088] Layer li1     Track-Pitch = 0.4600  line-2-Via Pitch: 0.3400
[INFO GRT-0088] Layer met1    Track-Pitch = 0.3400  line-2-Via Pitch: 0.3400
[INFO GRT-0088] Layer met2    Track-Pitch = 0.4600  line-2-Via Pitch: 0.3500
[INFO GRT-0088] Layer met3    Track-Pitch = 0.6800  line-2-Via Pitch: 0.6150
[INFO GRT-0088] Layer met4    Track-Pitch = 0.9200  line-2-Via Pitch: 0.6150
[INFO GRT-0019] Found 114 clock nets.
[INFO GRT-0001] Minimum degree: 2
[INFO GRT-0002] Maximum degree: 26
[INFO GRT-0003] Macros: 431880
[INFO GRT-0004] Blockages: 47668

[INFO GRT-0053] Routing resources analysis:
          Routing      Original      Derated      Resource
Layer     Direction    Resources     Resources    Reduction (%)
---------------------------------------------------------------
li1        Vertical            0             0          0.00%
met1       Horizontal    3767120       1395298          62.96%
met2       Vertical      2825340       1699867          39.83%
met3       Horizontal    1883560       1193552          36.63%
met4       Vertical      1318492        685052          48.04%
---------------------------------------------------------------

[INFO GRT-0101] Running extra iterations to remove overflow.
[INFO GRT-0103] Extra Run for hard benchmark.
[INFO GRT-0197] Via related to pin nodes: 106551
[INFO GRT-0198] Via related Steiner nodes: 23316
[INFO GRT-0199] Via filling finished.
[INFO GRT-0111] Final number of vias: 1182108
[INFO GRT-0112] Final usage 3D: 8413735
[ERROR GRT-0118] Routing congestion too high.
Error: groute.tcl, 55 GRT-0118

```

   ### todo

   * ra/rb/rs massaging for ops
   * other selectors like iar


<image src="./macros.png" width=100%>


```
cp A2P_MPW7.v verilog/rtl/a2p/a2p_top.v
# add some source mods for PD
make a2p_top
```
