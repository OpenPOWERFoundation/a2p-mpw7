# A2P Efabless

* decomposing with macros but can't get anything out of OR

```
Design area 1287794 u^2 37% utilization.

[ERROR]: during executing openroad script /openlane/scripts/openroad/groute.tcl
[ERROR]: Exit code: 1
[ERROR]: full log: ../data/projects/a2p-mpw7/openlane/a2p_top/runs/wtf/logs/routing/14-global.log
[ERROR]: Last 10 lines:
[INFO GRT-0101] Running extra iterations to remove overflow.
[INFO GRT-0103] Extra Run for hard benchmark.
[INFO GRT-0197] Via related to pin nodes: 80704
[INFO GRT-0198] Via related Steiner nodes: 12635
[INFO GRT-0199] Via filling finished.
[INFO GRT-0111] Final number of vias: 575181
[INFO GRT-0112] Final usage 3D: 3442462
[ERROR GRT-0118] Routing congestion too high.
Error: groute.tcl, 55 GRT-0118
child process exited abnormally
```