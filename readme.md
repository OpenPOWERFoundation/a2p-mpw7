# A2P-FAF

## try adding macros to empty toplevel - first 4

* top logic pulled nicely between and wired nicely to macros up and down
* macros go to rats-nest mode - superhighways should help escaping them

<image src="./a2p_macros_1.png" width=75%>


## decompose to macros

<image src="./drt_a2p_lef.png" width=75%>

   * stop after one drt optimization ```set ::env(DRT_OPT_ITERS) 1```

```
[INFO DRT-0195] Start 1st optimization iteration.
    Completing 10% with 3505311 violations.
    elapsed time = 00:05:06, memory = 9801.58 (MB).
    Completing 20% with 3505311 violations.
    elapsed time = 01:03:07, memory = 9710.80 (MB).
    Completing 30% with 3535529 violations.
    elapsed time = 01:04:50, memory = 9713.69 (MB).
    Completing 40% with 3535529 violations.
    elapsed time = 01:48:29, memory = 9676.85 (MB).
    Completing 50% with 3535529 violations.
    elapsed time = 02:10:30, memory = 9784.45 (MB).
    Completing 60% with 3674262 violations.
    elapsed time = 02:26:40, memory = 9790.35 (MB).
    Completing 70% with 3674262 violations.
    elapsed time = 03:27:55, memory = 10254.61 (MB).
    Completing 80% with 3575503 violations.
    elapsed time = 03:29:06, memory = 10311.55 (MB).
    Completing 90% with 3575503 violations.
    elapsed time = 04:32:20, memory = 10425.82 (MB).
    Completing 100% with 3037036 violations.
    elapsed time = 04:48:22, memory = 10838.11 (MB).
[INFO DRT-0199]   Number of violations = 3037078.
[INFO DRT-0267] cpu time = 09:34:32, elapsed time = 04:48:30, memory = 10850.91 (MB), peak = 10850.91 (MB)
Total wire length = 8546605 um.
Total wire length on LAYER li1 = 0 um.
Total wire length on LAYER met1 = 2955822 um.
Total wire length on LAYER met2 = 3146860 um.
Total wire length on LAYER met3 = 1416106 um.
Total wire length on LAYER met4 = 1027816 um.
Total wire length on LAYER met5 = 0 um.
Total number of vias = 279675.
Up-via summary (total 279675):.

-------------------------
 FR_MASTERSLICE         0
            li1     41805
           met1    159371
           met2     50842
           met3     27657
           met4         0
-------------------------
                   279675


[INFO DRT-0198] Complete detail routing.
Total wire length = 8546605 um.
Total wire length on LAYER li1 = 0 um.
Total wire length on LAYER met1 = 2955822 um.
Total wire length on LAYER met2 = 3146860 um.
Total wire length on LAYER met3 = 1416106 um.
Total wire length on LAYER met4 = 1027816 um.
Total wire length on LAYER met5 = 0 um.
Total number of vias = 279675.
Up-via summary (total 279675):.

-------------------------
 FR_MASTERSLICE         0
            li1     41805
           met1    159371
           met2     50842
           met3     27657
           met4         0
-------------------------
                   279675


[INFO DRT-0267] cpu time = 18:40:53, elapsed time = 09:35:30, memory = 10760.71 (MB), peak = 10861.02 (MB)

[INFO DRT-0180] Post processing.
```

```
[ERROR]: during executing: "openroad -python /openlane/scripts/drc_rosetta.py tr to_klayout -o /data/projects/a2p-mpw7/openlane/a2p_top/runs/wtf/reports/routing/detailed.klayout.xml --design-name a2p /data/projects/a2p-mpw7/openlane/a2p_top/runs/wtf/reports/routing/detailed.drc"
[ERROR]: Exit code: 1
[ERROR]: Last 10 lines:
OpenROAD 0b8b7ae255f8fbbbefa57d443949b84e73eed757
This program is licensed under the BSD-3 license. See the LICENSE file for details.
Components of this program may be licensed under more restrictive licenses which must be honored.
child killed: kill signal

[ERROR]: Flow failed.
```

```
grep violation openlane/a2p_top/runs/a2p_top/reports/routing/detailed.drc | wc -l
3037078
grep Recheck openlane/a2p_top/runs/a2p_top/reports/routing/detailed.drc | wc -l
47
grep Short openlane/a2p_top/runs/a2p_top/reports/routing/detailed.drc | wc -l
2855070
grep MetSpc openlane/a2p_top/runs/a2p_top/reports/routing/detailed.drc | wc -l
178412
```

```
cp A2P_MPW7.v verilog/rtl/a2p/a2p_top.v
# add some source mods for PD
make a2p_top
```

