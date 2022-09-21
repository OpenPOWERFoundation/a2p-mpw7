// Generator : SpinalHDL v1.4.0    git head : ecb5a80b713566f417ea3ea061f9969e73770a7f
// Date      : 20/09/2022, 19:21:24
// Component : A2P_MPW7


/*

cp ~/projects/a2p-openpowerwtf/core/A2P_MPW7.v verilog/rtl/a2p/a2p_top_gpr.v
rename module A2P_MPW7 to a2p
delete all other modules;  gen'd as macros separately
// *** could skip this if i can surround the logic with `ifdef SYNTHESIS to blackbox them

//  wrappers in verilog/rtl/a2p/wrapper (include in config.tcl)
//  gpr regfile:
//    can be from GPR.v (inferred, instantiation OK)
//             or gpr.v (DFFRF_3R1W, need to change instantiation to 'gpr' and remove reset)

change GPR to gpr and comment out .reset()


*/

/* async reset changed to sync for IBusCachedPlugin_fetchPc_pcReg

  //wtf ********************************************************************************
  // get rid of yosys: module $_ALDFFE_PPP_ not found
  always @ (posedge clk) begin
    if (reset) begin
      IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
    end
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      //IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
*/


`define SYNTHESIS
`include "defs.v"

`define TgtCtrlEnum_defaultEncoding_type [0:0]
`define TgtCtrlEnum_defaultEncoding_RT 1'b0
`define TgtCtrlEnum_defaultEncoding_RA 1'b1

`define Src1CtrlEnum_defaultEncoding_type [2:0]
`define Src1CtrlEnum_defaultEncoding_RA 3'b000
`define Src1CtrlEnum_defaultEncoding_RA_N 3'b001
`define Src1CtrlEnum_defaultEncoding_RA_NIA 3'b010
`define Src1CtrlEnum_defaultEncoding_RA_0 3'b011
`define Src1CtrlEnum_defaultEncoding_RS 3'b100

`define Src3CtrlEnum_defaultEncoding_type [1:0]
`define Src3CtrlEnum_defaultEncoding_CA 2'b00
`define Src3CtrlEnum_defaultEncoding_CA_0 2'b01
`define Src3CtrlEnum_defaultEncoding_CA_1 2'b10

`define CRBusCmdEnum_defaultEncoding_type [4:0]
`define CRBusCmdEnum_defaultEncoding_NOP 5'b00000
`define CRBusCmdEnum_defaultEncoding_CR0 5'b00001
`define CRBusCmdEnum_defaultEncoding_CR1 5'b00010
`define CRBusCmdEnum_defaultEncoding_CR6 5'b00011
`define CRBusCmdEnum_defaultEncoding_CMP 5'b00100
`define CRBusCmdEnum_defaultEncoding_AND_1 5'b00101
`define CRBusCmdEnum_defaultEncoding_OR_1 5'b00110
`define CRBusCmdEnum_defaultEncoding_XOR_1 5'b00111
`define CRBusCmdEnum_defaultEncoding_NAND_1 5'b01000
`define CRBusCmdEnum_defaultEncoding_NOR_1 5'b01001
`define CRBusCmdEnum_defaultEncoding_EQV 5'b01010
`define CRBusCmdEnum_defaultEncoding_ANDC 5'b01011
`define CRBusCmdEnum_defaultEncoding_ORC 5'b01100
`define CRBusCmdEnum_defaultEncoding_MCRF 5'b01101
`define CRBusCmdEnum_defaultEncoding_MCRXRX 5'b01110
`define CRBusCmdEnum_defaultEncoding_MTOCRF 5'b01111
`define CRBusCmdEnum_defaultEncoding_MTCRF 5'b10000
`define CRBusCmdEnum_defaultEncoding_DEC 5'b10001
`define CRBusCmdEnum_defaultEncoding_LNK 5'b10010
`define CRBusCmdEnum_defaultEncoding_DECLNK 5'b10011

`define CRMoveCtrlEnum_defaultEncoding_type [1:0]
`define CRMoveCtrlEnum_defaultEncoding_MCRF 2'b00
`define CRMoveCtrlEnum_defaultEncoding_MCRXRX 2'b01
`define CRMoveCtrlEnum_defaultEncoding_MTCRF 2'b10

`define DataSizeEnum_defaultEncoding_type [1:0]
`define DataSizeEnum_defaultEncoding_B 2'b00
`define DataSizeEnum_defaultEncoding_H 2'b01
`define DataSizeEnum_defaultEncoding_HA 2'b10
`define DataSizeEnum_defaultEncoding_W 2'b11

`define EndianEnum_defaultEncoding_type [0:0]
`define EndianEnum_defaultEncoding_BE 1'b0
`define EndianEnum_defaultEncoding_LE 1'b1

`define AluRimiAmtEnum_defaultEncoding_type [0:0]
`define AluRimiAmtEnum_defaultEncoding_IMM 1'b0
`define AluRimiAmtEnum_defaultEncoding_RB 1'b1

`define AluSpecCtrlEnum_defaultEncoding_type [2:0]
`define AluSpecCtrlEnum_defaultEncoding_CNTLZW 3'b000
`define AluSpecCtrlEnum_defaultEncoding_CNTTZW 3'b001
`define AluSpecCtrlEnum_defaultEncoding_POPCNTB 3'b010
`define AluSpecCtrlEnum_defaultEncoding_POPCNTW 3'b011
`define AluSpecCtrlEnum_defaultEncoding_CMPB 3'b100
`define AluSpecCtrlEnum_defaultEncoding_PRTYW 3'b101

`define EnvCtrlEnum_defaultEncoding_type [3:0]
`define EnvCtrlEnum_defaultEncoding_NONE 4'b0000
`define EnvCtrlEnum_defaultEncoding_MFMSR 4'b0001
`define EnvCtrlEnum_defaultEncoding_MTMSR 4'b0010
`define EnvCtrlEnum_defaultEncoding_SC 4'b0011
`define EnvCtrlEnum_defaultEncoding_SCV 4'b0100
`define EnvCtrlEnum_defaultEncoding_RFI 4'b0101
`define EnvCtrlEnum_defaultEncoding_RFSCV 4'b0110
`define EnvCtrlEnum_defaultEncoding_TW 4'b0111
`define EnvCtrlEnum_defaultEncoding_TWI 4'b1000

`define AluCtrlEnum_defaultEncoding_type [1:0]
`define AluCtrlEnum_defaultEncoding_ADD 2'b00
`define AluCtrlEnum_defaultEncoding_BIT_1 2'b01
`define AluCtrlEnum_defaultEncoding_RIMI 2'b10
`define AluCtrlEnum_defaultEncoding_SPEC 2'b11

`define AluBitwiseCtrlEnum_defaultEncoding_type [3:0]
`define AluBitwiseCtrlEnum_defaultEncoding_AND_1 4'b0000
`define AluBitwiseCtrlEnum_defaultEncoding_ANDC 4'b0001
`define AluBitwiseCtrlEnum_defaultEncoding_OR_1 4'b0010
`define AluBitwiseCtrlEnum_defaultEncoding_ORC 4'b0011
`define AluBitwiseCtrlEnum_defaultEncoding_XOR_1 4'b0100
`define AluBitwiseCtrlEnum_defaultEncoding_XORC 4'b0101
`define AluBitwiseCtrlEnum_defaultEncoding_EQV 4'b0110
`define AluBitwiseCtrlEnum_defaultEncoding_NAND_1 4'b0111
`define AluBitwiseCtrlEnum_defaultEncoding_NOR_1 4'b1000
`define AluBitwiseCtrlEnum_defaultEncoding_EXTSB 4'b1001
`define AluBitwiseCtrlEnum_defaultEncoding_EXTSH 4'b1010

`define Src2CtrlEnum_defaultEncoding_type [2:0]
`define Src2CtrlEnum_defaultEncoding_RB 3'b000
`define Src2CtrlEnum_defaultEncoding_RB_0 3'b001
`define Src2CtrlEnum_defaultEncoding_RB_M1 3'b010
`define Src2CtrlEnum_defaultEncoding_RB_UI 3'b011
`define Src2CtrlEnum_defaultEncoding_RB_SI 3'b100
`define Src2CtrlEnum_defaultEncoding_RB_SH 3'b101
`define Src2CtrlEnum_defaultEncoding_RB_PCISD 3'b110
`define Src2CtrlEnum_defaultEncoding_RA 3'b111

`define CRLogCtrlEnum_defaultEncoding_type [2:0]
`define CRLogCtrlEnum_defaultEncoding_AND_1 3'b000
`define CRLogCtrlEnum_defaultEncoding_OR_1 3'b001
`define CRLogCtrlEnum_defaultEncoding_XOR_1 3'b010
`define CRLogCtrlEnum_defaultEncoding_NAND_1 3'b011
`define CRLogCtrlEnum_defaultEncoding_NOR_1 3'b100
`define CRLogCtrlEnum_defaultEncoding_EQV 3'b101
`define CRLogCtrlEnum_defaultEncoding_ANDC 3'b110
`define CRLogCtrlEnum_defaultEncoding_ORC 3'b111

`define BranchCtrlEnum_defaultEncoding_type [2:0]
`define BranchCtrlEnum_defaultEncoding_NONE 3'b000
`define BranchCtrlEnum_defaultEncoding_BU 3'b001
`define BranchCtrlEnum_defaultEncoding_BC 3'b010
`define BranchCtrlEnum_defaultEncoding_BCLR 3'b011
`define BranchCtrlEnum_defaultEncoding_BCCTR 3'b100
`define BranchCtrlEnum_defaultEncoding_BCTAR 3'b101

`define AluRimiCtrlEnum_defaultEncoding_type [2:0]
`define AluRimiCtrlEnum_defaultEncoding_ROT 3'b000
`define AluRimiCtrlEnum_defaultEncoding_INS 3'b001
`define AluRimiCtrlEnum_defaultEncoding_SHIFTL 3'b010
`define AluRimiCtrlEnum_defaultEncoding_SHIFTR 3'b011
`define AluRimiCtrlEnum_defaultEncoding_SHIFTRA 3'b100

`define ExcpEnum_defaultEncoding_type [4:0]
`define ExcpEnum_defaultEncoding_NONE 5'b00000
`define ExcpEnum_defaultEncoding_SC 5'b00001
`define ExcpEnum_defaultEncoding_SCV 5'b00010
`define ExcpEnum_defaultEncoding_TRAP 5'b00011
`define ExcpEnum_defaultEncoding_RFI 5'b00100
`define ExcpEnum_defaultEncoding_RFSCV 5'b00101
`define ExcpEnum_defaultEncoding_DSI 5'b00110
`define ExcpEnum_defaultEncoding_DSI_PROT 5'b00111
`define ExcpEnum_defaultEncoding_DSS 5'b01000
`define ExcpEnum_defaultEncoding_ISI 5'b01001
`define ExcpEnum_defaultEncoding_ISI_PROT 5'b01010
`define ExcpEnum_defaultEncoding_ISS 5'b01011
`define ExcpEnum_defaultEncoding_ALG 5'b01100
`define ExcpEnum_defaultEncoding_PGM_ILL 5'b01101
`define ExcpEnum_defaultEncoding_PGM_PRV 5'b01110
`define ExcpEnum_defaultEncoding_FP 5'b01111
`define ExcpEnum_defaultEncoding_VEC 5'b10000
`define ExcpEnum_defaultEncoding_VSX 5'b10001
`define ExcpEnum_defaultEncoding_FAC 5'b10010
`define ExcpEnum_defaultEncoding_SR 5'b10011
`define ExcpEnum_defaultEncoding_MC 5'b10100
`define ExcpEnum_defaultEncoding_EXT 5'b10101
`define ExcpEnum_defaultEncoding_DEC 5'b10110
`define ExcpEnum_defaultEncoding_TR 5'b10111
`define ExcpEnum_defaultEncoding_PM 5'b11000

module a2p (
  input      [31:0]   externalResetVector,
  input               timerInterrupt,
  input               externalInterrupt,
  input               softwareInterrupt,
  input               externalInterruptS,
  output reg          iBusWB_CYC /* verilator public */ ,
  output reg          iBusWB_STB /* verilator public */ ,
  input               iBusWB_ACK /* verilator public */ ,
  output              iBusWB_WE /* verilator public */ ,
  output     [29:0]   iBusWB_ADR /* verilator public */ ,
  input      [31:0]   iBusWB_DAT_MISO /* verilator public */ ,
  output     [31:0]   iBusWB_DAT_MOSI /* verilator public */ ,
  output     [3:0]    iBusWB_SEL /* verilator public */ ,
  input               iBusWB_ERR /* verilator public */ ,
  output     [1:0]    iBusWB_BTE /* verilator public */ ,
  output     [2:0]    iBusWB_CTI /* verilator public */ ,
  output              dBusWB_CYC /* verilator public */ ,
  output              dBusWB_STB /* verilator public */ ,
  input               dBusWB_ACK /* verilator public */ ,
  output              dBusWB_WE /* verilator public */ ,
  output     [29:0]   dBusWB_ADR /* verilator public */ ,
  input      [31:0]   dBusWB_DAT_MISO /* verilator public */ ,
  output     [31:0]   dBusWB_DAT_MOSI /* verilator public */ ,
  output     [3:0]    dBusWB_SEL /* verilator public */ ,
  input               dBusWB_ERR /* verilator public */ ,
  output     [1:0]    dBusWB_BTE /* verilator public */ ,
  output     [2:0]    dBusWB_CTI /* verilator public */ ,
  input               clk,
  input               reset
);
  wire       [31:0]   _zz_317_;
  wire       [31:0]   _zz_318_;
  wire       [31:0]   _zz_319_;
  wire       [2:0]    _zz_320_;
  wire                _zz_321_;
  wire                _zz_322_;
  wire                _zz_323_;
  wire                _zz_324_;
  wire                _zz_325_;
  wire                _zz_326_;
  wire                _zz_327_;
  wire                _zz_328_;
  reg                 _zz_329_;
  wire       [9:0]    _zz_330_;
  wire                _zz_331_;
  wire       [31:0]   _zz_332_;
  reg        [31:0]   _zz_333_;
  wire                _zz_334_;
  wire       [31:0]   _zz_335_;
  reg                 _zz_336_;
  wire                _zz_337_;
  wire                _zz_338_;
  wire                _zz_339_;
  wire       [31:0]   _zz_340_;
  wire                _zz_341_;
  wire                _zz_342_;
  reg                 _zz_343_;
  reg        [4:0]    _zz_344_;
  reg        [31:0]   _zz_345_;
  reg        [31:0]   _zz_346_;
  reg        [31:0]   _zz_347_;
  reg        [31:0]   _zz_348_;
  reg        [31:0]   _zz_349_;
  reg        [31:0]   _zz_350_;
  reg        [31:0]   _zz_351_;
  wire       [31:0]   _zz_352_;
  reg        [6:0]    _zz_353_;
  reg        [2:0]    _zz_354_;
  wire       [4:0]    _zz_355_;
  wire       [4:0]    _zz_356_;
  wire       [31:0]   _zz_357_;
  wire       [31:0]   _zz_358_;
  reg        [3:0]    _zz_359_;
  wire       [31:0]   _zz_360_;
  wire       [31:0]   _zz_361_;
  wire       [31:0]   _zz_362_;
  wire       [31:0]   _zz_363_;
  reg        [3:0]    _zz_364_;
  reg        [2:0]    _zz_365_;
  wire       [15:0]   _zz_366_;
  wire       [15:0]   _zz_367_;
  wire       [16:0]   _zz_368_;
  wire       [16:0]   _zz_369_;
  wire       [16:0]   _zz_370_;
  wire       [16:0]   _zz_371_;
  wire       [16:0]   _zz_372_;
  wire       [16:0]   _zz_373_;
  wire       [32:0]   _zz_374_;
  wire       [49:0]   _zz_375_;
  wire       [49:0]   _zz_376_;
  wire       [51:0]   _zz_377_;
  wire       [33:0]   _zz_378_;
  wire       [32:0]   _zz_379_;
  wire       [31:0]   _zz_380_;
  reg                 _zz_381_;
  wire                _zz_382_;
  reg        [61:0]   _zz_383_;
  wire       [31:0]   PC_LOAD_result;
  wire                IBusCachedPlugin_cache_io_cpu_prefetch_haltIt;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_data;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_haltIt;
  wire       [3:0]    IBusCachedPlugin_cache_io_cpu_fetch_exceptionType;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end;
  wire                IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_spr_valid;
  wire       [9:0]    IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_spr_payload_id;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_spr_payload_data;
  wire                IBusCachedPlugin_cache_io_cpu_decode_error;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling;
  wire                IBusCachedPlugin_cache_io_cpu_decode_mmuException;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_data;
  wire                IBusCachedPlugin_cache_io_cpu_decode_cacheMiss;
  wire       [31:0]   IBusCachedPlugin_cache_io_cpu_decode_physicalAddress;
  wire       [3:0]    IBusCachedPlugin_cache_io_cpu_decode_exceptionType;
  wire                IBusCachedPlugin_cache_io_mem_cmd_valid;
  wire       [31:0]   IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  wire       [2:0]    IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  wire                dataCache_1__io_cpu_memory_isWrite;
  wire                dataCache_1__io_cpu_memory_mmuBus_cmd_isValid;
  wire       [31:0]   dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress;
  wire                dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation;
  wire                dataCache_1__io_cpu_memory_mmuBus_end;
  wire                dataCache_1__io_cpu_memory_mmuBus_spr_valid;
  wire       [9:0]    dataCache_1__io_cpu_memory_mmuBus_spr_payload_id;
  wire       [31:0]   dataCache_1__io_cpu_memory_mmuBus_spr_payload_data;
  wire                dataCache_1__io_cpu_writeBack_haltIt;
  wire       [31:0]   dataCache_1__io_cpu_writeBack_data;
  wire                dataCache_1__io_cpu_writeBack_mmuException;
  wire                dataCache_1__io_cpu_writeBack_unalignedAccess;
  wire                dataCache_1__io_cpu_writeBack_accessError;
  wire                dataCache_1__io_cpu_writeBack_isWrite;
  wire       [3:0]    dataCache_1__io_cpu_writeBack_exceptionType;
  wire                dataCache_1__io_cpu_flush_ready;
  wire                dataCache_1__io_cpu_redo;
  wire                dataCache_1__io_mem_cmd_valid;
  wire                dataCache_1__io_mem_cmd_payload_wr;
  wire       [31:0]   dataCache_1__io_mem_cmd_payload_address;
  wire       [31:0]   dataCache_1__io_mem_cmd_payload_data;
  wire       [3:0]    dataCache_1__io_mem_cmd_payload_mask;
  wire       [2:0]    dataCache_1__io_mem_cmd_payload_length;
  wire                dataCache_1__io_mem_cmd_payload_last;
  wire       [31:0]   RegFilePluginComp_regFile_rd_dat_0;
  wire       [31:0]   RegFilePluginComp_regFile_rd_dat_1;
  wire       [31:0]   RegFilePluginComp_regFile_rd_dat_2;
  wire       [31:0]   WB_EXECUTE_result;
  wire       [31:0]   FX_ALUL_result;
  wire       [2:0]    FX_ALUL_cr;
  wire                FX_ALUL_xer_ca;
  wire                FX_ALUL_xer_ov;
  wire       [31:0]   SRC1_result;
  wire       [31:0]   SRC2_A_result;
  wire       [31:0]   SRC2_result;
  wire       [31:0]   FX_ALU_result;
  wire       [1:0]    FX_ALU_add_cr;
  wire       [1:0]    FX_ALU_cmp_cr;
  wire       [1:0]    FX_ALU_cmpl_cr;
  wire                FX_ALU_ca;
  wire                FX_ALU_ov;
  wire       [31:0]   MUL_LL_result;
  wire       [33:0]   MUL_LH_result;
  wire       [33:0]   MUL_HL_result;
  wire       [33:0]   MUL_HH_result;
  wire       [51:0]   MUL_ADD1_result;
  wire       [65:0]   MUL_ADD2_result;
  wire       [31:0]   FX_DIV_result;
  wire                FX_DIV_valid;
  wire                FX_DIV_ov;
  wire       [31:0]   BYP_RA_result;
  wire       [31:0]   BYP_RB_result;
  wire       [31:0]   BYP_RS_result;
  wire                _zz_384_;
  wire                _zz_385_;
  wire                _zz_386_;
  wire                _zz_387_;
  wire                _zz_388_;
  wire                _zz_389_;
  wire                _zz_390_;
  wire                _zz_391_;
  wire                _zz_392_;
  wire                _zz_393_;
  wire                _zz_394_;
  wire                _zz_395_;
  wire                _zz_396_;
  wire                _zz_397_;
  wire                _zz_398_;
  wire                _zz_399_;
  wire                _zz_400_;
  wire                _zz_401_;
  wire                _zz_402_;
  wire                _zz_403_;
  wire                _zz_404_;
  wire                _zz_405_;
  wire                _zz_406_;
  wire                _zz_407_;
  wire                _zz_408_;
  wire                _zz_409_;
  wire                _zz_410_;
  wire                _zz_411_;
  wire                _zz_412_;
  wire                _zz_413_;
  wire                _zz_414_;
  wire                _zz_415_;
  wire                _zz_416_;
  wire                _zz_417_;
  wire                _zz_418_;
  wire                _zz_419_;
  wire                _zz_420_;
  wire                _zz_421_;
  wire                _zz_422_;
  wire                _zz_423_;
  wire                _zz_424_;
  wire                _zz_425_;
  wire                _zz_426_;
  wire                _zz_427_;
  wire                _zz_428_;
  wire                _zz_429_;
  wire                _zz_430_;
  wire                _zz_431_;
  wire       [7:0]    _zz_432_;
  wire       [2:0]    _zz_433_;
  wire       [2:0]    _zz_434_;
  wire       [1:0]    _zz_435_;
  wire       [1:0]    _zz_436_;
  wire       [2:0]    _zz_437_;
  wire       [0:0]    _zz_438_;
  wire       [0:0]    _zz_439_;
  wire       [0:0]    _zz_440_;
  wire       [0:0]    _zz_441_;
  wire       [0:0]    _zz_442_;
  wire       [0:0]    _zz_443_;
  wire       [0:0]    _zz_444_;
  wire       [0:0]    _zz_445_;
  wire       [0:0]    _zz_446_;
  wire       [0:0]    _zz_447_;
  wire       [0:0]    _zz_448_;
  wire       [0:0]    _zz_449_;
  wire       [0:0]    _zz_450_;
  wire       [0:0]    _zz_451_;
  wire       [0:0]    _zz_452_;
  wire       [0:0]    _zz_453_;
  wire       [0:0]    _zz_454_;
  wire       [0:0]    _zz_455_;
  wire       [0:0]    _zz_456_;
  wire       [0:0]    _zz_457_;
  wire       [0:0]    _zz_458_;
  wire       [0:0]    _zz_459_;
  wire       [0:0]    _zz_460_;
  wire       [0:0]    _zz_461_;
  wire       [0:0]    _zz_462_;
  wire       [0:0]    _zz_463_;
  wire       [0:0]    _zz_464_;
  wire       [0:0]    _zz_465_;
  wire       [0:0]    _zz_466_;
  wire       [0:0]    _zz_467_;
  wire       [0:0]    _zz_468_;
  wire       [0:0]    _zz_469_;
  wire       [0:0]    _zz_470_;
  wire       [0:0]    _zz_471_;
  wire       [0:0]    _zz_472_;
  wire       [0:0]    _zz_473_;
  wire       [0:0]    _zz_474_;
  wire       [0:0]    _zz_475_;
  wire       [0:0]    _zz_476_;
  wire       [0:0]    _zz_477_;
  wire       [0:0]    _zz_478_;
  wire       [0:0]    _zz_479_;
  wire       [2:0]    _zz_480_;
  wire       [31:0]   _zz_481_;
  wire       [1:0]    _zz_482_;
  wire       [29:0]   _zz_483_;
  wire       [1:0]    _zz_484_;
  wire       [27:0]   _zz_485_;
  wire       [1:0]    _zz_486_;
  wire       [0:0]    _zz_487_;
  wire       [1:0]    _zz_488_;
  wire       [0:0]    _zz_489_;
  wire       [1:0]    _zz_490_;
  wire       [1:0]    _zz_491_;
  wire       [0:0]    _zz_492_;
  wire       [1:0]    _zz_493_;
  wire       [0:0]    _zz_494_;
  wire       [1:0]    _zz_495_;
  wire       [2:0]    _zz_496_;
  wire       [2:0]    _zz_497_;
  wire       [10:0]   _zz_498_;
  wire       [31:0]   _zz_499_;
  wire       [10:0]   _zz_500_;
  wire       [31:0]   _zz_501_;
  wire       [31:0]   _zz_502_;
  wire       [31:0]   _zz_503_;
  wire       [31:0]   _zz_504_;
  wire       [31:0]   _zz_505_;
  wire       [31:0]   _zz_506_;
  wire       [31:0]   _zz_507_;
  wire       [31:0]   _zz_508_;
  wire       [31:0]   _zz_509_;
  wire       [31:0]   _zz_510_;
  wire       [31:0]   _zz_511_;
  wire       [31:0]   _zz_512_;
  wire       [31:0]   _zz_513_;
  wire       [31:0]   _zz_514_;
  wire       [31:0]   _zz_515_;
  wire       [31:0]   _zz_516_;
  wire       [31:0]   _zz_517_;
  wire       [31:0]   _zz_518_;
  wire       [31:0]   _zz_519_;
  wire       [31:0]   _zz_520_;
  wire       [31:0]   _zz_521_;
  wire       [31:0]   _zz_522_;
  wire       [31:0]   _zz_523_;
  wire       [31:0]   _zz_524_;
  wire       [31:0]   _zz_525_;
  wire       [4:0]    _zz_526_;
  wire       [2:0]    _zz_527_;
  wire       [32:0]   _zz_528_;
  wire       [49:0]   _zz_529_;
  wire       [49:0]   _zz_530_;
  wire       [31:0]   _zz_531_;
  wire       [31:0]   _zz_532_;
  wire       [32:0]   _zz_533_;
  wire       [0:0]    _zz_534_;
  wire       [32:0]   _zz_535_;
  wire       [31:0]   _zz_536_;
  wire       [0:0]    _zz_537_;
  wire       [31:0]   _zz_538_;
  wire       [4:0]    _zz_539_;
  wire       [4:0]    _zz_540_;
  wire       [4:0]    _zz_541_;
  wire       [4:0]    _zz_542_;
  wire       [4:0]    _zz_543_;
  wire       [4:0]    _zz_544_;
  wire       [4:0]    _zz_545_;
  wire       [4:0]    _zz_546_;
  wire       [4:0]    _zz_547_;
  wire       [4:0]    _zz_548_;
  wire       [4:0]    _zz_549_;
  wire       [4:0]    _zz_550_;
  wire       [4:0]    _zz_551_;
  wire       [4:0]    _zz_552_;
  wire       [4:0]    _zz_553_;
  wire       [4:0]    _zz_554_;
  wire       [4:0]    _zz_555_;
  wire       [4:0]    _zz_556_;
  wire       [4:0]    _zz_557_;
  wire       [4:0]    _zz_558_;
  wire       [4:0]    _zz_559_;
  wire       [4:0]    _zz_560_;
  wire       [4:0]    _zz_561_;
  wire       [4:0]    _zz_562_;
  wire       [31:0]   _zz_563_;
  wire       [31:0]   _zz_564_;
  wire       [31:0]   _zz_565_;
  wire       [31:0]   _zz_566_;
  wire       [1:0]    _zz_567_;
  wire       [4:0]    _zz_568_;
  wire       [1:0]    _zz_569_;
  wire       [4:0]    _zz_570_;
  wire       [4:0]    _zz_571_;
  wire       [1:0]    _zz_572_;
  wire       [4:0]    _zz_573_;
  wire       [4:0]    _zz_574_;
  wire       [1:0]    _zz_575_;
  wire       [4:0]    _zz_576_;
  wire       [4:0]    _zz_577_;
  wire       [1:0]    _zz_578_;
  wire       [4:0]    _zz_579_;
  wire       [3:0]    _zz_580_;
  wire       [1:0]    _zz_581_;
  wire       [3:0]    _zz_582_;
  wire       [3:0]    _zz_583_;
  wire       [1:0]    _zz_584_;
  wire       [3:0]    _zz_585_;
  wire       [2:0]    _zz_586_;
  wire       [1:0]    _zz_587_;
  wire       [2:0]    _zz_588_;
  wire       [1:0]    _zz_589_;
  wire       [1:0]    _zz_590_;
  wire       [1:0]    _zz_591_;
  wire       [1:0]    _zz_592_;
  wire       [31:0]   _zz_593_;
  wire       [31:0]   _zz_594_;
  wire       [31:0]   _zz_595_;
  wire       [31:0]   _zz_596_;
  wire       [31:0]   _zz_597_;
  wire       [31:0]   _zz_598_;
  wire       [31:0]   _zz_599_;
  wire       [31:0]   _zz_600_;
  wire       [0:0]    _zz_601_;
  wire       [0:0]    _zz_602_;
  wire       [0:0]    _zz_603_;
  wire       [0:0]    _zz_604_;
  wire       [0:0]    _zz_605_;
  wire       [0:0]    _zz_606_;
  wire       [0:0]    _zz_607_;
  wire       [0:0]    _zz_608_;
  wire       [0:0]    _zz_609_;
  wire       [0:0]    _zz_610_;
  wire       [0:0]    _zz_611_;
  wire       [0:0]    _zz_612_;
  wire       [0:0]    _zz_613_;
  wire       [26:0]   _zz_614_;
  wire       [61:0]   _zz_615_;
  wire       [0:0]    _zz_616_;
  wire       [92:0]   _zz_617_;
  wire       [0:0]    _zz_618_;
  wire       [84:0]   _zz_619_;
  wire       [31:0]   _zz_620_;
  wire                _zz_621_;
  wire       [0:0]    _zz_622_;
  wire       [75:0]   _zz_623_;
  wire       [31:0]   _zz_624_;
  wire       [31:0]   _zz_625_;
  wire                _zz_626_;
  wire       [0:0]    _zz_627_;
  wire       [68:0]   _zz_628_;
  wire       [31:0]   _zz_629_;
  wire       [31:0]   _zz_630_;
  wire       [31:0]   _zz_631_;
  wire                _zz_632_;
  wire       [0:0]    _zz_633_;
  wire       [62:0]   _zz_634_;
  wire       [31:0]   _zz_635_;
  wire       [31:0]   _zz_636_;
  wire       [31:0]   _zz_637_;
  wire                _zz_638_;
  wire       [0:0]    _zz_639_;
  wire       [56:0]   _zz_640_;
  wire       [31:0]   _zz_641_;
  wire       [31:0]   _zz_642_;
  wire       [31:0]   _zz_643_;
  wire                _zz_644_;
  wire       [0:0]    _zz_645_;
  wire       [50:0]   _zz_646_;
  wire       [31:0]   _zz_647_;
  wire       [31:0]   _zz_648_;
  wire       [31:0]   _zz_649_;
  wire                _zz_650_;
  wire       [0:0]    _zz_651_;
  wire       [44:0]   _zz_652_;
  wire       [31:0]   _zz_653_;
  wire       [31:0]   _zz_654_;
  wire       [31:0]   _zz_655_;
  wire                _zz_656_;
  wire       [0:0]    _zz_657_;
  wire       [38:0]   _zz_658_;
  wire       [31:0]   _zz_659_;
  wire       [31:0]   _zz_660_;
  wire       [31:0]   _zz_661_;
  wire                _zz_662_;
  wire       [0:0]    _zz_663_;
  wire       [32:0]   _zz_664_;
  wire       [31:0]   _zz_665_;
  wire       [31:0]   _zz_666_;
  wire       [31:0]   _zz_667_;
  wire                _zz_668_;
  wire       [0:0]    _zz_669_;
  wire       [26:0]   _zz_670_;
  wire       [31:0]   _zz_671_;
  wire       [31:0]   _zz_672_;
  wire       [31:0]   _zz_673_;
  wire                _zz_674_;
  wire       [0:0]    _zz_675_;
  wire       [20:0]   _zz_676_;
  wire       [31:0]   _zz_677_;
  wire       [31:0]   _zz_678_;
  wire       [31:0]   _zz_679_;
  wire                _zz_680_;
  wire       [0:0]    _zz_681_;
  wire       [14:0]   _zz_682_;
  wire       [31:0]   _zz_683_;
  wire       [31:0]   _zz_684_;
  wire       [31:0]   _zz_685_;
  wire                _zz_686_;
  wire       [0:0]    _zz_687_;
  wire       [8:0]    _zz_688_;
  wire       [31:0]   _zz_689_;
  wire       [31:0]   _zz_690_;
  wire       [31:0]   _zz_691_;
  wire                _zz_692_;
  wire       [0:0]    _zz_693_;
  wire       [2:0]    _zz_694_;
  wire       [31:0]   _zz_695_;
  wire       [31:0]   _zz_696_;
  wire                _zz_697_;
  wire       [0:0]    _zz_698_;
  wire       [8:0]    _zz_699_;
  wire       [3:0]    _zz_700_;
  wire       [3:0]    _zz_701_;
  wire                _zz_702_;
  wire       [0:0]    _zz_703_;
  wire       [73:0]   _zz_704_;
  wire       [31:0]   _zz_705_;
  wire       [31:0]   _zz_706_;
  wire                _zz_707_;
  wire       [0:0]    _zz_708_;
  wire       [5:0]    _zz_709_;
  wire       [31:0]   _zz_710_;
  wire       [31:0]   _zz_711_;
  wire                _zz_712_;
  wire       [0:0]    _zz_713_;
  wire       [0:0]    _zz_714_;
  wire       [31:0]   _zz_715_;
  wire       [31:0]   _zz_716_;
  wire       [0:0]    _zz_717_;
  wire       [0:0]    _zz_718_;
  wire       [2:0]    _zz_719_;
  wire       [2:0]    _zz_720_;
  wire                _zz_721_;
  wire       [0:0]    _zz_722_;
  wire       [70:0]   _zz_723_;
  wire       [31:0]   _zz_724_;
  wire       [31:0]   _zz_725_;
  wire       [31:0]   _zz_726_;
  wire                _zz_727_;
  wire       [0:0]    _zz_728_;
  wire       [3:0]    _zz_729_;
  wire       [31:0]   _zz_730_;
  wire       [31:0]   _zz_731_;
  wire       [31:0]   _zz_732_;
  wire       [31:0]   _zz_733_;
  wire       [31:0]   _zz_734_;
  wire       [31:0]   _zz_735_;
  wire       [31:0]   _zz_736_;
  wire                _zz_737_;
  wire       [0:0]    _zz_738_;
  wire       [0:0]    _zz_739_;
  wire       [0:0]    _zz_740_;
  wire       [1:0]    _zz_741_;
  wire       [2:0]    _zz_742_;
  wire       [2:0]    _zz_743_;
  wire                _zz_744_;
  wire       [0:0]    _zz_745_;
  wire       [68:0]   _zz_746_;
  wire       [31:0]   _zz_747_;
  wire       [31:0]   _zz_748_;
  wire       [31:0]   _zz_749_;
  wire                _zz_750_;
  wire       [0:0]    _zz_751_;
  wire       [1:0]    _zz_752_;
  wire       [31:0]   _zz_753_;
  wire       [31:0]   _zz_754_;
  wire       [31:0]   _zz_755_;
  wire       [31:0]   _zz_756_;
  wire       [31:0]   _zz_757_;
  wire       [31:0]   _zz_758_;
  wire       [31:0]   _zz_759_;
  wire                _zz_760_;
  wire                _zz_761_;
  wire                _zz_762_;
  wire       [0:0]    _zz_763_;
  wire       [0:0]    _zz_764_;
  wire       [0:0]    _zz_765_;
  wire       [1:0]    _zz_766_;
  wire       [2:0]    _zz_767_;
  wire       [2:0]    _zz_768_;
  wire                _zz_769_;
  wire       [0:0]    _zz_770_;
  wire       [66:0]   _zz_771_;
  wire       [31:0]   _zz_772_;
  wire       [31:0]   _zz_773_;
  wire       [31:0]   _zz_774_;
  wire                _zz_775_;
  wire       [31:0]   _zz_776_;
  wire       [31:0]   _zz_777_;
  wire       [31:0]   _zz_778_;
  wire       [31:0]   _zz_779_;
  wire       [31:0]   _zz_780_;
  wire       [31:0]   _zz_781_;
  wire       [31:0]   _zz_782_;
  wire       [31:0]   _zz_783_;
  wire       [31:0]   _zz_784_;
  wire                _zz_785_;
  wire                _zz_786_;
  wire                _zz_787_;
  wire       [0:0]    _zz_788_;
  wire       [0:0]    _zz_789_;
  wire                _zz_790_;
  wire       [0:0]    _zz_791_;
  wire       [0:0]    _zz_792_;
  wire                _zz_793_;
  wire       [0:0]    _zz_794_;
  wire       [64:0]   _zz_795_;
  wire       [31:0]   _zz_796_;
  wire       [31:0]   _zz_797_;
  wire       [31:0]   _zz_798_;
  wire       [31:0]   _zz_799_;
  wire       [31:0]   _zz_800_;
  wire       [31:0]   _zz_801_;
  wire       [31:0]   _zz_802_;
  wire       [31:0]   _zz_803_;
  wire       [31:0]   _zz_804_;
  wire       [31:0]   _zz_805_;
  wire       [31:0]   _zz_806_;
  wire       [0:0]    _zz_807_;
  wire       [0:0]    _zz_808_;
  wire       [1:0]    _zz_809_;
  wire       [1:0]    _zz_810_;
  wire                _zz_811_;
  wire       [0:0]    _zz_812_;
  wire       [62:0]   _zz_813_;
  wire       [31:0]   _zz_814_;
  wire       [31:0]   _zz_815_;
  wire       [31:0]   _zz_816_;
  wire                _zz_817_;
  wire       [0:0]    _zz_818_;
  wire       [29:0]   _zz_819_;
  wire       [7:0]    _zz_820_;
  wire       [7:0]    _zz_821_;
  wire                _zz_822_;
  wire       [0:0]    _zz_823_;
  wire       [59:0]   _zz_824_;
  wire       [31:0]   _zz_825_;
  wire       [0:0]    _zz_826_;
  wire       [26:0]   _zz_827_;
  wire       [31:0]   _zz_828_;
  wire       [31:0]   _zz_829_;
  wire                _zz_830_;
  wire       [0:0]    _zz_831_;
  wire       [4:0]    _zz_832_;
  wire       [0:0]    _zz_833_;
  wire       [0:0]    _zz_834_;
  wire                _zz_835_;
  wire       [0:0]    _zz_836_;
  wire       [0:0]    _zz_837_;
  wire                _zz_838_;
  wire       [0:0]    _zz_839_;
  wire       [56:0]   _zz_840_;
  wire       [31:0]   _zz_841_;
  wire       [31:0]   _zz_842_;
  wire       [0:0]    _zz_843_;
  wire       [24:0]   _zz_844_;
  wire       [31:0]   _zz_845_;
  wire       [31:0]   _zz_846_;
  wire       [31:0]   _zz_847_;
  wire                _zz_848_;
  wire       [0:0]    _zz_849_;
  wire       [2:0]    _zz_850_;
  wire       [31:0]   _zz_851_;
  wire       [31:0]   _zz_852_;
  wire       [31:0]   _zz_853_;
  wire       [31:0]   _zz_854_;
  wire       [31:0]   _zz_855_;
  wire       [0:0]    _zz_856_;
  wire       [0:0]    _zz_857_;
  wire       [0:0]    _zz_858_;
  wire       [0:0]    _zz_859_;
  wire                _zz_860_;
  wire       [0:0]    _zz_861_;
  wire       [54:0]   _zz_862_;
  wire       [0:0]    _zz_863_;
  wire       [22:0]   _zz_864_;
  wire       [31:0]   _zz_865_;
  wire       [31:0]   _zz_866_;
  wire       [31:0]   _zz_867_;
  wire                _zz_868_;
  wire       [0:0]    _zz_869_;
  wire       [0:0]    _zz_870_;
  wire       [31:0]   _zz_871_;
  wire       [31:0]   _zz_872_;
  wire       [31:0]   _zz_873_;
  wire       [31:0]   _zz_874_;
  wire       [31:0]   _zz_875_;
  wire       [31:0]   _zz_876_;
  wire       [0:0]    _zz_877_;
  wire       [0:0]    _zz_878_;
  wire       [4:0]    _zz_879_;
  wire       [4:0]    _zz_880_;
  wire                _zz_881_;
  wire       [0:0]    _zz_882_;
  wire       [52:0]   _zz_883_;
  wire       [0:0]    _zz_884_;
  wire       [20:0]   _zz_885_;
  wire       [31:0]   _zz_886_;
  wire       [31:0]   _zz_887_;
  wire       [31:0]   _zz_888_;
  wire       [31:0]   _zz_889_;
  wire       [31:0]   _zz_890_;
  wire       [31:0]   _zz_891_;
  wire       [31:0]   _zz_892_;
  wire       [31:0]   _zz_893_;
  wire       [31:0]   _zz_894_;
  wire                _zz_895_;
  wire       [0:0]    _zz_896_;
  wire       [2:0]    _zz_897_;
  wire       [0:0]    _zz_898_;
  wire       [2:0]    _zz_899_;
  wire       [1:0]    _zz_900_;
  wire       [1:0]    _zz_901_;
  wire                _zz_902_;
  wire       [0:0]    _zz_903_;
  wire       [50:0]   _zz_904_;
  wire       [0:0]    _zz_905_;
  wire       [18:0]   _zz_906_;
  wire       [31:0]   _zz_907_;
  wire       [31:0]   _zz_908_;
  wire       [31:0]   _zz_909_;
  wire                _zz_910_;
  wire       [0:0]    _zz_911_;
  wire       [0:0]    _zz_912_;
  wire       [31:0]   _zz_913_;
  wire       [31:0]   _zz_914_;
  wire       [0:0]    _zz_915_;
  wire       [0:0]    _zz_916_;
  wire                _zz_917_;
  wire                _zz_918_;
  wire       [0:0]    _zz_919_;
  wire       [6:0]    _zz_920_;
  wire       [3:0]    _zz_921_;
  wire       [3:0]    _zz_922_;
  wire                _zz_923_;
  wire       [0:0]    _zz_924_;
  wire       [48:0]   _zz_925_;
  wire       [0:0]    _zz_926_;
  wire       [16:0]   _zz_927_;
  wire       [31:0]   _zz_928_;
  wire       [31:0]   _zz_929_;
  wire       [31:0]   _zz_930_;
  wire       [31:0]   _zz_931_;
  wire       [31:0]   _zz_932_;
  wire       [31:0]   _zz_933_;
  wire       [31:0]   _zz_934_;
  wire       [31:0]   _zz_935_;
  wire       [31:0]   _zz_936_;
  wire       [31:0]   _zz_937_;
  wire       [31:0]   _zz_938_;
  wire       [31:0]   _zz_939_;
  wire       [31:0]   _zz_940_;
  wire                _zz_941_;
  wire       [0:0]    _zz_942_;
  wire       [4:0]    _zz_943_;
  wire       [0:0]    _zz_944_;
  wire       [1:0]    _zz_945_;
  wire       [1:0]    _zz_946_;
  wire       [1:0]    _zz_947_;
  wire                _zz_948_;
  wire       [0:0]    _zz_949_;
  wire       [46:0]   _zz_950_;
  wire                _zz_951_;
  wire       [0:0]    _zz_952_;
  wire       [14:0]   _zz_953_;
  wire       [31:0]   _zz_954_;
  wire       [31:0]   _zz_955_;
  wire       [31:0]   _zz_956_;
  wire                _zz_957_;
  wire       [0:0]    _zz_958_;
  wire       [2:0]    _zz_959_;
  wire       [31:0]   _zz_960_;
  wire       [31:0]   _zz_961_;
  wire                _zz_962_;
  wire       [0:0]    _zz_963_;
  wire       [1:0]    _zz_964_;
  wire       [1:0]    _zz_965_;
  wire       [1:0]    _zz_966_;
  wire                _zz_967_;
  wire       [0:0]    _zz_968_;
  wire       [44:0]   _zz_969_;
  wire       [31:0]   _zz_970_;
  wire       [0:0]    _zz_971_;
  wire       [12:0]   _zz_972_;
  wire       [31:0]   _zz_973_;
  wire       [31:0]   _zz_974_;
  wire       [31:0]   _zz_975_;
  wire                _zz_976_;
  wire       [0:0]    _zz_977_;
  wire       [0:0]    _zz_978_;
  wire       [31:0]   _zz_979_;
  wire                _zz_980_;
  wire                _zz_981_;
  wire       [0:0]    _zz_982_;
  wire       [2:0]    _zz_983_;
  wire       [1:0]    _zz_984_;
  wire       [1:0]    _zz_985_;
  wire                _zz_986_;
  wire       [0:0]    _zz_987_;
  wire       [42:0]   _zz_988_;
  wire       [31:0]   _zz_989_;
  wire       [31:0]   _zz_990_;
  wire       [0:0]    _zz_991_;
  wire       [10:0]   _zz_992_;
  wire       [31:0]   _zz_993_;
  wire       [31:0]   _zz_994_;
  wire       [31:0]   _zz_995_;
  wire       [31:0]   _zz_996_;
  wire       [31:0]   _zz_997_;
  wire       [31:0]   _zz_998_;
  wire       [31:0]   _zz_999_;
  wire       [31:0]   _zz_1000_;
  wire       [31:0]   _zz_1001_;
  wire                _zz_1002_;
  wire       [0:0]    _zz_1003_;
  wire       [0:0]    _zz_1004_;
  wire                _zz_1005_;
  wire       [0:0]    _zz_1006_;
  wire       [0:0]    _zz_1007_;
  wire       [7:0]    _zz_1008_;
  wire       [7:0]    _zz_1009_;
  wire                _zz_1010_;
  wire       [0:0]    _zz_1011_;
  wire       [40:0]   _zz_1012_;
  wire       [0:0]    _zz_1013_;
  wire       [8:0]    _zz_1014_;
  wire       [31:0]   _zz_1015_;
  wire       [31:0]   _zz_1016_;
  wire       [31:0]   _zz_1017_;
  wire       [31:0]   _zz_1018_;
  wire       [31:0]   _zz_1019_;
  wire       [31:0]   _zz_1020_;
  wire       [0:0]    _zz_1021_;
  wire       [5:0]    _zz_1022_;
  wire       [0:0]    _zz_1023_;
  wire       [2:0]    _zz_1024_;
  wire       [8:0]    _zz_1025_;
  wire       [8:0]    _zz_1026_;
  wire                _zz_1027_;
  wire       [0:0]    _zz_1028_;
  wire       [38:0]   _zz_1029_;
  wire                _zz_1030_;
  wire       [0:0]    _zz_1031_;
  wire       [6:0]    _zz_1032_;
  wire       [31:0]   _zz_1033_;
  wire       [31:0]   _zz_1034_;
  wire                _zz_1035_;
  wire       [0:0]    _zz_1036_;
  wire       [3:0]    _zz_1037_;
  wire       [0:0]    _zz_1038_;
  wire       [0:0]    _zz_1039_;
  wire       [0:0]    _zz_1040_;
  wire       [6:0]    _zz_1041_;
  wire       [0:0]    _zz_1042_;
  wire       [3:0]    _zz_1043_;
  wire       [5:0]    _zz_1044_;
  wire       [5:0]    _zz_1045_;
  wire                _zz_1046_;
  wire       [0:0]    _zz_1047_;
  wire       [36:0]   _zz_1048_;
  wire       [31:0]   _zz_1049_;
  wire       [31:0]   _zz_1050_;
  wire       [31:0]   _zz_1051_;
  wire       [0:0]    _zz_1052_;
  wire       [4:0]    _zz_1053_;
  wire       [31:0]   _zz_1054_;
  wire       [31:0]   _zz_1055_;
  wire       [31:0]   _zz_1056_;
  wire                _zz_1057_;
  wire       [0:0]    _zz_1058_;
  wire       [1:0]    _zz_1059_;
  wire       [0:0]    _zz_1060_;
  wire       [4:0]    _zz_1061_;
  wire       [31:0]   _zz_1062_;
  wire       [31:0]   _zz_1063_;
  wire       [0:0]    _zz_1064_;
  wire       [1:0]    _zz_1065_;
  wire                _zz_1066_;
  wire       [0:0]    _zz_1067_;
  wire       [3:0]    _zz_1068_;
  wire       [0:0]    _zz_1069_;
  wire       [4:0]    _zz_1070_;
  wire       [0:0]    _zz_1071_;
  wire       [0:0]    _zz_1072_;
  wire                _zz_1073_;
  wire       [0:0]    _zz_1074_;
  wire       [34:0]   _zz_1075_;
  wire       [31:0]   _zz_1076_;
  wire       [31:0]   _zz_1077_;
  wire                _zz_1078_;
  wire       [0:0]    _zz_1079_;
  wire       [2:0]    _zz_1080_;
  wire       [31:0]   _zz_1081_;
  wire       [31:0]   _zz_1082_;
  wire       [31:0]   _zz_1083_;
  wire                _zz_1084_;
  wire                _zz_1085_;
  wire       [31:0]   _zz_1086_;
  wire       [31:0]   _zz_1087_;
  wire                _zz_1088_;
  wire       [0:0]    _zz_1089_;
  wire       [2:0]    _zz_1090_;
  wire       [31:0]   _zz_1091_;
  wire       [0:0]    _zz_1092_;
  wire       [1:0]    _zz_1093_;
  wire       [0:0]    _zz_1094_;
  wire       [2:0]    _zz_1095_;
  wire       [31:0]   _zz_1096_;
  wire       [31:0]   _zz_1097_;
  wire       [0:0]    _zz_1098_;
  wire       [0:0]    _zz_1099_;
  wire       [2:0]    _zz_1100_;
  wire       [2:0]    _zz_1101_;
  wire                _zz_1102_;
  wire       [0:0]    _zz_1103_;
  wire       [32:0]   _zz_1104_;
  wire       [31:0]   _zz_1105_;
  wire       [31:0]   _zz_1106_;
  wire       [31:0]   _zz_1107_;
  wire                _zz_1108_;
  wire       [0:0]    _zz_1109_;
  wire       [1:0]    _zz_1110_;
  wire       [31:0]   _zz_1111_;
  wire       [31:0]   _zz_1112_;
  wire       [31:0]   _zz_1113_;
  wire       [31:0]   _zz_1114_;
  wire       [31:0]   _zz_1115_;
  wire       [31:0]   _zz_1116_;
  wire       [31:0]   _zz_1117_;
  wire       [31:0]   _zz_1118_;
  wire                _zz_1119_;
  wire       [0:0]    _zz_1120_;
  wire       [1:0]    _zz_1121_;
  wire       [0:0]    _zz_1122_;
  wire       [0:0]    _zz_1123_;
  wire                _zz_1124_;
  wire       [0:0]    _zz_1125_;
  wire       [1:0]    _zz_1126_;
  wire       [31:0]   _zz_1127_;
  wire                _zz_1128_;
  wire                _zz_1129_;
  wire       [0:0]    _zz_1130_;
  wire       [1:0]    _zz_1131_;
  wire       [19:0]   _zz_1132_;
  wire       [19:0]   _zz_1133_;
  wire                _zz_1134_;
  wire       [0:0]    _zz_1135_;
  wire       [31:0]   _zz_1136_;
  wire       [31:0]   _zz_1137_;
  wire       [31:0]   _zz_1138_;
  wire       [31:0]   _zz_1139_;
  wire                _zz_1140_;
  wire       [0:0]    _zz_1141_;
  wire       [0:0]    _zz_1142_;
  wire       [31:0]   _zz_1143_;
  wire       [31:0]   _zz_1144_;
  wire       [31:0]   _zz_1145_;
  wire       [31:0]   _zz_1146_;
  wire       [31:0]   _zz_1147_;
  wire                _zz_1148_;
  wire       [0:0]    _zz_1149_;
  wire       [0:0]    _zz_1150_;
  wire       [31:0]   _zz_1151_;
  wire       [31:0]   _zz_1152_;
  wire       [0:0]    _zz_1153_;
  wire       [0:0]    _zz_1154_;
  wire       [31:0]   _zz_1155_;
  wire       [31:0]   _zz_1156_;
  wire       [31:0]   _zz_1157_;
  wire       [31:0]   _zz_1158_;
  wire                _zz_1159_;
  wire       [0:0]    _zz_1160_;
  wire       [0:0]    _zz_1161_;
  wire       [0:0]    _zz_1162_;
  wire       [18:0]   _zz_1163_;
  wire       [2:0]    _zz_1164_;
  wire       [2:0]    _zz_1165_;
  wire                _zz_1166_;
  wire       [0:0]    _zz_1167_;
  wire       [30:0]   _zz_1168_;
  wire       [31:0]   _zz_1169_;
  wire       [31:0]   _zz_1170_;
  wire       [31:0]   _zz_1171_;
  wire       [31:0]   _zz_1172_;
  wire       [31:0]   _zz_1173_;
  wire       [31:0]   _zz_1174_;
  wire       [31:0]   _zz_1175_;
  wire       [31:0]   _zz_1176_;
  wire       [31:0]   _zz_1177_;
  wire       [31:0]   _zz_1178_;
  wire       [31:0]   _zz_1179_;
  wire       [31:0]   _zz_1180_;
  wire       [31:0]   _zz_1181_;
  wire       [31:0]   _zz_1182_;
  wire       [31:0]   _zz_1183_;
  wire       [31:0]   _zz_1184_;
  wire       [31:0]   _zz_1185_;
  wire       [31:0]   _zz_1186_;
  wire       [31:0]   _zz_1187_;
  wire                _zz_1188_;
  wire       [0:0]    _zz_1189_;
  wire       [16:0]   _zz_1190_;
  wire       [0:0]    _zz_1191_;
  wire       [0:0]    _zz_1192_;
  wire       [0:0]    _zz_1193_;
  wire       [1:0]    _zz_1194_;
  wire       [24:0]   _zz_1195_;
  wire       [24:0]   _zz_1196_;
  wire                _zz_1197_;
  wire       [0:0]    _zz_1198_;
  wire       [28:0]   _zz_1199_;
  wire       [31:0]   _zz_1200_;
  wire       [31:0]   _zz_1201_;
  wire       [31:0]   _zz_1202_;
  wire       [0:0]    _zz_1203_;
  wire       [14:0]   _zz_1204_;
  wire                _zz_1205_;
  wire                _zz_1206_;
  wire       [0:0]    _zz_1207_;
  wire       [22:0]   _zz_1208_;
  wire       [0:0]    _zz_1209_;
  wire       [18:0]   _zz_1210_;
  wire       [0:0]    _zz_1211_;
  wire       [0:0]    _zz_1212_;
  wire                _zz_1213_;
  wire       [0:0]    _zz_1214_;
  wire       [26:0]   _zz_1215_;
  wire       [0:0]    _zz_1216_;
  wire       [12:0]   _zz_1217_;
  wire       [31:0]   _zz_1218_;
  wire       [31:0]   _zz_1219_;
  wire                _zz_1220_;
  wire       [0:0]    _zz_1221_;
  wire       [20:0]   _zz_1222_;
  wire       [31:0]   _zz_1223_;
  wire       [31:0]   _zz_1224_;
  wire       [0:0]    _zz_1225_;
  wire       [16:0]   _zz_1226_;
  wire       [31:0]   _zz_1227_;
  wire       [31:0]   _zz_1228_;
  wire       [0:0]    _zz_1229_;
  wire       [0:0]    _zz_1230_;
  wire       [1:0]    _zz_1231_;
  wire       [1:0]    _zz_1232_;
  wire                _zz_1233_;
  wire       [0:0]    _zz_1234_;
  wire       [24:0]   _zz_1235_;
  wire       [0:0]    _zz_1236_;
  wire       [10:0]   _zz_1237_;
  wire       [31:0]   _zz_1238_;
  wire       [31:0]   _zz_1239_;
  wire       [31:0]   _zz_1240_;
  wire       [0:0]    _zz_1241_;
  wire       [18:0]   _zz_1242_;
  wire       [0:0]    _zz_1243_;
  wire       [14:0]   _zz_1244_;
  wire       [31:0]   _zz_1245_;
  wire       [31:0]   _zz_1246_;
  wire       [31:0]   _zz_1247_;
  wire       [31:0]   _zz_1248_;
  wire                _zz_1249_;
  wire       [0:0]    _zz_1250_;
  wire       [1:0]    _zz_1251_;
  wire       [1:0]    _zz_1252_;
  wire       [1:0]    _zz_1253_;
  wire                _zz_1254_;
  wire       [0:0]    _zz_1255_;
  wire       [22:0]   _zz_1256_;
  wire       [31:0]   _zz_1257_;
  wire       [31:0]   _zz_1258_;
  wire                _zz_1259_;
  wire       [0:0]    _zz_1260_;
  wire       [8:0]    _zz_1261_;
  wire       [31:0]   _zz_1262_;
  wire       [31:0]   _zz_1263_;
  wire       [0:0]    _zz_1264_;
  wire       [16:0]   _zz_1265_;
  wire       [0:0]    _zz_1266_;
  wire       [12:0]   _zz_1267_;
  wire       [31:0]   _zz_1268_;
  wire       [31:0]   _zz_1269_;
  wire       [31:0]   _zz_1270_;
  wire                _zz_1271_;
  wire                _zz_1272_;
  wire                _zz_1273_;
  wire       [0:0]    _zz_1274_;
  wire       [0:0]    _zz_1275_;
  wire                _zz_1276_;
  wire       [0:0]    _zz_1277_;
  wire       [20:0]   _zz_1278_;
  wire       [31:0]   _zz_1279_;
  wire       [31:0]   _zz_1280_;
  wire       [31:0]   _zz_1281_;
  wire                _zz_1282_;
  wire       [0:0]    _zz_1283_;
  wire       [6:0]    _zz_1284_;
  wire       [0:0]    _zz_1285_;
  wire       [14:0]   _zz_1286_;
  wire       [0:0]    _zz_1287_;
  wire       [10:0]   _zz_1288_;
  wire       [31:0]   _zz_1289_;
  wire       [31:0]   _zz_1290_;
  wire       [31:0]   _zz_1291_;
  wire       [3:0]    _zz_1292_;
  wire       [3:0]    _zz_1293_;
  wire                _zz_1294_;
  wire       [0:0]    _zz_1295_;
  wire       [18:0]   _zz_1296_;
  wire       [31:0]   _zz_1297_;
  wire       [31:0]   _zz_1298_;
  wire       [31:0]   _zz_1299_;
  wire                _zz_1300_;
  wire       [0:0]    _zz_1301_;
  wire       [4:0]    _zz_1302_;
  wire       [0:0]    _zz_1303_;
  wire       [12:0]   _zz_1304_;
  wire       [0:0]    _zz_1305_;
  wire       [8:0]    _zz_1306_;
  wire                _zz_1307_;
  wire       [0:0]    _zz_1308_;
  wire       [1:0]    _zz_1309_;
  wire       [0:0]    _zz_1310_;
  wire       [2:0]    _zz_1311_;
  wire       [3:0]    _zz_1312_;
  wire       [3:0]    _zz_1313_;
  wire                _zz_1314_;
  wire       [0:0]    _zz_1315_;
  wire       [16:0]   _zz_1316_;
  wire       [31:0]   _zz_1317_;
  wire       [31:0]   _zz_1318_;
  wire       [31:0]   _zz_1319_;
  wire                _zz_1320_;
  wire       [0:0]    _zz_1321_;
  wire       [2:0]    _zz_1322_;
  wire       [31:0]   _zz_1323_;
  wire       [31:0]   _zz_1324_;
  wire                _zz_1325_;
  wire       [0:0]    _zz_1326_;
  wire       [10:0]   _zz_1327_;
  wire       [0:0]    _zz_1328_;
  wire       [6:0]    _zz_1329_;
  wire       [31:0]   _zz_1330_;
  wire                _zz_1331_;
  wire                _zz_1332_;
  wire       [0:0]    _zz_1333_;
  wire       [0:0]    _zz_1334_;
  wire       [0:0]    _zz_1335_;
  wire       [1:0]    _zz_1336_;
  wire       [5:0]    _zz_1337_;
  wire       [5:0]    _zz_1338_;
  wire                _zz_1339_;
  wire       [0:0]    _zz_1340_;
  wire       [14:0]   _zz_1341_;
  wire       [31:0]   _zz_1342_;
  wire       [31:0]   _zz_1343_;
  wire       [31:0]   _zz_1344_;
  wire                _zz_1345_;
  wire       [0:0]    _zz_1346_;
  wire       [0:0]    _zz_1347_;
  wire       [31:0]   _zz_1348_;
  wire       [0:0]    _zz_1349_;
  wire       [8:0]    _zz_1350_;
  wire       [0:0]    _zz_1351_;
  wire       [4:0]    _zz_1352_;
  wire       [31:0]   _zz_1353_;
  wire       [31:0]   _zz_1354_;
  wire       [0:0]    _zz_1355_;
  wire       [3:0]    _zz_1356_;
  wire       [0:0]    _zz_1357_;
  wire       [2:0]    _zz_1358_;
  wire       [5:0]    _zz_1359_;
  wire       [5:0]    _zz_1360_;
  wire                _zz_1361_;
  wire       [0:0]    _zz_1362_;
  wire       [12:0]   _zz_1363_;
  wire       [31:0]   _zz_1364_;
  wire       [31:0]   _zz_1365_;
  wire       [31:0]   _zz_1366_;
  wire       [31:0]   _zz_1367_;
  wire       [31:0]   _zz_1368_;
  wire       [0:0]    _zz_1369_;
  wire       [6:0]    _zz_1370_;
  wire       [0:0]    _zz_1371_;
  wire       [2:0]    _zz_1372_;
  wire       [31:0]   _zz_1373_;
  wire       [31:0]   _zz_1374_;
  wire       [0:0]    _zz_1375_;
  wire       [1:0]    _zz_1376_;
  wire       [31:0]   _zz_1377_;
  wire       [31:0]   _zz_1378_;
  wire                _zz_1379_;
  wire       [0:0]    _zz_1380_;
  wire       [0:0]    _zz_1381_;
  wire       [0:0]    _zz_1382_;
  wire       [3:0]    _zz_1383_;
  wire       [0:0]    _zz_1384_;
  wire       [13:0]   _zz_1385_;
  wire       [3:0]    _zz_1386_;
  wire       [3:0]    _zz_1387_;
  wire                _zz_1388_;
  wire       [0:0]    _zz_1389_;
  wire       [10:0]   _zz_1390_;
  wire       [0:0]    _zz_1391_;
  wire       [4:0]    _zz_1392_;
  wire       [31:0]   _zz_1393_;
  wire       [31:0]   _zz_1394_;
  wire                _zz_1395_;
  wire       [0:0]    _zz_1396_;
  wire       [0:0]    _zz_1397_;
  wire       [31:0]   _zz_1398_;
  wire       [31:0]   _zz_1399_;
  wire                _zz_1400_;
  wire       [31:0]   _zz_1401_;
  wire       [31:0]   _zz_1402_;
  wire       [31:0]   _zz_1403_;
  wire       [0:0]    _zz_1404_;
  wire       [1:0]    _zz_1405_;
  wire       [0:0]    _zz_1406_;
  wire       [11:0]   _zz_1407_;
  wire       [0:0]    _zz_1408_;
  wire       [1:0]    _zz_1409_;
  wire       [0:0]    _zz_1410_;
  wire       [3:0]    _zz_1411_;
  wire       [1:0]    _zz_1412_;
  wire       [1:0]    _zz_1413_;
  wire                _zz_1414_;
  wire       [0:0]    _zz_1415_;
  wire       [8:0]    _zz_1416_;
  wire       [0:0]    _zz_1417_;
  wire       [2:0]    _zz_1418_;
  wire       [31:0]   _zz_1419_;
  wire       [31:0]   _zz_1420_;
  wire       [31:0]   _zz_1421_;
  wire       [31:0]   _zz_1422_;
  wire       [31:0]   _zz_1423_;
  wire       [31:0]   _zz_1424_;
  wire                _zz_1425_;
  wire                _zz_1426_;
  wire       [0:0]    _zz_1427_;
  wire       [9:0]    _zz_1428_;
  wire                _zz_1429_;
  wire       [0:0]    _zz_1430_;
  wire       [1:0]    _zz_1431_;
  wire                _zz_1432_;
  wire                _zz_1433_;
  wire       [0:0]    _zz_1434_;
  wire       [4:0]    _zz_1435_;
  wire       [0:0]    _zz_1436_;
  wire       [0:0]    _zz_1437_;
  wire                _zz_1438_;
  wire       [0:0]    _zz_1439_;
  wire       [6:0]    _zz_1440_;
  wire       [31:0]   _zz_1441_;
  wire       [31:0]   _zz_1442_;
  wire       [0:0]    _zz_1443_;
  wire       [0:0]    _zz_1444_;
  wire       [31:0]   _zz_1445_;
  wire       [31:0]   _zz_1446_;
  wire       [31:0]   _zz_1447_;
  wire       [31:0]   _zz_1448_;
  wire       [0:0]    _zz_1449_;
  wire       [7:0]    _zz_1450_;
  wire       [31:0]   _zz_1451_;
  wire       [31:0]   _zz_1452_;
  wire       [31:0]   _zz_1453_;
  wire                _zz_1454_;
  wire       [0:0]    _zz_1455_;
  wire       [2:0]    _zz_1456_;
  wire       [31:0]   _zz_1457_;
  wire       [31:0]   _zz_1458_;
  wire       [0:0]    _zz_1459_;
  wire       [9:0]    _zz_1460_;
  wire       [1:0]    _zz_1461_;
  wire       [1:0]    _zz_1462_;
  wire                _zz_1463_;
  wire       [0:0]    _zz_1464_;
  wire       [4:0]    _zz_1465_;
  wire       [31:0]   _zz_1466_;
  wire       [31:0]   _zz_1467_;
  wire                _zz_1468_;
  wire       [0:0]    _zz_1469_;
  wire       [5:0]    _zz_1470_;
  wire       [31:0]   _zz_1471_;
  wire       [31:0]   _zz_1472_;
  wire       [31:0]   _zz_1473_;
  wire       [0:0]    _zz_1474_;
  wire       [0:0]    _zz_1475_;
  wire       [0:0]    _zz_1476_;
  wire       [7:0]    _zz_1477_;
  wire                _zz_1478_;
  wire       [1:0]    _zz_1479_;
  wire       [1:0]    _zz_1480_;
  wire                _zz_1481_;
  wire       [0:0]    _zz_1482_;
  wire       [2:0]    _zz_1483_;
  wire       [31:0]   _zz_1484_;
  wire       [31:0]   _zz_1485_;
  wire       [31:0]   _zz_1486_;
  wire       [0:0]    _zz_1487_;
  wire       [3:0]    _zz_1488_;
  wire       [31:0]   _zz_1489_;
  wire       [31:0]   _zz_1490_;
  wire       [31:0]   _zz_1491_;
  wire       [31:0]   _zz_1492_;
  wire       [31:0]   _zz_1493_;
  wire       [31:0]   _zz_1494_;
  wire                _zz_1495_;
  wire       [0:0]    _zz_1496_;
  wire       [5:0]    _zz_1497_;
  wire       [31:0]   _zz_1498_;
  wire       [0:0]    _zz_1499_;
  wire       [0:0]    _zz_1500_;
  wire                _zz_1501_;
  wire       [0:0]    _zz_1502_;
  wire       [0:0]    _zz_1503_;
  wire       [31:0]   _zz_1504_;
  wire       [31:0]   _zz_1505_;
  wire       [0:0]    _zz_1506_;
  wire       [0:0]    _zz_1507_;
  wire       [31:0]   _zz_1508_;
  wire       [31:0]   _zz_1509_;
  wire                _zz_1510_;
  wire       [0:0]    _zz_1511_;
  wire       [2:0]    _zz_1512_;
  wire       [31:0]   _zz_1513_;
  wire       [31:0]   _zz_1514_;
  wire       [31:0]   _zz_1515_;
  wire       [0:0]    _zz_1516_;
  wire       [1:0]    _zz_1517_;
  wire       [31:0]   _zz_1518_;
  wire       [31:0]   _zz_1519_;
  wire       [31:0]   _zz_1520_;
  wire       [31:0]   _zz_1521_;
  wire       [31:0]   _zz_1522_;
  wire       [31:0]   _zz_1523_;
  wire       [10:0]   _zz_1524_;
  wire       [10:0]   _zz_1525_;
  wire       [17:0]   _zz_1526_;
  wire       [0:0]    _zz_1527_;
  wire       [17:0]   _zz_1528_;
  wire       [0:0]    _zz_1529_;
  wire       [17:0]   _zz_1530_;
  wire       [0:0]    _zz_1531_;
  wire       [4:0]    writeBack_REGFILE_WRITE_ADDR;
  wire       [4:0]    memory_REGFILE_WRITE_ADDR;
  wire       [4:0]    execute_REGFILE_WRITE_ADDR;
  wire                decode_DECODER_stageables_30;
  wire       `TgtCtrlEnum_defaultEncoding_type _zz_1_;
  wire       `TgtCtrlEnum_defaultEncoding_type _zz_2_;
  wire                decode_DECODER_stageables_43;
  wire                execute_TARGET_MISSMATCH2;
  wire       [31:0]   memory_SRC1;
  wire                execute_DECODER_stageables_35;
  wire                decode_DECODER_stageables_35;
  wire                decode_DECODER_stageables_29;
  wire       `Src1CtrlEnum_defaultEncoding_type decode_DECODER_stageables_27;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_3_;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_4_;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_5_;
  wire       `Src3CtrlEnum_defaultEncoding_type decode_DECODER_stageables_8;
  wire       `Src3CtrlEnum_defaultEncoding_type _zz_6_;
  wire       `Src3CtrlEnum_defaultEncoding_type _zz_7_;
  wire       `Src3CtrlEnum_defaultEncoding_type _zz_8_;
  wire       `CRBusCmdEnum_defaultEncoding_type _zz_9_;
  wire       `CRBusCmdEnum_defaultEncoding_type _zz_10_;
  wire       `CRBusCmdEnum_defaultEncoding_type execute_CR_WRITE_op;
  wire       [4:0]    execute_CR_WRITE_ba;
  wire       [4:0]    execute_CR_WRITE_bb;
  wire       [4:0]    execute_CR_WRITE_bt;
  wire       [31:0]   execute_CR_WRITE_imm;
  wire       [7:0]    execute_CR_WRITE_fxm;
  wire       `CRBusCmdEnum_defaultEncoding_type _zz_11_;
  wire       `CRBusCmdEnum_defaultEncoding_type _zz_12_;
  wire       `CRBusCmdEnum_defaultEncoding_type _zz_13_;
  wire                decode_DECODER_stageables_16;
  wire                memory_DECODER_stageables_37;
  wire                execute_DECODER_stageables_37;
  wire                decode_DECODER_stageables_37;
  wire                decode_DECODER_stageables_22;
  wire       [31:0]   execute_REGFILE_WRITE_DATA;
  wire                decode_DECODER_stageables_0;
  wire                decode_DECODER_stageables_54;
  wire                memory_DECODER_stageables_7;
  wire                execute_DECODER_stageables_7;
  wire                decode_DECODER_stageables_7;
  wire       [4:0]    decode_RT_ADDR;
  wire       `CRMoveCtrlEnum_defaultEncoding_type decode_DECODER_stageables_49;
  wire       `CRMoveCtrlEnum_defaultEncoding_type _zz_14_;
  wire       `CRMoveCtrlEnum_defaultEncoding_type _zz_15_;
  wire       `CRMoveCtrlEnum_defaultEncoding_type _zz_16_;
  wire                decode_DECODER_stageables_50;
  wire       `DataSizeEnum_defaultEncoding_type memory_DECODER_stageables_32;
  wire       `DataSizeEnum_defaultEncoding_type _zz_17_;
  wire       `DataSizeEnum_defaultEncoding_type _zz_18_;
  wire       `DataSizeEnum_defaultEncoding_type _zz_19_;
  wire       `DataSizeEnum_defaultEncoding_type _zz_20_;
  wire       `DataSizeEnum_defaultEncoding_type _zz_21_;
  wire       `DataSizeEnum_defaultEncoding_type decode_DECODER_stageables_32;
  wire       `DataSizeEnum_defaultEncoding_type _zz_22_;
  wire       `DataSizeEnum_defaultEncoding_type _zz_23_;
  wire       `DataSizeEnum_defaultEncoding_type _zz_24_;
  wire       `EndianEnum_defaultEncoding_type memory_MSR_ENDIAN;
  wire       `EndianEnum_defaultEncoding_type _zz_25_;
  wire       `EndianEnum_defaultEncoding_type _zz_26_;
  wire       `EndianEnum_defaultEncoding_type _zz_27_;
  wire       `EndianEnum_defaultEncoding_type _zz_28_;
  wire       `EndianEnum_defaultEncoding_type _zz_29_;
  wire       `EndianEnum_defaultEncoding_type _zz_30_;
  wire       `EndianEnum_defaultEncoding_type _zz_31_;
  wire       [31:0]   memory_SRC_ADD;
  wire                decode_DECODER_stageables_48;
  wire       [7:0]    execute_CR_FIELD_WR;
  wire                execute_BRANCH_DO;
  wire                execute_XER_SO;
  wire                decode_DECODER_stageables_9;
  wire                decode_DECODER_stageables_51;
  wire       [33:0]   memory_MUL_HH;
  wire       [33:0]   execute_MUL_HH;
  wire                decode_DECODER_stageables_13;
  wire                decode_DECODER_stageables_3;
  wire       [7:0]    decode_CR_FIELD_RD;
  wire       [31:0]   execute_MUL_LL;
  wire                execute_DECODER_stageables_53;
  wire                decode_DECODER_stageables_53;
  wire                decode_DECODER_stageables_33;
  wire                execute_DECODER_stageables_34;
  wire                decode_DECODER_stageables_34;
  wire       [51:0]   memory_MUL_LOW;
  wire                decode_DECODER_stageables_5;
  wire       [33:0]   execute_MUL_LH;
  wire       [31:0]   execute_RA;
  wire                decode_DECODER_stageables_56;
  wire       `AluRimiAmtEnum_defaultEncoding_type decode_DECODER_stageables_40;
  wire       `AluRimiAmtEnum_defaultEncoding_type _zz_32_;
  wire       `AluRimiAmtEnum_defaultEncoding_type _zz_33_;
  wire       `AluRimiAmtEnum_defaultEncoding_type _zz_34_;
  wire                decode_DECODER_stageables_21;
  wire       [31:0]   execute_NEXT_PC2;
  wire       [4:0]    writeBack_LOAD_UPDATE_ADDR;
  wire       [4:0]    memory_LOAD_UPDATE_ADDR;
  wire       [4:0]    execute_LOAD_UPDATE_ADDR;
  wire                decode_DECODER_stageables_6;
  wire                memory_DECODER_stageables_47;
  wire                execute_DECODER_stageables_47;
  wire                decode_DECODER_stageables_47;
  wire                execute_PREDICTION_CONTEXT_hazard;
  wire                execute_PREDICTION_CONTEXT_hit;
  wire       [27:0]   execute_PREDICTION_CONTEXT_line_source;
  wire       [1:0]    execute_PREDICTION_CONTEXT_line_branchWish;
  wire       [31:0]   execute_PREDICTION_CONTEXT_line_target;
  wire                decode_PREDICTION_CONTEXT_hazard;
  wire                decode_PREDICTION_CONTEXT_hit;
  wire       [27:0]   decode_PREDICTION_CONTEXT_line_source;
  wire       [1:0]    decode_PREDICTION_CONTEXT_line_branchWish;
  wire       [31:0]   decode_PREDICTION_CONTEXT_line_target;
  wire       `AluSpecCtrlEnum_defaultEncoding_type decode_DECODER_stageables_1;
  wire       `AluSpecCtrlEnum_defaultEncoding_type _zz_35_;
  wire       `AluSpecCtrlEnum_defaultEncoding_type _zz_36_;
  wire       `AluSpecCtrlEnum_defaultEncoding_type _zz_37_;
  wire                decode_DECODER_stageables_36;
  wire                decode_DECODER_stageables_17;
  wire                execute_DECODER_stageables_55;
  wire                decode_DECODER_stageables_55;
  wire       [1:0]    memory_MEMORY_ADDRESS_LOW;
  wire       [1:0]    execute_MEMORY_ADDRESS_LOW;
  wire       [33:0]   execute_MUL_HL;
  wire                execute_DECODER_stageables_57;
  wire                decode_DECODER_stageables_57;
  wire                execute_XER_WRITE_validOV;
  wire                execute_XER_WRITE_validCA;
  wire       [1:0]    execute_XER_WRITE_imm;
  wire       `EnvCtrlEnum_defaultEncoding_type memory_DECODER_stageables_14;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_38_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_39_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_40_;
  wire       `EnvCtrlEnum_defaultEncoding_type decode_DECODER_stageables_14;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_41_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_42_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_43_;
  wire                memory_DECODER_stageables_15;
  wire                execute_DECODER_stageables_15;
  wire                decode_DECODER_stageables_15;
  wire                memory_DECODER_stageables_31;
  wire                decode_DECODER_stageables_31;
  wire       `AluCtrlEnum_defaultEncoding_type decode_DECODER_stageables_39;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_44_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_45_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_46_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type decode_DECODER_stageables_52;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_47_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_48_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_49_;
  wire       [31:0]   writeBack_LOAD_UPDATE_DATA;
  wire       [31:0]   memory_LOAD_UPDATE_DATA;
  wire       [31:0]   execute_LOAD_UPDATE_DATA;
  wire                execute_BRANCH_LINK;
  wire                decode_DECODER_stageables_41;
  wire                memory_DECODER_stageables_45;
  wire                execute_DECODER_stageables_45;
  wire                decode_DECODER_stageables_45;
  wire                execute_XER_CA;
  wire       [31:0]   execute_RB;
  wire       `Src2CtrlEnum_defaultEncoding_type decode_DECODER_stageables_12;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_50_;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_51_;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_52_;
  wire       `CRLogCtrlEnum_defaultEncoding_type decode_DECODER_stageables_18;
  wire       `CRLogCtrlEnum_defaultEncoding_type _zz_53_;
  wire       `CRLogCtrlEnum_defaultEncoding_type _zz_54_;
  wire       `CRLogCtrlEnum_defaultEncoding_type _zz_55_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_56_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_57_;
  wire       [31:0]   writeBack_FORMAL_PC_NEXT;
  wire       [31:0]   memory_FORMAL_PC_NEXT;
  wire       [31:0]   execute_FORMAL_PC_NEXT;
  wire       [31:0]   decode_FORMAL_PC_NEXT;
  wire                decode_DECODER_stageables_10;
  wire                decode_DECODER_stageables_38;
  wire       `AluRimiCtrlEnum_defaultEncoding_type decode_DECODER_stageables_42;
  wire       `AluRimiCtrlEnum_defaultEncoding_type _zz_58_;
  wire       `AluRimiCtrlEnum_defaultEncoding_type _zz_59_;
  wire       `AluRimiCtrlEnum_defaultEncoding_type _zz_60_;
  wire       `EnvCtrlEnum_defaultEncoding_type writeBack_DECODER_stageables_14;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_61_;
  wire                writeBack_DECODER_stageables_47;
  wire                execute_DECODER_stageables_9;
  wire                execute_DECODER_stageables_28;
  reg        `EnvCtrlEnum_defaultEncoding_type _zz_62_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_63_;
  wire       `EnvCtrlEnum_defaultEncoding_type execute_DECODER_stageables_14;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_64_;
  reg        `EndianEnum_defaultEncoding_type _zz_65_;
  wire       [31:0]   writeBack_SRC_ADD;
  wire       [31:0]   memory_NEXT_PC2;
  wire       [31:0]   memory_PC;
  wire       [31:0]   memory_BRANCH_CALC;
  wire                memory_TARGET_MISSMATCH2;
  wire                memory_BRANCH_DO;
  wire       [31:0]   execute_BRANCH_CALC;
  wire       [31:0]   execute_PC;
  reg        [7:0]    _zz_66_;
  wire                decode_DECODER_stageables_23;
  wire       `BranchCtrlEnum_defaultEncoding_type decode_DECODER_stageables_25;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_67_;
  wire       [7:0]    writeBack_CR_FIELD_WR;
  wire                execute_BRANCH_DEC;
  wire                execute_DECODER_stageables_17;
  wire                memory_BRANCH_DEC;
  wire                memory_BRANCH_LINK;
  wire       [10:0]   memory_SPR_ID;
  wire                memory_DECODER_stageables_17;
  wire                memory_XER_WRITE_validOV;
  wire                memory_XER_WRITE_validCA;
  wire       [1:0]    memory_XER_WRITE_imm;
  wire       `CRBusCmdEnum_defaultEncoding_type memory_CR_WRITE_op;
  wire       [4:0]    memory_CR_WRITE_ba;
  wire       [4:0]    memory_CR_WRITE_bb;
  wire       [4:0]    memory_CR_WRITE_bt;
  wire       [31:0]   memory_CR_WRITE_imm;
  wire       [7:0]    memory_CR_WRITE_fxm;
  wire       `CRBusCmdEnum_defaultEncoding_type _zz_68_;
  wire                memory_DECODER_stageables_34;
  wire       `BranchCtrlEnum_defaultEncoding_type execute_DECODER_stageables_25;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_69_;
  wire       [7:0]    execute_CR_FIELD_RD;
  wire       [7:0]    memory_CR_FIELD_WR;
  wire                execute_DECODER_stageables_6;
  wire                memory_DECODER_stageables_55;
  wire                decode_DECODER_stageables_24;
  wire                decode_DECODER_stageables_44;
  wire                decode_DECODER_stageables_46;
  reg        [31:0]   decode_RS;
  reg        [31:0]   decode_RB;
  reg        [31:0]   decode_RA;
  reg        [31:0]   _zz_70_;
  wire                writeBack_DECODER_stageables_21;
  wire       [4:0]    writeBack_RT_ADDR;
  wire                memory_DECODER_stageables_21;
  wire       [4:0]    memory_RT_ADDR;
  wire                execute_DECODER_stageables_21;
  wire       [4:0]    execute_RT_ADDR;
  wire       [4:0]    decode_R2_ADDR;
  wire       [4:0]    decode_R1_ADDR;
  wire       [4:0]    decode_R0_ADDR;
  wire       [1:0]    memory_SRC_CR;
  wire                memory_XER_SO;
  wire       [31:0]   memory_INSTRUCTION;
  wire                memory_DECODER_stageables_35;
  reg        [31:0]   _zz_71_;
  wire                memory_DECODER_stageables_57;
  wire                memory_DECODER_stageables_53;
  wire                execute_DECODER_stageables_3;
  wire                execute_DECODER_stageables_30;
  wire                writeBack_DECODER_stageables_34;
  wire                writeBack_DECODER_stageables_15;
  wire       [1:0]    writeBack_SRC_CR;
  wire                writeBack_DECODER_stageables_7;
  wire                writeBack_XER_SO;
  wire                writeBack_DECODER_stageables_45;
  wire       [33:0]   writeBack_MUL_HH;
  wire       [51:0]   writeBack_MUL_LOW;
  wire       [33:0]   memory_MUL_HL;
  wire       [33:0]   memory_MUL_LH;
  wire       [31:0]   memory_MUL_LL;
  wire                execute_DECODER_stageables_33;
  wire                memory_DECODER_stageables_48;
  wire                execute_DECODER_stageables_48;
  wire                writeBack_DECODER_stageables_48;
  wire                execute_DECODER_stageables_38;
  wire       [0:0]    execute_SRC3;
  wire       `Src3CtrlEnum_defaultEncoding_type execute_DECODER_stageables_8;
  wire       `Src3CtrlEnum_defaultEncoding_type _zz_72_;
  wire       `Src2CtrlEnum_defaultEncoding_type execute_DECODER_stageables_12;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_73_;
  wire       `Src1CtrlEnum_defaultEncoding_type execute_DECODER_stageables_27;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_74_;
  wire       [31:0]   _zz_75_;
  wire       [31:0]   _zz_76_;
  wire                decode_DECODER_stageables_2;
  reg        [7:0]    _zz_77_;
  wire       `CRBusCmdEnum_defaultEncoding_type _zz_78_;
  wire       `CRLogCtrlEnum_defaultEncoding_type execute_DECODER_stageables_18;
  wire       `CRLogCtrlEnum_defaultEncoding_type _zz_79_;
  wire       `CRMoveCtrlEnum_defaultEncoding_type execute_DECODER_stageables_49;
  wire       `CRMoveCtrlEnum_defaultEncoding_type _zz_80_;
  wire                execute_DECODER_stageables_50;
  wire                execute_DECODER_stageables_51;
  wire                execute_DECODER_stageables_29;
  wire                execute_DECODER_stageables_54;
  wire                execute_DECODER_stageables_56;
  wire       [1:0]    execute_SRC_CR;
  wire                execute_DECODER_stageables_36;
  wire                execute_DECODER_stageables_43;
  wire       [1:0]    execute_SRC_CAOV;
  wire                execute_DECODER_stageables_5;
  reg        [10:0]   _zz_81_;
  wire                execute_DECODER_stageables_23;
  wire       [4:0]    execute_R0_ADDR;
  wire       `TgtCtrlEnum_defaultEncoding_type execute_DECODER_stageables_26;
  wire       `TgtCtrlEnum_defaultEncoding_type _zz_82_;
  wire                execute_DECODER_stageables_0;
  wire                execute_DECODER_stageables_13;
  wire                execute_DECODER_stageables_41;
  wire       `AluRimiAmtEnum_defaultEncoding_type execute_DECODER_stageables_40;
  wire       `AluRimiAmtEnum_defaultEncoding_type _zz_83_;
  wire       `AluSpecCtrlEnum_defaultEncoding_type execute_DECODER_stageables_1;
  wire       `AluSpecCtrlEnum_defaultEncoding_type _zz_84_;
  wire       `AluRimiCtrlEnum_defaultEncoding_type execute_DECODER_stageables_42;
  wire       `AluRimiCtrlEnum_defaultEncoding_type _zz_85_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type execute_DECODER_stageables_52;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_86_;
  wire       `AluCtrlEnum_defaultEncoding_type execute_DECODER_stageables_39;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_87_;
  wire       [31:0]   execute_SRC2;
  wire       [31:0]   execute_SRC1;
  wire                execute_DECODER_stageables_10;
  wire       [10:0]   execute_SPR_ID;
  wire       [31:0]   writeBack_SRC1;
  wire                writeBack_DECODER_stageables_17;
  wire       [10:0]   writeBack_SPR_ID;
  wire                writeBack_XER_WRITE_validOV;
  wire                writeBack_XER_WRITE_validCA;
  wire       [1:0]    writeBack_XER_WRITE_imm;
  wire                writeBack_BRANCH_LINK;
  wire                writeBack_BRANCH_DEC;
  wire       `CRBusCmdEnum_defaultEncoding_type writeBack_CR_WRITE_op;
  wire       [4:0]    writeBack_CR_WRITE_ba;
  wire       [4:0]    writeBack_CR_WRITE_bb;
  wire       [4:0]    writeBack_CR_WRITE_bt;
  wire       [31:0]   writeBack_CR_WRITE_imm;
  wire       [7:0]    writeBack_CR_WRITE_fxm;
  wire       `CRBusCmdEnum_defaultEncoding_type _zz_88_;
  wire       [4:0]    lastStageRegFileWrite_payload_address /* verilator public */ ;
  wire                _zz_89_;
  wire       `TgtCtrlEnum_defaultEncoding_type decode_DECODER_stageables_26;
  wire       `TgtCtrlEnum_defaultEncoding_type _zz_90_;
  wire       [31:0]   decode_INSTRUCTION_ANTICIPATED;
  wire                decode;
  wire                decode_LEGAL_INSTRUCTION;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_91_;
  wire       `CRMoveCtrlEnum_defaultEncoding_type _zz_92_;
  wire       `AluRimiCtrlEnum_defaultEncoding_type _zz_93_;
  wire       `AluRimiAmtEnum_defaultEncoding_type _zz_94_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_95_;
  wire       `DataSizeEnum_defaultEncoding_type _zz_96_;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_97_;
  wire       `TgtCtrlEnum_defaultEncoding_type _zz_98_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_99_;
  wire       `CRLogCtrlEnum_defaultEncoding_type _zz_100_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_101_;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_102_;
  wire       `Src3CtrlEnum_defaultEncoding_type _zz_103_;
  wire       `AluSpecCtrlEnum_defaultEncoding_type _zz_104_;
  reg        [31:0]   lastStageRegFileWrite_payload_data /* verilator public */ ;
  wire                writeBack_SIGN_EXTEND;
  wire       `DataSizeEnum_defaultEncoding_type writeBack_DATA_SIZE;
  wire       `DataSizeEnum_defaultEncoding_type _zz_105_;
  wire       [1:0]    writeBack_MEMORY_ADDRESS_LOW;
  wire                writeBack_MEMORY_WR;
  wire       `EndianEnum_defaultEncoding_type writeBack_MSR_ENDIAN;
  wire       `EndianEnum_defaultEncoding_type _zz_106_;
  wire       [31:0]   writeBack_REGFILE_WRITE_DATA;
  wire                writeBack_MEMORY_ENABLE;
  wire       [31:0]   memory_REGFILE_WRITE_DATA;
  wire                memory_MEMORY_ENABLE;
  reg        [31:0]   _zz_107_;
  wire                execute_STORE_UPDATE;
  wire                execute_MEMORY_MANAGMENT;
  wire       [31:0]   execute_RS;
  wire                execute_MEMORY_WR;
  wire       [31:0]   execute_SRC_ADD;
  wire                execute_MEMORY_ENABLE;
  wire       `DataSizeEnum_defaultEncoding_type execute_DATA_SIZE;
  wire       `DataSizeEnum_defaultEncoding_type _zz_108_;
  wire       [31:0]   execute_INSTRUCTION;
  wire       `EndianEnum_defaultEncoding_type execute_MSR_ENDIAN;
  wire       `EndianEnum_defaultEncoding_type _zz_109_;
  wire                decode_MEMORY_ENABLE;
  wire                decode_FLUSH_ALL;
  reg                 _zz_110_;
  reg                 _zz_110__3;
  reg                 _zz_110__2;
  reg                 _zz_110__1;
  reg                 _zz_110__0;
  wire       [31:0]   decode_INSTRUCTION;
  reg        [31:0]   _zz_111_;
  wire       `EndianEnum_defaultEncoding_type decode_MSR_ENDIAN;
  wire       `EndianEnum_defaultEncoding_type _zz_112_;
  wire                memory_PREDICTION_CONTEXT_hazard;
  wire                memory_PREDICTION_CONTEXT_hit;
  wire       [27:0]   memory_PREDICTION_CONTEXT_line_source;
  wire       [1:0]    memory_PREDICTION_CONTEXT_line_branchWish;
  wire       [31:0]   memory_PREDICTION_CONTEXT_line_target;
  reg                 _zz_113_;
  reg        [31:0]   _zz_114_;
  wire       [31:0]   decode_PC;
  wire       [31:0]   writeBack_PC;
  wire       [31:0]   writeBack_INSTRUCTION;
  wire                sprReadBU_valid;
  wire       [31:0]   sprReadBU_payload_data;
  wire                sprReadSPR_valid;
  wire       [31:0]   sprReadSPR_payload_data;
  reg                 decode_arbitration_haltItself;
  reg                 decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  wire                decode_arbitration_flushNext;
  wire                decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  reg                 execute_arbitration_haltItself;
  reg                 execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  wire                execute_arbitration_flushIt;
  wire                execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  reg                 memory_arbitration_haltItself;
  wire                memory_arbitration_haltByOther;
  reg                 memory_arbitration_removeIt;
  wire                memory_arbitration_flushIt;
  reg                 memory_arbitration_flushNext;
  reg                 memory_arbitration_isValid;
  wire                memory_arbitration_isStuck;
  wire                memory_arbitration_isStuckByOthers;
  wire                memory_arbitration_isFlushed;
  wire                memory_arbitration_isMoving;
  wire                memory_arbitration_isFiring;
  reg                 writeBack_arbitration_haltItself;
  wire                writeBack_arbitration_haltByOther;
  reg                 writeBack_arbitration_removeIt;
  reg                 writeBack_arbitration_flushIt;
  reg                 writeBack_arbitration_flushNext;
  reg                 writeBack_arbitration_isValid;
  wire                writeBack_arbitration_isStuck;
  wire                writeBack_arbitration_isStuckByOthers;
  wire                writeBack_arbitration_isFlushed;
  wire                writeBack_arbitration_isMoving;
  wire                writeBack_arbitration_isFiring;
  wire       [31:0]   lastStageInstruction /* verilator public */ ;
  wire       [31:0]   lastStagePc /* verilator public */ ;
  wire                lastStageIsValid /* verilator public */ ;
  wire                lastStageIsFiring /* verilator public */ ;
  reg                 IBusCachedPlugin_fetcherHalt;
  reg                 IBusCachedPlugin_incomingInstruction;
  wire                IBusCachedPlugin_fetchPrediction_cmd_hadBranch;
  wire       [31:0]   IBusCachedPlugin_fetchPrediction_cmd_targetPc;
  wire                IBusCachedPlugin_fetchPrediction_rsp_wasRight;
  wire       [31:0]   IBusCachedPlugin_fetchPrediction_rsp_finalPc;
  wire       [31:0]   IBusCachedPlugin_fetchPrediction_rsp_sourceLastWord;
  wire                IBusCachedPlugin_pcValids_0;
  wire                IBusCachedPlugin_pcValids_1;
  wire                IBusCachedPlugin_pcValids_2;
  wire                IBusCachedPlugin_pcValids_3;
  reg                 IBusCachedPlugin_decodeExceptionPort_valid;
  reg        [3:0]    IBusCachedPlugin_decodeExceptionPort_payload_code;
  reg        [31:0]   IBusCachedPlugin_decodeExceptionPort_payload_badAddr;
  reg        `ExcpEnum_defaultEncoding_type IBusCachedPlugin_decodeExceptionPort_payload_codePPC;
  wire       [6:0]    IBusCachedPlugin_decodeExceptionPort_payload_imm;
  wire                IBusCachedPlugin_mmuBus_cmd_isValid;
  wire       [31:0]   IBusCachedPlugin_mmuBus_cmd_virtualAddress;
  wire                IBusCachedPlugin_mmuBus_cmd_bypassTranslation;
  wire       [31:0]   IBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                IBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                IBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                IBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                IBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                IBusCachedPlugin_mmuBus_rsp_exception;
  wire                IBusCachedPlugin_mmuBus_rsp_refilling;
  wire                IBusCachedPlugin_mmuBus_spr_valid;
  wire       [9:0]    IBusCachedPlugin_mmuBus_spr_payload_id;
  wire       [31:0]   IBusCachedPlugin_mmuBus_spr_payload_data;
  wire                IBusCachedPlugin_mmuBus_end;
  wire                IBusCachedPlugin_mmuBus_busy;
  wire                DBusCachedPlugin_mmuBus_cmd_isValid;
  wire       [31:0]   DBusCachedPlugin_mmuBus_cmd_virtualAddress;
  wire                DBusCachedPlugin_mmuBus_cmd_bypassTranslation;
  wire       [31:0]   DBusCachedPlugin_mmuBus_rsp_physicalAddress;
  wire                DBusCachedPlugin_mmuBus_rsp_isIoAccess;
  wire                DBusCachedPlugin_mmuBus_rsp_allowRead;
  wire                DBusCachedPlugin_mmuBus_rsp_allowWrite;
  wire                DBusCachedPlugin_mmuBus_rsp_allowExecute;
  wire                DBusCachedPlugin_mmuBus_rsp_exception;
  wire                DBusCachedPlugin_mmuBus_rsp_refilling;
  wire                DBusCachedPlugin_mmuBus_spr_valid;
  wire       [9:0]    DBusCachedPlugin_mmuBus_spr_payload_id;
  wire       [31:0]   DBusCachedPlugin_mmuBus_spr_payload_data;
  wire                DBusCachedPlugin_mmuBus_end;
  wire                DBusCachedPlugin_mmuBus_busy;
  reg                 DBusCachedPlugin_redoBranch_valid;
  wire       [31:0]   DBusCachedPlugin_redoBranch_payload;
  reg                 DBusCachedPlugin_exceptionBus_valid;
  reg        [3:0]    DBusCachedPlugin_exceptionBus_payload_code;
  reg        [31:0]   DBusCachedPlugin_exceptionBus_payload_badAddr;
  reg        `ExcpEnum_defaultEncoding_type DBusCachedPlugin_exceptionBus_payload_codePPC;
  wire       [6:0]    DBusCachedPlugin_exceptionBus_payload_imm;
  reg                 decodeExceptionPort_valid;
  reg        [3:0]    decodeExceptionPort_payload_code;
  reg        [31:0]   decodeExceptionPort_payload_badAddr;
  reg        `ExcpEnum_defaultEncoding_type decodeExceptionPort_payload_codePPC;
  wire       [6:0]    decodeExceptionPort_payload_imm;
  wire                BranchPlugin_jumpInterface_valid;
  wire       [31:0]   BranchPlugin_jumpInterface_payload;
  wire                BranchPlugin_branchExceptionPort_valid;
  wire       [3:0]    BranchPlugin_branchExceptionPort_payload_code;
  reg        [31:0]   BranchPlugin_branchExceptionPort_payload_badAddr;
  wire       `ExcpEnum_defaultEncoding_type BranchPlugin_branchExceptionPort_payload_codePPC;
  wire       [6:0]    BranchPlugin_branchExceptionPort_payload_imm;
  reg                 SPRPlugin_jumpInterface_valid;
  reg        [31:0]   SPRPlugin_jumpInterface_payload;
  wire                SPRPlugin_exceptionPendings_0;
  wire                SPRPlugin_exceptionPendings_1;
  wire                SPRPlugin_exceptionPendings_2;
  wire                SPRPlugin_exceptionPendings_3;
  wire                contextSwitching;
  wire       [1:0]    SPRPlugin_privilege;
  wire                SPRPlugin_forceMachineWire;
  reg                 SPRPlugin_msr_ir;
  wire                SPRPlugin_msr_dr;
  wire                SPRPlugin_msr_pr;
  reg                 SPRPlugin_selfException_valid;
  reg        [3:0]    SPRPlugin_selfException_payload_code;
  reg        [31:0]   SPRPlugin_selfException_payload_badAddr;
  reg        `ExcpEnum_defaultEncoding_type SPRPlugin_selfException_payload_codePPC;
  reg        [6:0]    SPRPlugin_selfException_payload_imm;
  wire                SPRPlugin_allowInterrupts;
  wire                SPRPlugin_allowException;
  wire                IBusCachedPlugin_externalFlush;
  wire                IBusCachedPlugin_jump_pcLoad_valid;
  wire       [31:0]   IBusCachedPlugin_jump_pcLoad_payload;
  wire                IBusCachedPlugin_fetchPc_output_valid;
  wire                IBusCachedPlugin_fetchPc_output_ready;
  wire       [31:0]   IBusCachedPlugin_fetchPc_output_payload;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pcReg /* verilator public */ ;
  reg                 IBusCachedPlugin_fetchPc_correction;
  reg                 IBusCachedPlugin_fetchPc_correctionReg;
  wire                IBusCachedPlugin_fetchPc_corrected;
  wire                IBusCachedPlugin_fetchPc_pcRegPropagate;
  reg                 IBusCachedPlugin_fetchPc_booted;
  reg                 IBusCachedPlugin_fetchPc_inc;
  reg        [31:0]   IBusCachedPlugin_fetchPc_pc;
  wire                IBusCachedPlugin_fetchPc_predictionPcLoad_valid;
  wire       [31:0]   IBusCachedPlugin_fetchPc_predictionPcLoad_payload;
  wire                IBusCachedPlugin_fetchPc_redo_valid;
  wire       [31:0]   IBusCachedPlugin_fetchPc_redo_payload;
  reg                 IBusCachedPlugin_fetchPc_flushed;
  reg                 IBusCachedPlugin_iBusRsp_redoFetch;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_0_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_0_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_0_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_1_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_1_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_1_halt;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_input_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  wire                IBusCachedPlugin_iBusRsp_stages_2_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  reg                 IBusCachedPlugin_iBusRsp_stages_2_halt;
  wire                _zz_115_;
  wire                _zz_116_;
  wire                _zz_117_;
  wire                IBusCachedPlugin_iBusRsp_flush;
  wire                _zz_118_;
  reg                 _zz_119_;
  reg        [31:0]   _zz_120_;
  wire                _zz_121_;
  reg                 _zz_122_;
  reg        [31:0]   _zz_123_;
  reg                 IBusCachedPlugin_iBusRsp_readyForError;
  wire                IBusCachedPlugin_iBusRsp_output_valid;
  wire                IBusCachedPlugin_iBusRsp_output_ready;
  wire       [31:0]   IBusCachedPlugin_iBusRsp_output_payload_pc;
  wire                IBusCachedPlugin_iBusRsp_output_payload_rsp_error;
  reg        [31:0]   IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  wire                IBusCachedPlugin_iBusRsp_output_payload_isRvc;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_0;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_1;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_2;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_3;
  reg                 IBusCachedPlugin_injector_nextPcCalc_valids_4;
  wire                IBusCachedPlugin_predictor_historyWriteDelayPatched_valid;
  wire       [1:0]    IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_address;
  wire       [27:0]   IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_data_source;
  wire       [1:0]    IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_data_branchWish;
  wire       [31:0]   IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_data_target;
  reg                 IBusCachedPlugin_predictor_historyWrite_valid;
  wire       [1:0]    IBusCachedPlugin_predictor_historyWrite_payload_address;
  wire       [27:0]   IBusCachedPlugin_predictor_historyWrite_payload_data_source;
  reg        [1:0]    IBusCachedPlugin_predictor_historyWrite_payload_data_branchWish;
  wire       [31:0]   IBusCachedPlugin_predictor_historyWrite_payload_data_target;
  reg                 IBusCachedPlugin_predictor_writeLast_valid;
  reg        [1:0]    IBusCachedPlugin_predictor_writeLast_payload_address;
  reg        [27:0]   IBusCachedPlugin_predictor_writeLast_payload_data_source;
  reg        [1:0]    IBusCachedPlugin_predictor_writeLast_payload_data_branchWish;
  reg        [31:0]   IBusCachedPlugin_predictor_writeLast_payload_data_target;
  wire       [29:0]   _zz_124_;
  wire       [27:0]   IBusCachedPlugin_predictor_buffer_line_source;
  wire       [1:0]    IBusCachedPlugin_predictor_buffer_line_branchWish;
  wire       [31:0]   IBusCachedPlugin_predictor_buffer_line_target;
  wire       [61:0]   _zz_125_;
  reg                 IBusCachedPlugin_predictor_buffer_pcCorrected;
  wire                IBusCachedPlugin_predictor_buffer_hazard;
  reg        [27:0]   IBusCachedPlugin_predictor_line_source;
  reg        [1:0]    IBusCachedPlugin_predictor_line_branchWish;
  reg        [31:0]   IBusCachedPlugin_predictor_line_target;
  reg                 IBusCachedPlugin_predictor_buffer_hazard_regNextWhen;
  wire                IBusCachedPlugin_predictor_hazard;
  wire                IBusCachedPlugin_predictor_hit;
  wire                IBusCachedPlugin_predictor_fetchContext_hazard;
  wire                IBusCachedPlugin_predictor_fetchContext_hit;
  wire       [27:0]   IBusCachedPlugin_predictor_fetchContext_line_source;
  wire       [1:0]    IBusCachedPlugin_predictor_fetchContext_line_branchWish;
  wire       [31:0]   IBusCachedPlugin_predictor_fetchContext_line_target;
  reg                 IBusCachedPlugin_predictor_iBusRspContext_hazard;
  reg                 IBusCachedPlugin_predictor_iBusRspContext_hit;
  reg        [27:0]   IBusCachedPlugin_predictor_iBusRspContext_line_source;
  reg        [1:0]    IBusCachedPlugin_predictor_iBusRspContext_line_branchWish;
  reg        [31:0]   IBusCachedPlugin_predictor_iBusRspContext_line_target;
  wire                IBusCachedPlugin_predictor_iBusRspContextOutput_hazard;
  wire                IBusCachedPlugin_predictor_iBusRspContextOutput_hit;
  wire       [27:0]   IBusCachedPlugin_predictor_iBusRspContextOutput_line_source;
  wire       [1:0]    IBusCachedPlugin_predictor_iBusRspContextOutput_line_branchWish;
  wire       [31:0]   IBusCachedPlugin_predictor_iBusRspContextOutput_line_target;
  wire                IBusCachedPlugin_predictor_injectorContext_hazard;
  wire                IBusCachedPlugin_predictor_injectorContext_hit;
  wire       [27:0]   IBusCachedPlugin_predictor_injectorContext_line_source;
  wire       [1:0]    IBusCachedPlugin_predictor_injectorContext_line_branchWish;
  wire       [31:0]   IBusCachedPlugin_predictor_injectorContext_line_target;
  wire                iBus_cmd_valid;
  wire                iBus_cmd_ready;
  reg        [31:0]   iBus_cmd_payload_address;
  wire       [2:0]    iBus_cmd_payload_size;
  wire                iBus_rsp_valid;
  wire       [31:0]   iBus_rsp_payload_data;
  wire                iBus_rsp_payload_error;
  wire       [31:0]   _zz_126_;
  reg        [31:0]   IBusCachedPlugin_rspCounter;
  wire                IBusCachedPlugin_s0_tightlyCoupledHit;
  wire                IBusCachedPlugin_s1_bigEndian;
  reg                 IBusCachedPlugin_s1_tightlyCoupledHit;
  wire                IBusCachedPlugin_s2_bigEndian;
  reg                 IBusCachedPlugin_s2_tightlyCoupledHit;
  wire                IBusCachedPlugin_rsp_iBusRspOutputHalt;
  wire                IBusCachedPlugin_rsp_issueDetected;
  reg                 IBusCachedPlugin_rsp_redoFetch;
  wire                IBusCachedPlugin_rsp_bigEndian;
  wire                dBus_cmd_valid;
  wire                dBus_cmd_ready;
  wire                dBus_cmd_payload_wr;
  wire       [31:0]   dBus_cmd_payload_address;
  wire       [31:0]   dBus_cmd_payload_data;
  wire       [3:0]    dBus_cmd_payload_mask;
  wire       [2:0]    dBus_cmd_payload_length;
  wire                dBus_cmd_payload_last;
  wire                dBus_rsp_valid;
  wire       [31:0]   dBus_rsp_payload_data;
  wire                dBus_rsp_payload_error;
  wire                dataCache_1__io_mem_cmd_m2sPipe_valid;
  wire                dataCache_1__io_mem_cmd_m2sPipe_ready;
  wire                dataCache_1__io_mem_cmd_m2sPipe_payload_wr;
  wire       [31:0]   dataCache_1__io_mem_cmd_m2sPipe_payload_address;
  wire       [31:0]   dataCache_1__io_mem_cmd_m2sPipe_payload_data;
  wire       [3:0]    dataCache_1__io_mem_cmd_m2sPipe_payload_mask;
  wire       [2:0]    dataCache_1__io_mem_cmd_m2sPipe_payload_length;
  wire                dataCache_1__io_mem_cmd_m2sPipe_payload_last;
  reg                 dataCache_1__io_mem_cmd_m2sPipe_rValid;
  reg                 dataCache_1__io_mem_cmd_m2sPipe_rData_wr;
  reg        [31:0]   dataCache_1__io_mem_cmd_m2sPipe_rData_address;
  reg        [31:0]   dataCache_1__io_mem_cmd_m2sPipe_rData_data;
  reg        [3:0]    dataCache_1__io_mem_cmd_m2sPipe_rData_mask;
  reg        [2:0]    dataCache_1__io_mem_cmd_m2sPipe_rData_length;
  reg                 dataCache_1__io_mem_cmd_m2sPipe_rData_last;
  wire       [31:0]   _zz_127_;
  reg        [31:0]   DBusCachedPlugin_rspCounter;
  wire                execute_DBusCachedPlugin_bigEndian;
  reg        [1:0]    execute_DBusCachedPlugin_size;
  reg        [31:0]   _zz_128_;
  wire       [15:0]   _zz_129_;
  wire       [15:0]   _zz_130_;
  reg        [31:0]   _zz_131_;
  wire                writeBack_DBusCachedPlugin_bigEndian;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspShifted;
  reg        [31:0]   writeBack_DBusCachedPlugin_rspFormated;
  reg        [15:0]   writeBack_DBusCachedPlugin_rspHW;
  wire       [15:0]   _zz_132_;
  wire       [15:0]   _zz_133_;
  wire                _zz_134_;
  reg        [15:0]   _zz_135_;
  wire       [79:0]   _zz_136_;
  wire                _zz_137_;
  wire                _zz_138_;
  wire                _zz_139_;
  wire                _zz_140_;
  wire                _zz_141_;
  wire                _zz_142_;
  wire                _zz_143_;
  wire                _zz_144_;
  wire                _zz_145_;
  wire                _zz_146_;
  wire                _zz_147_;
  wire                _zz_148_;
  wire                _zz_149_;
  wire                _zz_150_;
  wire                _zz_151_;
  wire                _zz_152_;
  wire                _zz_153_;
  wire                _zz_154_;
  wire                _zz_155_;
  wire                _zz_156_;
  wire                _zz_157_;
  wire                _zz_158_;
  wire                _zz_159_;
  wire                _zz_160_;
  wire                _zz_161_;
  wire                _zz_162_;
  wire                _zz_163_;
  wire                _zz_164_;
  wire                _zz_165_;
  wire                _zz_166_;
  wire                _zz_167_;
  wire                _zz_168_;
  wire                _zz_169_;
  wire                _zz_170_;
  wire                _zz_171_;
  wire                _zz_172_;
  wire                _zz_173_;
  wire                _zz_174_;
  wire                _zz_175_;
  wire                _zz_176_;
  wire                _zz_177_;
  wire                _zz_178_;
  wire                _zz_179_;
  wire                _zz_180_;
  wire                _zz_181_;
  wire                _zz_182_;
  wire                _zz_183_;
  wire                _zz_184_;
  wire                _zz_185_;
  wire                _zz_186_;
  wire                _zz_187_;
  wire                _zz_188_;
  wire                _zz_189_;
  wire                _zz_190_;
  wire                _zz_191_;
  wire                _zz_192_;
  wire                _zz_193_;
  wire                _zz_194_;
  wire                _zz_195_;
  wire                _zz_196_;
  wire                _zz_197_;
  wire                _zz_198_;
  wire                _zz_199_;
  wire                _zz_200_;
  wire                _zz_201_;
  wire       `AluSpecCtrlEnum_defaultEncoding_type _zz_202_;
  wire       `Src3CtrlEnum_defaultEncoding_type _zz_203_;
  wire       `Src2CtrlEnum_defaultEncoding_type _zz_204_;
  wire       `EnvCtrlEnum_defaultEncoding_type _zz_205_;
  wire       `CRLogCtrlEnum_defaultEncoding_type _zz_206_;
  wire       `BranchCtrlEnum_defaultEncoding_type _zz_207_;
  wire       `TgtCtrlEnum_defaultEncoding_type _zz_208_;
  wire       `Src1CtrlEnum_defaultEncoding_type _zz_209_;
  wire       `DataSizeEnum_defaultEncoding_type _zz_210_;
  wire       `AluCtrlEnum_defaultEncoding_type _zz_211_;
  wire       `AluRimiAmtEnum_defaultEncoding_type _zz_212_;
  wire       `AluRimiCtrlEnum_defaultEncoding_type _zz_213_;
  wire       `CRMoveCtrlEnum_defaultEncoding_type _zz_214_;
  wire       `AluBitwiseCtrlEnum_defaultEncoding_type _zz_215_;
  reg                 _zz_216_;
  wire       [4:0]    decode_RegFilePluginComp_regFileReadAddress1;
  wire       [4:0]    decode_RegFilePluginComp_regFileReadAddress2;
  wire       [4:0]    decode_RegFilePluginComp_regFileReadAddress3;
  reg        [4:0]    _zz_217_;
  wire                UpdateRegFileWrite_valid /* verilator public */ ;
  wire                UpdateRegFileWrite_payload_valid /* verilator public */ ;
  wire       [4:0]    UpdateRegFileWrite_payload_address /* verilator public */ ;
  wire       [31:0]   UpdateRegFileWrite_payload_data /* verilator public */ ;
  wire                lastStageRegFileWrite_valid /* verilator public */ ;
  reg                 writeBack_RegFilePluginComp_crBusPort_valid;
  reg        `CRBusCmdEnum_defaultEncoding_type writeBack_RegFilePluginComp_crBusPort_payload_op;
  wire       [4:0]    writeBack_RegFilePluginComp_crBusPort_payload_ba;
  wire       [4:0]    writeBack_RegFilePluginComp_crBusPort_payload_bb;
  wire       [4:0]    writeBack_RegFilePluginComp_crBusPort_payload_bt;
  reg        [31:0]   writeBack_RegFilePluginComp_crBusPort_payload_imm;
  wire       [7:0]    writeBack_RegFilePluginComp_crBusPort_payload_fxm;
  reg                 writeBack_RegFilePluginComp_xerBusPort_valid;
  wire                writeBack_RegFilePluginComp_xerBusPort_payload_validOV;
  wire                writeBack_RegFilePluginComp_xerBusPort_payload_validCA;
  wire       [1:0]    writeBack_RegFilePluginComp_xerBusPort_payload_imm;
  reg                 writeBack_RegFilePluginComp_sprWriteXERPort_valid;
  wire       [9:0]    writeBack_RegFilePluginComp_sprWriteXERPort_payload_id;
  wire       [31:0]   writeBack_RegFilePluginComp_sprWriteXERPort_payload_data;
  reg                 writeBack_RegFilePluginComp_sprWriteCLTPort_valid;
  wire       [9:0]    writeBack_RegFilePluginComp_sprWriteCLTPort_payload_id;
  wire       [31:0]   writeBack_RegFilePluginComp_sprWriteCLTPort_payload_data;
  reg                 _zz_218_;
  reg                 _zz_219_;
  reg                 _zz_220_;
  reg        [1:0]    _zz_221_;
  reg                 _zz_222_;
  reg        [31:0]   execute_IntAluPluginComp_XER;
  reg                 execute_IntAluPluginComp_sprReadValid;
  reg        [4:0]    _zz_223_;
  reg        [31:0]   _zz_224_;
  reg                 _zz_225_;
  reg                 _zz_226_;
  reg        [4:0]    _zz_227_;
  reg                 execute_IntAluPluginComp_xer_ca;
  wire                execute_IntAluPluginComp_xer_ov;
  wire                execute_IntAluPluginComp_xer_so;
  wire                execute_IntAluPluginComp_xerBus_validOV;
  wire                execute_IntAluPluginComp_xerBus_validCA;
  wire       [1:0]    execute_IntAluPluginComp_xerBus_imm;
  reg        [2:0]    execute_IntAluPluginComp_alu_cr;
  reg        [2:0]    execute_IntAluPluginComp_cr0_val_a;
  wire       [3:0]    execute_IntAluPluginComp_cr0_val;
  wire                execute_IntAluPluginComp_cr_record;
  wire                execute_IntAluPluginComp_cr_mcrf;
  wire                execute_IntAluPluginComp_cr_update_valid;
  reg        `CRBusCmdEnum_defaultEncoding_type execute_IntAluPluginComp_crBus_op;
  reg        [4:0]    execute_IntAluPluginComp_crBus_ba;
  reg        [4:0]    execute_IntAluPluginComp_crBus_bb;
  reg        [4:0]    execute_IntAluPluginComp_crBus_bt;
  reg        [31:0]   execute_IntAluPluginComp_crBus_imm;
  reg        [7:0]    execute_IntAluPluginComp_crBus_fxm;
  wire       [4:0]    SRC_ra;
  wire       [4:0]    SRC_rb;
  wire       [4:0]    SRC_rs;
  wire       [4:0]    SRC_rt;
  wire                _zz_228_;
  reg        [15:0]   _zz_229_;
  reg        [31:0]   SRC_src2_other;
  wire       [31:0]   SRC_src2_m1;
  reg                 SRC_src2ctrl_other;
  wire                SRC_sel_m1;
  wire       [0:0]    SRC_src3;
  reg                 _zz_230_;
  wire       [1:0]    SRC_ADD_cmp_cr;
  reg                 _zz_231_;
  reg        [4:0]    _zz_232_;
  reg        [31:0]   _zz_233_;
  reg                 _zz_234_;
  reg        `CRBusCmdEnum_defaultEncoding_type _zz_235_;
  reg        [31:0]   _zz_236_;
  wire                MUL1_aSigned;
  wire                MUL1_bSigned;
  wire       [31:0]   MUL1_a;
  wire       [31:0]   MUL1_b;
  wire       [15:0]   MUL1_aULow;
  wire       [15:0]   MUL1_bULow;
  wire       [16:0]   MUL1_aSLow;
  wire       [16:0]   MUL1_bSLow;
  wire       [16:0]   MUL1_aHigh;
  wire       [16:0]   MUL1_bHigh;
  wire       [65:0]   MUL3_result;
  wire                MUL3_xer_ov;
  reg                 MUL3_xer_so;
  reg        [31:0]   MUL3_result32;
  wire       [1:0]    MUL3_cr;
  reg        [3:0]    MUL3_cr_decode;
  wire                MUL3_cr_record;
  reg        [32:0]   DIV_rs1;
  reg        [31:0]   DIV_rs2;
  reg        [64:0]   DIV_accumulator;
  reg                 DIV_MEM_needRevert;
  reg                 DIV_MEM_crBusPort_valid;
  reg        `CRBusCmdEnum_defaultEncoding_type DIV_MEM_crBusPort_payload_op;
  wire       [4:0]    DIV_MEM_crBusPort_payload_ba;
  wire       [4:0]    DIV_MEM_crBusPort_payload_bb;
  wire       [4:0]    DIV_MEM_crBusPort_payload_bt;
  reg        [31:0]   DIV_MEM_crBusPort_payload_imm;
  wire       [7:0]    DIV_MEM_crBusPort_payload_fxm;
  reg                 DIV_MEM_xerBusPort_valid;
  reg                 DIV_MEM_xerBusPort_payload_validOV;
  reg                 DIV_MEM_xerBusPort_payload_validCA;
  reg        [1:0]    DIV_MEM_xerBusPort_payload_imm;
  wire                DIV_MEM_rs1NeedRevert;
  wire                DIV_MEM_rs2NeedRevert;
  reg        [32:0]   DIV_MEM_rs1Extended;
  reg                 _zz_237_;
  reg        [3:0]    _zz_238_;
  reg                 _zz_239_ /* verilator public */ ;
  reg                 _zz_240_ /* verilator public */ ;
  reg                 _zz_241_ /* verilator public */ ;
  wire                Hazards_writeBackWrites_valid;
  wire       [4:0]    Hazards_writeBackWrites_payload_address;
  wire       [31:0]   Hazards_writeBackWrites_payload_data;
  reg                 Hazards_writeBackBuffer_valid;
  reg        [4:0]    Hazards_writeBackBuffer_payload_address;
  reg        [31:0]   Hazards_writeBackBuffer_payload_data;
  wire                Hazards_addr0Match;
  wire                Hazards_addr1Match;
  wire                Hazards_addr2Match;
  reg        [3:0]    _zz_242_;
  reg        [3:0]    _zz_243_;
  reg        [3:0]    _zz_244_;
  wire                _zz_245_;
  reg                 _zz_246_;
  reg                 _zz_247_;
  reg                 _zz_248_;
  reg                 _zz_249_;
  reg                 _zz_250_;
  reg                 _zz_251_;
  reg                 _zz_252_;
  reg                 _zz_253_;
  reg        [3:0]    _zz_254_;
  reg                 _zz_255_;
  reg                 _zz_256_;
  reg                 _zz_257_;
  wire                _zz_258_;
  reg                 _zz_259_;
  reg                 _zz_260_;
  wire                _zz_261_;
  reg                 _zz_262_;
  reg                 _zz_263_;
  reg                 _zz_264_;
  reg                 _zz_265_;
  reg                 _zz_266_;
  reg                 _zz_267_;
  reg                 _zz_268_;
  reg                 _zz_269_;
  reg        [3:0]    _zz_270_;
  reg                 _zz_271_;
  reg                 _zz_272_;
  wire                _zz_273_;
  reg                 _zz_274_;
  reg                 _zz_275_;
  wire                _zz_276_;
  reg                 decode_BranchPlugin_bc;
  wire       [4:0]    decode_BranchPlugin_bi;
  wire       [2:0]    decode_BranchPlugin_crbiField;
  wire       [4:0]    decode_BranchPlugin_bo;
  wire                decode_BranchPlugin_crbiRead;
  reg        [7:0]    decode_BranchPlugin_crFieldRd;
  reg        [31:0]   execute_BranchPlugin_CR;
  reg        [31:0]   execute_BranchPlugin_CTR;
  reg        [31:0]   execute_BranchPlugin_LR;
  reg        [31:0]   execute_BranchPlugin_TAR;
  wire                execute_BranchPlugin_ctrOne;
  reg        [31:0]   execute_BranchPlugin_sprReadData;
  reg                 execute_BranchPlugin_sprReadValid;
  reg                 execute_BranchPlugin_crReadValid;
  reg        `CRBusCmdEnum_defaultEncoding_type execute_BranchPlugin_crBusPort_op;
  reg        [4:0]    execute_BranchPlugin_crBusPort_ba;
  reg        [4:0]    execute_BranchPlugin_crBusPort_bb;
  reg        [4:0]    execute_BranchPlugin_crBusPort_bt;
  reg        [31:0]   execute_BranchPlugin_crBusPort_imm;
  reg        [7:0]    execute_BranchPlugin_crBusPort_fxm;
  wire                execute_BranchPlugin_crBusPort_valid;
  reg        [3:0]    _zz_277_;
  wire       [3:0]    _zz_278_;
  wire                _zz_279_;
  reg        [5:0]    _zz_280_;
  wire       [31:0]   execute_BranchPlugin_li;
  wire                _zz_281_;
  reg        [15:0]   _zz_282_;
  wire       [31:0]   execute_BranchPlugin_bd;
  wire                _zz_283_;
  reg        [31:0]   execute_BranchPlugin_aaMask;
  reg        [31:0]   execute_BranchPlugin_branch_tgt0;
  reg        [31:0]   execute_BranchPlugin_branch_tgt1;
  wire                execute_BranchPlugin_use_li;
  wire       [31:0]   execute_BranchPlugin_branch_tgt2;
  reg        [31:0]   execute_BranchPlugin_branchAdder;
  wire       [4:0]    execute_BranchPlugin_opbi;
  wire       [2:0]    execute_BranchPlugin_crbiField;
  wire       [1:0]    execute_BranchPlugin_crbiBit;
  reg                 execute_BranchPlugin_crbi;
  wire                execute_BranchPlugin_ctrOK;
  wire       [4:0]    execute_BranchPlugin_bo;
  reg        [3:0]    execute_BranchPlugin_crBypassPort_field;
  wire       [0:0]    execute_BranchPlugin_crBypassPort_stageID;
  wire                execute_BranchPlugin_crBypassPort_valid;
  wire                execute_BranchPlugin_condOK;
  wire                execute_BranchPlugin_lk;
  reg                 _zz_284_;
  reg                 _zz_285_;
  reg                 _zz_286_;
  wire                memory_BranchPlugin_predictionMissmatch;
  reg                 MSR_VEC;
  reg                 MSR_VSX;
  reg                 MSR_EE;
  reg                 MSR_PR;
  reg                 MSR_FP;
  reg                 MSR_ME;
  reg                 MSR_FE0;
  reg                 MSR_FE1;
  reg                 MSR_IR;
  reg                 MSR_DR;
  reg                 MSR_PMM;
  reg                 MSR_RI;
  reg                 MSR_LE;
  reg        [31:0]   SPRPlugin_srr0;
  reg        [31:0]   SPRPlugin_srr1;
  reg        [31:0]   SPRPlugin_dar;
  reg        [31:0]   SPRPlugin_sprg3;
  reg        [31:0]   SPRPlugin_dsisr;
  (* ram_style = "block" *) reg        [31:0]   SPRPlugin_tb;
  wire                SPRPlugin_incTB;
  (* ram_style = "block" *) reg        [31:0]   SPRPlugin_dec;
  reg                 SPRPlugin_dec31Prev;
  reg                 SPRPlugin_intDec;
  reg                 SPRPlugin_intDecTkn;
  reg        [31:0]   SPRPlugin_minstret;
  reg                 SPRPlugin_exceptionPortCtrl_exceptionValids_decode;
  reg                 SPRPlugin_exceptionPortCtrl_exceptionValids_execute;
  reg                 SPRPlugin_exceptionPortCtrl_exceptionValids_memory;
  reg                 SPRPlugin_exceptionPortCtrl_exceptionValids_writeBack;
  reg                 SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  reg                 SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  reg                 SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  reg                 SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  reg        [3:0]    SPRPlugin_exceptionPortCtrl_exceptionContext_code;
  reg        [31:0]   SPRPlugin_exceptionPortCtrl_exceptionContext_badAddr;
  reg        `ExcpEnum_defaultEncoding_type SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC;
  reg        [6:0]    SPRPlugin_exceptionPortCtrl_exceptionContext_imm;
  wire       `ExcpEnum_defaultEncoding_type _zz_287_;
  wire       [1:0]    _zz_288_;
  wire                _zz_289_;
  wire       `ExcpEnum_defaultEncoding_type _zz_290_;
  reg                 _zz_291_;
  reg                 _zz_292_;
  reg                 _zz_293_;
  reg                 _zz_294_;
  reg                 SPRPlugin_interrupt_valid;
  reg        [3:0]    SPRPlugin_interrupt_code /* verilator public */ ;
  reg        [1:0]    SPRPlugin_interrupt_targetPrivilege;
  reg                 SPRPlugin_pipelineLiberator_pcValids_0;
  reg                 SPRPlugin_pipelineLiberator_pcValids_1;
  reg                 SPRPlugin_pipelineLiberator_pcValids_2;
  wire                SPRPlugin_pipelineLiberator_active;
  reg                 SPRPlugin_pipelineLiberator_done;
  wire                SPRPlugin_exception;
  reg        [31:0]   SPRPlugin_darSave;
  reg                 SPRPlugin_hadException;
  reg                 SPRPlugin_interruptJump /* verilator public */ ;
  reg        `ExcpEnum_defaultEncoding_type SPRPlugin_intType;
  reg        [31:0]   SPRPlugin_intSRR0;
  reg        [31:0]   _zz_295_;
  wire                execute_SPRPLUGIN_blockedBySideEffects;
  reg                 execute_SPRPLUGIN_sprHere;
  reg                 execute_SPRPLUGIN_illegalAccess;
  wire                _zz_296_;
  reg        [15:0]   _zz_297_;
  wire       [31:0]   execute_SPRPLUGIN_si;
  wire       [4:0]    execute_SPRPLUGIN_tmask;
  reg                 execute_SPRPLUGIN_trap;
  wire       [3:0]    execute_SPRPLUGIN_opExcp_code;
  wire       [31:0]   execute_SPRPLUGIN_opExcp_badAddr;
  wire       `ExcpEnum_defaultEncoding_type execute_SPRPLUGIN_opExcp_codePPC;
  wire       [6:0]    execute_SPRPLUGIN_opExcp_imm;
  reg                 _zz_298_;
  wire       [31:0]   execute_SPRPLUGIN_readData;
  wire       [31:0]   execute_SPRPLUGIN_readToWriteData;
  wire                execute_SPRPLUGIN_sprg3read;
  wire                execute_SPRPLUGIN_privViolation;
  wire                execute_SPRPLUGIN_readInstruction;
  wire                execute_SPRPLUGIN_readEnable;
  wire                execute_SPRPLUGIN_writeInstruction;
  wire                execute_SPRPLUGIN_writeEnable;
  reg        [10:0]   execute_SPRPLUGIN_SPRAddress;
  reg        [31:0]   decode_to_execute_RS;
  reg        [4:0]    decode_to_execute_R0_ADDR;
  reg        `AluRimiCtrlEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_42;
  reg                 decode_to_execute_DECODER_stageables_38;
  reg                 decode_to_execute_DECODER_stageables_10;
  reg        [31:0]   decode_to_execute_FORMAL_PC_NEXT;
  reg        [31:0]   execute_to_memory_FORMAL_PC_NEXT;
  reg        [31:0]   memory_to_writeBack_FORMAL_PC_NEXT;
  reg        `BranchCtrlEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_25;
  reg        `CRLogCtrlEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_18;
  reg        `Src2CtrlEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_12;
  reg        [31:0]   decode_to_execute_RB;
  reg                 decode_to_execute_DECODER_stageables_45;
  reg                 execute_to_memory_DECODER_stageables_45;
  reg                 memory_to_writeBack_DECODER_stageables_45;
  reg                 decode_to_execute_DECODER_stageables_41;
  reg                 execute_to_memory_BRANCH_LINK;
  reg                 memory_to_writeBack_BRANCH_LINK;
  reg        [31:0]   execute_to_memory_LOAD_UPDATE_DATA;
  reg        [31:0]   memory_to_writeBack_LOAD_UPDATE_DATA;
  reg        `AluBitwiseCtrlEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_52;
  reg        `AluCtrlEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_39;
  reg                 decode_to_execute_DECODER_stageables_31;
  reg                 execute_to_memory_DECODER_stageables_31;
  reg                 memory_to_writeBack_DECODER_stageables_31;
  reg                 decode_to_execute_DECODER_stageables_15;
  reg                 execute_to_memory_DECODER_stageables_15;
  reg                 memory_to_writeBack_DECODER_stageables_15;
  reg        `EnvCtrlEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_14;
  reg        `EnvCtrlEnum_defaultEncoding_type execute_to_memory_DECODER_stageables_14;
  reg        `EnvCtrlEnum_defaultEncoding_type memory_to_writeBack_DECODER_stageables_14;
  reg                 execute_to_memory_XER_WRITE_validOV;
  reg                 execute_to_memory_XER_WRITE_validCA;
  reg        [1:0]    execute_to_memory_XER_WRITE_imm;
  reg                 memory_to_writeBack_XER_WRITE_validOV;
  reg                 memory_to_writeBack_XER_WRITE_validCA;
  reg        [1:0]    memory_to_writeBack_XER_WRITE_imm;
  reg                 decode_to_execute_DECODER_stageables_57;
  reg                 execute_to_memory_DECODER_stageables_57;
  reg                 decode_to_execute_DECODER_stageables_20;
  reg                 execute_to_memory_DECODER_stageables_20;
  reg                 memory_to_writeBack_DECODER_stageables_20;
  reg        [33:0]   execute_to_memory_MUL_HL;
  reg        [1:0]    execute_to_memory_MEMORY_ADDRESS_LOW;
  reg        [1:0]    memory_to_writeBack_MEMORY_ADDRESS_LOW;
  reg                 decode_to_execute_DECODER_stageables_55;
  reg                 execute_to_memory_DECODER_stageables_55;
  reg                 decode_to_execute_DECODER_stageables_17;
  reg                 execute_to_memory_DECODER_stageables_17;
  reg                 memory_to_writeBack_DECODER_stageables_17;
  reg        [31:0]   execute_to_memory_BRANCH_CALC;
  reg                 decode_to_execute_DECODER_stageables_36;
  reg        `AluSpecCtrlEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_1;
  reg                 decode_to_execute_PREDICTION_CONTEXT_hazard;
  reg                 decode_to_execute_PREDICTION_CONTEXT_hit;
  reg        [27:0]   decode_to_execute_PREDICTION_CONTEXT_line_source;
  reg        [1:0]    decode_to_execute_PREDICTION_CONTEXT_line_branchWish;
  reg        [31:0]   decode_to_execute_PREDICTION_CONTEXT_line_target;
  reg                 execute_to_memory_PREDICTION_CONTEXT_hazard;
  reg                 execute_to_memory_PREDICTION_CONTEXT_hit;
  reg        [27:0]   execute_to_memory_PREDICTION_CONTEXT_line_source;
  reg        [1:0]    execute_to_memory_PREDICTION_CONTEXT_line_branchWish;
  reg        [31:0]   execute_to_memory_PREDICTION_CONTEXT_line_target;
  reg                 decode_to_execute_DECODER_stageables_47;
  reg                 execute_to_memory_DECODER_stageables_47;
  reg                 memory_to_writeBack_DECODER_stageables_47;
  reg                 decode_to_execute_DECODER_stageables_6;
  reg        [4:0]    execute_to_memory_LOAD_UPDATE_ADDR;
  reg        [4:0]    memory_to_writeBack_LOAD_UPDATE_ADDR;
  reg        [31:0]   execute_to_memory_NEXT_PC2;
  reg        [1:0]    execute_to_memory_SRC_CR;
  reg        [1:0]    memory_to_writeBack_SRC_CR;
  reg                 decode_to_execute_DECODER_stageables_21;
  reg                 execute_to_memory_DECODER_stageables_21;
  reg                 memory_to_writeBack_DECODER_stageables_21;
  reg        `AluRimiAmtEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_40;
  reg                 decode_to_execute_DECODER_stageables_56;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memory_INSTRUCTION;
  reg        [31:0]   memory_to_writeBack_INSTRUCTION;
  reg        [31:0]   decode_to_execute_RA;
  reg        [33:0]   execute_to_memory_MUL_LH;
  reg                 decode_to_execute_DECODER_stageables_5;
  reg        [51:0]   memory_to_writeBack_MUL_LOW;
  reg                 decode_to_execute_DECODER_stageables_34;
  reg                 execute_to_memory_DECODER_stageables_34;
  reg                 memory_to_writeBack_DECODER_stageables_34;
  reg                 decode_to_execute_DECODER_stageables_33;
  reg                 decode_to_execute_DECODER_stageables_28;
  reg                 decode_to_execute_DECODER_stageables_53;
  reg                 execute_to_memory_DECODER_stageables_53;
  reg        [10:0]   execute_to_memory_SPR_ID;
  reg        [10:0]   memory_to_writeBack_SPR_ID;
  reg        [31:0]   execute_to_memory_MUL_LL;
  reg        [7:0]    decode_to_execute_CR_FIELD_RD;
  reg                 decode_to_execute_DECODER_stageables_3;
  reg                 decode_to_execute_DECODER_stageables_13;
  reg        [33:0]   execute_to_memory_MUL_HH;
  reg        [33:0]   memory_to_writeBack_MUL_HH;
  reg                 decode_to_execute_DECODER_stageables_51;
  reg                 decode_to_execute_DECODER_stageables_9;
  reg                 execute_to_memory_XER_SO;
  reg                 memory_to_writeBack_XER_SO;
  reg                 execute_to_memory_BRANCH_DO;
  reg                 decode_to_execute_DECODER_stageables_23;
  reg        [7:0]    execute_to_memory_CR_FIELD_WR;
  reg        [7:0]    memory_to_writeBack_CR_FIELD_WR;
  reg                 decode_to_execute_DECODER_stageables_48;
  reg                 execute_to_memory_DECODER_stageables_48;
  reg                 memory_to_writeBack_DECODER_stageables_48;
  reg        [31:0]   execute_to_memory_SRC_ADD;
  reg        [31:0]   memory_to_writeBack_SRC_ADD;
  reg        `EndianEnum_defaultEncoding_type decode_to_execute_MSR_ENDIAN;
  reg        `EndianEnum_defaultEncoding_type execute_to_memory_MSR_ENDIAN;
  reg        `EndianEnum_defaultEncoding_type memory_to_writeBack_MSR_ENDIAN;
  reg        `DataSizeEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_32;
  reg        `DataSizeEnum_defaultEncoding_type execute_to_memory_DECODER_stageables_32;
  reg        `DataSizeEnum_defaultEncoding_type memory_to_writeBack_DECODER_stageables_32;
  reg                 decode_to_execute_DECODER_stageables_50;
  reg        `CRMoveCtrlEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_49;
  reg        [4:0]    decode_to_execute_RT_ADDR;
  reg        [4:0]    execute_to_memory_RT_ADDR;
  reg        [4:0]    memory_to_writeBack_RT_ADDR;
  reg                 decode_to_execute_DECODER_stageables_7;
  reg                 execute_to_memory_DECODER_stageables_7;
  reg                 memory_to_writeBack_DECODER_stageables_7;
  reg                 decode_to_execute_DECODER_stageables_54;
  reg                 decode_to_execute_DECODER_stageables_0;
  reg        [31:0]   execute_to_memory_REGFILE_WRITE_DATA;
  reg        [31:0]   memory_to_writeBack_REGFILE_WRITE_DATA;
  reg                 decode_to_execute_DECODER_stageables_22;
  reg                 decode_to_execute_DECODER_stageables_37;
  reg                 execute_to_memory_DECODER_stageables_37;
  reg                 memory_to_writeBack_DECODER_stageables_37;
  reg                 decode_to_execute_DECODER_stageables_16;
  reg        `CRBusCmdEnum_defaultEncoding_type execute_to_memory_CR_WRITE_op;
  reg        [4:0]    execute_to_memory_CR_WRITE_ba;
  reg        [4:0]    execute_to_memory_CR_WRITE_bb;
  reg        [4:0]    execute_to_memory_CR_WRITE_bt;
  reg        [31:0]   execute_to_memory_CR_WRITE_imm;
  reg        [7:0]    execute_to_memory_CR_WRITE_fxm;
  reg        `CRBusCmdEnum_defaultEncoding_type memory_to_writeBack_CR_WRITE_op;
  reg        [4:0]    memory_to_writeBack_CR_WRITE_ba;
  reg        [4:0]    memory_to_writeBack_CR_WRITE_bb;
  reg        [4:0]    memory_to_writeBack_CR_WRITE_bt;
  reg        [31:0]   memory_to_writeBack_CR_WRITE_imm;
  reg        [7:0]    memory_to_writeBack_CR_WRITE_fxm;
  reg        `Src3CtrlEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_8;
  reg        `Src1CtrlEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_27;
  reg                 decode_to_execute_DECODER_stageables_29;
  reg                 decode_to_execute_DECODER_stageables_35;
  reg                 execute_to_memory_DECODER_stageables_35;
  reg        [31:0]   execute_to_memory_SRC1;
  reg        [31:0]   memory_to_writeBack_SRC1;
  reg                 execute_to_memory_BRANCH_DEC;
  reg                 memory_to_writeBack_BRANCH_DEC;
  reg                 execute_to_memory_TARGET_MISSMATCH2;
  reg        [31:0]   decode_to_execute_PC;
  reg        [31:0]   execute_to_memory_PC;
  reg        [31:0]   memory_to_writeBack_PC;
  reg                 decode_to_execute_DECODER_stageables_43;
  reg        `TgtCtrlEnum_defaultEncoding_type decode_to_execute_DECODER_stageables_26;
  reg                 decode_to_execute_DECODER_stageables_30;
  reg        [4:0]    execute_to_memory_REGFILE_WRITE_ADDR;
  reg        [4:0]    memory_to_writeBack_REGFILE_WRITE_ADDR;
  reg        [10:0]   _zz_299_;
  reg                 execute_SPRPLUGIN_SPR_1025;
  reg                 execute_SPRPLUGIN_SPR_26;
  reg                 execute_SPRPLUGIN_SPR_27;
  reg                 execute_SPRPLUGIN_SPR_19;
  reg                 execute_SPRPLUGIN_SPR_259;
  reg                 execute_SPRPLUGIN_SPR_18;
  reg                 execute_SPRPLUGIN_SPR_268;
  reg                 execute_SPRPLUGIN_SPR_22;
  reg        [31:0]   _zz_300_;
  reg        [31:0]   _zz_301_;
  reg        [31:0]   _zz_302_;
  reg        [31:0]   _zz_303_;
  reg        [31:0]   _zz_304_;
  reg        [31:0]   _zz_305_;
  reg        [31:0]   _zz_306_;
  reg        [31:0]   _zz_307_;
  reg        [2:0]    _zz_308_;
  reg                 _zz_309_;
  reg        [31:0]   iBusWB_DAT_MISO_regNext;
  reg        [2:0]    _zz_310_;
  wire                _zz_311_;
  wire                _zz_312_;
  wire                _zz_313_;
  wire                _zz_314_;
  wire                _zz_315_;
  reg                 _zz_316_;
  reg        [31:0]   dBusWB_DAT_MISO_regNext;
  `ifndef SYNTHESIS
  reg [15:0] _zz_1__string;
  reg [15:0] _zz_2__string;
  reg [47:0] decode_DECODER_stageables_27_string;
  reg [47:0] _zz_3__string;
  reg [47:0] _zz_4__string;
  reg [47:0] _zz_5__string;
  reg [31:0] decode_DECODER_stageables_8_string;
  reg [31:0] _zz_6__string;
  reg [31:0] _zz_7__string;
  reg [31:0] _zz_8__string;
  reg [47:0] _zz_9__string;
  reg [47:0] _zz_10__string;
  reg [47:0] execute_CR_WRITE_op_string;
  reg [47:0] _zz_11__string;
  reg [47:0] _zz_12__string;
  reg [47:0] _zz_13__string;
  reg [47:0] decode_DECODER_stageables_49_string;
  reg [47:0] _zz_14__string;
  reg [47:0] _zz_15__string;
  reg [47:0] _zz_16__string;
  reg [15:0] memory_DECODER_stageables_32_string;
  reg [15:0] _zz_17__string;
  reg [15:0] _zz_18__string;
  reg [15:0] _zz_19__string;
  reg [15:0] _zz_20__string;
  reg [15:0] _zz_21__string;
  reg [15:0] decode_DECODER_stageables_32_string;
  reg [15:0] _zz_22__string;
  reg [15:0] _zz_23__string;
  reg [15:0] _zz_24__string;
  reg [15:0] memory_MSR_ENDIAN_string;
  reg [15:0] _zz_25__string;
  reg [15:0] _zz_26__string;
  reg [15:0] _zz_27__string;
  reg [15:0] _zz_28__string;
  reg [15:0] _zz_29__string;
  reg [15:0] _zz_30__string;
  reg [15:0] _zz_31__string;
  reg [23:0] decode_DECODER_stageables_40_string;
  reg [23:0] _zz_32__string;
  reg [23:0] _zz_33__string;
  reg [23:0] _zz_34__string;
  reg [55:0] decode_DECODER_stageables_1_string;
  reg [55:0] _zz_35__string;
  reg [55:0] _zz_36__string;
  reg [55:0] _zz_37__string;
  reg [39:0] memory_DECODER_stageables_14_string;
  reg [39:0] _zz_38__string;
  reg [39:0] _zz_39__string;
  reg [39:0] _zz_40__string;
  reg [39:0] decode_DECODER_stageables_14_string;
  reg [39:0] _zz_41__string;
  reg [39:0] _zz_42__string;
  reg [39:0] _zz_43__string;
  reg [39:0] decode_DECODER_stageables_39_string;
  reg [39:0] _zz_44__string;
  reg [39:0] _zz_45__string;
  reg [39:0] _zz_46__string;
  reg [47:0] decode_DECODER_stageables_52_string;
  reg [47:0] _zz_47__string;
  reg [47:0] _zz_48__string;
  reg [47:0] _zz_49__string;
  reg [63:0] decode_DECODER_stageables_12_string;
  reg [63:0] _zz_50__string;
  reg [63:0] _zz_51__string;
  reg [63:0] _zz_52__string;
  reg [47:0] decode_DECODER_stageables_18_string;
  reg [47:0] _zz_53__string;
  reg [47:0] _zz_54__string;
  reg [47:0] _zz_55__string;
  reg [39:0] _zz_56__string;
  reg [39:0] _zz_57__string;
  reg [55:0] decode_DECODER_stageables_42_string;
  reg [55:0] _zz_58__string;
  reg [55:0] _zz_59__string;
  reg [55:0] _zz_60__string;
  reg [39:0] writeBack_DECODER_stageables_14_string;
  reg [39:0] _zz_61__string;
  reg [39:0] _zz_62__string;
  reg [39:0] _zz_63__string;
  reg [39:0] execute_DECODER_stageables_14_string;
  reg [39:0] _zz_64__string;
  reg [15:0] _zz_65__string;
  reg [39:0] decode_DECODER_stageables_25_string;
  reg [39:0] _zz_67__string;
  reg [47:0] memory_CR_WRITE_op_string;
  reg [47:0] _zz_68__string;
  reg [39:0] execute_DECODER_stageables_25_string;
  reg [39:0] _zz_69__string;
  reg [31:0] execute_DECODER_stageables_8_string;
  reg [31:0] _zz_72__string;
  reg [63:0] execute_DECODER_stageables_12_string;
  reg [63:0] _zz_73__string;
  reg [47:0] execute_DECODER_stageables_27_string;
  reg [47:0] _zz_74__string;
  reg [47:0] _zz_78__string;
  reg [47:0] execute_DECODER_stageables_18_string;
  reg [47:0] _zz_79__string;
  reg [47:0] execute_DECODER_stageables_49_string;
  reg [47:0] _zz_80__string;
  reg [15:0] execute_DECODER_stageables_26_string;
  reg [15:0] _zz_82__string;
  reg [23:0] execute_DECODER_stageables_40_string;
  reg [23:0] _zz_83__string;
  reg [55:0] execute_DECODER_stageables_1_string;
  reg [55:0] _zz_84__string;
  reg [55:0] execute_DECODER_stageables_42_string;
  reg [55:0] _zz_85__string;
  reg [47:0] execute_DECODER_stageables_52_string;
  reg [47:0] _zz_86__string;
  reg [39:0] execute_DECODER_stageables_39_string;
  reg [39:0] _zz_87__string;
  reg [47:0] writeBack_CR_WRITE_op_string;
  reg [47:0] _zz_88__string;
  reg [15:0] decode_DECODER_stageables_26_string;
  reg [15:0] _zz_90__string;
  reg [47:0] _zz_91__string;
  reg [47:0] _zz_92__string;
  reg [55:0] _zz_93__string;
  reg [23:0] _zz_94__string;
  reg [39:0] _zz_95__string;
  reg [15:0] _zz_96__string;
  reg [47:0] _zz_97__string;
  reg [15:0] _zz_98__string;
  reg [39:0] _zz_99__string;
  reg [47:0] _zz_100__string;
  reg [39:0] _zz_101__string;
  reg [63:0] _zz_102__string;
  reg [31:0] _zz_103__string;
  reg [55:0] _zz_104__string;
  reg [15:0] writeBack_DATA_SIZE_string;
  reg [15:0] _zz_105__string;
  reg [15:0] writeBack_MSR_ENDIAN_string;
  reg [15:0] _zz_106__string;
  reg [15:0] execute_DATA_SIZE_string;
  reg [15:0] _zz_108__string;
  reg [15:0] execute_MSR_ENDIAN_string;
  reg [15:0] _zz_109__string;
  reg [15:0] decode_MSR_ENDIAN_string;
  reg [15:0] _zz_112__string;
  reg [63:0] IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string;
  reg [63:0] DBusCachedPlugin_exceptionBus_payload_codePPC_string;
  reg [63:0] decodeExceptionPort_payload_codePPC_string;
  reg [63:0] BranchPlugin_branchExceptionPort_payload_codePPC_string;
  reg [63:0] SPRPlugin_selfException_payload_codePPC_string;
  reg [55:0] _zz_202__string;
  reg [31:0] _zz_203__string;
  reg [63:0] _zz_204__string;
  reg [39:0] _zz_205__string;
  reg [47:0] _zz_206__string;
  reg [39:0] _zz_207__string;
  reg [15:0] _zz_208__string;
  reg [47:0] _zz_209__string;
  reg [15:0] _zz_210__string;
  reg [39:0] _zz_211__string;
  reg [23:0] _zz_212__string;
  reg [55:0] _zz_213__string;
  reg [47:0] _zz_214__string;
  reg [47:0] _zz_215__string;
  reg [47:0] writeBack_RegFilePluginComp_crBusPort_payload_op_string;
  reg [47:0] execute_IntAluPluginComp_crBus_op_string;
  reg [47:0] _zz_235__string;
  reg [47:0] DIV_MEM_crBusPort_payload_op_string;
  reg [47:0] execute_BranchPlugin_crBusPort_op_string;
  reg [63:0] SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string;
  reg [63:0] _zz_287__string;
  reg [63:0] _zz_290__string;
  reg [63:0] SPRPlugin_intType_string;
  reg [63:0] execute_SPRPLUGIN_opExcp_codePPC_string;
  reg [55:0] decode_to_execute_DECODER_stageables_42_string;
  reg [39:0] decode_to_execute_DECODER_stageables_25_string;
  reg [47:0] decode_to_execute_DECODER_stageables_18_string;
  reg [63:0] decode_to_execute_DECODER_stageables_12_string;
  reg [47:0] decode_to_execute_DECODER_stageables_52_string;
  reg [39:0] decode_to_execute_DECODER_stageables_39_string;
  reg [39:0] decode_to_execute_DECODER_stageables_14_string;
  reg [39:0] execute_to_memory_DECODER_stageables_14_string;
  reg [39:0] memory_to_writeBack_DECODER_stageables_14_string;
  reg [55:0] decode_to_execute_DECODER_stageables_1_string;
  reg [23:0] decode_to_execute_DECODER_stageables_40_string;
  reg [15:0] decode_to_execute_MSR_ENDIAN_string;
  reg [15:0] execute_to_memory_MSR_ENDIAN_string;
  reg [15:0] memory_to_writeBack_MSR_ENDIAN_string;
  reg [15:0] decode_to_execute_DECODER_stageables_32_string;
  reg [15:0] execute_to_memory_DECODER_stageables_32_string;
  reg [15:0] memory_to_writeBack_DECODER_stageables_32_string;
  reg [47:0] decode_to_execute_DECODER_stageables_49_string;
  reg [47:0] execute_to_memory_CR_WRITE_op_string;
  reg [47:0] memory_to_writeBack_CR_WRITE_op_string;
  reg [31:0] decode_to_execute_DECODER_stageables_8_string;
  reg [47:0] decode_to_execute_DECODER_stageables_27_string;
  reg [15:0] decode_to_execute_DECODER_stageables_26_string;
  `endif

  reg [61:0] IBusCachedPlugin_predictor_history [0:3];
  function [6:0] zz_SPRPlugin_selfException_payload_imm(input dummy);
    begin
      zz_SPRPlugin_selfException_payload_imm = 7'h0;
      zz_SPRPlugin_selfException_payload_imm = 7'h0;
    end
  endfunction
  wire [6:0] _zz_1532_;

  assign _zz_384_ = (execute_DECODER_stageables_14 == `EnvCtrlEnum_defaultEncoding_TW);
  assign _zz_385_ = (memory_arbitration_isValid && memory_DECODER_stageables_57);
  assign _zz_386_ = (! FX_DIV_valid);
  assign _zz_387_ = (writeBack_arbitration_isFiring && writeBack_DECODER_stageables_34);
  assign _zz_388_ = ((_zz_326_ && IBusCachedPlugin_cache_io_cpu_decode_cacheMiss) && (! _zz_110__3));
  assign _zz_389_ = ((_zz_326_ && IBusCachedPlugin_cache_io_cpu_decode_error) && (! _zz_110__2));
  assign _zz_390_ = ((_zz_326_ && (! IBusCachedPlugin_cache_io_cpu_decode_mmuException)) && (! _zz_110__1));
  assign _zz_391_ = IBusCachedPlugin_cache_io_cpu_decode_exceptionType[0];
  assign _zz_392_ = ((_zz_326_ && IBusCachedPlugin_cache_io_cpu_decode_mmuException) && (! _zz_110__0));
  assign _zz_393_ = ((_zz_326_ && IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling) && (! IBusCachedPlugin_rsp_issueDetected));
  assign _zz_394_ = ({decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid} != (2'b00));
  assign _zz_395_ = (SPRPlugin_hadException || SPRPlugin_interruptJump);
  assign _zz_396_ = (writeBack_arbitration_isFiring && writeBack_DECODER_stageables_47);
  assign _zz_397_ = (writeBack_arbitration_isFiring && (writeBack_DECODER_stageables_14 == `EnvCtrlEnum_defaultEncoding_SC));
  assign _zz_398_ = (writeBack_arbitration_isFiring && ((writeBack_DECODER_stageables_14 == `EnvCtrlEnum_defaultEncoding_TW) || (writeBack_DECODER_stageables_14 == `EnvCtrlEnum_defaultEncoding_TWI)));
  assign _zz_399_ = (writeBack_arbitration_isFiring && (writeBack_DECODER_stageables_14 == `EnvCtrlEnum_defaultEncoding_SCV));
  assign _zz_400_ = (writeBack_arbitration_isFiring && (writeBack_DECODER_stageables_14 == `EnvCtrlEnum_defaultEncoding_RFI));
  assign _zz_401_ = (writeBack_arbitration_isFiring && (writeBack_DECODER_stageables_14 == `EnvCtrlEnum_defaultEncoding_RFSCV));
  assign _zz_402_ = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_403_ = ((! dataCache_1__io_cpu_writeBack_mmuException) && dataCache_1__io_cpu_writeBack_exceptionType[0]);
  assign _zz_404_ = ((! dataCache_1__io_cpu_writeBack_exceptionType[3]) && (! writeBack_MEMORY_WR));
  assign _zz_405_ = ((! dataCache_1__io_cpu_writeBack_exceptionType[2]) && writeBack_MEMORY_WR);
  assign _zz_406_ = (! decode_LEGAL_INSTRUCTION);
  assign _zz_407_ = (decode && SPRPlugin_msr_pr);
  assign _zz_408_ = (! UpdateRegFileWrite_valid);
  assign _zz_409_ = (memory_DECODER_stageables_35 && memory_INSTRUCTION[10]);
  assign _zz_410_ = (writeBack_arbitration_isValid && writeBack_DECODER_stageables_21);
  assign _zz_411_ = (1'b0 || (! _zz_245_));
  assign _zz_412_ = (memory_arbitration_isValid && memory_DECODER_stageables_21);
  assign _zz_413_ = (1'b0 || (! memory_DECODER_stageables_55));
  assign _zz_414_ = (execute_arbitration_isValid && execute_DECODER_stageables_21);
  assign _zz_415_ = (1'b0 || (! execute_DECODER_stageables_6));
  assign _zz_416_ = (execute_arbitration_isValid && execute_DECODER_stageables_21);
  assign _zz_417_ = 1'b1;
  assign _zz_418_ = (memory_arbitration_isValid && memory_DECODER_stageables_21);
  assign _zz_419_ = 1'b1;
  assign _zz_420_ = (writeBack_arbitration_isValid && writeBack_DECODER_stageables_21);
  assign _zz_421_ = 1'b1;
  assign _zz_422_ = (memory_arbitration_isValid && execute_arbitration_isValid);
  assign _zz_423_ = (1'b0 ? (memory_CR_FIELD_WR != 8'h0) : ((memory_CR_FIELD_WR & execute_CR_FIELD_RD) != 8'h0));
  assign _zz_424_ = (1'b1 && (! 1'b0));
  assign _zz_425_ = (writeBack_arbitration_isValid && execute_arbitration_isValid);
  assign _zz_426_ = (1'b0 ? (writeBack_CR_FIELD_WR != 8'h0) : ((writeBack_CR_FIELD_WR & execute_CR_FIELD_RD) != 8'h0));
  assign _zz_427_ = (1'b1 && (! 1'b0));
  assign _zz_428_ = (! SPRPlugin_hadException);
  assign _zz_429_ = (iBus_cmd_valid || (_zz_308_ != (3'b000)));
  assign _zz_430_ = 1'b1;
  assign _zz_431_ = (((MSR_EE && SPRPlugin_intDec) && 1'b1) && (! 1'b0));
  assign _zz_432_ = execute_INSTRUCTION[19 : 12];
  assign _zz_433_ = execute_INSTRUCTION[20 : 18];
  assign _zz_434_ = execute_INSTRUCTION[20 : 18];
  assign _zz_435_ = (2'b00);
  assign _zz_436_ = (2'b00);
  assign _zz_437_ = execute_BranchPlugin_crBusPort_ba[2 : 0];
  assign _zz_438_ = _zz_136_[44 : 44];
  assign _zz_439_ = _zz_136_[61 : 61];
  assign _zz_440_ = _zz_136_[50 : 50];
  assign _zz_441_ = _zz_136_[43 : 43];
  assign _zz_442_ = _zz_136_[24 : 24];
  assign _zz_443_ = _zz_136_[52 : 52];
  assign _zz_444_ = _zz_136_[32 : 32];
  assign _zz_445_ = _zz_136_[0 : 0];
  assign _zz_446_ = _zz_136_[76 : 76];
  assign _zz_447_ = _zz_136_[9 : 9];
  assign _zz_448_ = _zz_136_[69 : 69];
  assign _zz_449_ = _zz_136_[66 : 66];
  assign _zz_450_ = _zz_136_[12 : 12];
  assign _zz_451_ = _zz_136_[70 : 70];
  assign _zz_452_ = _zz_136_[18 : 18];
  assign _zz_453_ = _zz_136_[5 : 5];
  assign _zz_454_ = _zz_136_[75 : 75];
  assign _zz_455_ = _zz_136_[48 : 48];
  assign _zz_456_ = _zz_136_[49 : 49];
  assign _zz_457_ = _zz_136_[7 : 7];
  assign _zz_458_ = _zz_136_[78 : 78];
  assign _zz_459_ = _zz_136_[31 : 31];
  assign _zz_460_ = _zz_136_[8 : 8];
  assign _zz_461_ = _zz_136_[65 : 65];
  assign _zz_462_ = _zz_136_[51 : 51];
  assign _zz_463_ = _zz_136_[25 : 25];
  assign _zz_464_ = _zz_136_[77 : 77];
  assign _zz_465_ = _zz_136_[79 : 79];
  assign _zz_466_ = _zz_136_[23 : 23];
  assign _zz_467_ = _zz_136_[45 : 45];
  assign _zz_468_ = _zz_136_[57 : 57];
  assign _zz_469_ = _zz_136_[63 : 63];
  assign _zz_470_ = _zz_136_[13 : 13];
  assign _zz_471_ = _zz_136_[53 : 53];
  assign _zz_472_ = _zz_136_[33 : 33];
  assign _zz_473_ = _zz_136_[34 : 34];
  assign _zz_474_ = _zz_136_[62 : 62];
  assign _zz_475_ = _zz_136_[64 : 64];
  assign _zz_476_ = _zz_136_[4 : 4];
  assign _zz_477_ = _zz_136_[42 : 42];
  assign _zz_478_ = _zz_136_[30 : 30];
  assign _zz_479_ = _zz_136_[6 : 6];
  assign _zz_480_ = {IBusCachedPlugin_fetchPc_inc,(2'b00)};
  assign _zz_481_ = {29'd0, _zz_480_};
  assign _zz_482_ = _zz_124_[1:0];
  assign _zz_483_ = (IBusCachedPlugin_iBusRsp_stages_1_input_payload >>> 2);
  assign _zz_484_ = _zz_483_[1:0];
  assign _zz_485_ = (IBusCachedPlugin_iBusRsp_stages_1_input_payload >>> 4);
  assign _zz_486_ = (memory_PREDICTION_CONTEXT_line_branchWish + _zz_488_);
  assign _zz_487_ = (memory_PREDICTION_CONTEXT_line_branchWish == (2'b10));
  assign _zz_488_ = {1'd0, _zz_487_};
  assign _zz_489_ = (memory_PREDICTION_CONTEXT_line_branchWish == (2'b01));
  assign _zz_490_ = {1'd0, _zz_489_};
  assign _zz_491_ = (memory_PREDICTION_CONTEXT_line_branchWish - _zz_493_);
  assign _zz_492_ = memory_PREDICTION_CONTEXT_line_branchWish[1];
  assign _zz_493_ = {1'd0, _zz_492_};
  assign _zz_494_ = (! memory_PREDICTION_CONTEXT_line_branchWish[1]);
  assign _zz_495_ = {1'd0, _zz_494_};
  assign _zz_496_ = (writeBack_MEMORY_WR ? (3'b111) : (3'b101));
  assign _zz_497_ = (writeBack_MEMORY_WR ? (3'b110) : (3'b100));
  assign _zz_498_ = writeBack_SPR_ID;
  assign _zz_499_ = (writeBack_PC + 32'h00000004);
  assign _zz_500_ = writeBack_SPR_ID;
  assign _zz_501_ = sprReadBU_payload_data;
  assign _zz_502_ = sprReadBU_payload_data;
  assign _zz_503_ = sprReadBU_payload_data;
  assign _zz_504_ = sprReadBU_payload_data;
  assign _zz_505_ = sprReadBU_payload_data;
  assign _zz_506_ = sprReadBU_payload_data;
  assign _zz_507_ = sprReadBU_payload_data;
  assign _zz_508_ = sprReadBU_payload_data;
  assign _zz_509_ = sprReadBU_payload_data;
  assign _zz_510_ = sprReadBU_payload_data;
  assign _zz_511_ = sprReadBU_payload_data;
  assign _zz_512_ = sprReadBU_payload_data;
  assign _zz_513_ = sprReadBU_payload_data;
  assign _zz_514_ = sprReadBU_payload_data;
  assign _zz_515_ = sprReadBU_payload_data;
  assign _zz_516_ = sprReadBU_payload_data;
  assign _zz_517_ = sprReadBU_payload_data;
  assign _zz_518_ = sprReadBU_payload_data;
  assign _zz_519_ = sprReadBU_payload_data;
  assign _zz_520_ = sprReadBU_payload_data;
  assign _zz_521_ = sprReadBU_payload_data;
  assign _zz_522_ = sprReadBU_payload_data;
  assign _zz_523_ = sprReadBU_payload_data;
  assign _zz_524_ = sprReadBU_payload_data;
  assign _zz_525_ = sprReadBU_payload_data;
  assign _zz_526_ = (5'h1f - execute_INSTRUCTION[10 : 6]);
  assign _zz_527_ = ((3'b111) - execute_INSTRUCTION[25 : 23]);
  assign _zz_528_ = {1'b0,memory_MUL_LL};
  assign _zz_529_ = ({16'd0,memory_MUL_LH} <<< 16);
  assign _zz_530_ = ({16'd0,memory_MUL_HL} <<< 16);
  assign _zz_531_ = MUL3_result[63 : 32];
  assign _zz_532_ = writeBack_MUL_LOW[31 : 0];
  assign _zz_533_ = ((DIV_MEM_rs1NeedRevert ? (~ DIV_MEM_rs1Extended) : DIV_MEM_rs1Extended) + _zz_535_);
  assign _zz_534_ = DIV_MEM_rs1NeedRevert;
  assign _zz_535_ = {32'd0, _zz_534_};
  assign _zz_536_ = ((DIV_MEM_rs2NeedRevert ? (~ execute_SRC2) : execute_SRC2) + _zz_538_);
  assign _zz_537_ = DIV_MEM_rs2NeedRevert;
  assign _zz_538_ = {31'd0, _zz_537_};
  assign _zz_539_ = (5'h1f - execute_BranchPlugin_crBusPort_bt);
  assign _zz_540_ = (5'h1f - execute_BranchPlugin_crBusPort_ba);
  assign _zz_541_ = (5'h1f - execute_BranchPlugin_crBusPort_bb);
  assign _zz_542_ = (5'h1f - execute_BranchPlugin_crBusPort_bt);
  assign _zz_543_ = (5'h1f - execute_BranchPlugin_crBusPort_ba);
  assign _zz_544_ = (5'h1f - execute_BranchPlugin_crBusPort_bb);
  assign _zz_545_ = (5'h1f - execute_BranchPlugin_crBusPort_bt);
  assign _zz_546_ = (5'h1f - execute_BranchPlugin_crBusPort_ba);
  assign _zz_547_ = (5'h1f - execute_BranchPlugin_crBusPort_bb);
  assign _zz_548_ = (5'h1f - execute_BranchPlugin_crBusPort_bt);
  assign _zz_549_ = (5'h1f - execute_BranchPlugin_crBusPort_ba);
  assign _zz_550_ = (5'h1f - execute_BranchPlugin_crBusPort_bb);
  assign _zz_551_ = (5'h1f - execute_BranchPlugin_crBusPort_bt);
  assign _zz_552_ = (5'h1f - execute_BranchPlugin_crBusPort_ba);
  assign _zz_553_ = (5'h1f - execute_BranchPlugin_crBusPort_bb);
  assign _zz_554_ = (5'h1f - execute_BranchPlugin_crBusPort_bt);
  assign _zz_555_ = (5'h1f - execute_BranchPlugin_crBusPort_ba);
  assign _zz_556_ = (5'h1f - execute_BranchPlugin_crBusPort_bb);
  assign _zz_557_ = (5'h1f - execute_BranchPlugin_crBusPort_bt);
  assign _zz_558_ = (5'h1f - execute_BranchPlugin_crBusPort_ba);
  assign _zz_559_ = (5'h1f - execute_BranchPlugin_crBusPort_bb);
  assign _zz_560_ = (5'h1f - execute_BranchPlugin_crBusPort_bt);
  assign _zz_561_ = (5'h1f - execute_BranchPlugin_crBusPort_ba);
  assign _zz_562_ = (5'h1f - execute_BranchPlugin_crBusPort_bb);
  assign _zz_563_ = execute_BranchPlugin_li;
  assign _zz_564_ = execute_BranchPlugin_bd;
  assign _zz_565_ = ($signed(execute_BranchPlugin_branch_tgt1) + $signed(execute_BranchPlugin_branch_tgt2));
  assign _zz_566_ = ($signed(execute_BranchPlugin_branch_tgt1) + $signed(execute_BranchPlugin_branch_tgt2));
  assign _zz_567_ = ((2'b11) - execute_BranchPlugin_crbiBit);
  assign _zz_568_ = (_zz_570_ + 5'h1c);
  assign _zz_569_ = ((2'b11) - execute_BranchPlugin_crbiBit);
  assign _zz_570_ = {3'd0, _zz_569_};
  assign _zz_571_ = (_zz_573_ + 5'h18);
  assign _zz_572_ = ((2'b11) - execute_BranchPlugin_crbiBit);
  assign _zz_573_ = {3'd0, _zz_572_};
  assign _zz_574_ = (_zz_576_ + 5'h14);
  assign _zz_575_ = ((2'b11) - execute_BranchPlugin_crbiBit);
  assign _zz_576_ = {3'd0, _zz_575_};
  assign _zz_577_ = (_zz_579_ + 5'h10);
  assign _zz_578_ = ((2'b11) - execute_BranchPlugin_crbiBit);
  assign _zz_579_ = {3'd0, _zz_578_};
  assign _zz_580_ = (_zz_582_ + (4'b1100));
  assign _zz_581_ = ((2'b11) - execute_BranchPlugin_crbiBit);
  assign _zz_582_ = {2'd0, _zz_581_};
  assign _zz_583_ = (_zz_585_ + (4'b1000));
  assign _zz_584_ = ((2'b11) - execute_BranchPlugin_crbiBit);
  assign _zz_585_ = {2'd0, _zz_584_};
  assign _zz_586_ = (_zz_588_ + (3'b100));
  assign _zz_587_ = ((2'b11) - execute_BranchPlugin_crbiBit);
  assign _zz_588_ = {1'd0, _zz_587_};
  assign _zz_589_ = (_zz_590_ + (2'b00));
  assign _zz_590_ = ((2'b11) - execute_BranchPlugin_crbiBit);
  assign _zz_591_ = (_zz_288_ & (~ _zz_592_));
  assign _zz_592_ = (_zz_288_ - (2'b01));
  assign _zz_593_ = execute_SRC1;
  assign _zz_594_ = execute_SRC2;
  assign _zz_595_ = execute_SRC2;
  assign _zz_596_ = execute_SRC1;
  assign _zz_597_ = execute_SRC1;
  assign _zz_598_ = execute_SPRPLUGIN_si;
  assign _zz_599_ = execute_SPRPLUGIN_si;
  assign _zz_600_ = execute_SRC1;
  assign _zz_601_ = execute_SRC1[23 : 23];
  assign _zz_602_ = execute_SRC1[8 : 8];
  assign _zz_603_ = execute_SRC1[11 : 11];
  assign _zz_604_ = execute_SRC1[2 : 2];
  assign _zz_605_ = execute_SRC1[5 : 5];
  assign _zz_606_ = execute_SRC1[14 : 14];
  assign _zz_607_ = execute_SRC1[13 : 13];
  assign _zz_608_ = execute_SRC1[4 : 4];
  assign _zz_609_ = execute_SRC1[25 : 25];
  assign _zz_610_ = execute_SRC1[1 : 1];
  assign _zz_611_ = execute_SRC1[12 : 12];
  assign _zz_612_ = execute_SRC1[15 : 15];
  assign _zz_613_ = execute_SRC1[0 : 0];
  assign _zz_614_ = (iBus_cmd_payload_address >>> 5);
  assign _zz_615_ = {IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_data_target,{IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_data_branchWish,IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_data_source}};
  assign _zz_616_ = ((decode_INSTRUCTION & 32'hb4000000) == 32'h20000000);
  assign _zz_617_ = {((decode_INSTRUCTION & 32'hd4000000) == 32'h40000000),{_zz_184_,{_zz_172_,{((decode_INSTRUCTION & 32'hcc100000) == 32'h80100000),{_zz_156_,{_zz_155_,{_zz_177_,{_zz_618_,_zz_619_}}}}}}}};
  assign _zz_618_ = ((decode_INSTRUCTION & 32'hd4100000) == 32'h80100000);
  assign _zz_619_ = {_zz_176_,{_zz_174_,{_zz_170_,{_zz_158_,{_zz_157_,{((decode_INSTRUCTION & _zz_620_) == 32'h98020000),{_zz_183_,{_zz_621_,{_zz_622_,_zz_623_}}}}}}}}};
  assign _zz_620_ = 32'hbc020000;
  assign _zz_621_ = ((decode_INSTRUCTION & 32'hf8100000) == 32'h38100000);
  assign _zz_622_ = _zz_182_;
  assign _zz_623_ = {((decode_INSTRUCTION & 32'hbc080000) == 32'h98080000),{((decode_INSTRUCTION & 32'hbc100000) == 32'h98100000),{_zz_181_,{_zz_180_,{(_zz_624_ == _zz_625_),{_zz_626_,{_zz_627_,_zz_628_}}}}}}};
  assign _zz_624_ = (decode_INSTRUCTION & 32'hbc040000);
  assign _zz_625_ = 32'h98040000;
  assign _zz_626_ = ((decode_INSTRUCTION & 32'hfc200000) == 32'hd8200000);
  assign _zz_627_ = _zz_166_;
  assign _zz_628_ = {((decode_INSTRUCTION & 32'hfc000003) == 32'h44000001),{((decode_INSTRUCTION & 32'hd41f0000) == 32'h80000000),{((decode_INSTRUCTION & _zz_629_) == 32'h80000000),{(_zz_630_ == _zz_631_),{_zz_632_,{_zz_633_,_zz_634_}}}}}};
  assign _zz_629_ = 32'he41f0000;
  assign _zz_630_ = (decode_INSTRUCTION & 32'hcc1f0000);
  assign _zz_631_ = 32'h80000000;
  assign _zz_632_ = ((decode_INSTRUCTION & 32'hf81f0000) == 32'h38000000);
  assign _zz_633_ = ((decode_INSTRUCTION & 32'hfc3e0000) == 32'hd8000000);
  assign _zz_634_ = {((decode_INSTRUCTION & 32'hfc00003e) == 32'h4c000004),{((decode_INSTRUCTION & 32'hfc02003e) == 32'h7c02001e),{((decode_INSTRUCTION & _zz_635_) == 32'h7c10001e),{(_zz_636_ == _zz_637_),{_zz_638_,{_zz_639_,_zz_640_}}}}}};
  assign _zz_635_ = 32'hfc10003e;
  assign _zz_636_ = (decode_INSTRUCTION & 32'hfc08003e);
  assign _zz_637_ = 32'h7c08001e;
  assign _zz_638_ = ((decode_INSTRUCTION & 32'hfc04003e) == 32'h7c04001e);
  assign _zz_639_ = ((decode_INSTRUCTION & 32'hfc01003e) == 32'h7c01001e);
  assign _zz_640_ = {((decode_INSTRUCTION & 32'hfc00033e) == 32'h7c000316),{((decode_INSTRUCTION & 32'hfc0003ba) == 32'h7c000190),{((decode_INSTRUCTION & _zz_641_) == 32'h7c000110),{(_zz_642_ == _zz_643_),{_zz_644_,{_zz_645_,_zz_646_}}}}}};
  assign _zz_641_ = 32'hfc00037a;
  assign _zz_642_ = (decode_INSTRUCTION & 32'hfc0003da);
  assign _zz_643_ = 32'h7c000010;
  assign _zz_644_ = ((decode_INSTRUCTION & 32'hfc00067e) == 32'h7c00006e);
  assign _zz_645_ = ((decode_INSTRUCTION & 32'hfc00057e) == 32'h7c00006e);
  assign _zz_646_ = {((decode_INSTRUCTION & 32'hfc0004fe) == 32'h7c00006e),{((decode_INSTRUCTION & 32'hfc00073e) == 32'h7c000338),{((decode_INSTRUCTION & _zz_647_) == 32'h7c000038),{(_zz_648_ == _zz_649_),{_zz_650_,{_zz_651_,_zz_652_}}}}}};
  assign _zz_647_ = 32'hfc0005be;
  assign _zz_648_ = (decode_INSTRUCTION & 32'hfc0003fc);
  assign _zz_649_ = 32'h7c000214;
  assign _zz_650_ = ((decode_INSTRUCTION & 32'hfc00037e) == 32'h7c000050);
  assign _zz_651_ = ((decode_INSTRUCTION & 32'hfc0007be) == 32'h7c000734);
  assign _zz_652_ = {((decode_INSTRUCTION & 32'hfc04067e) == 32'h7c04002e),{((decode_INSTRUCTION & 32'hfc02067e) == 32'h7c02002e),{((decode_INSTRUCTION & _zz_653_) == 32'h7c0000f4),{(_zz_654_ == _zz_655_),{_zz_656_,{_zz_657_,_zz_658_}}}}}};
  assign _zz_653_ = 32'hfc0005fe;
  assign _zz_654_ = (decode_INSTRUCTION & 32'hfc0804fe);
  assign _zz_655_ = 32'h7c08002e;
  assign _zz_656_ = ((decode_INSTRUCTION & 32'hfc02057e) == 32'h7c02002e);
  assign _zz_657_ = ((decode_INSTRUCTION & 32'hfc04057e) == 32'h7c04002e);
  assign _zz_658_ = {((decode_INSTRUCTION & 32'hfc08057e) == 32'h7c08002e),{((decode_INSTRUCTION & 32'hfc01057e) == 32'h7c01002e),{((decode_INSTRUCTION & _zz_659_) == 32'h7c10002e),{(_zz_660_ == _zz_661_),{_zz_662_,{_zz_663_,_zz_664_}}}}}};
  assign _zz_659_ = 32'hfc10067e;
  assign _zz_660_ = (decode_INSTRUCTION & 32'hfc0204fe);
  assign _zz_661_ = 32'h7c02002e;
  assign _zz_662_ = ((decode_INSTRUCTION & 32'hfc01067e) == 32'h7c01002e);
  assign _zz_663_ = ((decode_INSTRUCTION & 32'hfc0404fe) == 32'h7c04002e);
  assign _zz_664_ = {((decode_INSTRUCTION & 32'hfc0006fe) == 32'h7c0002a6),{((decode_INSTRUCTION & 32'hfc1004fe) == 32'h7c10002e),{((decode_INSTRUCTION & _zz_665_) == 32'h7c01002e),{(_zz_666_ == _zz_667_),{_zz_668_,{_zz_669_,_zz_670_}}}}}};
  assign _zz_665_ = 32'hfc0104fe;
  assign _zz_666_ = (decode_INSTRUCTION & 32'hfc10057e);
  assign _zz_667_ = 32'h7c10002e;
  assign _zz_668_ = ((decode_INSTRUCTION & 32'hfc08067e) == 32'h7c08002e);
  assign _zz_669_ = ((decode_INSTRUCTION & 32'hfc00077e) == 32'h7c000078);
  assign _zz_670_ = {((decode_INSTRUCTION & 32'hfc0007be) == 32'h7c000630),{((decode_INSTRUCTION & 32'hfc00077e) == 32'h7c000026),{((decode_INSTRUCTION & _zz_671_) == 32'h7c000124),{(_zz_672_ == _zz_673_),{_zz_674_,{_zz_675_,_zz_676_}}}}}};
  assign _zz_671_ = 32'hfc0007ee;
  assign _zz_672_ = (decode_INSTRUCTION & 32'hfc00077e);
  assign _zz_673_ = 32'h7c000016;
  assign _zz_674_ = ((decode_INSTRUCTION & 32'hfc0007de) == 32'h7c000100);
  assign _zz_675_ = _zz_169_;
  assign _zz_676_ = {((decode_INSTRUCTION & 32'hfc0006fe) == 32'h4c000242),{((decode_INSTRUCTION & 32'hfc0007be) == 32'h4c000182),{((decode_INSTRUCTION & _zz_677_) == 32'h4c000182),{(_zz_678_ == _zz_679_),{_zz_680_,{_zz_681_,_zz_682_}}}}}};
  assign _zz_677_ = 32'hfc0005fe;
  assign _zz_678_ = (decode_INSTRUCTION & 32'hfc0007be);
  assign _zz_679_ = 32'h4c000202;
  assign _zz_680_ = ((decode_INSTRUCTION & 32'hfc0007f6) == 32'h7c000000);
  assign _zz_681_ = ((decode_INSTRUCTION & 32'hfc0007be) == 32'h4c000420);
  assign _zz_682_ = {((decode_INSTRUCTION & 32'hfc00077e) == 32'h4c000102),{((decode_INSTRUCTION & 32'hfc0007be) == 32'h7c000000),{((decode_INSTRUCTION & _zz_683_) == 32'h4c000042),{(_zz_684_ == _zz_685_),{_zz_686_,{_zz_687_,_zz_688_}}}}}};
  assign _zz_683_ = 32'hfc0005fe;
  assign _zz_684_ = (decode_INSTRUCTION & 32'hfc0007de);
  assign _zz_685_ = 32'h4c000000;
  assign _zz_686_ = ((decode_INSTRUCTION & 32'hfc0007fe) == 32'h7c0007ac);
  assign _zz_687_ = ((decode_INSTRUCTION & 32'hfc0007fe) == 32'h7c0001d6);
  assign _zz_688_ = {((decode_INSTRUCTION & 32'hfc1f003e) == 32'h7c00001e),{((decode_INSTRUCTION & 32'hfc0007fe) == 32'h7c000480),{((decode_INSTRUCTION & _zz_689_) == 32'h4c00012c),{(_zz_690_ == _zz_691_),{_zz_692_,{_zz_693_,_zz_694_}}}}}};
  assign _zz_689_ = 32'hfc0007fe;
  assign _zz_690_ = (decode_INSTRUCTION & 32'hfc0007fe);
  assign _zz_691_ = 32'h4c000064;
  assign _zz_692_ = ((decode_INSTRUCTION & 32'hfc0007fe) == 32'h4c0000a4);
  assign _zz_693_ = ((decode_INSTRUCTION & 32'hfc6007fe) == 32'h4c0004ac);
  assign _zz_694_ = {((decode_INSTRUCTION & 32'hfc1f04fe) == 32'h7c00002e),{((decode_INSTRUCTION & 32'hfc1f057e) == 32'h7c00002e),((decode_INSTRUCTION & 32'hfc1f067e) == 32'h7c00002e)}};
  assign _zz_695_ = (decode_INSTRUCTION & 32'h7800028a);
  assign _zz_696_ = 32'h78000202;
  assign _zz_697_ = ((decode_INSTRUCTION & 32'h78000538) == 32'h78000000);
  assign _zz_698_ = _zz_145_;
  assign _zz_699_ = {(_zz_705_ == _zz_706_),{_zz_707_,{_zz_708_,_zz_709_}}};
  assign _zz_700_ = {(_zz_710_ == _zz_711_),{_zz_712_,{_zz_713_,_zz_714_}}};
  assign _zz_701_ = (4'b0000);
  assign _zz_702_ = ((_zz_715_ == _zz_716_) != (1'b0));
  assign _zz_703_ = ({_zz_717_,_zz_718_} != (2'b00));
  assign _zz_704_ = {(_zz_719_ != _zz_720_),{_zz_721_,{_zz_722_,_zz_723_}}};
  assign _zz_705_ = (decode_INSTRUCTION & 32'h40000002);
  assign _zz_706_ = 32'h40000000;
  assign _zz_707_ = ((decode_INSTRUCTION & _zz_724_) == 32'h40000000);
  assign _zz_708_ = (_zz_725_ == _zz_726_);
  assign _zz_709_ = {_zz_727_,{_zz_728_,_zz_729_}};
  assign _zz_710_ = (decode_INSTRUCTION & 32'hf8000000);
  assign _zz_711_ = 32'h70000000;
  assign _zz_712_ = ((decode_INSTRUCTION & _zz_730_) == 32'h34000000);
  assign _zz_713_ = _zz_201_;
  assign _zz_714_ = (_zz_731_ == _zz_732_);
  assign _zz_715_ = (decode_INSTRUCTION & 32'h7800038a);
  assign _zz_716_ = 32'h78000202;
  assign _zz_717_ = (_zz_733_ == _zz_734_);
  assign _zz_718_ = (_zz_735_ == _zz_736_);
  assign _zz_719_ = {_zz_737_,{_zz_738_,_zz_739_}};
  assign _zz_720_ = (3'b000);
  assign _zz_721_ = ({_zz_740_,_zz_741_} != (3'b000));
  assign _zz_722_ = (_zz_742_ != _zz_743_);
  assign _zz_723_ = {_zz_744_,{_zz_745_,_zz_746_}};
  assign _zz_724_ = 32'h60000000;
  assign _zz_725_ = (decode_INSTRUCTION & 32'h18000000);
  assign _zz_726_ = 32'h10000000;
  assign _zz_727_ = ((decode_INSTRUCTION & _zz_747_) == 32'h0);
  assign _zz_728_ = (_zz_748_ == _zz_749_);
  assign _zz_729_ = {_zz_750_,{_zz_751_,_zz_752_}};
  assign _zz_730_ = 32'hbc000000;
  assign _zz_731_ = (decode_INSTRUCTION & 32'h70000538);
  assign _zz_732_ = 32'h70000000;
  assign _zz_733_ = (decode_INSTRUCTION & 32'h18000008);
  assign _zz_734_ = 32'h18000000;
  assign _zz_735_ = (decode_INSTRUCTION & 32'h18000280);
  assign _zz_736_ = 32'h18000080;
  assign _zz_737_ = ((decode_INSTRUCTION & _zz_753_) == 32'h08000000);
  assign _zz_738_ = (_zz_754_ == _zz_755_);
  assign _zz_739_ = (_zz_756_ == _zz_757_);
  assign _zz_740_ = (_zz_758_ == _zz_759_);
  assign _zz_741_ = {_zz_760_,_zz_761_};
  assign _zz_742_ = {_zz_762_,{_zz_763_,_zz_764_}};
  assign _zz_743_ = (3'b000);
  assign _zz_744_ = ({_zz_765_,_zz_766_} != (3'b000));
  assign _zz_745_ = (_zz_767_ != _zz_768_);
  assign _zz_746_ = {_zz_769_,{_zz_770_,_zz_771_}};
  assign _zz_747_ = 32'h90000000;
  assign _zz_748_ = (decode_INSTRUCTION & 32'h40000028);
  assign _zz_749_ = 32'h40000008;
  assign _zz_750_ = ((decode_INSTRUCTION & _zz_772_) == 32'h40000100);
  assign _zz_751_ = (_zz_773_ == _zz_774_);
  assign _zz_752_ = {_zz_143_,_zz_775_};
  assign _zz_753_ = 32'h18000000;
  assign _zz_754_ = (decode_INSTRUCTION & 32'h080000c0);
  assign _zz_755_ = 32'h08000080;
  assign _zz_756_ = (decode_INSTRUCTION & 32'h08000300);
  assign _zz_757_ = 32'h08000200;
  assign _zz_758_ = (decode_INSTRUCTION & 32'h18000000);
  assign _zz_759_ = 32'h0;
  assign _zz_760_ = ((decode_INSTRUCTION & _zz_776_) == 32'h18000200);
  assign _zz_761_ = ((decode_INSTRUCTION & _zz_777_) == 32'h18000100);
  assign _zz_762_ = ((decode_INSTRUCTION & _zz_778_) == 32'h18000040);
  assign _zz_763_ = (_zz_779_ == _zz_780_);
  assign _zz_764_ = (_zz_781_ == _zz_782_);
  assign _zz_765_ = (_zz_783_ == _zz_784_);
  assign _zz_766_ = {_zz_785_,_zz_786_};
  assign _zz_767_ = {_zz_787_,{_zz_788_,_zz_789_}};
  assign _zz_768_ = (3'b000);
  assign _zz_769_ = (_zz_790_ != (1'b0));
  assign _zz_770_ = (_zz_791_ != _zz_792_);
  assign _zz_771_ = {_zz_793_,{_zz_794_,_zz_795_}};
  assign _zz_772_ = 32'h40000110;
  assign _zz_773_ = (decode_INSTRUCTION & 32'h40000220);
  assign _zz_774_ = 32'h40000200;
  assign _zz_775_ = ((decode_INSTRUCTION & _zz_796_) == 32'h40000000);
  assign _zz_776_ = 32'h18000240;
  assign _zz_777_ = 32'h18000500;
  assign _zz_778_ = 32'h18000048;
  assign _zz_779_ = (decode_INSTRUCTION & 32'h18000540);
  assign _zz_780_ = 32'h18000100;
  assign _zz_781_ = (decode_INSTRUCTION & 32'h180002c0);
  assign _zz_782_ = 32'h18000040;
  assign _zz_783_ = (decode_INSTRUCTION & 32'h7c000104);
  assign _zz_784_ = 32'h4c000100;
  assign _zz_785_ = ((decode_INSTRUCTION & _zz_797_) == 32'h4c000200);
  assign _zz_786_ = ((decode_INSTRUCTION & _zz_798_) == 32'h4c000040);
  assign _zz_787_ = ((decode_INSTRUCTION & _zz_799_) == 32'h78000020);
  assign _zz_788_ = (_zz_800_ == _zz_801_);
  assign _zz_789_ = (_zz_802_ == _zz_803_);
  assign _zz_790_ = ((decode_INSTRUCTION & _zz_804_) == 32'h20000000);
  assign _zz_791_ = (_zz_805_ == _zz_806_);
  assign _zz_792_ = (1'b0);
  assign _zz_793_ = ({_zz_807_,_zz_808_} != (2'b00));
  assign _zz_794_ = (_zz_809_ != _zz_810_);
  assign _zz_795_ = {_zz_811_,{_zz_812_,_zz_813_}};
  assign _zz_796_ = 32'h40000018;
  assign _zz_797_ = 32'h7c000204;
  assign _zz_798_ = 32'h7c000444;
  assign _zz_799_ = 32'h78000034;
  assign _zz_800_ = (decode_INSTRUCTION & 32'h78000418);
  assign _zz_801_ = 32'h78000400;
  assign _zz_802_ = (decode_INSTRUCTION & 32'h7c000364);
  assign _zz_803_ = 32'h4c000000;
  assign _zz_804_ = 32'h20000400;
  assign _zz_805_ = (decode_INSTRUCTION & 32'h20000100);
  assign _zz_806_ = 32'h20000000;
  assign _zz_807_ = _zz_159_;
  assign _zz_808_ = ((decode_INSTRUCTION & _zz_814_) == 32'h78000060);
  assign _zz_809_ = {(_zz_815_ == _zz_816_),_zz_142_};
  assign _zz_810_ = (2'b00);
  assign _zz_811_ = ({_zz_817_,{_zz_818_,_zz_819_}} != 32'h0);
  assign _zz_812_ = (_zz_196_ != (1'b0));
  assign _zz_813_ = {(_zz_820_ != _zz_821_),{_zz_822_,{_zz_823_,_zz_824_}}};
  assign _zz_814_ = 32'h78000170;
  assign _zz_815_ = (decode_INSTRUCTION & 32'h7c000120);
  assign _zz_816_ = 32'h4c000120;
  assign _zz_817_ = ((decode_INSTRUCTION & 32'hc0100000) == 32'h00100000);
  assign _zz_818_ = ((decode_INSTRUCTION & _zz_825_) == 32'h00100000);
  assign _zz_819_ = {_zz_177_,{_zz_176_,{_zz_826_,_zz_827_}}};
  assign _zz_820_ = {(_zz_828_ == _zz_829_),{_zz_830_,{_zz_831_,_zz_832_}}};
  assign _zz_821_ = 8'h0;
  assign _zz_822_ = ({_zz_194_,{_zz_833_,_zz_834_}} != (3'b000));
  assign _zz_823_ = (_zz_835_ != (1'b0));
  assign _zz_824_ = {(_zz_836_ != _zz_837_),{_zz_838_,{_zz_839_,_zz_840_}}};
  assign _zz_825_ = 32'h44100000;
  assign _zz_826_ = (_zz_841_ == _zz_842_);
  assign _zz_827_ = {_zz_201_,{_zz_843_,_zz_844_}};
  assign _zz_828_ = (decode_INSTRUCTION & 32'hd8000030);
  assign _zz_829_ = 32'h58000010;
  assign _zz_830_ = ((decode_INSTRUCTION & _zz_845_) == 32'h5c000000);
  assign _zz_831_ = (_zz_846_ == _zz_847_);
  assign _zz_832_ = {_zz_848_,{_zz_849_,_zz_850_}};
  assign _zz_833_ = _zz_199_;
  assign _zz_834_ = (_zz_851_ == _zz_852_);
  assign _zz_835_ = ((decode_INSTRUCTION & _zz_853_) == 32'h20000200);
  assign _zz_836_ = (_zz_854_ == _zz_855_);
  assign _zz_837_ = (1'b0);
  assign _zz_838_ = ({_zz_856_,_zz_857_} != (2'b00));
  assign _zz_839_ = (_zz_858_ != _zz_859_);
  assign _zz_840_ = {_zz_860_,{_zz_861_,_zz_862_}};
  assign _zz_841_ = (decode_INSTRUCTION & 32'hec000000);
  assign _zz_842_ = 32'h0c000000;
  assign _zz_843_ = _zz_175_;
  assign _zz_844_ = {_zz_174_,{_zz_863_,_zz_864_}};
  assign _zz_845_ = 32'hfc000000;
  assign _zz_846_ = (decode_INSTRUCTION & 32'hd8000508);
  assign _zz_847_ = 32'h58000500;
  assign _zz_848_ = ((decode_INSTRUCTION & _zz_865_) == 32'h58000200);
  assign _zz_849_ = (_zz_866_ == _zz_867_);
  assign _zz_850_ = {_zz_868_,{_zz_869_,_zz_870_}};
  assign _zz_851_ = (decode_INSTRUCTION & 32'h78000132);
  assign _zz_852_ = 32'h78000010;
  assign _zz_853_ = 32'h20000200;
  assign _zz_854_ = (decode_INSTRUCTION & 32'h20000200);
  assign _zz_855_ = 32'h20000000;
  assign _zz_856_ = (_zz_871_ == _zz_872_);
  assign _zz_857_ = (_zz_873_ == _zz_874_);
  assign _zz_858_ = (_zz_875_ == _zz_876_);
  assign _zz_859_ = (1'b0);
  assign _zz_860_ = ({_zz_877_,_zz_878_} != (2'b00));
  assign _zz_861_ = (_zz_879_ != _zz_880_);
  assign _zz_862_ = {_zz_881_,{_zz_882_,_zz_883_}};
  assign _zz_863_ = _zz_173_;
  assign _zz_864_ = {_zz_172_,{_zz_884_,_zz_885_}};
  assign _zz_865_ = 32'hd8000604;
  assign _zz_866_ = (decode_INSTRUCTION & 32'hd8000504);
  assign _zz_867_ = 32'h58000000;
  assign _zz_868_ = ((decode_INSTRUCTION & _zz_886_) == 32'h58000028);
  assign _zz_869_ = (_zz_887_ == _zz_888_);
  assign _zz_870_ = (_zz_889_ == _zz_890_);
  assign _zz_871_ = (decode_INSTRUCTION & 32'h04000000);
  assign _zz_872_ = 32'h0;
  assign _zz_873_ = (decode_INSTRUCTION & 32'h20000600);
  assign _zz_874_ = 32'h20000400;
  assign _zz_875_ = (decode_INSTRUCTION & 32'h781001b8);
  assign _zz_876_ = 32'h78100020;
  assign _zz_877_ = (_zz_891_ == _zz_892_);
  assign _zz_878_ = (_zz_893_ == _zz_894_);
  assign _zz_879_ = {_zz_895_,{_zz_896_,_zz_897_}};
  assign _zz_880_ = 5'h0;
  assign _zz_881_ = ({_zz_898_,_zz_899_} != (4'b0000));
  assign _zz_882_ = (_zz_900_ != _zz_901_);
  assign _zz_883_ = {_zz_902_,{_zz_903_,_zz_904_}};
  assign _zz_884_ = _zz_171_;
  assign _zz_885_ = {_zz_170_,{_zz_905_,_zz_906_}};
  assign _zz_886_ = 32'hd8000468;
  assign _zz_887_ = (decode_INSTRUCTION & 32'hd80002c8);
  assign _zz_888_ = 32'h58000200;
  assign _zz_889_ = (decode_INSTRUCTION & 32'hd8000384);
  assign _zz_890_ = 32'h58000000;
  assign _zz_891_ = (decode_INSTRUCTION & 32'h20000040);
  assign _zz_892_ = 32'h20000000;
  assign _zz_893_ = (decode_INSTRUCTION & 32'h28000000);
  assign _zz_894_ = 32'h08000000;
  assign _zz_895_ = ((decode_INSTRUCTION & _zz_907_) == 32'h10000000);
  assign _zz_896_ = (_zz_908_ == _zz_909_);
  assign _zz_897_ = {_zz_910_,{_zz_911_,_zz_912_}};
  assign _zz_898_ = (_zz_913_ == _zz_914_);
  assign _zz_899_ = {_zz_162_,{_zz_915_,_zz_916_}};
  assign _zz_900_ = {_zz_917_,_zz_918_};
  assign _zz_901_ = (2'b00);
  assign _zz_902_ = ({_zz_919_,_zz_920_} != 8'h0);
  assign _zz_903_ = (_zz_921_ != _zz_922_);
  assign _zz_904_ = {_zz_923_,{_zz_924_,_zz_925_}};
  assign _zz_905_ = _zz_158_;
  assign _zz_906_ = {_zz_157_,{_zz_926_,_zz_927_}};
  assign _zz_907_ = 32'hb0000000;
  assign _zz_908_ = (decode_INSTRUCTION & 32'h5800020c);
  assign _zz_909_ = 32'h58000200;
  assign _zz_910_ = ((decode_INSTRUCTION & _zz_928_) == 32'h58000020);
  assign _zz_911_ = (_zz_929_ == _zz_930_);
  assign _zz_912_ = (_zz_931_ == _zz_932_);
  assign _zz_913_ = (decode_INSTRUCTION & 32'h68000000);
  assign _zz_914_ = 32'h60000000;
  assign _zz_915_ = (_zz_933_ == _zz_934_);
  assign _zz_916_ = (_zz_935_ == _zz_936_);
  assign _zz_917_ = ((decode_INSTRUCTION & _zz_937_) == 32'h28000000);
  assign _zz_918_ = ((decode_INSTRUCTION & _zz_938_) == 32'h78000040);
  assign _zz_919_ = (_zz_939_ == _zz_940_);
  assign _zz_920_ = {_zz_941_,{_zz_942_,_zz_943_}};
  assign _zz_921_ = {_zz_200_,{_zz_944_,_zz_945_}};
  assign _zz_922_ = (4'b0000);
  assign _zz_923_ = (_zz_198_ != (1'b0));
  assign _zz_924_ = (_zz_946_ != _zz_947_);
  assign _zz_925_ = {_zz_948_,{_zz_949_,_zz_950_}};
  assign _zz_926_ = _zz_156_;
  assign _zz_927_ = {_zz_951_,{_zz_952_,_zz_953_}};
  assign _zz_928_ = 32'h58000228;
  assign _zz_929_ = (decode_INSTRUCTION & 32'h580002c4);
  assign _zz_930_ = 32'h580002c0;
  assign _zz_931_ = (decode_INSTRUCTION & 32'h5800042a);
  assign _zz_932_ = 32'h58000020;
  assign _zz_933_ = (decode_INSTRUCTION & 32'h6000000c);
  assign _zz_934_ = 32'h60000008;
  assign _zz_935_ = (decode_INSTRUCTION & 32'h6000002c);
  assign _zz_936_ = 32'h60000024;
  assign _zz_937_ = 32'hfc000000;
  assign _zz_938_ = 32'h78000070;
  assign _zz_939_ = (decode_INSTRUCTION & 32'ha8100000);
  assign _zz_940_ = 32'ha8100000;
  assign _zz_941_ = ((decode_INSTRUCTION & _zz_954_) == 32'hac000000);
  assign _zz_942_ = (_zz_955_ == _zz_956_);
  assign _zz_943_ = {_zz_957_,{_zz_958_,_zz_959_}};
  assign _zz_944_ = (_zz_960_ == _zz_961_);
  assign _zz_945_ = {_zz_199_,_zz_962_};
  assign _zz_946_ = {_zz_197_,_zz_168_};
  assign _zz_947_ = (2'b00);
  assign _zz_948_ = ({_zz_963_,_zz_964_} != (3'b000));
  assign _zz_949_ = (_zz_965_ != _zz_966_);
  assign _zz_950_ = {_zz_967_,{_zz_968_,_zz_969_}};
  assign _zz_951_ = ((decode_INSTRUCTION & _zz_970_) == 32'h30000000);
  assign _zz_952_ = _zz_155_;
  assign _zz_953_ = {_zz_200_,{_zz_971_,_zz_972_}};
  assign _zz_954_ = 32'hfc000000;
  assign _zz_955_ = (decode_INSTRUCTION & 32'hfc040000);
  assign _zz_956_ = 32'ha8040000;
  assign _zz_957_ = ((decode_INSTRUCTION & _zz_973_) == 32'ha8080000);
  assign _zz_958_ = (_zz_974_ == _zz_975_);
  assign _zz_959_ = {_zz_976_,{_zz_977_,_zz_978_}};
  assign _zz_960_ = (decode_INSTRUCTION & 32'h7800020c);
  assign _zz_961_ = 32'h78000200;
  assign _zz_962_ = ((decode_INSTRUCTION & _zz_979_) == 32'h78000010);
  assign _zz_963_ = _zz_197_;
  assign _zz_964_ = {_zz_196_,_zz_980_};
  assign _zz_965_ = {_zz_164_,_zz_981_};
  assign _zz_966_ = (2'b00);
  assign _zz_967_ = ({_zz_982_,_zz_983_} != (4'b0000));
  assign _zz_968_ = (_zz_984_ != _zz_985_);
  assign _zz_969_ = {_zz_986_,{_zz_987_,_zz_988_}};
  assign _zz_970_ = 32'hf8000000;
  assign _zz_971_ = (_zz_989_ == _zz_990_);
  assign _zz_972_ = {_zz_181_,{_zz_991_,_zz_992_}};
  assign _zz_973_ = 32'hfc080000;
  assign _zz_974_ = (decode_INSTRUCTION & 32'hfc020000);
  assign _zz_975_ = 32'ha8020000;
  assign _zz_976_ = ((decode_INSTRUCTION & _zz_993_) == 32'ha8010000);
  assign _zz_977_ = (_zz_994_ == _zz_995_);
  assign _zz_978_ = (_zz_996_ == _zz_997_);
  assign _zz_979_ = 32'h78000272;
  assign _zz_980_ = ((decode_INSTRUCTION & _zz_998_) == 32'h78000080);
  assign _zz_981_ = ((decode_INSTRUCTION & _zz_999_) == 32'h0);
  assign _zz_982_ = (_zz_1000_ == _zz_1001_);
  assign _zz_983_ = {_zz_1002_,{_zz_1003_,_zz_1004_}};
  assign _zz_984_ = {_zz_146_,_zz_1005_};
  assign _zz_985_ = (2'b00);
  assign _zz_986_ = ({_zz_1006_,_zz_1007_} != (2'b00));
  assign _zz_987_ = (_zz_1008_ != _zz_1009_);
  assign _zz_988_ = {_zz_1010_,{_zz_1011_,_zz_1012_}};
  assign _zz_989_ = (decode_INSTRUCTION & 32'h78000030);
  assign _zz_990_ = 32'h78000010;
  assign _zz_991_ = _zz_180_;
  assign _zz_992_ = {_zz_183_,{_zz_1013_,_zz_1014_}};
  assign _zz_993_ = 32'hfc010000;
  assign _zz_994_ = (decode_INSTRUCTION & 32'h780003a8);
  assign _zz_995_ = 32'h780002a8;
  assign _zz_996_ = (decode_INSTRUCTION & 32'hfc0f0000);
  assign _zz_997_ = 32'ha8000000;
  assign _zz_998_ = 32'h780005e8;
  assign _zz_999_ = 32'h80000280;
  assign _zz_1000_ = (decode_INSTRUCTION & 32'h08000000);
  assign _zz_1001_ = 32'h0;
  assign _zz_1002_ = ((decode_INSTRUCTION & _zz_1015_) == 32'h00000200);
  assign _zz_1003_ = (_zz_1016_ == _zz_1017_);
  assign _zz_1004_ = (_zz_1018_ == _zz_1019_);
  assign _zz_1005_ = ((decode_INSTRUCTION & _zz_1020_) == 32'h00000100);
  assign _zz_1006_ = _zz_140_;
  assign _zz_1007_ = _zz_139_;
  assign _zz_1008_ = {_zz_190_,{_zz_1021_,_zz_1022_}};
  assign _zz_1009_ = 8'h0;
  assign _zz_1010_ = ({_zz_1023_,_zz_1024_} != (4'b0000));
  assign _zz_1011_ = (_zz_1025_ != _zz_1026_);
  assign _zz_1012_ = {_zz_1027_,{_zz_1028_,_zz_1029_}};
  assign _zz_1013_ = _zz_182_;
  assign _zz_1014_ = {_zz_1030_,{_zz_1031_,_zz_1032_}};
  assign _zz_1015_ = 32'h80000200;
  assign _zz_1016_ = (decode_INSTRUCTION & 32'h60000000);
  assign _zz_1017_ = 32'h20000000;
  assign _zz_1018_ = (decode_INSTRUCTION & 32'h80000080);
  assign _zz_1019_ = 32'h0;
  assign _zz_1020_ = 32'h80000100;
  assign _zz_1021_ = (_zz_1033_ == _zz_1034_);
  assign _zz_1022_ = {_zz_1035_,{_zz_1036_,_zz_1037_}};
  assign _zz_1023_ = _zz_165_;
  assign _zz_1024_ = {_zz_142_,{_zz_1038_,_zz_1039_}};
  assign _zz_1025_ = {_zz_163_,{_zz_1040_,_zz_1041_}};
  assign _zz_1026_ = 9'h0;
  assign _zz_1027_ = ({_zz_1042_,_zz_1043_} != 5'h0);
  assign _zz_1028_ = (_zz_1044_ != _zz_1045_);
  assign _zz_1029_ = {_zz_1046_,{_zz_1047_,_zz_1048_}};
  assign _zz_1030_ = ((decode_INSTRUCTION & _zz_1049_) == 32'h50000000);
  assign _zz_1031_ = (_zz_1050_ == _zz_1051_);
  assign _zz_1032_ = {_zz_142_,{_zz_1052_,_zz_1053_}};
  assign _zz_1033_ = (decode_INSTRUCTION & 32'hf8000000);
  assign _zz_1034_ = 32'h50000000;
  assign _zz_1035_ = ((decode_INSTRUCTION & _zz_1054_) == 32'h58000200);
  assign _zz_1036_ = (_zz_1055_ == _zz_1056_);
  assign _zz_1037_ = {_zz_1057_,{_zz_1058_,_zz_1059_}};
  assign _zz_1038_ = _zz_167_;
  assign _zz_1039_ = _zz_141_;
  assign _zz_1040_ = _zz_144_;
  assign _zz_1041_ = {_zz_162_,{_zz_1060_,_zz_1061_}};
  assign _zz_1042_ = (_zz_1062_ == _zz_1063_);
  assign _zz_1043_ = {_zz_195_,{_zz_1064_,_zz_1065_}};
  assign _zz_1044_ = {_zz_1066_,{_zz_1067_,_zz_1068_}};
  assign _zz_1045_ = 6'h0;
  assign _zz_1046_ = ({_zz_1069_,_zz_1070_} != 6'h0);
  assign _zz_1047_ = (_zz_1071_ != _zz_1072_);
  assign _zz_1048_ = {_zz_1073_,{_zz_1074_,_zz_1075_}};
  assign _zz_1049_ = 32'hfc000000;
  assign _zz_1050_ = (decode_INSTRUCTION & 32'h78000188);
  assign _zz_1051_ = 32'h78000180;
  assign _zz_1052_ = (_zz_1076_ == _zz_1077_);
  assign _zz_1053_ = {_zz_1078_,{_zz_1079_,_zz_1080_}};
  assign _zz_1054_ = 32'hd8000282;
  assign _zz_1055_ = (decode_INSTRUCTION & 32'hd8000124);
  assign _zz_1056_ = 32'h58000020;
  assign _zz_1057_ = ((decode_INSTRUCTION & _zz_1081_) == 32'h58000004);
  assign _zz_1058_ = (_zz_1082_ == _zz_1083_);
  assign _zz_1059_ = {_zz_1084_,_zz_1085_};
  assign _zz_1060_ = (_zz_1086_ == _zz_1087_);
  assign _zz_1061_ = {_zz_1088_,{_zz_1089_,_zz_1090_}};
  assign _zz_1062_ = (decode_INSTRUCTION & 32'h78000004);
  assign _zz_1063_ = 32'h48000004;
  assign _zz_1064_ = _zz_193_;
  assign _zz_1065_ = {_zz_192_,_zz_191_};
  assign _zz_1066_ = ((decode_INSTRUCTION & _zz_1091_) == 32'h0);
  assign _zz_1067_ = _zz_195_;
  assign _zz_1068_ = {_zz_194_,{_zz_1092_,_zz_1093_}};
  assign _zz_1069_ = _zz_145_;
  assign _zz_1070_ = {_zz_163_,{_zz_1094_,_zz_1095_}};
  assign _zz_1071_ = (_zz_1096_ == _zz_1097_);
  assign _zz_1072_ = (1'b0);
  assign _zz_1073_ = ({_zz_1098_,_zz_1099_} != (2'b00));
  assign _zz_1074_ = (_zz_1100_ != _zz_1101_);
  assign _zz_1075_ = {_zz_1102_,{_zz_1103_,_zz_1104_}};
  assign _zz_1076_ = (decode_INSTRUCTION & _zz_1105_);
  assign _zz_1077_ = 32'h38100008;
  assign _zz_1078_ = (_zz_1106_ == _zz_1107_);
  assign _zz_1079_ = _zz_1108_;
  assign _zz_1080_ = {_zz_1109_,_zz_1110_};
  assign _zz_1081_ = 32'hd8000026;
  assign _zz_1082_ = (decode_INSTRUCTION & _zz_1111_);
  assign _zz_1083_ = 32'h58000200;
  assign _zz_1084_ = (_zz_1112_ == _zz_1113_);
  assign _zz_1085_ = (_zz_1114_ == _zz_1115_);
  assign _zz_1086_ = (decode_INSTRUCTION & _zz_1116_);
  assign _zz_1087_ = 32'h40000020;
  assign _zz_1088_ = (_zz_1117_ == _zz_1118_);
  assign _zz_1089_ = _zz_1119_;
  assign _zz_1090_ = {_zz_1120_,_zz_1121_};
  assign _zz_1091_ = 32'hd8000000;
  assign _zz_1092_ = _zz_193_;
  assign _zz_1093_ = {_zz_1122_,_zz_1123_};
  assign _zz_1094_ = _zz_1124_;
  assign _zz_1095_ = {_zz_1125_,_zz_1126_};
  assign _zz_1096_ = (decode_INSTRUCTION & _zz_1127_);
  assign _zz_1097_ = 32'h4c000400;
  assign _zz_1098_ = _zz_1128_;
  assign _zz_1099_ = _zz_1129_;
  assign _zz_1100_ = {_zz_1130_,_zz_1131_};
  assign _zz_1101_ = (3'b000);
  assign _zz_1102_ = (_zz_1132_ != _zz_1133_);
  assign _zz_1103_ = _zz_1134_;
  assign _zz_1104_ = {_zz_1135_,_zz_1136_};
  assign _zz_1105_ = 32'h38100458;
  assign _zz_1106_ = (decode_INSTRUCTION & _zz_1137_);
  assign _zz_1107_ = 32'h78000000;
  assign _zz_1108_ = (_zz_1138_ == _zz_1139_);
  assign _zz_1109_ = _zz_1140_;
  assign _zz_1110_ = {_zz_1141_,_zz_1142_};
  assign _zz_1111_ = 32'hd8000244;
  assign _zz_1112_ = (decode_INSTRUCTION & _zz_1143_);
  assign _zz_1113_ = 32'h580000c0;
  assign _zz_1114_ = (decode_INSTRUCTION & _zz_1144_);
  assign _zz_1115_ = 32'h58000010;
  assign _zz_1116_ = 32'h40000024;
  assign _zz_1117_ = (decode_INSTRUCTION & _zz_1145_);
  assign _zz_1118_ = 32'h40000020;
  assign _zz_1119_ = (_zz_1146_ == _zz_1147_);
  assign _zz_1120_ = _zz_1148_;
  assign _zz_1121_ = {_zz_1149_,_zz_1150_};
  assign _zz_1122_ = _zz_192_;
  assign _zz_1123_ = _zz_191_;
  assign _zz_1124_ = (_zz_1151_ == _zz_1152_);
  assign _zz_1125_ = _zz_144_;
  assign _zz_1126_ = {_zz_1153_,_zz_1154_};
  assign _zz_1127_ = 32'h7c000404;
  assign _zz_1128_ = (_zz_1155_ == _zz_1156_);
  assign _zz_1129_ = (_zz_1157_ == _zz_1158_);
  assign _zz_1130_ = _zz_1159_;
  assign _zz_1131_ = {_zz_1160_,_zz_1161_};
  assign _zz_1132_ = {_zz_1162_,_zz_1163_};
  assign _zz_1133_ = 20'h0;
  assign _zz_1134_ = (_zz_1164_ != _zz_1165_);
  assign _zz_1135_ = _zz_1166_;
  assign _zz_1136_ = {_zz_1167_,_zz_1168_};
  assign _zz_1137_ = 32'h78000524;
  assign _zz_1138_ = (decode_INSTRUCTION & 32'h38010478);
  assign _zz_1139_ = 32'h38010028;
  assign _zz_1140_ = ((decode_INSTRUCTION & _zz_1169_) == 32'h38020028);
  assign _zz_1141_ = (_zz_1170_ == _zz_1171_);
  assign _zz_1142_ = (_zz_1172_ == _zz_1173_);
  assign _zz_1143_ = 32'hd80002c4;
  assign _zz_1144_ = 32'hd80000b2;
  assign _zz_1145_ = 32'h40000028;
  assign _zz_1146_ = (decode_INSTRUCTION & 32'h40000414);
  assign _zz_1147_ = 32'h40000400;
  assign _zz_1148_ = ((decode_INSTRUCTION & _zz_1174_) == 32'h40000008);
  assign _zz_1149_ = (_zz_1175_ == _zz_1176_);
  assign _zz_1150_ = (_zz_1177_ == _zz_1178_);
  assign _zz_1151_ = (decode_INSTRUCTION & 32'h40000120);
  assign _zz_1152_ = 32'h40000120;
  assign _zz_1153_ = _zz_162_;
  assign _zz_1154_ = (_zz_1179_ == _zz_1180_);
  assign _zz_1155_ = (decode_INSTRUCTION & 32'hfc000000);
  assign _zz_1156_ = 32'h40000000;
  assign _zz_1157_ = (decode_INSTRUCTION & 32'h7c0005e0);
  assign _zz_1158_ = 32'h4c000020;
  assign _zz_1159_ = ((decode_INSTRUCTION & _zz_1181_) == 32'h48000000);
  assign _zz_1160_ = (_zz_1182_ == _zz_1183_);
  assign _zz_1161_ = (_zz_1184_ == _zz_1185_);
  assign _zz_1162_ = (_zz_1186_ == _zz_1187_);
  assign _zz_1163_ = {_zz_1188_,{_zz_1189_,_zz_1190_}};
  assign _zz_1164_ = {_zz_137_,{_zz_1191_,_zz_1192_}};
  assign _zz_1165_ = (3'b000);
  assign _zz_1166_ = ({_zz_1193_,_zz_1194_} != (3'b000));
  assign _zz_1167_ = (_zz_1195_ != _zz_1196_);
  assign _zz_1168_ = {_zz_1197_,{_zz_1198_,_zz_1199_}};
  assign _zz_1169_ = 32'h38020478;
  assign _zz_1170_ = (decode_INSTRUCTION & 32'h38080478);
  assign _zz_1171_ = 32'h38080028;
  assign _zz_1172_ = (decode_INSTRUCTION & 32'h38040478);
  assign _zz_1173_ = 32'h38040028;
  assign _zz_1174_ = 32'h40000038;
  assign _zz_1175_ = (decode_INSTRUCTION & 32'hf0000000);
  assign _zz_1176_ = 32'h0;
  assign _zz_1177_ = (decode_INSTRUCTION & 32'hb0000004);
  assign _zz_1178_ = 32'h0;
  assign _zz_1179_ = (decode_INSTRUCTION & 32'h40000022);
  assign _zz_1180_ = 32'h40000020;
  assign _zz_1181_ = 32'hfc000000;
  assign _zz_1182_ = (decode_INSTRUCTION & 32'h78000046);
  assign _zz_1183_ = 32'h48000040;
  assign _zz_1184_ = (decode_INSTRUCTION & 32'h780005e0);
  assign _zz_1185_ = 32'h48000020;
  assign _zz_1186_ = (decode_INSTRUCTION & 32'h60000030);
  assign _zz_1187_ = 32'h60000030;
  assign _zz_1188_ = ((decode_INSTRUCTION & _zz_1200_) == 32'h60000020);
  assign _zz_1189_ = (_zz_1201_ == _zz_1202_);
  assign _zz_1190_ = {_zz_187_,{_zz_1203_,_zz_1204_}};
  assign _zz_1191_ = _zz_153_;
  assign _zz_1192_ = _zz_152_;
  assign _zz_1193_ = _zz_189_;
  assign _zz_1194_ = {_zz_188_,_zz_1205_};
  assign _zz_1195_ = {_zz_1206_,{_zz_1207_,_zz_1208_}};
  assign _zz_1196_ = 25'h0;
  assign _zz_1197_ = ({_zz_1209_,_zz_1210_} != 20'h0);
  assign _zz_1198_ = (_zz_1211_ != _zz_1212_);
  assign _zz_1199_ = {_zz_1213_,{_zz_1214_,_zz_1215_}};
  assign _zz_1200_ = 32'h60000024;
  assign _zz_1201_ = (decode_INSTRUCTION & 32'hd0100000);
  assign _zz_1202_ = 32'h90100000;
  assign _zz_1203_ = _zz_186_;
  assign _zz_1204_ = {_zz_189_,{_zz_1216_,_zz_1217_}};
  assign _zz_1205_ = ((decode_INSTRUCTION & _zz_1218_) == 32'h78000140);
  assign _zz_1206_ = ((decode_INSTRUCTION & _zz_1219_) == 32'h60000010);
  assign _zz_1207_ = _zz_160_;
  assign _zz_1208_ = {_zz_1220_,{_zz_1221_,_zz_1222_}};
  assign _zz_1209_ = (_zz_1223_ == _zz_1224_);
  assign _zz_1210_ = {_zz_179_,{_zz_1225_,_zz_1226_}};
  assign _zz_1211_ = (_zz_1227_ == _zz_1228_);
  assign _zz_1212_ = (1'b0);
  assign _zz_1213_ = ({_zz_1229_,_zz_1230_} != (2'b00));
  assign _zz_1214_ = (_zz_1231_ != _zz_1232_);
  assign _zz_1215_ = {_zz_1233_,{_zz_1234_,_zz_1235_}};
  assign _zz_1216_ = _zz_188_;
  assign _zz_1217_ = {_zz_190_,{_zz_1236_,_zz_1237_}};
  assign _zz_1218_ = 32'h78000150;
  assign _zz_1219_ = 32'h60000010;
  assign _zz_1220_ = ((decode_INSTRUCTION & _zz_1238_) == 32'h60000060);
  assign _zz_1221_ = (_zz_1239_ == _zz_1240_);
  assign _zz_1222_ = {_zz_179_,{_zz_1241_,_zz_1242_}};
  assign _zz_1223_ = (decode_INSTRUCTION & 32'hc0100000);
  assign _zz_1224_ = 32'h80100000;
  assign _zz_1225_ = _zz_159_;
  assign _zz_1226_ = {_zz_178_,{_zz_1243_,_zz_1244_}};
  assign _zz_1227_ = (decode_INSTRUCTION & 32'h780003a8);
  assign _zz_1228_ = 32'h78000300;
  assign _zz_1229_ = (_zz_1245_ == _zz_1246_);
  assign _zz_1230_ = (_zz_1247_ == _zz_1248_);
  assign _zz_1231_ = {_zz_138_,_zz_1249_};
  assign _zz_1232_ = (2'b00);
  assign _zz_1233_ = ({_zz_1250_,_zz_1251_} != (3'b000));
  assign _zz_1234_ = (_zz_1252_ != _zz_1253_);
  assign _zz_1235_ = {_zz_1254_,{_zz_1255_,_zz_1256_}};
  assign _zz_1236_ = (_zz_1257_ == _zz_1258_);
  assign _zz_1237_ = {_zz_1259_,{_zz_1260_,_zz_1261_}};
  assign _zz_1238_ = 32'h60000060;
  assign _zz_1239_ = (decode_INSTRUCTION & 32'h60000120);
  assign _zz_1240_ = 32'h60000020;
  assign _zz_1241_ = (_zz_1262_ == _zz_1263_);
  assign _zz_1242_ = {_zz_187_,{_zz_1264_,_zz_1265_}};
  assign _zz_1243_ = _zz_177_;
  assign _zz_1244_ = {_zz_176_,{_zz_1266_,_zz_1267_}};
  assign _zz_1245_ = (decode_INSTRUCTION & 32'h000000c0);
  assign _zz_1246_ = 32'h00000040;
  assign _zz_1247_ = (decode_INSTRUCTION & 32'h00000280);
  assign _zz_1248_ = 32'h0;
  assign _zz_1249_ = ((decode_INSTRUCTION & _zz_1268_) == 32'h00000100);
  assign _zz_1250_ = (_zz_1269_ == _zz_1270_);
  assign _zz_1251_ = {_zz_1271_,_zz_1272_};
  assign _zz_1252_ = {_zz_1273_,_zz_142_};
  assign _zz_1253_ = (2'b00);
  assign _zz_1254_ = (_zz_169_ != (1'b0));
  assign _zz_1255_ = (_zz_1274_ != _zz_1275_);
  assign _zz_1256_ = {_zz_1276_,{_zz_1277_,_zz_1278_}};
  assign _zz_1257_ = (decode_INSTRUCTION & 32'h60000528);
  assign _zz_1258_ = 32'h60000128;
  assign _zz_1259_ = ((decode_INSTRUCTION & _zz_1279_) == 32'h60000300);
  assign _zz_1260_ = (_zz_1280_ == _zz_1281_);
  assign _zz_1261_ = {_zz_1282_,{_zz_1283_,_zz_1284_}};
  assign _zz_1262_ = (decode_INSTRUCTION & 32'hd0100000);
  assign _zz_1263_ = 32'h10100000;
  assign _zz_1264_ = _zz_159_;
  assign _zz_1265_ = {_zz_186_,{_zz_1285_,_zz_1286_}};
  assign _zz_1266_ = _zz_175_;
  assign _zz_1267_ = {_zz_174_,{_zz_1287_,_zz_1288_}};
  assign _zz_1268_ = 32'h00000180;
  assign _zz_1269_ = (decode_INSTRUCTION & 32'h00000300);
  assign _zz_1270_ = 32'h00000300;
  assign _zz_1271_ = ((decode_INSTRUCTION & _zz_1289_) == 32'h00000140);
  assign _zz_1272_ = ((decode_INSTRUCTION & _zz_1290_) == 32'h00000240);
  assign _zz_1273_ = ((decode_INSTRUCTION & _zz_1291_) == 32'h78000300);
  assign _zz_1274_ = _zz_168_;
  assign _zz_1275_ = (1'b0);
  assign _zz_1276_ = (_zz_151_ != (1'b0));
  assign _zz_1277_ = (_zz_1292_ != _zz_1293_);
  assign _zz_1278_ = {_zz_1294_,{_zz_1295_,_zz_1296_}};
  assign _zz_1279_ = 32'h60000318;
  assign _zz_1280_ = (decode_INSTRUCTION & 32'hf4020000);
  assign _zz_1281_ = 32'h90020000;
  assign _zz_1282_ = ((decode_INSTRUCTION & _zz_1297_) == 32'h90040000);
  assign _zz_1283_ = (_zz_1298_ == _zz_1299_);
  assign _zz_1284_ = {_zz_1300_,{_zz_1301_,_zz_1302_}};
  assign _zz_1285_ = _zz_178_;
  assign _zz_1286_ = {_zz_185_,{_zz_1303_,_zz_1304_}};
  assign _zz_1287_ = _zz_173_;
  assign _zz_1288_ = {_zz_172_,{_zz_1305_,_zz_1306_}};
  assign _zz_1289_ = 32'h00000140;
  assign _zz_1290_ = 32'h00000240;
  assign _zz_1291_ = 32'h78000318;
  assign _zz_1292_ = {_zz_1307_,{_zz_1308_,_zz_1309_}};
  assign _zz_1293_ = (4'b0000);
  assign _zz_1294_ = ({_zz_1310_,_zz_1311_} != (4'b0000));
  assign _zz_1295_ = (_zz_1312_ != _zz_1313_);
  assign _zz_1296_ = {_zz_1314_,{_zz_1315_,_zz_1316_}};
  assign _zz_1297_ = 32'hdc040000;
  assign _zz_1298_ = (decode_INSTRUCTION & 32'hf4080000);
  assign _zz_1299_ = 32'h90080000;
  assign _zz_1300_ = ((decode_INSTRUCTION & _zz_1317_) == 32'h90020000);
  assign _zz_1301_ = (_zz_1318_ == _zz_1319_);
  assign _zz_1302_ = {_zz_1320_,{_zz_1321_,_zz_1322_}};
  assign _zz_1303_ = (_zz_1323_ == _zz_1324_);
  assign _zz_1304_ = {_zz_1325_,{_zz_1326_,_zz_1327_}};
  assign _zz_1305_ = _zz_171_;
  assign _zz_1306_ = {_zz_170_,{_zz_1328_,_zz_1329_}};
  assign _zz_1307_ = ((decode_INSTRUCTION & _zz_1330_) == 32'h04000000);
  assign _zz_1308_ = _zz_149_;
  assign _zz_1309_ = {_zz_1331_,_zz_1332_};
  assign _zz_1310_ = _zz_149_;
  assign _zz_1311_ = {_zz_166_,{_zz_1333_,_zz_1334_}};
  assign _zz_1312_ = {_zz_149_,{_zz_1335_,_zz_1336_}};
  assign _zz_1313_ = (4'b0000);
  assign _zz_1314_ = (_zz_153_ != (1'b0));
  assign _zz_1315_ = (_zz_1337_ != _zz_1338_);
  assign _zz_1316_ = {_zz_1339_,{_zz_1340_,_zz_1341_}};
  assign _zz_1317_ = 32'hdc020000;
  assign _zz_1318_ = (decode_INSTRUCTION & 32'hf4040000);
  assign _zz_1319_ = 32'h90040000;
  assign _zz_1320_ = ((decode_INSTRUCTION & _zz_1342_) == 32'h90010000);
  assign _zz_1321_ = (_zz_1343_ == _zz_1344_);
  assign _zz_1322_ = {_zz_1345_,{_zz_1346_,_zz_1347_}};
  assign _zz_1323_ = (decode_INSTRUCTION & 32'hac000000);
  assign _zz_1324_ = 32'h20000000;
  assign _zz_1325_ = ((decode_INSTRUCTION & _zz_1348_) == 32'h60000100);
  assign _zz_1326_ = _zz_184_;
  assign _zz_1327_ = {_zz_158_,{_zz_1349_,_zz_1350_}};
  assign _zz_1328_ = _zz_158_;
  assign _zz_1329_ = {_zz_157_,{_zz_1351_,_zz_1352_}};
  assign _zz_1330_ = 32'hbc000002;
  assign _zz_1331_ = ((decode_INSTRUCTION & _zz_1353_) == 32'h440000a0);
  assign _zz_1332_ = ((decode_INSTRUCTION & _zz_1354_) == 32'h44000060);
  assign _zz_1333_ = _zz_142_;
  assign _zz_1334_ = _zz_167_;
  assign _zz_1335_ = _zz_166_;
  assign _zz_1336_ = {_zz_165_,_zz_141_};
  assign _zz_1337_ = {_zz_147_,{_zz_1355_,_zz_1356_}};
  assign _zz_1338_ = 6'h0;
  assign _zz_1339_ = ({_zz_1357_,_zz_1358_} != (4'b0000));
  assign _zz_1340_ = (_zz_1359_ != _zz_1360_);
  assign _zz_1341_ = {_zz_1361_,{_zz_1362_,_zz_1363_}};
  assign _zz_1342_ = 32'hf4010000;
  assign _zz_1343_ = (decode_INSTRUCTION & 32'hdc010000);
  assign _zz_1344_ = 32'h90010000;
  assign _zz_1345_ = ((decode_INSTRUCTION & _zz_1364_) == 32'h90080000);
  assign _zz_1346_ = (_zz_1365_ == _zz_1366_);
  assign _zz_1347_ = (_zz_1367_ == _zz_1368_);
  assign _zz_1348_ = 32'h60000128;
  assign _zz_1349_ = _zz_157_;
  assign _zz_1350_ = {_zz_156_,{_zz_1369_,_zz_1370_}};
  assign _zz_1351_ = _zz_156_;
  assign _zz_1352_ = {_zz_155_,{_zz_1371_,_zz_1372_}};
  assign _zz_1353_ = 32'h740004a2;
  assign _zz_1354_ = 32'h74000462;
  assign _zz_1355_ = (_zz_1373_ == _zz_1374_);
  assign _zz_1356_ = {_zz_146_,{_zz_1375_,_zz_1376_}};
  assign _zz_1357_ = (_zz_1377_ == _zz_1378_);
  assign _zz_1358_ = {_zz_1379_,{_zz_1380_,_zz_1381_}};
  assign _zz_1359_ = {_zz_163_,{_zz_1382_,_zz_1383_}};
  assign _zz_1360_ = 6'h0;
  assign _zz_1361_ = ({_zz_1384_,_zz_1385_} != 15'h0);
  assign _zz_1362_ = (_zz_1386_ != _zz_1387_);
  assign _zz_1363_ = {_zz_1388_,{_zz_1389_,_zz_1390_}};
  assign _zz_1364_ = 32'hdc080000;
  assign _zz_1365_ = (decode_INSTRUCTION & 32'hdc0f0000);
  assign _zz_1366_ = 32'h90000000;
  assign _zz_1367_ = (decode_INSTRUCTION & 32'hf40f0000);
  assign _zz_1368_ = 32'h90000000;
  assign _zz_1369_ = _zz_155_;
  assign _zz_1370_ = {_zz_183_,{_zz_1391_,_zz_1392_}};
  assign _zz_1371_ = (_zz_1393_ == _zz_1394_);
  assign _zz_1372_ = {_zz_1395_,{_zz_1396_,_zz_1397_}};
  assign _zz_1373_ = (decode_INSTRUCTION & 32'h0c000000);
  assign _zz_1374_ = 32'h04000000;
  assign _zz_1375_ = (_zz_1398_ == _zz_1399_);
  assign _zz_1376_ = {_zz_1400_,_zz_164_};
  assign _zz_1377_ = (decode_INSTRUCTION & 32'h44000000);
  assign _zz_1378_ = 32'h40000000;
  assign _zz_1379_ = ((decode_INSTRUCTION & _zz_1401_) == 32'h0);
  assign _zz_1380_ = _zz_161_;
  assign _zz_1381_ = (_zz_1402_ == _zz_1403_);
  assign _zz_1382_ = _zz_162_;
  assign _zz_1383_ = {_zz_161_,{_zz_1404_,_zz_1405_}};
  assign _zz_1384_ = _zz_160_;
  assign _zz_1385_ = {_zz_159_,{_zz_1406_,_zz_1407_}};
  assign _zz_1386_ = {_zz_137_,{_zz_1408_,_zz_1409_}};
  assign _zz_1387_ = (4'b0000);
  assign _zz_1388_ = ({_zz_1410_,_zz_1411_} != 5'h0);
  assign _zz_1389_ = (_zz_1412_ != _zz_1413_);
  assign _zz_1390_ = {_zz_1414_,{_zz_1415_,_zz_1416_}};
  assign _zz_1391_ = _zz_182_;
  assign _zz_1392_ = {_zz_181_,{_zz_1417_,_zz_1418_}};
  assign _zz_1393_ = (decode_INSTRUCTION & 32'h78000438);
  assign _zz_1394_ = 32'h78000028;
  assign _zz_1395_ = ((decode_INSTRUCTION & _zz_1419_) == 32'h80000000);
  assign _zz_1396_ = _zz_154_;
  assign _zz_1397_ = (_zz_1420_ == _zz_1421_);
  assign _zz_1398_ = (decode_INSTRUCTION & 32'h14000000);
  assign _zz_1399_ = 32'h04000000;
  assign _zz_1400_ = ((decode_INSTRUCTION & _zz_1422_) == 32'h0);
  assign _zz_1401_ = 32'hb0000000;
  assign _zz_1402_ = (decode_INSTRUCTION & 32'h78000066);
  assign _zz_1403_ = 32'h78000044;
  assign _zz_1404_ = (_zz_1423_ == _zz_1424_);
  assign _zz_1405_ = {_zz_1425_,_zz_1426_};
  assign _zz_1406_ = _zz_158_;
  assign _zz_1407_ = {_zz_157_,{_zz_1427_,_zz_1428_}};
  assign _zz_1408_ = _zz_153_;
  assign _zz_1409_ = {_zz_1429_,_zz_152_};
  assign _zz_1410_ = _zz_151_;
  assign _zz_1411_ = {_zz_150_,{_zz_1430_,_zz_1431_}};
  assign _zz_1412_ = {_zz_1432_,_zz_1433_};
  assign _zz_1413_ = (2'b00);
  assign _zz_1414_ = ({_zz_1434_,_zz_1435_} != 6'h0);
  assign _zz_1415_ = (_zz_1436_ != _zz_1437_);
  assign _zz_1416_ = {_zz_1438_,{_zz_1439_,_zz_1440_}};
  assign _zz_1417_ = (_zz_1441_ == _zz_1442_);
  assign _zz_1418_ = {_zz_180_,{_zz_1443_,_zz_1444_}};
  assign _zz_1419_ = 32'he40f0000;
  assign _zz_1420_ = (decode_INSTRUCTION & 32'hcc0f0000);
  assign _zz_1421_ = 32'h80000000;
  assign _zz_1422_ = 32'h48000000;
  assign _zz_1423_ = (decode_INSTRUCTION & 32'h7c000000);
  assign _zz_1424_ = 32'h3c000000;
  assign _zz_1425_ = ((decode_INSTRUCTION & _zz_1445_) == 32'h60000080);
  assign _zz_1426_ = ((decode_INSTRUCTION & _zz_1446_) == 32'h60000080);
  assign _zz_1427_ = (_zz_1447_ == _zz_1448_);
  assign _zz_1428_ = {_zz_156_,{_zz_1449_,_zz_1450_}};
  assign _zz_1429_ = ((decode_INSTRUCTION & _zz_1451_) == 32'h78000200);
  assign _zz_1430_ = _zz_149_;
  assign _zz_1431_ = {_zz_142_,_zz_148_};
  assign _zz_1432_ = ((decode_INSTRUCTION & _zz_1452_) == 32'h0);
  assign _zz_1433_ = ((decode_INSTRUCTION & _zz_1453_) == 32'h40000010);
  assign _zz_1434_ = _zz_147_;
  assign _zz_1435_ = {_zz_1454_,{_zz_1455_,_zz_1456_}};
  assign _zz_1436_ = (_zz_1457_ == _zz_1458_);
  assign _zz_1437_ = (1'b0);
  assign _zz_1438_ = ({_zz_1459_,_zz_1460_} != 11'h0);
  assign _zz_1439_ = (_zz_1461_ != _zz_1462_);
  assign _zz_1440_ = {_zz_1463_,{_zz_1464_,_zz_1465_}};
  assign _zz_1441_ = (decode_INSTRUCTION & 32'h4c00002c);
  assign _zz_1442_ = 32'h4c000004;
  assign _zz_1443_ = _zz_154_;
  assign _zz_1444_ = (_zz_1466_ == _zz_1467_);
  assign _zz_1445_ = 32'h600001a4;
  assign _zz_1446_ = 32'h600002c2;
  assign _zz_1447_ = (decode_INSTRUCTION & 32'h7c000000);
  assign _zz_1448_ = 32'h0c000000;
  assign _zz_1449_ = _zz_155_;
  assign _zz_1450_ = {_zz_1468_,{_zz_1469_,_zz_1470_}};
  assign _zz_1451_ = 32'h78000318;
  assign _zz_1452_ = 32'h98000000;
  assign _zz_1453_ = 32'h40000134;
  assign _zz_1454_ = ((decode_INSTRUCTION & _zz_1471_) == 32'h40000020);
  assign _zz_1455_ = (_zz_1472_ == _zz_1473_);
  assign _zz_1456_ = {_zz_146_,{_zz_1474_,_zz_1475_}};
  assign _zz_1457_ = (decode_INSTRUCTION & 32'h7800032a);
  assign _zz_1458_ = 32'h78000002;
  assign _zz_1459_ = _zz_145_;
  assign _zz_1460_ = {_zz_144_,{_zz_1476_,_zz_1477_}};
  assign _zz_1461_ = {_zz_142_,_zz_141_};
  assign _zz_1462_ = (2'b00);
  assign _zz_1463_ = (_zz_1478_ != (1'b0));
  assign _zz_1464_ = (_zz_1479_ != _zz_1480_);
  assign _zz_1465_ = {_zz_1481_,{_zz_1482_,_zz_1483_}};
  assign _zz_1466_ = (decode_INSTRUCTION & 32'hf80f0000);
  assign _zz_1467_ = 32'h38000000;
  assign _zz_1468_ = ((decode_INSTRUCTION & _zz_1484_) == 32'h040000a0);
  assign _zz_1469_ = (_zz_1485_ == _zz_1486_);
  assign _zz_1470_ = {_zz_150_,{_zz_1487_,_zz_1488_}};
  assign _zz_1471_ = 32'h40000020;
  assign _zz_1472_ = (decode_INSTRUCTION & 32'h40000010);
  assign _zz_1473_ = 32'h40000000;
  assign _zz_1474_ = (_zz_1489_ == _zz_1490_);
  assign _zz_1475_ = (_zz_1491_ == _zz_1492_);
  assign _zz_1476_ = (_zz_1493_ == _zz_1494_);
  assign _zz_1477_ = {_zz_1495_,{_zz_1496_,_zz_1497_}};
  assign _zz_1478_ = ((decode_INSTRUCTION & _zz_1498_) == 32'h78000200);
  assign _zz_1479_ = {_zz_140_,_zz_139_};
  assign _zz_1480_ = (2'b00);
  assign _zz_1481_ = 1'b0;
  assign _zz_1482_ = (_zz_1499_ != _zz_1500_);
  assign _zz_1483_ = {_zz_1501_,{_zz_1502_,_zz_1503_}};
  assign _zz_1484_ = 32'h340004a0;
  assign _zz_1485_ = (decode_INSTRUCTION & 32'h34000460);
  assign _zz_1486_ = 32'h04000060;
  assign _zz_1487_ = _zz_149_;
  assign _zz_1488_ = {(_zz_1504_ == _zz_1505_),{_zz_142_,{_zz_1506_,_zz_1507_}}};
  assign _zz_1489_ = (decode_INSTRUCTION & 32'h48000000);
  assign _zz_1490_ = 32'h08000000;
  assign _zz_1491_ = (decode_INSTRUCTION & 32'h40000104);
  assign _zz_1492_ = 32'h40000004;
  assign _zz_1493_ = (decode_INSTRUCTION & 32'h58000000);
  assign _zz_1494_ = 32'h48000000;
  assign _zz_1495_ = ((decode_INSTRUCTION & 32'ha8000000) == 32'h20000000);
  assign _zz_1496_ = _zz_143_;
  assign _zz_1497_ = {(_zz_1508_ == _zz_1509_),{_zz_1510_,{_zz_1511_,_zz_1512_}}};
  assign _zz_1498_ = 32'h78000212;
  assign _zz_1499_ = ((decode_INSTRUCTION & _zz_1513_) == 32'h00000100);
  assign _zz_1500_ = (1'b0);
  assign _zz_1501_ = ((_zz_1514_ == _zz_1515_) != (1'b0));
  assign _zz_1502_ = ({_zz_1516_,_zz_1517_} != (3'b000));
  assign _zz_1503_ = (_zz_137_ != (1'b0));
  assign _zz_1504_ = (decode_INSTRUCTION & 32'h78000138);
  assign _zz_1505_ = 32'h78000028;
  assign _zz_1506_ = _zz_148_;
  assign _zz_1507_ = _zz_154_;
  assign _zz_1508_ = (decode_INSTRUCTION & 32'ha0000108);
  assign _zz_1509_ = 32'h20000108;
  assign _zz_1510_ = ((decode_INSTRUCTION & 32'ha0000018) == 32'h20000018);
  assign _zz_1511_ = ((decode_INSTRUCTION & 32'ha0000012) == 32'h20000010);
  assign _zz_1512_ = {((decode_INSTRUCTION & _zz_1518_) == 32'h20000000),{(_zz_1519_ == _zz_1520_),(_zz_1521_ == _zz_1522_)}};
  assign _zz_1513_ = 32'h00000100;
  assign _zz_1514_ = (decode_INSTRUCTION & 32'h00000180);
  assign _zz_1515_ = 32'h00000080;
  assign _zz_1516_ = ((decode_INSTRUCTION & 32'h00000400) == 32'h00000400);
  assign _zz_1517_ = {_zz_138_,((decode_INSTRUCTION & _zz_1523_) == 32'h00000200)};
  assign _zz_1518_ = 32'ha000000c;
  assign _zz_1519_ = (decode_INSTRUCTION & 32'ha0000218);
  assign _zz_1520_ = 32'h20000200;
  assign _zz_1521_ = (decode_INSTRUCTION & 32'ha0000198);
  assign _zz_1522_ = 32'h20000000;
  assign _zz_1523_ = 32'h00000300;
  assign _zz_1524_ = 11'h008;
  assign _zz_1525_ = 11'h009;
  assign _zz_1526_ = {{{{{{6'h0,MSR_VEC},(1'b0)},MSR_VSX},7'h0},MSR_EE},MSR_PR};
  assign _zz_1527_ = MSR_FP;
  assign _zz_1528_ = {{{{{{6'h0,MSR_VEC},(1'b0)},MSR_VSX},7'h0},MSR_EE},MSR_PR};
  assign _zz_1529_ = MSR_FP;
  assign _zz_1530_ = {{{{{{6'h0,MSR_VEC},(1'b0)},MSR_VSX},7'h02},MSR_EE},MSR_PR};
  assign _zz_1531_ = MSR_FP;
  always @ (posedge clk) begin
    if(_zz_113_) begin
      IBusCachedPlugin_predictor_history[IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_address] <= _zz_615_;
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_0_output_ready) begin
      _zz_383_ <= IBusCachedPlugin_predictor_history[_zz_482_];
    end
  end

  SEL_PRI_32x3 PC_LOAD (
    .src0      (_zz_317_[31:0]        ), //i
    .src1      (_zz_318_[31:0]        ), //i
    .src2      (_zz_319_[31:0]        ), //i
    .sel       (_zz_320_[2:0]         ), //i
    .result    (PC_LOAD_result[31:0]  )  //o
  );
  InstructionCache IBusCachedPlugin_cache (
    .io_flush                                     (_zz_321_                                                             ), //i
    .io_cpu_prefetch_isValid                      (_zz_322_                                                             ), //i
    .io_cpu_prefetch_haltIt                       (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt                        ), //o
    .io_cpu_prefetch_pc                           (IBusCachedPlugin_iBusRsp_stages_0_input_payload[31:0]                ), //i
    .io_cpu_fetch_isValid                         (_zz_323_                                                             ), //i
    .io_cpu_fetch_isStuck                         (_zz_324_                                                             ), //i
    .io_cpu_fetch_isRemoved                       (IBusCachedPlugin_externalFlush                                       ), //i
    .io_cpu_fetch_pc                              (IBusCachedPlugin_iBusRsp_stages_1_input_payload[31:0]                ), //i
    .io_cpu_fetch_data                            (IBusCachedPlugin_cache_io_cpu_fetch_data[31:0]                       ), //o
    .io_cpu_fetch_mmuBus_cmd_isValid              (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid               ), //o
    .io_cpu_fetch_mmuBus_cmd_virtualAddress       (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress[31:0]  ), //o
    .io_cpu_fetch_mmuBus_cmd_bypassTranslation    (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation     ), //o
    .io_cpu_fetch_mmuBus_rsp_physicalAddress      (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]                    ), //i
    .io_cpu_fetch_mmuBus_rsp_isIoAccess           (IBusCachedPlugin_mmuBus_rsp_isIoAccess                               ), //i
    .io_cpu_fetch_mmuBus_rsp_allowRead            (IBusCachedPlugin_mmuBus_rsp_allowRead                                ), //i
    .io_cpu_fetch_mmuBus_rsp_allowWrite           (IBusCachedPlugin_mmuBus_rsp_allowWrite                               ), //i
    .io_cpu_fetch_mmuBus_rsp_allowExecute         (IBusCachedPlugin_mmuBus_rsp_allowExecute                             ), //i
    .io_cpu_fetch_mmuBus_rsp_exception            (IBusCachedPlugin_mmuBus_rsp_exception                                ), //i
    .io_cpu_fetch_mmuBus_rsp_refilling            (IBusCachedPlugin_mmuBus_rsp_refilling                                ), //i
    .io_cpu_fetch_mmuBus_spr_valid                (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_spr_valid                 ), //o
    .io_cpu_fetch_mmuBus_spr_payload_id           (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_spr_payload_id[9:0]       ), //o
    .io_cpu_fetch_mmuBus_spr_payload_data         (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_spr_payload_data[31:0]    ), //o
    .io_cpu_fetch_mmuBus_end                      (IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end                       ), //o
    .io_cpu_fetch_mmuBus_busy                     (IBusCachedPlugin_mmuBus_busy                                         ), //i
    .io_cpu_fetch_physicalAddress                 (IBusCachedPlugin_cache_io_cpu_fetch_physicalAddress[31:0]            ), //o
    .io_cpu_fetch_exceptionType                   (IBusCachedPlugin_cache_io_cpu_fetch_exceptionType[3:0]               ), //o
    .io_cpu_fetch_bypassTranslation               (_zz_325_                                                             ), //i
    .io_cpu_fetch_haltIt                          (IBusCachedPlugin_cache_io_cpu_fetch_haltIt                           ), //o
    .io_cpu_decode_isValid                        (_zz_326_                                                             ), //i
    .io_cpu_decode_isStuck                        (_zz_327_                                                             ), //i
    .io_cpu_decode_pc                             (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]                ), //i
    .io_cpu_decode_physicalAddress                (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]           ), //o
    .io_cpu_decode_data                           (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]                      ), //o
    .io_cpu_decode_cacheMiss                      (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss                       ), //o
    .io_cpu_decode_error                          (IBusCachedPlugin_cache_io_cpu_decode_error                           ), //o
    .io_cpu_decode_mmuRefilling                   (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling                    ), //o
    .io_cpu_decode_mmuException                   (IBusCachedPlugin_cache_io_cpu_decode_mmuException                    ), //o
    .io_cpu_decode_isUser                         (_zz_328_                                                             ), //i
    .io_cpu_decode_exceptionType                  (IBusCachedPlugin_cache_io_cpu_decode_exceptionType[3:0]              ), //o
    .io_cpu_fill_valid                            (_zz_329_                                                             ), //i
    .io_cpu_fill_payload                          (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]           ), //i
    .io_mem_cmd_valid                             (IBusCachedPlugin_cache_io_mem_cmd_valid                              ), //o
    .io_mem_cmd_ready                             (iBus_cmd_ready                                                       ), //i
    .io_mem_cmd_payload_address                   (IBusCachedPlugin_cache_io_mem_cmd_payload_address[31:0]              ), //o
    .io_mem_cmd_payload_size                      (IBusCachedPlugin_cache_io_mem_cmd_payload_size[2:0]                  ), //o
    .io_mem_rsp_valid                             (iBus_rsp_valid                                                       ), //i
    .io_mem_rsp_payload_data                      (iBus_rsp_payload_data[31:0]                                          ), //i
    .io_mem_rsp_payload_error                     (iBus_rsp_payload_error                                               ), //i
    .io_spr_valid                                 (_zz_216_                                                             ), //i
    .io_spr_payload_id                            (_zz_330_[9:0]                                                        ), //i
    .io_spr_payload_data                          (writeBack_SRC1[31:0]                                                 ), //i
    .clk                                          (clk                                                                  ), //i
    .reset                                        (reset                                                                )  //i
  );
  DataCache dataCache_1_ (
    .io_cpu_execute_isValid                        (_zz_331_                                                    ), //i
    .io_cpu_execute_address                        (_zz_332_[31:0]                                              ), //i
    .io_cpu_execute_args_wr                        (execute_MEMORY_WR                                           ), //i
    .io_cpu_execute_args_data                      (_zz_333_[31:0]                                              ), //i
    .io_cpu_execute_args_size                      (execute_DBusCachedPlugin_size[1:0]                          ), //i
    .io_cpu_memory_isValid                         (_zz_334_                                                    ), //i
    .io_cpu_memory_isStuck                         (memory_arbitration_isStuck                                  ), //i
    .io_cpu_memory_isRemoved                       (memory_arbitration_removeIt                                 ), //i
    .io_cpu_memory_isWrite                         (dataCache_1__io_cpu_memory_isWrite                          ), //o
    .io_cpu_memory_address                         (_zz_335_[31:0]                                              ), //i
    .io_cpu_memory_mmuBus_cmd_isValid              (dataCache_1__io_cpu_memory_mmuBus_cmd_isValid               ), //o
    .io_cpu_memory_mmuBus_cmd_virtualAddress       (dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress[31:0]  ), //o
    .io_cpu_memory_mmuBus_cmd_bypassTranslation    (dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation     ), //o
    .io_cpu_memory_mmuBus_rsp_physicalAddress      (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]           ), //i
    .io_cpu_memory_mmuBus_rsp_isIoAccess           (_zz_336_                                                    ), //i
    .io_cpu_memory_mmuBus_rsp_allowRead            (DBusCachedPlugin_mmuBus_rsp_allowRead                       ), //i
    .io_cpu_memory_mmuBus_rsp_allowWrite           (DBusCachedPlugin_mmuBus_rsp_allowWrite                      ), //i
    .io_cpu_memory_mmuBus_rsp_allowExecute         (DBusCachedPlugin_mmuBus_rsp_allowExecute                    ), //i
    .io_cpu_memory_mmuBus_rsp_exception            (DBusCachedPlugin_mmuBus_rsp_exception                       ), //i
    .io_cpu_memory_mmuBus_rsp_refilling            (DBusCachedPlugin_mmuBus_rsp_refilling                       ), //i
    .io_cpu_memory_mmuBus_spr_valid                (dataCache_1__io_cpu_memory_mmuBus_spr_valid                 ), //o
    .io_cpu_memory_mmuBus_spr_payload_id           (dataCache_1__io_cpu_memory_mmuBus_spr_payload_id[9:0]       ), //o
    .io_cpu_memory_mmuBus_spr_payload_data         (dataCache_1__io_cpu_memory_mmuBus_spr_payload_data[31:0]    ), //o
    .io_cpu_memory_mmuBus_end                      (dataCache_1__io_cpu_memory_mmuBus_end                       ), //o
    .io_cpu_memory_mmuBus_busy                     (DBusCachedPlugin_mmuBus_busy                                ), //i
    .io_cpu_memory_bypassTranslation               (_zz_337_                                                    ), //i
    .io_cpu_writeBack_isValid                      (_zz_338_                                                    ), //i
    .io_cpu_writeBack_isStuck                      (writeBack_arbitration_isStuck                               ), //i
    .io_cpu_writeBack_isUser                       (_zz_339_                                                    ), //i
    .io_cpu_writeBack_haltIt                       (dataCache_1__io_cpu_writeBack_haltIt                        ), //o
    .io_cpu_writeBack_isWrite                      (dataCache_1__io_cpu_writeBack_isWrite                       ), //o
    .io_cpu_writeBack_data                         (dataCache_1__io_cpu_writeBack_data[31:0]                    ), //o
    .io_cpu_writeBack_address                      (_zz_340_[31:0]                                              ), //i
    .io_cpu_writeBack_mmuException                 (dataCache_1__io_cpu_writeBack_mmuException                  ), //o
    .io_cpu_writeBack_unalignedAccess              (dataCache_1__io_cpu_writeBack_unalignedAccess               ), //o
    .io_cpu_writeBack_accessError                  (dataCache_1__io_cpu_writeBack_accessError                   ), //o
    .io_cpu_writeBack_exceptionType                (dataCache_1__io_cpu_writeBack_exceptionType[3:0]            ), //o
    .io_cpu_redo                                   (dataCache_1__io_cpu_redo                                    ), //o
    .io_cpu_flush_valid                            (_zz_341_                                                    ), //i
    .io_cpu_flush_ready                            (dataCache_1__io_cpu_flush_ready                             ), //o
    .io_mem_cmd_valid                              (dataCache_1__io_mem_cmd_valid                               ), //o
    .io_mem_cmd_ready                              (_zz_342_                                                    ), //i
    .io_mem_cmd_payload_wr                         (dataCache_1__io_mem_cmd_payload_wr                          ), //o
    .io_mem_cmd_payload_address                    (dataCache_1__io_mem_cmd_payload_address[31:0]               ), //o
    .io_mem_cmd_payload_data                       (dataCache_1__io_mem_cmd_payload_data[31:0]                  ), //o
    .io_mem_cmd_payload_mask                       (dataCache_1__io_mem_cmd_payload_mask[3:0]                   ), //o
    .io_mem_cmd_payload_length                     (dataCache_1__io_mem_cmd_payload_length[2:0]                 ), //o
    .io_mem_cmd_payload_last                       (dataCache_1__io_mem_cmd_payload_last                        ), //o
    .io_mem_rsp_valid                              (dBus_rsp_valid                                              ), //i
    .io_mem_rsp_payload_data                       (dBus_rsp_payload_data[31:0]                                 ), //i
    .io_mem_rsp_payload_error                      (dBus_rsp_payload_error                                      ), //i
    .clk                                           (clk                                                         ), //i
    .reset                                         (reset                                                       )  //i
  );
  gpr RegFilePluginComp_regFile (
    .rd_adr_0    (decode_RegFilePluginComp_regFileReadAddress1[4:0]  ), //i
    .rd_dat_0    (RegFilePluginComp_regFile_rd_dat_0[31:0]           ), //o
    .rd_adr_1    (decode_RegFilePluginComp_regFileReadAddress2[4:0]  ), //i
    .rd_dat_1    (RegFilePluginComp_regFile_rd_dat_1[31:0]           ), //o
    .rd_adr_2    (decode_RegFilePluginComp_regFileReadAddress3[4:0]  ), //i
    .rd_dat_2    (RegFilePluginComp_regFile_rd_dat_2[31:0]           ), //o
    .wr_en_0     (_zz_343_                                           ), //i
    .wr_adr_0    (_zz_344_[4:0]                                      ), //i
    .wr_dat_0    (_zz_345_[31:0]                                     ), //i
    .clk         (clk                                                ), //i
    //.reset       (reset                                              )  //i
  );
  WBExecute WB_EXECUTE (
    .src0      (_zz_346_[31:0]           ), //i
    .src1      (_zz_347_[31:0]           ), //i
    .src2      (_zz_348_[31:0]           ), //i
    .src3      (_zz_349_[31:0]           ), //i
    .src4      (_zz_350_[31:0]           ), //i
    .src5      (_zz_351_[31:0]           ), //i
    .src6      (_zz_352_[31:0]           ), //i
    .sel       (_zz_353_[6:0]            ), //i
    .zom       (_zz_354_[2:0]            ), //i
    .result    (WB_EXECUTE_result[31:0]  )  //o
  );
  ALUL FX_ALUL (
    .src1         (execute_SRC1[31:0]                  ), //i
    .src2         (execute_SRC2[31:0]                  ), //i
    .alu_ctrl     (execute_DECODER_stageables_39[1:0]  ), //i
    .bit_ctrl     (execute_DECODER_stageables_52[3:0]  ), //i
    .rimi_ctrl    (execute_DECODER_stageables_42[2:0]  ), //i
    .spec_ctrl    (execute_DECODER_stageables_1[2:0]   ), //i
    .shift_amt    (_zz_223_[4:0]                       ), //i
    .mask_mb      (_zz_355_[4:0]                       ), //i
    .mask_me      (_zz_356_[4:0]                       ), //i
    .result       (FX_ALUL_result[31:0]                ), //o
    .cr           (FX_ALUL_cr[2:0]                     ), //o
    .xer_ca       (FX_ALUL_xer_ca                      ), //o
    .xer_ov       (FX_ALUL_xer_ov                      )  //o
  );
  SEL_32x4 SRC1 (
    .src0      (_zz_76_[31:0]      ), //i
    .src1      (_zz_357_[31:0]     ), //i
    .src2      (_zz_358_[31:0]     ), //i
    .src3      (execute_RS[31:0]   ), //i
    .sel       (_zz_359_[3:0]      ), //i
    .result    (SRC1_result[31:0]  )  //o
  );
  SEL_32x4 SRC2_A (
    .src0      (_zz_360_[31:0]       ), //i
    .src1      (_zz_361_[31:0]       ), //i
    .src2      (_zz_362_[31:0]       ), //i
    .src3      (_zz_363_[31:0]       ), //i
    .sel       (_zz_364_[3:0]        ), //i
    .result    (SRC2_A_result[31:0]  )  //o
  );
  SEL_32x3 SRC2 (
    .src0      (execute_RB[31:0]      ), //i
    .src1      (_zz_76_[31:0]         ), //i
    .src2      (SRC_src2_other[31:0]  ), //i
    .sel       (_zz_365_[2:0]         ), //i
    .result    (SRC2_result[31:0]     )  //o
  );
  ALU FX_ALU (
    .src1       (execute_SRC1[31:0]   ), //i
    .src2       (execute_SRC2[31:0]   ), //i
    .cin        (execute_SRC3         ), //i
    .result     (FX_ALU_result[31:0]  ), //o
    .add_cr     (FX_ALU_add_cr[1:0]   ), //o
    .cmp_cr     (FX_ALU_cmp_cr[1:0]   ), //o
    .cmpl_cr    (FX_ALU_cmpl_cr[1:0]  ), //o
    .ca         (FX_ALU_ca            ), //o
    .ov         (FX_ALU_ov            )  //o
  );
  MUL16_U MUL_LL (
    .src1      (_zz_366_[15:0]       ), //i
    .src2      (_zz_367_[15:0]       ), //i
    .result    (MUL_LL_result[31:0]  )  //o
  );
  MUL17_S MUL_LH (
    .src1      (_zz_368_[16:0]       ), //i
    .src2      (_zz_369_[16:0]       ), //i
    .result    (MUL_LH_result[33:0]  )  //o
  );
  MUL17_S MUL_HL (
    .src1      (_zz_370_[16:0]       ), //i
    .src2      (_zz_371_[16:0]       ), //i
    .result    (MUL_HL_result[33:0]  )  //o
  );
  MUL17_S MUL_HH (
    .src1      (_zz_372_[16:0]       ), //i
    .src2      (_zz_373_[16:0]       ), //i
    .result    (MUL_HH_result[33:0]  )  //o
  );
  MULADD_1 MUL_ADD1 (
    .src1      (_zz_374_[32:0]         ), //i
    .src2      (_zz_375_[49:0]         ), //i
    .src3      (_zz_376_[49:0]         ), //i
    .result    (MUL_ADD1_result[51:0]  )  //o
  );
  MULADD_2 MUL_ADD2 (
    .src1      (_zz_377_[51:0]         ), //i
    .src2      (_zz_378_[33:0]         ), //i
    .result    (MUL_ADD2_result[65:0]  )  //o
  );
  DIV FX_DIV (
    .src1       (_zz_379_[32:0]                ), //i
    .src2       (_zz_380_[31:0]                ), //i
    .start      (_zz_381_                      ), //i
    .div_mod    (memory_DECODER_stageables_53  ), //i
    .revert     (_zz_382_                      ), //i
    .result     (FX_DIV_result[31:0]           ), //o
    .valid      (FX_DIV_valid                  ), //o
    .ov         (FX_DIV_ov                     ), //o
    .clk        (clk                           ), //i
    .reset      (reset                         )  //i
  );
  SEL_PRI_32x4 BYP_RA (
    .src0      (_zz_70_[31:0]                               ), //i
    .src1      (_zz_71_[31:0]                               ), //i
    .src2      (lastStageRegFileWrite_payload_data[31:0]    ), //i
    .src3      (Hazards_writeBackBuffer_payload_data[31:0]  ), //i
    .sel       (_zz_242_[3:0]                               ), //i
    .result    (BYP_RA_result[31:0]                         )  //o
  );
  SEL_PRI_32x4 BYP_RB (
    .src0      (_zz_70_[31:0]                               ), //i
    .src1      (_zz_71_[31:0]                               ), //i
    .src2      (lastStageRegFileWrite_payload_data[31:0]    ), //i
    .src3      (Hazards_writeBackBuffer_payload_data[31:0]  ), //i
    .sel       (_zz_243_[3:0]                               ), //i
    .result    (BYP_RB_result[31:0]                         )  //o
  );
  SEL_PRI_32x4 BYP_RS (
    .src0      (_zz_70_[31:0]                               ), //i
    .src1      (_zz_71_[31:0]                               ), //i
    .src2      (lastStageRegFileWrite_payload_data[31:0]    ), //i
    .src3      (Hazards_writeBackBuffer_payload_data[31:0]  ), //i
    .sel       (_zz_244_[3:0]                               ), //i
    .result    (BYP_RS_result[31:0]                         )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(_zz_1_)
      `TgtCtrlEnum_defaultEncoding_RT : _zz_1__string = "RT";
      `TgtCtrlEnum_defaultEncoding_RA : _zz_1__string = "RA";
      default : _zz_1__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_2_)
      `TgtCtrlEnum_defaultEncoding_RT : _zz_2__string = "RT";
      `TgtCtrlEnum_defaultEncoding_RA : _zz_2__string = "RA";
      default : _zz_2__string = "??";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_27)
      `Src1CtrlEnum_defaultEncoding_RA : decode_DECODER_stageables_27_string = "RA    ";
      `Src1CtrlEnum_defaultEncoding_RA_N : decode_DECODER_stageables_27_string = "RA_N  ";
      `Src1CtrlEnum_defaultEncoding_RA_NIA : decode_DECODER_stageables_27_string = "RA_NIA";
      `Src1CtrlEnum_defaultEncoding_RA_0 : decode_DECODER_stageables_27_string = "RA_0  ";
      `Src1CtrlEnum_defaultEncoding_RS : decode_DECODER_stageables_27_string = "RS    ";
      default : decode_DECODER_stageables_27_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_3_)
      `Src1CtrlEnum_defaultEncoding_RA : _zz_3__string = "RA    ";
      `Src1CtrlEnum_defaultEncoding_RA_N : _zz_3__string = "RA_N  ";
      `Src1CtrlEnum_defaultEncoding_RA_NIA : _zz_3__string = "RA_NIA";
      `Src1CtrlEnum_defaultEncoding_RA_0 : _zz_3__string = "RA_0  ";
      `Src1CtrlEnum_defaultEncoding_RS : _zz_3__string = "RS    ";
      default : _zz_3__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_4_)
      `Src1CtrlEnum_defaultEncoding_RA : _zz_4__string = "RA    ";
      `Src1CtrlEnum_defaultEncoding_RA_N : _zz_4__string = "RA_N  ";
      `Src1CtrlEnum_defaultEncoding_RA_NIA : _zz_4__string = "RA_NIA";
      `Src1CtrlEnum_defaultEncoding_RA_0 : _zz_4__string = "RA_0  ";
      `Src1CtrlEnum_defaultEncoding_RS : _zz_4__string = "RS    ";
      default : _zz_4__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_5_)
      `Src1CtrlEnum_defaultEncoding_RA : _zz_5__string = "RA    ";
      `Src1CtrlEnum_defaultEncoding_RA_N : _zz_5__string = "RA_N  ";
      `Src1CtrlEnum_defaultEncoding_RA_NIA : _zz_5__string = "RA_NIA";
      `Src1CtrlEnum_defaultEncoding_RA_0 : _zz_5__string = "RA_0  ";
      `Src1CtrlEnum_defaultEncoding_RS : _zz_5__string = "RS    ";
      default : _zz_5__string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_8)
      `Src3CtrlEnum_defaultEncoding_CA : decode_DECODER_stageables_8_string = "CA  ";
      `Src3CtrlEnum_defaultEncoding_CA_0 : decode_DECODER_stageables_8_string = "CA_0";
      `Src3CtrlEnum_defaultEncoding_CA_1 : decode_DECODER_stageables_8_string = "CA_1";
      default : decode_DECODER_stageables_8_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_6_)
      `Src3CtrlEnum_defaultEncoding_CA : _zz_6__string = "CA  ";
      `Src3CtrlEnum_defaultEncoding_CA_0 : _zz_6__string = "CA_0";
      `Src3CtrlEnum_defaultEncoding_CA_1 : _zz_6__string = "CA_1";
      default : _zz_6__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_7_)
      `Src3CtrlEnum_defaultEncoding_CA : _zz_7__string = "CA  ";
      `Src3CtrlEnum_defaultEncoding_CA_0 : _zz_7__string = "CA_0";
      `Src3CtrlEnum_defaultEncoding_CA_1 : _zz_7__string = "CA_1";
      default : _zz_7__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_8_)
      `Src3CtrlEnum_defaultEncoding_CA : _zz_8__string = "CA  ";
      `Src3CtrlEnum_defaultEncoding_CA_0 : _zz_8__string = "CA_0";
      `Src3CtrlEnum_defaultEncoding_CA_1 : _zz_8__string = "CA_1";
      default : _zz_8__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_9_)
      `CRBusCmdEnum_defaultEncoding_NOP : _zz_9__string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : _zz_9__string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : _zz_9__string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : _zz_9__string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : _zz_9__string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : _zz_9__string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : _zz_9__string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : _zz_9__string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : _zz_9__string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : _zz_9__string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : _zz_9__string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : _zz_9__string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : _zz_9__string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : _zz_9__string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : _zz_9__string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : _zz_9__string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : _zz_9__string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : _zz_9__string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : _zz_9__string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : _zz_9__string = "DECLNK";
      default : _zz_9__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_10_)
      `CRBusCmdEnum_defaultEncoding_NOP : _zz_10__string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : _zz_10__string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : _zz_10__string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : _zz_10__string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : _zz_10__string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : _zz_10__string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : _zz_10__string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : _zz_10__string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : _zz_10__string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : _zz_10__string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : _zz_10__string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : _zz_10__string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : _zz_10__string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : _zz_10__string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : _zz_10__string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : _zz_10__string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : _zz_10__string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : _zz_10__string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : _zz_10__string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : _zz_10__string = "DECLNK";
      default : _zz_10__string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_CR_WRITE_op)
      `CRBusCmdEnum_defaultEncoding_NOP : execute_CR_WRITE_op_string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : execute_CR_WRITE_op_string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : execute_CR_WRITE_op_string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : execute_CR_WRITE_op_string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : execute_CR_WRITE_op_string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : execute_CR_WRITE_op_string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : execute_CR_WRITE_op_string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : execute_CR_WRITE_op_string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : execute_CR_WRITE_op_string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : execute_CR_WRITE_op_string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : execute_CR_WRITE_op_string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : execute_CR_WRITE_op_string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : execute_CR_WRITE_op_string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : execute_CR_WRITE_op_string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : execute_CR_WRITE_op_string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : execute_CR_WRITE_op_string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : execute_CR_WRITE_op_string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : execute_CR_WRITE_op_string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : execute_CR_WRITE_op_string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : execute_CR_WRITE_op_string = "DECLNK";
      default : execute_CR_WRITE_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_11_)
      `CRBusCmdEnum_defaultEncoding_NOP : _zz_11__string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : _zz_11__string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : _zz_11__string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : _zz_11__string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : _zz_11__string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : _zz_11__string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : _zz_11__string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : _zz_11__string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : _zz_11__string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : _zz_11__string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : _zz_11__string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : _zz_11__string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : _zz_11__string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : _zz_11__string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : _zz_11__string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : _zz_11__string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : _zz_11__string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : _zz_11__string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : _zz_11__string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : _zz_11__string = "DECLNK";
      default : _zz_11__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_12_)
      `CRBusCmdEnum_defaultEncoding_NOP : _zz_12__string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : _zz_12__string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : _zz_12__string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : _zz_12__string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : _zz_12__string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : _zz_12__string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : _zz_12__string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : _zz_12__string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : _zz_12__string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : _zz_12__string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : _zz_12__string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : _zz_12__string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : _zz_12__string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : _zz_12__string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : _zz_12__string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : _zz_12__string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : _zz_12__string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : _zz_12__string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : _zz_12__string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : _zz_12__string = "DECLNK";
      default : _zz_12__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_13_)
      `CRBusCmdEnum_defaultEncoding_NOP : _zz_13__string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : _zz_13__string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : _zz_13__string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : _zz_13__string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : _zz_13__string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : _zz_13__string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : _zz_13__string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : _zz_13__string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : _zz_13__string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : _zz_13__string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : _zz_13__string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : _zz_13__string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : _zz_13__string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : _zz_13__string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : _zz_13__string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : _zz_13__string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : _zz_13__string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : _zz_13__string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : _zz_13__string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : _zz_13__string = "DECLNK";
      default : _zz_13__string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_49)
      `CRMoveCtrlEnum_defaultEncoding_MCRF : decode_DECODER_stageables_49_string = "MCRF  ";
      `CRMoveCtrlEnum_defaultEncoding_MCRXRX : decode_DECODER_stageables_49_string = "MCRXRX";
      `CRMoveCtrlEnum_defaultEncoding_MTCRF : decode_DECODER_stageables_49_string = "MTCRF ";
      default : decode_DECODER_stageables_49_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_14_)
      `CRMoveCtrlEnum_defaultEncoding_MCRF : _zz_14__string = "MCRF  ";
      `CRMoveCtrlEnum_defaultEncoding_MCRXRX : _zz_14__string = "MCRXRX";
      `CRMoveCtrlEnum_defaultEncoding_MTCRF : _zz_14__string = "MTCRF ";
      default : _zz_14__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_15_)
      `CRMoveCtrlEnum_defaultEncoding_MCRF : _zz_15__string = "MCRF  ";
      `CRMoveCtrlEnum_defaultEncoding_MCRXRX : _zz_15__string = "MCRXRX";
      `CRMoveCtrlEnum_defaultEncoding_MTCRF : _zz_15__string = "MTCRF ";
      default : _zz_15__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_16_)
      `CRMoveCtrlEnum_defaultEncoding_MCRF : _zz_16__string = "MCRF  ";
      `CRMoveCtrlEnum_defaultEncoding_MCRXRX : _zz_16__string = "MCRXRX";
      `CRMoveCtrlEnum_defaultEncoding_MTCRF : _zz_16__string = "MTCRF ";
      default : _zz_16__string = "??????";
    endcase
  end
  always @(*) begin
    case(memory_DECODER_stageables_32)
      `DataSizeEnum_defaultEncoding_B : memory_DECODER_stageables_32_string = "B ";
      `DataSizeEnum_defaultEncoding_H : memory_DECODER_stageables_32_string = "H ";
      `DataSizeEnum_defaultEncoding_HA : memory_DECODER_stageables_32_string = "HA";
      `DataSizeEnum_defaultEncoding_W : memory_DECODER_stageables_32_string = "W ";
      default : memory_DECODER_stageables_32_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_17_)
      `DataSizeEnum_defaultEncoding_B : _zz_17__string = "B ";
      `DataSizeEnum_defaultEncoding_H : _zz_17__string = "H ";
      `DataSizeEnum_defaultEncoding_HA : _zz_17__string = "HA";
      `DataSizeEnum_defaultEncoding_W : _zz_17__string = "W ";
      default : _zz_17__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_18_)
      `DataSizeEnum_defaultEncoding_B : _zz_18__string = "B ";
      `DataSizeEnum_defaultEncoding_H : _zz_18__string = "H ";
      `DataSizeEnum_defaultEncoding_HA : _zz_18__string = "HA";
      `DataSizeEnum_defaultEncoding_W : _zz_18__string = "W ";
      default : _zz_18__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_19_)
      `DataSizeEnum_defaultEncoding_B : _zz_19__string = "B ";
      `DataSizeEnum_defaultEncoding_H : _zz_19__string = "H ";
      `DataSizeEnum_defaultEncoding_HA : _zz_19__string = "HA";
      `DataSizeEnum_defaultEncoding_W : _zz_19__string = "W ";
      default : _zz_19__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_20_)
      `DataSizeEnum_defaultEncoding_B : _zz_20__string = "B ";
      `DataSizeEnum_defaultEncoding_H : _zz_20__string = "H ";
      `DataSizeEnum_defaultEncoding_HA : _zz_20__string = "HA";
      `DataSizeEnum_defaultEncoding_W : _zz_20__string = "W ";
      default : _zz_20__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_21_)
      `DataSizeEnum_defaultEncoding_B : _zz_21__string = "B ";
      `DataSizeEnum_defaultEncoding_H : _zz_21__string = "H ";
      `DataSizeEnum_defaultEncoding_HA : _zz_21__string = "HA";
      `DataSizeEnum_defaultEncoding_W : _zz_21__string = "W ";
      default : _zz_21__string = "??";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_32)
      `DataSizeEnum_defaultEncoding_B : decode_DECODER_stageables_32_string = "B ";
      `DataSizeEnum_defaultEncoding_H : decode_DECODER_stageables_32_string = "H ";
      `DataSizeEnum_defaultEncoding_HA : decode_DECODER_stageables_32_string = "HA";
      `DataSizeEnum_defaultEncoding_W : decode_DECODER_stageables_32_string = "W ";
      default : decode_DECODER_stageables_32_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_22_)
      `DataSizeEnum_defaultEncoding_B : _zz_22__string = "B ";
      `DataSizeEnum_defaultEncoding_H : _zz_22__string = "H ";
      `DataSizeEnum_defaultEncoding_HA : _zz_22__string = "HA";
      `DataSizeEnum_defaultEncoding_W : _zz_22__string = "W ";
      default : _zz_22__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_23_)
      `DataSizeEnum_defaultEncoding_B : _zz_23__string = "B ";
      `DataSizeEnum_defaultEncoding_H : _zz_23__string = "H ";
      `DataSizeEnum_defaultEncoding_HA : _zz_23__string = "HA";
      `DataSizeEnum_defaultEncoding_W : _zz_23__string = "W ";
      default : _zz_23__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_24_)
      `DataSizeEnum_defaultEncoding_B : _zz_24__string = "B ";
      `DataSizeEnum_defaultEncoding_H : _zz_24__string = "H ";
      `DataSizeEnum_defaultEncoding_HA : _zz_24__string = "HA";
      `DataSizeEnum_defaultEncoding_W : _zz_24__string = "W ";
      default : _zz_24__string = "??";
    endcase
  end
  always @(*) begin
    case(memory_MSR_ENDIAN)
      `EndianEnum_defaultEncoding_BE : memory_MSR_ENDIAN_string = "BE";
      `EndianEnum_defaultEncoding_LE : memory_MSR_ENDIAN_string = "LE";
      default : memory_MSR_ENDIAN_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_25_)
      `EndianEnum_defaultEncoding_BE : _zz_25__string = "BE";
      `EndianEnum_defaultEncoding_LE : _zz_25__string = "LE";
      default : _zz_25__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_26_)
      `EndianEnum_defaultEncoding_BE : _zz_26__string = "BE";
      `EndianEnum_defaultEncoding_LE : _zz_26__string = "LE";
      default : _zz_26__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_27_)
      `EndianEnum_defaultEncoding_BE : _zz_27__string = "BE";
      `EndianEnum_defaultEncoding_LE : _zz_27__string = "LE";
      default : _zz_27__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_28_)
      `EndianEnum_defaultEncoding_BE : _zz_28__string = "BE";
      `EndianEnum_defaultEncoding_LE : _zz_28__string = "LE";
      default : _zz_28__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_29_)
      `EndianEnum_defaultEncoding_BE : _zz_29__string = "BE";
      `EndianEnum_defaultEncoding_LE : _zz_29__string = "LE";
      default : _zz_29__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_30_)
      `EndianEnum_defaultEncoding_BE : _zz_30__string = "BE";
      `EndianEnum_defaultEncoding_LE : _zz_30__string = "LE";
      default : _zz_30__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_31_)
      `EndianEnum_defaultEncoding_BE : _zz_31__string = "BE";
      `EndianEnum_defaultEncoding_LE : _zz_31__string = "LE";
      default : _zz_31__string = "??";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_40)
      `AluRimiAmtEnum_defaultEncoding_IMM : decode_DECODER_stageables_40_string = "IMM";
      `AluRimiAmtEnum_defaultEncoding_RB : decode_DECODER_stageables_40_string = "RB ";
      default : decode_DECODER_stageables_40_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_32_)
      `AluRimiAmtEnum_defaultEncoding_IMM : _zz_32__string = "IMM";
      `AluRimiAmtEnum_defaultEncoding_RB : _zz_32__string = "RB ";
      default : _zz_32__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_33_)
      `AluRimiAmtEnum_defaultEncoding_IMM : _zz_33__string = "IMM";
      `AluRimiAmtEnum_defaultEncoding_RB : _zz_33__string = "RB ";
      default : _zz_33__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_34_)
      `AluRimiAmtEnum_defaultEncoding_IMM : _zz_34__string = "IMM";
      `AluRimiAmtEnum_defaultEncoding_RB : _zz_34__string = "RB ";
      default : _zz_34__string = "???";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_1)
      `AluSpecCtrlEnum_defaultEncoding_CNTLZW : decode_DECODER_stageables_1_string = "CNTLZW ";
      `AluSpecCtrlEnum_defaultEncoding_CNTTZW : decode_DECODER_stageables_1_string = "CNTTZW ";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTB : decode_DECODER_stageables_1_string = "POPCNTB";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTW : decode_DECODER_stageables_1_string = "POPCNTW";
      `AluSpecCtrlEnum_defaultEncoding_CMPB : decode_DECODER_stageables_1_string = "CMPB   ";
      `AluSpecCtrlEnum_defaultEncoding_PRTYW : decode_DECODER_stageables_1_string = "PRTYW  ";
      default : decode_DECODER_stageables_1_string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_35_)
      `AluSpecCtrlEnum_defaultEncoding_CNTLZW : _zz_35__string = "CNTLZW ";
      `AluSpecCtrlEnum_defaultEncoding_CNTTZW : _zz_35__string = "CNTTZW ";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTB : _zz_35__string = "POPCNTB";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTW : _zz_35__string = "POPCNTW";
      `AluSpecCtrlEnum_defaultEncoding_CMPB : _zz_35__string = "CMPB   ";
      `AluSpecCtrlEnum_defaultEncoding_PRTYW : _zz_35__string = "PRTYW  ";
      default : _zz_35__string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_36_)
      `AluSpecCtrlEnum_defaultEncoding_CNTLZW : _zz_36__string = "CNTLZW ";
      `AluSpecCtrlEnum_defaultEncoding_CNTTZW : _zz_36__string = "CNTTZW ";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTB : _zz_36__string = "POPCNTB";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTW : _zz_36__string = "POPCNTW";
      `AluSpecCtrlEnum_defaultEncoding_CMPB : _zz_36__string = "CMPB   ";
      `AluSpecCtrlEnum_defaultEncoding_PRTYW : _zz_36__string = "PRTYW  ";
      default : _zz_36__string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_37_)
      `AluSpecCtrlEnum_defaultEncoding_CNTLZW : _zz_37__string = "CNTLZW ";
      `AluSpecCtrlEnum_defaultEncoding_CNTTZW : _zz_37__string = "CNTTZW ";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTB : _zz_37__string = "POPCNTB";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTW : _zz_37__string = "POPCNTW";
      `AluSpecCtrlEnum_defaultEncoding_CMPB : _zz_37__string = "CMPB   ";
      `AluSpecCtrlEnum_defaultEncoding_PRTYW : _zz_37__string = "PRTYW  ";
      default : _zz_37__string = "???????";
    endcase
  end
  always @(*) begin
    case(memory_DECODER_stageables_14)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_DECODER_stageables_14_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : memory_DECODER_stageables_14_string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : memory_DECODER_stageables_14_string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : memory_DECODER_stageables_14_string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : memory_DECODER_stageables_14_string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : memory_DECODER_stageables_14_string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : memory_DECODER_stageables_14_string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : memory_DECODER_stageables_14_string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : memory_DECODER_stageables_14_string = "TWI  ";
      default : memory_DECODER_stageables_14_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_38_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_38__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : _zz_38__string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : _zz_38__string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : _zz_38__string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : _zz_38__string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : _zz_38__string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : _zz_38__string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : _zz_38__string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : _zz_38__string = "TWI  ";
      default : _zz_38__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_39_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_39__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : _zz_39__string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : _zz_39__string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : _zz_39__string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : _zz_39__string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : _zz_39__string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : _zz_39__string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : _zz_39__string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : _zz_39__string = "TWI  ";
      default : _zz_39__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_40_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_40__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : _zz_40__string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : _zz_40__string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : _zz_40__string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : _zz_40__string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : _zz_40__string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : _zz_40__string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : _zz_40__string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : _zz_40__string = "TWI  ";
      default : _zz_40__string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_14)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_DECODER_stageables_14_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : decode_DECODER_stageables_14_string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : decode_DECODER_stageables_14_string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : decode_DECODER_stageables_14_string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : decode_DECODER_stageables_14_string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : decode_DECODER_stageables_14_string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : decode_DECODER_stageables_14_string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : decode_DECODER_stageables_14_string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : decode_DECODER_stageables_14_string = "TWI  ";
      default : decode_DECODER_stageables_14_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_41_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_41__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : _zz_41__string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : _zz_41__string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : _zz_41__string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : _zz_41__string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : _zz_41__string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : _zz_41__string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : _zz_41__string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : _zz_41__string = "TWI  ";
      default : _zz_41__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_42_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_42__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : _zz_42__string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : _zz_42__string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : _zz_42__string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : _zz_42__string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : _zz_42__string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : _zz_42__string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : _zz_42__string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : _zz_42__string = "TWI  ";
      default : _zz_42__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_43_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_43__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : _zz_43__string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : _zz_43__string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : _zz_43__string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : _zz_43__string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : _zz_43__string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : _zz_43__string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : _zz_43__string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : _zz_43__string = "TWI  ";
      default : _zz_43__string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_39)
      `AluCtrlEnum_defaultEncoding_ADD : decode_DECODER_stageables_39_string = "ADD  ";
      `AluCtrlEnum_defaultEncoding_BIT_1 : decode_DECODER_stageables_39_string = "BIT_1";
      `AluCtrlEnum_defaultEncoding_RIMI : decode_DECODER_stageables_39_string = "RIMI ";
      `AluCtrlEnum_defaultEncoding_SPEC : decode_DECODER_stageables_39_string = "SPEC ";
      default : decode_DECODER_stageables_39_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_44_)
      `AluCtrlEnum_defaultEncoding_ADD : _zz_44__string = "ADD  ";
      `AluCtrlEnum_defaultEncoding_BIT_1 : _zz_44__string = "BIT_1";
      `AluCtrlEnum_defaultEncoding_RIMI : _zz_44__string = "RIMI ";
      `AluCtrlEnum_defaultEncoding_SPEC : _zz_44__string = "SPEC ";
      default : _zz_44__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_45_)
      `AluCtrlEnum_defaultEncoding_ADD : _zz_45__string = "ADD  ";
      `AluCtrlEnum_defaultEncoding_BIT_1 : _zz_45__string = "BIT_1";
      `AluCtrlEnum_defaultEncoding_RIMI : _zz_45__string = "RIMI ";
      `AluCtrlEnum_defaultEncoding_SPEC : _zz_45__string = "SPEC ";
      default : _zz_45__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_46_)
      `AluCtrlEnum_defaultEncoding_ADD : _zz_46__string = "ADD  ";
      `AluCtrlEnum_defaultEncoding_BIT_1 : _zz_46__string = "BIT_1";
      `AluCtrlEnum_defaultEncoding_RIMI : _zz_46__string = "RIMI ";
      `AluCtrlEnum_defaultEncoding_SPEC : _zz_46__string = "SPEC ";
      default : _zz_46__string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_52)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_DECODER_stageables_52_string = "AND_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_ANDC : decode_DECODER_stageables_52_string = "ANDC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_DECODER_stageables_52_string = "OR_1  ";
      `AluBitwiseCtrlEnum_defaultEncoding_ORC : decode_DECODER_stageables_52_string = "ORC   ";
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_DECODER_stageables_52_string = "XOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_XORC : decode_DECODER_stageables_52_string = "XORC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_EQV : decode_DECODER_stageables_52_string = "EQV   ";
      `AluBitwiseCtrlEnum_defaultEncoding_NAND_1 : decode_DECODER_stageables_52_string = "NAND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_NOR_1 : decode_DECODER_stageables_52_string = "NOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSB : decode_DECODER_stageables_52_string = "EXTSB ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSH : decode_DECODER_stageables_52_string = "EXTSH ";
      default : decode_DECODER_stageables_52_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_47_)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_47__string = "AND_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_ANDC : _zz_47__string = "ANDC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_47__string = "OR_1  ";
      `AluBitwiseCtrlEnum_defaultEncoding_ORC : _zz_47__string = "ORC   ";
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_47__string = "XOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_XORC : _zz_47__string = "XORC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_EQV : _zz_47__string = "EQV   ";
      `AluBitwiseCtrlEnum_defaultEncoding_NAND_1 : _zz_47__string = "NAND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_NOR_1 : _zz_47__string = "NOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSB : _zz_47__string = "EXTSB ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSH : _zz_47__string = "EXTSH ";
      default : _zz_47__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_48_)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_48__string = "AND_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_ANDC : _zz_48__string = "ANDC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_48__string = "OR_1  ";
      `AluBitwiseCtrlEnum_defaultEncoding_ORC : _zz_48__string = "ORC   ";
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_48__string = "XOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_XORC : _zz_48__string = "XORC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_EQV : _zz_48__string = "EQV   ";
      `AluBitwiseCtrlEnum_defaultEncoding_NAND_1 : _zz_48__string = "NAND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_NOR_1 : _zz_48__string = "NOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSB : _zz_48__string = "EXTSB ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSH : _zz_48__string = "EXTSH ";
      default : _zz_48__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_49_)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_49__string = "AND_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_ANDC : _zz_49__string = "ANDC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_49__string = "OR_1  ";
      `AluBitwiseCtrlEnum_defaultEncoding_ORC : _zz_49__string = "ORC   ";
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_49__string = "XOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_XORC : _zz_49__string = "XORC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_EQV : _zz_49__string = "EQV   ";
      `AluBitwiseCtrlEnum_defaultEncoding_NAND_1 : _zz_49__string = "NAND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_NOR_1 : _zz_49__string = "NOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSB : _zz_49__string = "EXTSB ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSH : _zz_49__string = "EXTSH ";
      default : _zz_49__string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_12)
      `Src2CtrlEnum_defaultEncoding_RB : decode_DECODER_stageables_12_string = "RB      ";
      `Src2CtrlEnum_defaultEncoding_RB_0 : decode_DECODER_stageables_12_string = "RB_0    ";
      `Src2CtrlEnum_defaultEncoding_RB_M1 : decode_DECODER_stageables_12_string = "RB_M1   ";
      `Src2CtrlEnum_defaultEncoding_RB_UI : decode_DECODER_stageables_12_string = "RB_UI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SI : decode_DECODER_stageables_12_string = "RB_SI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SH : decode_DECODER_stageables_12_string = "RB_SH   ";
      `Src2CtrlEnum_defaultEncoding_RB_PCISD : decode_DECODER_stageables_12_string = "RB_PCISD";
      `Src2CtrlEnum_defaultEncoding_RA : decode_DECODER_stageables_12_string = "RA      ";
      default : decode_DECODER_stageables_12_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_50_)
      `Src2CtrlEnum_defaultEncoding_RB : _zz_50__string = "RB      ";
      `Src2CtrlEnum_defaultEncoding_RB_0 : _zz_50__string = "RB_0    ";
      `Src2CtrlEnum_defaultEncoding_RB_M1 : _zz_50__string = "RB_M1   ";
      `Src2CtrlEnum_defaultEncoding_RB_UI : _zz_50__string = "RB_UI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SI : _zz_50__string = "RB_SI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SH : _zz_50__string = "RB_SH   ";
      `Src2CtrlEnum_defaultEncoding_RB_PCISD : _zz_50__string = "RB_PCISD";
      `Src2CtrlEnum_defaultEncoding_RA : _zz_50__string = "RA      ";
      default : _zz_50__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_51_)
      `Src2CtrlEnum_defaultEncoding_RB : _zz_51__string = "RB      ";
      `Src2CtrlEnum_defaultEncoding_RB_0 : _zz_51__string = "RB_0    ";
      `Src2CtrlEnum_defaultEncoding_RB_M1 : _zz_51__string = "RB_M1   ";
      `Src2CtrlEnum_defaultEncoding_RB_UI : _zz_51__string = "RB_UI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SI : _zz_51__string = "RB_SI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SH : _zz_51__string = "RB_SH   ";
      `Src2CtrlEnum_defaultEncoding_RB_PCISD : _zz_51__string = "RB_PCISD";
      `Src2CtrlEnum_defaultEncoding_RA : _zz_51__string = "RA      ";
      default : _zz_51__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_52_)
      `Src2CtrlEnum_defaultEncoding_RB : _zz_52__string = "RB      ";
      `Src2CtrlEnum_defaultEncoding_RB_0 : _zz_52__string = "RB_0    ";
      `Src2CtrlEnum_defaultEncoding_RB_M1 : _zz_52__string = "RB_M1   ";
      `Src2CtrlEnum_defaultEncoding_RB_UI : _zz_52__string = "RB_UI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SI : _zz_52__string = "RB_SI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SH : _zz_52__string = "RB_SH   ";
      `Src2CtrlEnum_defaultEncoding_RB_PCISD : _zz_52__string = "RB_PCISD";
      `Src2CtrlEnum_defaultEncoding_RA : _zz_52__string = "RA      ";
      default : _zz_52__string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_18)
      `CRLogCtrlEnum_defaultEncoding_AND_1 : decode_DECODER_stageables_18_string = "AND_1 ";
      `CRLogCtrlEnum_defaultEncoding_OR_1 : decode_DECODER_stageables_18_string = "OR_1  ";
      `CRLogCtrlEnum_defaultEncoding_XOR_1 : decode_DECODER_stageables_18_string = "XOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_NAND_1 : decode_DECODER_stageables_18_string = "NAND_1";
      `CRLogCtrlEnum_defaultEncoding_NOR_1 : decode_DECODER_stageables_18_string = "NOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_EQV : decode_DECODER_stageables_18_string = "EQV   ";
      `CRLogCtrlEnum_defaultEncoding_ANDC : decode_DECODER_stageables_18_string = "ANDC  ";
      `CRLogCtrlEnum_defaultEncoding_ORC : decode_DECODER_stageables_18_string = "ORC   ";
      default : decode_DECODER_stageables_18_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_53_)
      `CRLogCtrlEnum_defaultEncoding_AND_1 : _zz_53__string = "AND_1 ";
      `CRLogCtrlEnum_defaultEncoding_OR_1 : _zz_53__string = "OR_1  ";
      `CRLogCtrlEnum_defaultEncoding_XOR_1 : _zz_53__string = "XOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_NAND_1 : _zz_53__string = "NAND_1";
      `CRLogCtrlEnum_defaultEncoding_NOR_1 : _zz_53__string = "NOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_EQV : _zz_53__string = "EQV   ";
      `CRLogCtrlEnum_defaultEncoding_ANDC : _zz_53__string = "ANDC  ";
      `CRLogCtrlEnum_defaultEncoding_ORC : _zz_53__string = "ORC   ";
      default : _zz_53__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_54_)
      `CRLogCtrlEnum_defaultEncoding_AND_1 : _zz_54__string = "AND_1 ";
      `CRLogCtrlEnum_defaultEncoding_OR_1 : _zz_54__string = "OR_1  ";
      `CRLogCtrlEnum_defaultEncoding_XOR_1 : _zz_54__string = "XOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_NAND_1 : _zz_54__string = "NAND_1";
      `CRLogCtrlEnum_defaultEncoding_NOR_1 : _zz_54__string = "NOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_EQV : _zz_54__string = "EQV   ";
      `CRLogCtrlEnum_defaultEncoding_ANDC : _zz_54__string = "ANDC  ";
      `CRLogCtrlEnum_defaultEncoding_ORC : _zz_54__string = "ORC   ";
      default : _zz_54__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_55_)
      `CRLogCtrlEnum_defaultEncoding_AND_1 : _zz_55__string = "AND_1 ";
      `CRLogCtrlEnum_defaultEncoding_OR_1 : _zz_55__string = "OR_1  ";
      `CRLogCtrlEnum_defaultEncoding_XOR_1 : _zz_55__string = "XOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_NAND_1 : _zz_55__string = "NAND_1";
      `CRLogCtrlEnum_defaultEncoding_NOR_1 : _zz_55__string = "NOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_EQV : _zz_55__string = "EQV   ";
      `CRLogCtrlEnum_defaultEncoding_ANDC : _zz_55__string = "ANDC  ";
      `CRLogCtrlEnum_defaultEncoding_ORC : _zz_55__string = "ORC   ";
      default : _zz_55__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_56_)
      `BranchCtrlEnum_defaultEncoding_NONE : _zz_56__string = "NONE ";
      `BranchCtrlEnum_defaultEncoding_BU : _zz_56__string = "BU   ";
      `BranchCtrlEnum_defaultEncoding_BC : _zz_56__string = "BC   ";
      `BranchCtrlEnum_defaultEncoding_BCLR : _zz_56__string = "BCLR ";
      `BranchCtrlEnum_defaultEncoding_BCCTR : _zz_56__string = "BCCTR";
      `BranchCtrlEnum_defaultEncoding_BCTAR : _zz_56__string = "BCTAR";
      default : _zz_56__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_57_)
      `BranchCtrlEnum_defaultEncoding_NONE : _zz_57__string = "NONE ";
      `BranchCtrlEnum_defaultEncoding_BU : _zz_57__string = "BU   ";
      `BranchCtrlEnum_defaultEncoding_BC : _zz_57__string = "BC   ";
      `BranchCtrlEnum_defaultEncoding_BCLR : _zz_57__string = "BCLR ";
      `BranchCtrlEnum_defaultEncoding_BCCTR : _zz_57__string = "BCCTR";
      `BranchCtrlEnum_defaultEncoding_BCTAR : _zz_57__string = "BCTAR";
      default : _zz_57__string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_42)
      `AluRimiCtrlEnum_defaultEncoding_ROT : decode_DECODER_stageables_42_string = "ROT    ";
      `AluRimiCtrlEnum_defaultEncoding_INS : decode_DECODER_stageables_42_string = "INS    ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTL : decode_DECODER_stageables_42_string = "SHIFTL ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTR : decode_DECODER_stageables_42_string = "SHIFTR ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTRA : decode_DECODER_stageables_42_string = "SHIFTRA";
      default : decode_DECODER_stageables_42_string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_58_)
      `AluRimiCtrlEnum_defaultEncoding_ROT : _zz_58__string = "ROT    ";
      `AluRimiCtrlEnum_defaultEncoding_INS : _zz_58__string = "INS    ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTL : _zz_58__string = "SHIFTL ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTR : _zz_58__string = "SHIFTR ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTRA : _zz_58__string = "SHIFTRA";
      default : _zz_58__string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_59_)
      `AluRimiCtrlEnum_defaultEncoding_ROT : _zz_59__string = "ROT    ";
      `AluRimiCtrlEnum_defaultEncoding_INS : _zz_59__string = "INS    ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTL : _zz_59__string = "SHIFTL ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTR : _zz_59__string = "SHIFTR ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTRA : _zz_59__string = "SHIFTRA";
      default : _zz_59__string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_60_)
      `AluRimiCtrlEnum_defaultEncoding_ROT : _zz_60__string = "ROT    ";
      `AluRimiCtrlEnum_defaultEncoding_INS : _zz_60__string = "INS    ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTL : _zz_60__string = "SHIFTL ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTR : _zz_60__string = "SHIFTR ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTRA : _zz_60__string = "SHIFTRA";
      default : _zz_60__string = "???????";
    endcase
  end
  always @(*) begin
    case(writeBack_DECODER_stageables_14)
      `EnvCtrlEnum_defaultEncoding_NONE : writeBack_DECODER_stageables_14_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : writeBack_DECODER_stageables_14_string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : writeBack_DECODER_stageables_14_string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : writeBack_DECODER_stageables_14_string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : writeBack_DECODER_stageables_14_string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : writeBack_DECODER_stageables_14_string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : writeBack_DECODER_stageables_14_string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : writeBack_DECODER_stageables_14_string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : writeBack_DECODER_stageables_14_string = "TWI  ";
      default : writeBack_DECODER_stageables_14_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_61_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_61__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : _zz_61__string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : _zz_61__string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : _zz_61__string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : _zz_61__string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : _zz_61__string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : _zz_61__string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : _zz_61__string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : _zz_61__string = "TWI  ";
      default : _zz_61__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_62_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_62__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : _zz_62__string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : _zz_62__string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : _zz_62__string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : _zz_62__string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : _zz_62__string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : _zz_62__string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : _zz_62__string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : _zz_62__string = "TWI  ";
      default : _zz_62__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_63_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_63__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : _zz_63__string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : _zz_63__string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : _zz_63__string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : _zz_63__string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : _zz_63__string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : _zz_63__string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : _zz_63__string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : _zz_63__string = "TWI  ";
      default : _zz_63__string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_DECODER_stageables_14)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_DECODER_stageables_14_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : execute_DECODER_stageables_14_string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : execute_DECODER_stageables_14_string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : execute_DECODER_stageables_14_string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : execute_DECODER_stageables_14_string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : execute_DECODER_stageables_14_string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : execute_DECODER_stageables_14_string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : execute_DECODER_stageables_14_string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : execute_DECODER_stageables_14_string = "TWI  ";
      default : execute_DECODER_stageables_14_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_64_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_64__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : _zz_64__string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : _zz_64__string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : _zz_64__string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : _zz_64__string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : _zz_64__string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : _zz_64__string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : _zz_64__string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : _zz_64__string = "TWI  ";
      default : _zz_64__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_65_)
      `EndianEnum_defaultEncoding_BE : _zz_65__string = "BE";
      `EndianEnum_defaultEncoding_LE : _zz_65__string = "LE";
      default : _zz_65__string = "??";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_25)
      `BranchCtrlEnum_defaultEncoding_NONE : decode_DECODER_stageables_25_string = "NONE ";
      `BranchCtrlEnum_defaultEncoding_BU : decode_DECODER_stageables_25_string = "BU   ";
      `BranchCtrlEnum_defaultEncoding_BC : decode_DECODER_stageables_25_string = "BC   ";
      `BranchCtrlEnum_defaultEncoding_BCLR : decode_DECODER_stageables_25_string = "BCLR ";
      `BranchCtrlEnum_defaultEncoding_BCCTR : decode_DECODER_stageables_25_string = "BCCTR";
      `BranchCtrlEnum_defaultEncoding_BCTAR : decode_DECODER_stageables_25_string = "BCTAR";
      default : decode_DECODER_stageables_25_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_67_)
      `BranchCtrlEnum_defaultEncoding_NONE : _zz_67__string = "NONE ";
      `BranchCtrlEnum_defaultEncoding_BU : _zz_67__string = "BU   ";
      `BranchCtrlEnum_defaultEncoding_BC : _zz_67__string = "BC   ";
      `BranchCtrlEnum_defaultEncoding_BCLR : _zz_67__string = "BCLR ";
      `BranchCtrlEnum_defaultEncoding_BCCTR : _zz_67__string = "BCCTR";
      `BranchCtrlEnum_defaultEncoding_BCTAR : _zz_67__string = "BCTAR";
      default : _zz_67__string = "?????";
    endcase
  end
  always @(*) begin
    case(memory_CR_WRITE_op)
      `CRBusCmdEnum_defaultEncoding_NOP : memory_CR_WRITE_op_string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : memory_CR_WRITE_op_string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : memory_CR_WRITE_op_string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : memory_CR_WRITE_op_string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : memory_CR_WRITE_op_string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : memory_CR_WRITE_op_string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : memory_CR_WRITE_op_string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : memory_CR_WRITE_op_string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : memory_CR_WRITE_op_string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : memory_CR_WRITE_op_string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : memory_CR_WRITE_op_string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : memory_CR_WRITE_op_string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : memory_CR_WRITE_op_string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : memory_CR_WRITE_op_string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : memory_CR_WRITE_op_string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : memory_CR_WRITE_op_string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : memory_CR_WRITE_op_string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : memory_CR_WRITE_op_string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : memory_CR_WRITE_op_string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : memory_CR_WRITE_op_string = "DECLNK";
      default : memory_CR_WRITE_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_68_)
      `CRBusCmdEnum_defaultEncoding_NOP : _zz_68__string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : _zz_68__string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : _zz_68__string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : _zz_68__string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : _zz_68__string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : _zz_68__string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : _zz_68__string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : _zz_68__string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : _zz_68__string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : _zz_68__string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : _zz_68__string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : _zz_68__string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : _zz_68__string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : _zz_68__string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : _zz_68__string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : _zz_68__string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : _zz_68__string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : _zz_68__string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : _zz_68__string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : _zz_68__string = "DECLNK";
      default : _zz_68__string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_DECODER_stageables_25)
      `BranchCtrlEnum_defaultEncoding_NONE : execute_DECODER_stageables_25_string = "NONE ";
      `BranchCtrlEnum_defaultEncoding_BU : execute_DECODER_stageables_25_string = "BU   ";
      `BranchCtrlEnum_defaultEncoding_BC : execute_DECODER_stageables_25_string = "BC   ";
      `BranchCtrlEnum_defaultEncoding_BCLR : execute_DECODER_stageables_25_string = "BCLR ";
      `BranchCtrlEnum_defaultEncoding_BCCTR : execute_DECODER_stageables_25_string = "BCCTR";
      `BranchCtrlEnum_defaultEncoding_BCTAR : execute_DECODER_stageables_25_string = "BCTAR";
      default : execute_DECODER_stageables_25_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_69_)
      `BranchCtrlEnum_defaultEncoding_NONE : _zz_69__string = "NONE ";
      `BranchCtrlEnum_defaultEncoding_BU : _zz_69__string = "BU   ";
      `BranchCtrlEnum_defaultEncoding_BC : _zz_69__string = "BC   ";
      `BranchCtrlEnum_defaultEncoding_BCLR : _zz_69__string = "BCLR ";
      `BranchCtrlEnum_defaultEncoding_BCCTR : _zz_69__string = "BCCTR";
      `BranchCtrlEnum_defaultEncoding_BCTAR : _zz_69__string = "BCTAR";
      default : _zz_69__string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_DECODER_stageables_8)
      `Src3CtrlEnum_defaultEncoding_CA : execute_DECODER_stageables_8_string = "CA  ";
      `Src3CtrlEnum_defaultEncoding_CA_0 : execute_DECODER_stageables_8_string = "CA_0";
      `Src3CtrlEnum_defaultEncoding_CA_1 : execute_DECODER_stageables_8_string = "CA_1";
      default : execute_DECODER_stageables_8_string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_72_)
      `Src3CtrlEnum_defaultEncoding_CA : _zz_72__string = "CA  ";
      `Src3CtrlEnum_defaultEncoding_CA_0 : _zz_72__string = "CA_0";
      `Src3CtrlEnum_defaultEncoding_CA_1 : _zz_72__string = "CA_1";
      default : _zz_72__string = "????";
    endcase
  end
  always @(*) begin
    case(execute_DECODER_stageables_12)
      `Src2CtrlEnum_defaultEncoding_RB : execute_DECODER_stageables_12_string = "RB      ";
      `Src2CtrlEnum_defaultEncoding_RB_0 : execute_DECODER_stageables_12_string = "RB_0    ";
      `Src2CtrlEnum_defaultEncoding_RB_M1 : execute_DECODER_stageables_12_string = "RB_M1   ";
      `Src2CtrlEnum_defaultEncoding_RB_UI : execute_DECODER_stageables_12_string = "RB_UI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SI : execute_DECODER_stageables_12_string = "RB_SI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SH : execute_DECODER_stageables_12_string = "RB_SH   ";
      `Src2CtrlEnum_defaultEncoding_RB_PCISD : execute_DECODER_stageables_12_string = "RB_PCISD";
      `Src2CtrlEnum_defaultEncoding_RA : execute_DECODER_stageables_12_string = "RA      ";
      default : execute_DECODER_stageables_12_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_73_)
      `Src2CtrlEnum_defaultEncoding_RB : _zz_73__string = "RB      ";
      `Src2CtrlEnum_defaultEncoding_RB_0 : _zz_73__string = "RB_0    ";
      `Src2CtrlEnum_defaultEncoding_RB_M1 : _zz_73__string = "RB_M1   ";
      `Src2CtrlEnum_defaultEncoding_RB_UI : _zz_73__string = "RB_UI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SI : _zz_73__string = "RB_SI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SH : _zz_73__string = "RB_SH   ";
      `Src2CtrlEnum_defaultEncoding_RB_PCISD : _zz_73__string = "RB_PCISD";
      `Src2CtrlEnum_defaultEncoding_RA : _zz_73__string = "RA      ";
      default : _zz_73__string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_DECODER_stageables_27)
      `Src1CtrlEnum_defaultEncoding_RA : execute_DECODER_stageables_27_string = "RA    ";
      `Src1CtrlEnum_defaultEncoding_RA_N : execute_DECODER_stageables_27_string = "RA_N  ";
      `Src1CtrlEnum_defaultEncoding_RA_NIA : execute_DECODER_stageables_27_string = "RA_NIA";
      `Src1CtrlEnum_defaultEncoding_RA_0 : execute_DECODER_stageables_27_string = "RA_0  ";
      `Src1CtrlEnum_defaultEncoding_RS : execute_DECODER_stageables_27_string = "RS    ";
      default : execute_DECODER_stageables_27_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_74_)
      `Src1CtrlEnum_defaultEncoding_RA : _zz_74__string = "RA    ";
      `Src1CtrlEnum_defaultEncoding_RA_N : _zz_74__string = "RA_N  ";
      `Src1CtrlEnum_defaultEncoding_RA_NIA : _zz_74__string = "RA_NIA";
      `Src1CtrlEnum_defaultEncoding_RA_0 : _zz_74__string = "RA_0  ";
      `Src1CtrlEnum_defaultEncoding_RS : _zz_74__string = "RS    ";
      default : _zz_74__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_78_)
      `CRBusCmdEnum_defaultEncoding_NOP : _zz_78__string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : _zz_78__string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : _zz_78__string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : _zz_78__string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : _zz_78__string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : _zz_78__string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : _zz_78__string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : _zz_78__string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : _zz_78__string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : _zz_78__string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : _zz_78__string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : _zz_78__string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : _zz_78__string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : _zz_78__string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : _zz_78__string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : _zz_78__string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : _zz_78__string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : _zz_78__string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : _zz_78__string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : _zz_78__string = "DECLNK";
      default : _zz_78__string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_DECODER_stageables_18)
      `CRLogCtrlEnum_defaultEncoding_AND_1 : execute_DECODER_stageables_18_string = "AND_1 ";
      `CRLogCtrlEnum_defaultEncoding_OR_1 : execute_DECODER_stageables_18_string = "OR_1  ";
      `CRLogCtrlEnum_defaultEncoding_XOR_1 : execute_DECODER_stageables_18_string = "XOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_NAND_1 : execute_DECODER_stageables_18_string = "NAND_1";
      `CRLogCtrlEnum_defaultEncoding_NOR_1 : execute_DECODER_stageables_18_string = "NOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_EQV : execute_DECODER_stageables_18_string = "EQV   ";
      `CRLogCtrlEnum_defaultEncoding_ANDC : execute_DECODER_stageables_18_string = "ANDC  ";
      `CRLogCtrlEnum_defaultEncoding_ORC : execute_DECODER_stageables_18_string = "ORC   ";
      default : execute_DECODER_stageables_18_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_79_)
      `CRLogCtrlEnum_defaultEncoding_AND_1 : _zz_79__string = "AND_1 ";
      `CRLogCtrlEnum_defaultEncoding_OR_1 : _zz_79__string = "OR_1  ";
      `CRLogCtrlEnum_defaultEncoding_XOR_1 : _zz_79__string = "XOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_NAND_1 : _zz_79__string = "NAND_1";
      `CRLogCtrlEnum_defaultEncoding_NOR_1 : _zz_79__string = "NOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_EQV : _zz_79__string = "EQV   ";
      `CRLogCtrlEnum_defaultEncoding_ANDC : _zz_79__string = "ANDC  ";
      `CRLogCtrlEnum_defaultEncoding_ORC : _zz_79__string = "ORC   ";
      default : _zz_79__string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_DECODER_stageables_49)
      `CRMoveCtrlEnum_defaultEncoding_MCRF : execute_DECODER_stageables_49_string = "MCRF  ";
      `CRMoveCtrlEnum_defaultEncoding_MCRXRX : execute_DECODER_stageables_49_string = "MCRXRX";
      `CRMoveCtrlEnum_defaultEncoding_MTCRF : execute_DECODER_stageables_49_string = "MTCRF ";
      default : execute_DECODER_stageables_49_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_80_)
      `CRMoveCtrlEnum_defaultEncoding_MCRF : _zz_80__string = "MCRF  ";
      `CRMoveCtrlEnum_defaultEncoding_MCRXRX : _zz_80__string = "MCRXRX";
      `CRMoveCtrlEnum_defaultEncoding_MTCRF : _zz_80__string = "MTCRF ";
      default : _zz_80__string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_DECODER_stageables_26)
      `TgtCtrlEnum_defaultEncoding_RT : execute_DECODER_stageables_26_string = "RT";
      `TgtCtrlEnum_defaultEncoding_RA : execute_DECODER_stageables_26_string = "RA";
      default : execute_DECODER_stageables_26_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_82_)
      `TgtCtrlEnum_defaultEncoding_RT : _zz_82__string = "RT";
      `TgtCtrlEnum_defaultEncoding_RA : _zz_82__string = "RA";
      default : _zz_82__string = "??";
    endcase
  end
  always @(*) begin
    case(execute_DECODER_stageables_40)
      `AluRimiAmtEnum_defaultEncoding_IMM : execute_DECODER_stageables_40_string = "IMM";
      `AluRimiAmtEnum_defaultEncoding_RB : execute_DECODER_stageables_40_string = "RB ";
      default : execute_DECODER_stageables_40_string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_83_)
      `AluRimiAmtEnum_defaultEncoding_IMM : _zz_83__string = "IMM";
      `AluRimiAmtEnum_defaultEncoding_RB : _zz_83__string = "RB ";
      default : _zz_83__string = "???";
    endcase
  end
  always @(*) begin
    case(execute_DECODER_stageables_1)
      `AluSpecCtrlEnum_defaultEncoding_CNTLZW : execute_DECODER_stageables_1_string = "CNTLZW ";
      `AluSpecCtrlEnum_defaultEncoding_CNTTZW : execute_DECODER_stageables_1_string = "CNTTZW ";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTB : execute_DECODER_stageables_1_string = "POPCNTB";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTW : execute_DECODER_stageables_1_string = "POPCNTW";
      `AluSpecCtrlEnum_defaultEncoding_CMPB : execute_DECODER_stageables_1_string = "CMPB   ";
      `AluSpecCtrlEnum_defaultEncoding_PRTYW : execute_DECODER_stageables_1_string = "PRTYW  ";
      default : execute_DECODER_stageables_1_string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_84_)
      `AluSpecCtrlEnum_defaultEncoding_CNTLZW : _zz_84__string = "CNTLZW ";
      `AluSpecCtrlEnum_defaultEncoding_CNTTZW : _zz_84__string = "CNTTZW ";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTB : _zz_84__string = "POPCNTB";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTW : _zz_84__string = "POPCNTW";
      `AluSpecCtrlEnum_defaultEncoding_CMPB : _zz_84__string = "CMPB   ";
      `AluSpecCtrlEnum_defaultEncoding_PRTYW : _zz_84__string = "PRTYW  ";
      default : _zz_84__string = "???????";
    endcase
  end
  always @(*) begin
    case(execute_DECODER_stageables_42)
      `AluRimiCtrlEnum_defaultEncoding_ROT : execute_DECODER_stageables_42_string = "ROT    ";
      `AluRimiCtrlEnum_defaultEncoding_INS : execute_DECODER_stageables_42_string = "INS    ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTL : execute_DECODER_stageables_42_string = "SHIFTL ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTR : execute_DECODER_stageables_42_string = "SHIFTR ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTRA : execute_DECODER_stageables_42_string = "SHIFTRA";
      default : execute_DECODER_stageables_42_string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_85_)
      `AluRimiCtrlEnum_defaultEncoding_ROT : _zz_85__string = "ROT    ";
      `AluRimiCtrlEnum_defaultEncoding_INS : _zz_85__string = "INS    ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTL : _zz_85__string = "SHIFTL ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTR : _zz_85__string = "SHIFTR ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTRA : _zz_85__string = "SHIFTRA";
      default : _zz_85__string = "???????";
    endcase
  end
  always @(*) begin
    case(execute_DECODER_stageables_52)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : execute_DECODER_stageables_52_string = "AND_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_ANDC : execute_DECODER_stageables_52_string = "ANDC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : execute_DECODER_stageables_52_string = "OR_1  ";
      `AluBitwiseCtrlEnum_defaultEncoding_ORC : execute_DECODER_stageables_52_string = "ORC   ";
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : execute_DECODER_stageables_52_string = "XOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_XORC : execute_DECODER_stageables_52_string = "XORC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_EQV : execute_DECODER_stageables_52_string = "EQV   ";
      `AluBitwiseCtrlEnum_defaultEncoding_NAND_1 : execute_DECODER_stageables_52_string = "NAND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_NOR_1 : execute_DECODER_stageables_52_string = "NOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSB : execute_DECODER_stageables_52_string = "EXTSB ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSH : execute_DECODER_stageables_52_string = "EXTSH ";
      default : execute_DECODER_stageables_52_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_86_)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_86__string = "AND_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_ANDC : _zz_86__string = "ANDC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_86__string = "OR_1  ";
      `AluBitwiseCtrlEnum_defaultEncoding_ORC : _zz_86__string = "ORC   ";
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_86__string = "XOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_XORC : _zz_86__string = "XORC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_EQV : _zz_86__string = "EQV   ";
      `AluBitwiseCtrlEnum_defaultEncoding_NAND_1 : _zz_86__string = "NAND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_NOR_1 : _zz_86__string = "NOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSB : _zz_86__string = "EXTSB ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSH : _zz_86__string = "EXTSH ";
      default : _zz_86__string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_DECODER_stageables_39)
      `AluCtrlEnum_defaultEncoding_ADD : execute_DECODER_stageables_39_string = "ADD  ";
      `AluCtrlEnum_defaultEncoding_BIT_1 : execute_DECODER_stageables_39_string = "BIT_1";
      `AluCtrlEnum_defaultEncoding_RIMI : execute_DECODER_stageables_39_string = "RIMI ";
      `AluCtrlEnum_defaultEncoding_SPEC : execute_DECODER_stageables_39_string = "SPEC ";
      default : execute_DECODER_stageables_39_string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_87_)
      `AluCtrlEnum_defaultEncoding_ADD : _zz_87__string = "ADD  ";
      `AluCtrlEnum_defaultEncoding_BIT_1 : _zz_87__string = "BIT_1";
      `AluCtrlEnum_defaultEncoding_RIMI : _zz_87__string = "RIMI ";
      `AluCtrlEnum_defaultEncoding_SPEC : _zz_87__string = "SPEC ";
      default : _zz_87__string = "?????";
    endcase
  end
  always @(*) begin
    case(writeBack_CR_WRITE_op)
      `CRBusCmdEnum_defaultEncoding_NOP : writeBack_CR_WRITE_op_string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : writeBack_CR_WRITE_op_string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : writeBack_CR_WRITE_op_string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : writeBack_CR_WRITE_op_string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : writeBack_CR_WRITE_op_string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : writeBack_CR_WRITE_op_string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : writeBack_CR_WRITE_op_string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : writeBack_CR_WRITE_op_string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : writeBack_CR_WRITE_op_string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : writeBack_CR_WRITE_op_string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : writeBack_CR_WRITE_op_string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : writeBack_CR_WRITE_op_string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : writeBack_CR_WRITE_op_string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : writeBack_CR_WRITE_op_string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : writeBack_CR_WRITE_op_string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : writeBack_CR_WRITE_op_string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : writeBack_CR_WRITE_op_string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : writeBack_CR_WRITE_op_string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : writeBack_CR_WRITE_op_string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : writeBack_CR_WRITE_op_string = "DECLNK";
      default : writeBack_CR_WRITE_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_88_)
      `CRBusCmdEnum_defaultEncoding_NOP : _zz_88__string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : _zz_88__string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : _zz_88__string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : _zz_88__string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : _zz_88__string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : _zz_88__string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : _zz_88__string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : _zz_88__string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : _zz_88__string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : _zz_88__string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : _zz_88__string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : _zz_88__string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : _zz_88__string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : _zz_88__string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : _zz_88__string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : _zz_88__string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : _zz_88__string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : _zz_88__string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : _zz_88__string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : _zz_88__string = "DECLNK";
      default : _zz_88__string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_DECODER_stageables_26)
      `TgtCtrlEnum_defaultEncoding_RT : decode_DECODER_stageables_26_string = "RT";
      `TgtCtrlEnum_defaultEncoding_RA : decode_DECODER_stageables_26_string = "RA";
      default : decode_DECODER_stageables_26_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_90_)
      `TgtCtrlEnum_defaultEncoding_RT : _zz_90__string = "RT";
      `TgtCtrlEnum_defaultEncoding_RA : _zz_90__string = "RA";
      default : _zz_90__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_91_)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_91__string = "AND_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_ANDC : _zz_91__string = "ANDC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_91__string = "OR_1  ";
      `AluBitwiseCtrlEnum_defaultEncoding_ORC : _zz_91__string = "ORC   ";
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_91__string = "XOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_XORC : _zz_91__string = "XORC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_EQV : _zz_91__string = "EQV   ";
      `AluBitwiseCtrlEnum_defaultEncoding_NAND_1 : _zz_91__string = "NAND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_NOR_1 : _zz_91__string = "NOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSB : _zz_91__string = "EXTSB ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSH : _zz_91__string = "EXTSH ";
      default : _zz_91__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_92_)
      `CRMoveCtrlEnum_defaultEncoding_MCRF : _zz_92__string = "MCRF  ";
      `CRMoveCtrlEnum_defaultEncoding_MCRXRX : _zz_92__string = "MCRXRX";
      `CRMoveCtrlEnum_defaultEncoding_MTCRF : _zz_92__string = "MTCRF ";
      default : _zz_92__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_93_)
      `AluRimiCtrlEnum_defaultEncoding_ROT : _zz_93__string = "ROT    ";
      `AluRimiCtrlEnum_defaultEncoding_INS : _zz_93__string = "INS    ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTL : _zz_93__string = "SHIFTL ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTR : _zz_93__string = "SHIFTR ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTRA : _zz_93__string = "SHIFTRA";
      default : _zz_93__string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_94_)
      `AluRimiAmtEnum_defaultEncoding_IMM : _zz_94__string = "IMM";
      `AluRimiAmtEnum_defaultEncoding_RB : _zz_94__string = "RB ";
      default : _zz_94__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_95_)
      `AluCtrlEnum_defaultEncoding_ADD : _zz_95__string = "ADD  ";
      `AluCtrlEnum_defaultEncoding_BIT_1 : _zz_95__string = "BIT_1";
      `AluCtrlEnum_defaultEncoding_RIMI : _zz_95__string = "RIMI ";
      `AluCtrlEnum_defaultEncoding_SPEC : _zz_95__string = "SPEC ";
      default : _zz_95__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_96_)
      `DataSizeEnum_defaultEncoding_B : _zz_96__string = "B ";
      `DataSizeEnum_defaultEncoding_H : _zz_96__string = "H ";
      `DataSizeEnum_defaultEncoding_HA : _zz_96__string = "HA";
      `DataSizeEnum_defaultEncoding_W : _zz_96__string = "W ";
      default : _zz_96__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_97_)
      `Src1CtrlEnum_defaultEncoding_RA : _zz_97__string = "RA    ";
      `Src1CtrlEnum_defaultEncoding_RA_N : _zz_97__string = "RA_N  ";
      `Src1CtrlEnum_defaultEncoding_RA_NIA : _zz_97__string = "RA_NIA";
      `Src1CtrlEnum_defaultEncoding_RA_0 : _zz_97__string = "RA_0  ";
      `Src1CtrlEnum_defaultEncoding_RS : _zz_97__string = "RS    ";
      default : _zz_97__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_98_)
      `TgtCtrlEnum_defaultEncoding_RT : _zz_98__string = "RT";
      `TgtCtrlEnum_defaultEncoding_RA : _zz_98__string = "RA";
      default : _zz_98__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_99_)
      `BranchCtrlEnum_defaultEncoding_NONE : _zz_99__string = "NONE ";
      `BranchCtrlEnum_defaultEncoding_BU : _zz_99__string = "BU   ";
      `BranchCtrlEnum_defaultEncoding_BC : _zz_99__string = "BC   ";
      `BranchCtrlEnum_defaultEncoding_BCLR : _zz_99__string = "BCLR ";
      `BranchCtrlEnum_defaultEncoding_BCCTR : _zz_99__string = "BCCTR";
      `BranchCtrlEnum_defaultEncoding_BCTAR : _zz_99__string = "BCTAR";
      default : _zz_99__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_100_)
      `CRLogCtrlEnum_defaultEncoding_AND_1 : _zz_100__string = "AND_1 ";
      `CRLogCtrlEnum_defaultEncoding_OR_1 : _zz_100__string = "OR_1  ";
      `CRLogCtrlEnum_defaultEncoding_XOR_1 : _zz_100__string = "XOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_NAND_1 : _zz_100__string = "NAND_1";
      `CRLogCtrlEnum_defaultEncoding_NOR_1 : _zz_100__string = "NOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_EQV : _zz_100__string = "EQV   ";
      `CRLogCtrlEnum_defaultEncoding_ANDC : _zz_100__string = "ANDC  ";
      `CRLogCtrlEnum_defaultEncoding_ORC : _zz_100__string = "ORC   ";
      default : _zz_100__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_101_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_101__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : _zz_101__string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : _zz_101__string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : _zz_101__string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : _zz_101__string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : _zz_101__string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : _zz_101__string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : _zz_101__string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : _zz_101__string = "TWI  ";
      default : _zz_101__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_102_)
      `Src2CtrlEnum_defaultEncoding_RB : _zz_102__string = "RB      ";
      `Src2CtrlEnum_defaultEncoding_RB_0 : _zz_102__string = "RB_0    ";
      `Src2CtrlEnum_defaultEncoding_RB_M1 : _zz_102__string = "RB_M1   ";
      `Src2CtrlEnum_defaultEncoding_RB_UI : _zz_102__string = "RB_UI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SI : _zz_102__string = "RB_SI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SH : _zz_102__string = "RB_SH   ";
      `Src2CtrlEnum_defaultEncoding_RB_PCISD : _zz_102__string = "RB_PCISD";
      `Src2CtrlEnum_defaultEncoding_RA : _zz_102__string = "RA      ";
      default : _zz_102__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_103_)
      `Src3CtrlEnum_defaultEncoding_CA : _zz_103__string = "CA  ";
      `Src3CtrlEnum_defaultEncoding_CA_0 : _zz_103__string = "CA_0";
      `Src3CtrlEnum_defaultEncoding_CA_1 : _zz_103__string = "CA_1";
      default : _zz_103__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_104_)
      `AluSpecCtrlEnum_defaultEncoding_CNTLZW : _zz_104__string = "CNTLZW ";
      `AluSpecCtrlEnum_defaultEncoding_CNTTZW : _zz_104__string = "CNTTZW ";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTB : _zz_104__string = "POPCNTB";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTW : _zz_104__string = "POPCNTW";
      `AluSpecCtrlEnum_defaultEncoding_CMPB : _zz_104__string = "CMPB   ";
      `AluSpecCtrlEnum_defaultEncoding_PRTYW : _zz_104__string = "PRTYW  ";
      default : _zz_104__string = "???????";
    endcase
  end
  always @(*) begin
    case(writeBack_DATA_SIZE)
      `DataSizeEnum_defaultEncoding_B : writeBack_DATA_SIZE_string = "B ";
      `DataSizeEnum_defaultEncoding_H : writeBack_DATA_SIZE_string = "H ";
      `DataSizeEnum_defaultEncoding_HA : writeBack_DATA_SIZE_string = "HA";
      `DataSizeEnum_defaultEncoding_W : writeBack_DATA_SIZE_string = "W ";
      default : writeBack_DATA_SIZE_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_105_)
      `DataSizeEnum_defaultEncoding_B : _zz_105__string = "B ";
      `DataSizeEnum_defaultEncoding_H : _zz_105__string = "H ";
      `DataSizeEnum_defaultEncoding_HA : _zz_105__string = "HA";
      `DataSizeEnum_defaultEncoding_W : _zz_105__string = "W ";
      default : _zz_105__string = "??";
    endcase
  end
  always @(*) begin
    case(writeBack_MSR_ENDIAN)
      `EndianEnum_defaultEncoding_BE : writeBack_MSR_ENDIAN_string = "BE";
      `EndianEnum_defaultEncoding_LE : writeBack_MSR_ENDIAN_string = "LE";
      default : writeBack_MSR_ENDIAN_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_106_)
      `EndianEnum_defaultEncoding_BE : _zz_106__string = "BE";
      `EndianEnum_defaultEncoding_LE : _zz_106__string = "LE";
      default : _zz_106__string = "??";
    endcase
  end
  always @(*) begin
    case(execute_DATA_SIZE)
      `DataSizeEnum_defaultEncoding_B : execute_DATA_SIZE_string = "B ";
      `DataSizeEnum_defaultEncoding_H : execute_DATA_SIZE_string = "H ";
      `DataSizeEnum_defaultEncoding_HA : execute_DATA_SIZE_string = "HA";
      `DataSizeEnum_defaultEncoding_W : execute_DATA_SIZE_string = "W ";
      default : execute_DATA_SIZE_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_108_)
      `DataSizeEnum_defaultEncoding_B : _zz_108__string = "B ";
      `DataSizeEnum_defaultEncoding_H : _zz_108__string = "H ";
      `DataSizeEnum_defaultEncoding_HA : _zz_108__string = "HA";
      `DataSizeEnum_defaultEncoding_W : _zz_108__string = "W ";
      default : _zz_108__string = "??";
    endcase
  end
  always @(*) begin
    case(execute_MSR_ENDIAN)
      `EndianEnum_defaultEncoding_BE : execute_MSR_ENDIAN_string = "BE";
      `EndianEnum_defaultEncoding_LE : execute_MSR_ENDIAN_string = "LE";
      default : execute_MSR_ENDIAN_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_109_)
      `EndianEnum_defaultEncoding_BE : _zz_109__string = "BE";
      `EndianEnum_defaultEncoding_LE : _zz_109__string = "LE";
      default : _zz_109__string = "??";
    endcase
  end
  always @(*) begin
    case(decode_MSR_ENDIAN)
      `EndianEnum_defaultEncoding_BE : decode_MSR_ENDIAN_string = "BE";
      `EndianEnum_defaultEncoding_LE : decode_MSR_ENDIAN_string = "LE";
      default : decode_MSR_ENDIAN_string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_112_)
      `EndianEnum_defaultEncoding_BE : _zz_112__string = "BE";
      `EndianEnum_defaultEncoding_LE : _zz_112__string = "LE";
      default : _zz_112__string = "??";
    endcase
  end
  always @(*) begin
    case(IBusCachedPlugin_decodeExceptionPort_payload_codePPC)
      `ExcpEnum_defaultEncoding_NONE : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "NONE    ";
      `ExcpEnum_defaultEncoding_SC : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "SC      ";
      `ExcpEnum_defaultEncoding_SCV : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "SCV     ";
      `ExcpEnum_defaultEncoding_TRAP : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "TRAP    ";
      `ExcpEnum_defaultEncoding_RFI : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "RFI     ";
      `ExcpEnum_defaultEncoding_RFSCV : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "RFSCV   ";
      `ExcpEnum_defaultEncoding_DSI : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "DSI     ";
      `ExcpEnum_defaultEncoding_DSI_PROT : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "DSI_PROT";
      `ExcpEnum_defaultEncoding_DSS : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "DSS     ";
      `ExcpEnum_defaultEncoding_ISI : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "ISI     ";
      `ExcpEnum_defaultEncoding_ISI_PROT : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "ISI_PROT";
      `ExcpEnum_defaultEncoding_ISS : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "ISS     ";
      `ExcpEnum_defaultEncoding_ALG : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "ALG     ";
      `ExcpEnum_defaultEncoding_PGM_ILL : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "PGM_ILL ";
      `ExcpEnum_defaultEncoding_PGM_PRV : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "PGM_PRV ";
      `ExcpEnum_defaultEncoding_FP : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "FP      ";
      `ExcpEnum_defaultEncoding_VEC : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "VEC     ";
      `ExcpEnum_defaultEncoding_VSX : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "VSX     ";
      `ExcpEnum_defaultEncoding_FAC : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "FAC     ";
      `ExcpEnum_defaultEncoding_SR : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "SR      ";
      `ExcpEnum_defaultEncoding_MC : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "MC      ";
      `ExcpEnum_defaultEncoding_EXT : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "EXT     ";
      `ExcpEnum_defaultEncoding_DEC : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "DEC     ";
      `ExcpEnum_defaultEncoding_TR : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "TR      ";
      `ExcpEnum_defaultEncoding_PM : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "PM      ";
      default : IBusCachedPlugin_decodeExceptionPort_payload_codePPC_string = "????????";
    endcase
  end
  always @(*) begin
    case(DBusCachedPlugin_exceptionBus_payload_codePPC)
      `ExcpEnum_defaultEncoding_NONE : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "NONE    ";
      `ExcpEnum_defaultEncoding_SC : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "SC      ";
      `ExcpEnum_defaultEncoding_SCV : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "SCV     ";
      `ExcpEnum_defaultEncoding_TRAP : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "TRAP    ";
      `ExcpEnum_defaultEncoding_RFI : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "RFI     ";
      `ExcpEnum_defaultEncoding_RFSCV : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "RFSCV   ";
      `ExcpEnum_defaultEncoding_DSI : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "DSI     ";
      `ExcpEnum_defaultEncoding_DSI_PROT : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "DSI_PROT";
      `ExcpEnum_defaultEncoding_DSS : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "DSS     ";
      `ExcpEnum_defaultEncoding_ISI : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "ISI     ";
      `ExcpEnum_defaultEncoding_ISI_PROT : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "ISI_PROT";
      `ExcpEnum_defaultEncoding_ISS : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "ISS     ";
      `ExcpEnum_defaultEncoding_ALG : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "ALG     ";
      `ExcpEnum_defaultEncoding_PGM_ILL : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "PGM_ILL ";
      `ExcpEnum_defaultEncoding_PGM_PRV : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "PGM_PRV ";
      `ExcpEnum_defaultEncoding_FP : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "FP      ";
      `ExcpEnum_defaultEncoding_VEC : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "VEC     ";
      `ExcpEnum_defaultEncoding_VSX : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "VSX     ";
      `ExcpEnum_defaultEncoding_FAC : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "FAC     ";
      `ExcpEnum_defaultEncoding_SR : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "SR      ";
      `ExcpEnum_defaultEncoding_MC : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "MC      ";
      `ExcpEnum_defaultEncoding_EXT : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "EXT     ";
      `ExcpEnum_defaultEncoding_DEC : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "DEC     ";
      `ExcpEnum_defaultEncoding_TR : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "TR      ";
      `ExcpEnum_defaultEncoding_PM : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "PM      ";
      default : DBusCachedPlugin_exceptionBus_payload_codePPC_string = "????????";
    endcase
  end
  always @(*) begin
    case(decodeExceptionPort_payload_codePPC)
      `ExcpEnum_defaultEncoding_NONE : decodeExceptionPort_payload_codePPC_string = "NONE    ";
      `ExcpEnum_defaultEncoding_SC : decodeExceptionPort_payload_codePPC_string = "SC      ";
      `ExcpEnum_defaultEncoding_SCV : decodeExceptionPort_payload_codePPC_string = "SCV     ";
      `ExcpEnum_defaultEncoding_TRAP : decodeExceptionPort_payload_codePPC_string = "TRAP    ";
      `ExcpEnum_defaultEncoding_RFI : decodeExceptionPort_payload_codePPC_string = "RFI     ";
      `ExcpEnum_defaultEncoding_RFSCV : decodeExceptionPort_payload_codePPC_string = "RFSCV   ";
      `ExcpEnum_defaultEncoding_DSI : decodeExceptionPort_payload_codePPC_string = "DSI     ";
      `ExcpEnum_defaultEncoding_DSI_PROT : decodeExceptionPort_payload_codePPC_string = "DSI_PROT";
      `ExcpEnum_defaultEncoding_DSS : decodeExceptionPort_payload_codePPC_string = "DSS     ";
      `ExcpEnum_defaultEncoding_ISI : decodeExceptionPort_payload_codePPC_string = "ISI     ";
      `ExcpEnum_defaultEncoding_ISI_PROT : decodeExceptionPort_payload_codePPC_string = "ISI_PROT";
      `ExcpEnum_defaultEncoding_ISS : decodeExceptionPort_payload_codePPC_string = "ISS     ";
      `ExcpEnum_defaultEncoding_ALG : decodeExceptionPort_payload_codePPC_string = "ALG     ";
      `ExcpEnum_defaultEncoding_PGM_ILL : decodeExceptionPort_payload_codePPC_string = "PGM_ILL ";
      `ExcpEnum_defaultEncoding_PGM_PRV : decodeExceptionPort_payload_codePPC_string = "PGM_PRV ";
      `ExcpEnum_defaultEncoding_FP : decodeExceptionPort_payload_codePPC_string = "FP      ";
      `ExcpEnum_defaultEncoding_VEC : decodeExceptionPort_payload_codePPC_string = "VEC     ";
      `ExcpEnum_defaultEncoding_VSX : decodeExceptionPort_payload_codePPC_string = "VSX     ";
      `ExcpEnum_defaultEncoding_FAC : decodeExceptionPort_payload_codePPC_string = "FAC     ";
      `ExcpEnum_defaultEncoding_SR : decodeExceptionPort_payload_codePPC_string = "SR      ";
      `ExcpEnum_defaultEncoding_MC : decodeExceptionPort_payload_codePPC_string = "MC      ";
      `ExcpEnum_defaultEncoding_EXT : decodeExceptionPort_payload_codePPC_string = "EXT     ";
      `ExcpEnum_defaultEncoding_DEC : decodeExceptionPort_payload_codePPC_string = "DEC     ";
      `ExcpEnum_defaultEncoding_TR : decodeExceptionPort_payload_codePPC_string = "TR      ";
      `ExcpEnum_defaultEncoding_PM : decodeExceptionPort_payload_codePPC_string = "PM      ";
      default : decodeExceptionPort_payload_codePPC_string = "????????";
    endcase
  end
  always @(*) begin
    case(BranchPlugin_branchExceptionPort_payload_codePPC)
      `ExcpEnum_defaultEncoding_NONE : BranchPlugin_branchExceptionPort_payload_codePPC_string = "NONE    ";
      `ExcpEnum_defaultEncoding_SC : BranchPlugin_branchExceptionPort_payload_codePPC_string = "SC      ";
      `ExcpEnum_defaultEncoding_SCV : BranchPlugin_branchExceptionPort_payload_codePPC_string = "SCV     ";
      `ExcpEnum_defaultEncoding_TRAP : BranchPlugin_branchExceptionPort_payload_codePPC_string = "TRAP    ";
      `ExcpEnum_defaultEncoding_RFI : BranchPlugin_branchExceptionPort_payload_codePPC_string = "RFI     ";
      `ExcpEnum_defaultEncoding_RFSCV : BranchPlugin_branchExceptionPort_payload_codePPC_string = "RFSCV   ";
      `ExcpEnum_defaultEncoding_DSI : BranchPlugin_branchExceptionPort_payload_codePPC_string = "DSI     ";
      `ExcpEnum_defaultEncoding_DSI_PROT : BranchPlugin_branchExceptionPort_payload_codePPC_string = "DSI_PROT";
      `ExcpEnum_defaultEncoding_DSS : BranchPlugin_branchExceptionPort_payload_codePPC_string = "DSS     ";
      `ExcpEnum_defaultEncoding_ISI : BranchPlugin_branchExceptionPort_payload_codePPC_string = "ISI     ";
      `ExcpEnum_defaultEncoding_ISI_PROT : BranchPlugin_branchExceptionPort_payload_codePPC_string = "ISI_PROT";
      `ExcpEnum_defaultEncoding_ISS : BranchPlugin_branchExceptionPort_payload_codePPC_string = "ISS     ";
      `ExcpEnum_defaultEncoding_ALG : BranchPlugin_branchExceptionPort_payload_codePPC_string = "ALG     ";
      `ExcpEnum_defaultEncoding_PGM_ILL : BranchPlugin_branchExceptionPort_payload_codePPC_string = "PGM_ILL ";
      `ExcpEnum_defaultEncoding_PGM_PRV : BranchPlugin_branchExceptionPort_payload_codePPC_string = "PGM_PRV ";
      `ExcpEnum_defaultEncoding_FP : BranchPlugin_branchExceptionPort_payload_codePPC_string = "FP      ";
      `ExcpEnum_defaultEncoding_VEC : BranchPlugin_branchExceptionPort_payload_codePPC_string = "VEC     ";
      `ExcpEnum_defaultEncoding_VSX : BranchPlugin_branchExceptionPort_payload_codePPC_string = "VSX     ";
      `ExcpEnum_defaultEncoding_FAC : BranchPlugin_branchExceptionPort_payload_codePPC_string = "FAC     ";
      `ExcpEnum_defaultEncoding_SR : BranchPlugin_branchExceptionPort_payload_codePPC_string = "SR      ";
      `ExcpEnum_defaultEncoding_MC : BranchPlugin_branchExceptionPort_payload_codePPC_string = "MC      ";
      `ExcpEnum_defaultEncoding_EXT : BranchPlugin_branchExceptionPort_payload_codePPC_string = "EXT     ";
      `ExcpEnum_defaultEncoding_DEC : BranchPlugin_branchExceptionPort_payload_codePPC_string = "DEC     ";
      `ExcpEnum_defaultEncoding_TR : BranchPlugin_branchExceptionPort_payload_codePPC_string = "TR      ";
      `ExcpEnum_defaultEncoding_PM : BranchPlugin_branchExceptionPort_payload_codePPC_string = "PM      ";
      default : BranchPlugin_branchExceptionPort_payload_codePPC_string = "????????";
    endcase
  end
  always @(*) begin
    case(SPRPlugin_selfException_payload_codePPC)
      `ExcpEnum_defaultEncoding_NONE : SPRPlugin_selfException_payload_codePPC_string = "NONE    ";
      `ExcpEnum_defaultEncoding_SC : SPRPlugin_selfException_payload_codePPC_string = "SC      ";
      `ExcpEnum_defaultEncoding_SCV : SPRPlugin_selfException_payload_codePPC_string = "SCV     ";
      `ExcpEnum_defaultEncoding_TRAP : SPRPlugin_selfException_payload_codePPC_string = "TRAP    ";
      `ExcpEnum_defaultEncoding_RFI : SPRPlugin_selfException_payload_codePPC_string = "RFI     ";
      `ExcpEnum_defaultEncoding_RFSCV : SPRPlugin_selfException_payload_codePPC_string = "RFSCV   ";
      `ExcpEnum_defaultEncoding_DSI : SPRPlugin_selfException_payload_codePPC_string = "DSI     ";
      `ExcpEnum_defaultEncoding_DSI_PROT : SPRPlugin_selfException_payload_codePPC_string = "DSI_PROT";
      `ExcpEnum_defaultEncoding_DSS : SPRPlugin_selfException_payload_codePPC_string = "DSS     ";
      `ExcpEnum_defaultEncoding_ISI : SPRPlugin_selfException_payload_codePPC_string = "ISI     ";
      `ExcpEnum_defaultEncoding_ISI_PROT : SPRPlugin_selfException_payload_codePPC_string = "ISI_PROT";
      `ExcpEnum_defaultEncoding_ISS : SPRPlugin_selfException_payload_codePPC_string = "ISS     ";
      `ExcpEnum_defaultEncoding_ALG : SPRPlugin_selfException_payload_codePPC_string = "ALG     ";
      `ExcpEnum_defaultEncoding_PGM_ILL : SPRPlugin_selfException_payload_codePPC_string = "PGM_ILL ";
      `ExcpEnum_defaultEncoding_PGM_PRV : SPRPlugin_selfException_payload_codePPC_string = "PGM_PRV ";
      `ExcpEnum_defaultEncoding_FP : SPRPlugin_selfException_payload_codePPC_string = "FP      ";
      `ExcpEnum_defaultEncoding_VEC : SPRPlugin_selfException_payload_codePPC_string = "VEC     ";
      `ExcpEnum_defaultEncoding_VSX : SPRPlugin_selfException_payload_codePPC_string = "VSX     ";
      `ExcpEnum_defaultEncoding_FAC : SPRPlugin_selfException_payload_codePPC_string = "FAC     ";
      `ExcpEnum_defaultEncoding_SR : SPRPlugin_selfException_payload_codePPC_string = "SR      ";
      `ExcpEnum_defaultEncoding_MC : SPRPlugin_selfException_payload_codePPC_string = "MC      ";
      `ExcpEnum_defaultEncoding_EXT : SPRPlugin_selfException_payload_codePPC_string = "EXT     ";
      `ExcpEnum_defaultEncoding_DEC : SPRPlugin_selfException_payload_codePPC_string = "DEC     ";
      `ExcpEnum_defaultEncoding_TR : SPRPlugin_selfException_payload_codePPC_string = "TR      ";
      `ExcpEnum_defaultEncoding_PM : SPRPlugin_selfException_payload_codePPC_string = "PM      ";
      default : SPRPlugin_selfException_payload_codePPC_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_202_)
      `AluSpecCtrlEnum_defaultEncoding_CNTLZW : _zz_202__string = "CNTLZW ";
      `AluSpecCtrlEnum_defaultEncoding_CNTTZW : _zz_202__string = "CNTTZW ";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTB : _zz_202__string = "POPCNTB";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTW : _zz_202__string = "POPCNTW";
      `AluSpecCtrlEnum_defaultEncoding_CMPB : _zz_202__string = "CMPB   ";
      `AluSpecCtrlEnum_defaultEncoding_PRTYW : _zz_202__string = "PRTYW  ";
      default : _zz_202__string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_203_)
      `Src3CtrlEnum_defaultEncoding_CA : _zz_203__string = "CA  ";
      `Src3CtrlEnum_defaultEncoding_CA_0 : _zz_203__string = "CA_0";
      `Src3CtrlEnum_defaultEncoding_CA_1 : _zz_203__string = "CA_1";
      default : _zz_203__string = "????";
    endcase
  end
  always @(*) begin
    case(_zz_204_)
      `Src2CtrlEnum_defaultEncoding_RB : _zz_204__string = "RB      ";
      `Src2CtrlEnum_defaultEncoding_RB_0 : _zz_204__string = "RB_0    ";
      `Src2CtrlEnum_defaultEncoding_RB_M1 : _zz_204__string = "RB_M1   ";
      `Src2CtrlEnum_defaultEncoding_RB_UI : _zz_204__string = "RB_UI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SI : _zz_204__string = "RB_SI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SH : _zz_204__string = "RB_SH   ";
      `Src2CtrlEnum_defaultEncoding_RB_PCISD : _zz_204__string = "RB_PCISD";
      `Src2CtrlEnum_defaultEncoding_RA : _zz_204__string = "RA      ";
      default : _zz_204__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_205_)
      `EnvCtrlEnum_defaultEncoding_NONE : _zz_205__string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : _zz_205__string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : _zz_205__string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : _zz_205__string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : _zz_205__string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : _zz_205__string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : _zz_205__string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : _zz_205__string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : _zz_205__string = "TWI  ";
      default : _zz_205__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_206_)
      `CRLogCtrlEnum_defaultEncoding_AND_1 : _zz_206__string = "AND_1 ";
      `CRLogCtrlEnum_defaultEncoding_OR_1 : _zz_206__string = "OR_1  ";
      `CRLogCtrlEnum_defaultEncoding_XOR_1 : _zz_206__string = "XOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_NAND_1 : _zz_206__string = "NAND_1";
      `CRLogCtrlEnum_defaultEncoding_NOR_1 : _zz_206__string = "NOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_EQV : _zz_206__string = "EQV   ";
      `CRLogCtrlEnum_defaultEncoding_ANDC : _zz_206__string = "ANDC  ";
      `CRLogCtrlEnum_defaultEncoding_ORC : _zz_206__string = "ORC   ";
      default : _zz_206__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_207_)
      `BranchCtrlEnum_defaultEncoding_NONE : _zz_207__string = "NONE ";
      `BranchCtrlEnum_defaultEncoding_BU : _zz_207__string = "BU   ";
      `BranchCtrlEnum_defaultEncoding_BC : _zz_207__string = "BC   ";
      `BranchCtrlEnum_defaultEncoding_BCLR : _zz_207__string = "BCLR ";
      `BranchCtrlEnum_defaultEncoding_BCCTR : _zz_207__string = "BCCTR";
      `BranchCtrlEnum_defaultEncoding_BCTAR : _zz_207__string = "BCTAR";
      default : _zz_207__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_208_)
      `TgtCtrlEnum_defaultEncoding_RT : _zz_208__string = "RT";
      `TgtCtrlEnum_defaultEncoding_RA : _zz_208__string = "RA";
      default : _zz_208__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_209_)
      `Src1CtrlEnum_defaultEncoding_RA : _zz_209__string = "RA    ";
      `Src1CtrlEnum_defaultEncoding_RA_N : _zz_209__string = "RA_N  ";
      `Src1CtrlEnum_defaultEncoding_RA_NIA : _zz_209__string = "RA_NIA";
      `Src1CtrlEnum_defaultEncoding_RA_0 : _zz_209__string = "RA_0  ";
      `Src1CtrlEnum_defaultEncoding_RS : _zz_209__string = "RS    ";
      default : _zz_209__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_210_)
      `DataSizeEnum_defaultEncoding_B : _zz_210__string = "B ";
      `DataSizeEnum_defaultEncoding_H : _zz_210__string = "H ";
      `DataSizeEnum_defaultEncoding_HA : _zz_210__string = "HA";
      `DataSizeEnum_defaultEncoding_W : _zz_210__string = "W ";
      default : _zz_210__string = "??";
    endcase
  end
  always @(*) begin
    case(_zz_211_)
      `AluCtrlEnum_defaultEncoding_ADD : _zz_211__string = "ADD  ";
      `AluCtrlEnum_defaultEncoding_BIT_1 : _zz_211__string = "BIT_1";
      `AluCtrlEnum_defaultEncoding_RIMI : _zz_211__string = "RIMI ";
      `AluCtrlEnum_defaultEncoding_SPEC : _zz_211__string = "SPEC ";
      default : _zz_211__string = "?????";
    endcase
  end
  always @(*) begin
    case(_zz_212_)
      `AluRimiAmtEnum_defaultEncoding_IMM : _zz_212__string = "IMM";
      `AluRimiAmtEnum_defaultEncoding_RB : _zz_212__string = "RB ";
      default : _zz_212__string = "???";
    endcase
  end
  always @(*) begin
    case(_zz_213_)
      `AluRimiCtrlEnum_defaultEncoding_ROT : _zz_213__string = "ROT    ";
      `AluRimiCtrlEnum_defaultEncoding_INS : _zz_213__string = "INS    ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTL : _zz_213__string = "SHIFTL ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTR : _zz_213__string = "SHIFTR ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTRA : _zz_213__string = "SHIFTRA";
      default : _zz_213__string = "???????";
    endcase
  end
  always @(*) begin
    case(_zz_214_)
      `CRMoveCtrlEnum_defaultEncoding_MCRF : _zz_214__string = "MCRF  ";
      `CRMoveCtrlEnum_defaultEncoding_MCRXRX : _zz_214__string = "MCRXRX";
      `CRMoveCtrlEnum_defaultEncoding_MTCRF : _zz_214__string = "MTCRF ";
      default : _zz_214__string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_215_)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : _zz_215__string = "AND_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_ANDC : _zz_215__string = "ANDC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : _zz_215__string = "OR_1  ";
      `AluBitwiseCtrlEnum_defaultEncoding_ORC : _zz_215__string = "ORC   ";
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : _zz_215__string = "XOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_XORC : _zz_215__string = "XORC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_EQV : _zz_215__string = "EQV   ";
      `AluBitwiseCtrlEnum_defaultEncoding_NAND_1 : _zz_215__string = "NAND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_NOR_1 : _zz_215__string = "NOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSB : _zz_215__string = "EXTSB ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSH : _zz_215__string = "EXTSH ";
      default : _zz_215__string = "??????";
    endcase
  end
  always @(*) begin
    case(writeBack_RegFilePluginComp_crBusPort_payload_op)
      `CRBusCmdEnum_defaultEncoding_NOP : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "DECLNK";
      default : writeBack_RegFilePluginComp_crBusPort_payload_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_IntAluPluginComp_crBus_op)
      `CRBusCmdEnum_defaultEncoding_NOP : execute_IntAluPluginComp_crBus_op_string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : execute_IntAluPluginComp_crBus_op_string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : execute_IntAluPluginComp_crBus_op_string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : execute_IntAluPluginComp_crBus_op_string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : execute_IntAluPluginComp_crBus_op_string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : execute_IntAluPluginComp_crBus_op_string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : execute_IntAluPluginComp_crBus_op_string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : execute_IntAluPluginComp_crBus_op_string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : execute_IntAluPluginComp_crBus_op_string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : execute_IntAluPluginComp_crBus_op_string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : execute_IntAluPluginComp_crBus_op_string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : execute_IntAluPluginComp_crBus_op_string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : execute_IntAluPluginComp_crBus_op_string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : execute_IntAluPluginComp_crBus_op_string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : execute_IntAluPluginComp_crBus_op_string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : execute_IntAluPluginComp_crBus_op_string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : execute_IntAluPluginComp_crBus_op_string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : execute_IntAluPluginComp_crBus_op_string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : execute_IntAluPluginComp_crBus_op_string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : execute_IntAluPluginComp_crBus_op_string = "DECLNK";
      default : execute_IntAluPluginComp_crBus_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(_zz_235_)
      `CRBusCmdEnum_defaultEncoding_NOP : _zz_235__string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : _zz_235__string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : _zz_235__string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : _zz_235__string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : _zz_235__string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : _zz_235__string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : _zz_235__string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : _zz_235__string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : _zz_235__string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : _zz_235__string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : _zz_235__string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : _zz_235__string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : _zz_235__string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : _zz_235__string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : _zz_235__string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : _zz_235__string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : _zz_235__string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : _zz_235__string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : _zz_235__string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : _zz_235__string = "DECLNK";
      default : _zz_235__string = "??????";
    endcase
  end
  always @(*) begin
    case(DIV_MEM_crBusPort_payload_op)
      `CRBusCmdEnum_defaultEncoding_NOP : DIV_MEM_crBusPort_payload_op_string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : DIV_MEM_crBusPort_payload_op_string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : DIV_MEM_crBusPort_payload_op_string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : DIV_MEM_crBusPort_payload_op_string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : DIV_MEM_crBusPort_payload_op_string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : DIV_MEM_crBusPort_payload_op_string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : DIV_MEM_crBusPort_payload_op_string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : DIV_MEM_crBusPort_payload_op_string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : DIV_MEM_crBusPort_payload_op_string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : DIV_MEM_crBusPort_payload_op_string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : DIV_MEM_crBusPort_payload_op_string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : DIV_MEM_crBusPort_payload_op_string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : DIV_MEM_crBusPort_payload_op_string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : DIV_MEM_crBusPort_payload_op_string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : DIV_MEM_crBusPort_payload_op_string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : DIV_MEM_crBusPort_payload_op_string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : DIV_MEM_crBusPort_payload_op_string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : DIV_MEM_crBusPort_payload_op_string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : DIV_MEM_crBusPort_payload_op_string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : DIV_MEM_crBusPort_payload_op_string = "DECLNK";
      default : DIV_MEM_crBusPort_payload_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_BranchPlugin_crBusPort_op)
      `CRBusCmdEnum_defaultEncoding_NOP : execute_BranchPlugin_crBusPort_op_string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : execute_BranchPlugin_crBusPort_op_string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : execute_BranchPlugin_crBusPort_op_string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : execute_BranchPlugin_crBusPort_op_string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : execute_BranchPlugin_crBusPort_op_string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : execute_BranchPlugin_crBusPort_op_string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : execute_BranchPlugin_crBusPort_op_string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : execute_BranchPlugin_crBusPort_op_string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : execute_BranchPlugin_crBusPort_op_string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : execute_BranchPlugin_crBusPort_op_string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : execute_BranchPlugin_crBusPort_op_string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : execute_BranchPlugin_crBusPort_op_string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : execute_BranchPlugin_crBusPort_op_string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : execute_BranchPlugin_crBusPort_op_string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : execute_BranchPlugin_crBusPort_op_string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : execute_BranchPlugin_crBusPort_op_string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : execute_BranchPlugin_crBusPort_op_string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : execute_BranchPlugin_crBusPort_op_string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : execute_BranchPlugin_crBusPort_op_string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : execute_BranchPlugin_crBusPort_op_string = "DECLNK";
      default : execute_BranchPlugin_crBusPort_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC)
      `ExcpEnum_defaultEncoding_NONE : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "NONE    ";
      `ExcpEnum_defaultEncoding_SC : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "SC      ";
      `ExcpEnum_defaultEncoding_SCV : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "SCV     ";
      `ExcpEnum_defaultEncoding_TRAP : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "TRAP    ";
      `ExcpEnum_defaultEncoding_RFI : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "RFI     ";
      `ExcpEnum_defaultEncoding_RFSCV : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "RFSCV   ";
      `ExcpEnum_defaultEncoding_DSI : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "DSI     ";
      `ExcpEnum_defaultEncoding_DSI_PROT : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "DSI_PROT";
      `ExcpEnum_defaultEncoding_DSS : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "DSS     ";
      `ExcpEnum_defaultEncoding_ISI : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "ISI     ";
      `ExcpEnum_defaultEncoding_ISI_PROT : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "ISI_PROT";
      `ExcpEnum_defaultEncoding_ISS : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "ISS     ";
      `ExcpEnum_defaultEncoding_ALG : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "ALG     ";
      `ExcpEnum_defaultEncoding_PGM_ILL : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "PGM_ILL ";
      `ExcpEnum_defaultEncoding_PGM_PRV : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "PGM_PRV ";
      `ExcpEnum_defaultEncoding_FP : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "FP      ";
      `ExcpEnum_defaultEncoding_VEC : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "VEC     ";
      `ExcpEnum_defaultEncoding_VSX : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "VSX     ";
      `ExcpEnum_defaultEncoding_FAC : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "FAC     ";
      `ExcpEnum_defaultEncoding_SR : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "SR      ";
      `ExcpEnum_defaultEncoding_MC : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "MC      ";
      `ExcpEnum_defaultEncoding_EXT : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "EXT     ";
      `ExcpEnum_defaultEncoding_DEC : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "DEC     ";
      `ExcpEnum_defaultEncoding_TR : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "TR      ";
      `ExcpEnum_defaultEncoding_PM : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "PM      ";
      default : SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC_string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_287_)
      `ExcpEnum_defaultEncoding_NONE : _zz_287__string = "NONE    ";
      `ExcpEnum_defaultEncoding_SC : _zz_287__string = "SC      ";
      `ExcpEnum_defaultEncoding_SCV : _zz_287__string = "SCV     ";
      `ExcpEnum_defaultEncoding_TRAP : _zz_287__string = "TRAP    ";
      `ExcpEnum_defaultEncoding_RFI : _zz_287__string = "RFI     ";
      `ExcpEnum_defaultEncoding_RFSCV : _zz_287__string = "RFSCV   ";
      `ExcpEnum_defaultEncoding_DSI : _zz_287__string = "DSI     ";
      `ExcpEnum_defaultEncoding_DSI_PROT : _zz_287__string = "DSI_PROT";
      `ExcpEnum_defaultEncoding_DSS : _zz_287__string = "DSS     ";
      `ExcpEnum_defaultEncoding_ISI : _zz_287__string = "ISI     ";
      `ExcpEnum_defaultEncoding_ISI_PROT : _zz_287__string = "ISI_PROT";
      `ExcpEnum_defaultEncoding_ISS : _zz_287__string = "ISS     ";
      `ExcpEnum_defaultEncoding_ALG : _zz_287__string = "ALG     ";
      `ExcpEnum_defaultEncoding_PGM_ILL : _zz_287__string = "PGM_ILL ";
      `ExcpEnum_defaultEncoding_PGM_PRV : _zz_287__string = "PGM_PRV ";
      `ExcpEnum_defaultEncoding_FP : _zz_287__string = "FP      ";
      `ExcpEnum_defaultEncoding_VEC : _zz_287__string = "VEC     ";
      `ExcpEnum_defaultEncoding_VSX : _zz_287__string = "VSX     ";
      `ExcpEnum_defaultEncoding_FAC : _zz_287__string = "FAC     ";
      `ExcpEnum_defaultEncoding_SR : _zz_287__string = "SR      ";
      `ExcpEnum_defaultEncoding_MC : _zz_287__string = "MC      ";
      `ExcpEnum_defaultEncoding_EXT : _zz_287__string = "EXT     ";
      `ExcpEnum_defaultEncoding_DEC : _zz_287__string = "DEC     ";
      `ExcpEnum_defaultEncoding_TR : _zz_287__string = "TR      ";
      `ExcpEnum_defaultEncoding_PM : _zz_287__string = "PM      ";
      default : _zz_287__string = "????????";
    endcase
  end
  always @(*) begin
    case(_zz_290_)
      `ExcpEnum_defaultEncoding_NONE : _zz_290__string = "NONE    ";
      `ExcpEnum_defaultEncoding_SC : _zz_290__string = "SC      ";
      `ExcpEnum_defaultEncoding_SCV : _zz_290__string = "SCV     ";
      `ExcpEnum_defaultEncoding_TRAP : _zz_290__string = "TRAP    ";
      `ExcpEnum_defaultEncoding_RFI : _zz_290__string = "RFI     ";
      `ExcpEnum_defaultEncoding_RFSCV : _zz_290__string = "RFSCV   ";
      `ExcpEnum_defaultEncoding_DSI : _zz_290__string = "DSI     ";
      `ExcpEnum_defaultEncoding_DSI_PROT : _zz_290__string = "DSI_PROT";
      `ExcpEnum_defaultEncoding_DSS : _zz_290__string = "DSS     ";
      `ExcpEnum_defaultEncoding_ISI : _zz_290__string = "ISI     ";
      `ExcpEnum_defaultEncoding_ISI_PROT : _zz_290__string = "ISI_PROT";
      `ExcpEnum_defaultEncoding_ISS : _zz_290__string = "ISS     ";
      `ExcpEnum_defaultEncoding_ALG : _zz_290__string = "ALG     ";
      `ExcpEnum_defaultEncoding_PGM_ILL : _zz_290__string = "PGM_ILL ";
      `ExcpEnum_defaultEncoding_PGM_PRV : _zz_290__string = "PGM_PRV ";
      `ExcpEnum_defaultEncoding_FP : _zz_290__string = "FP      ";
      `ExcpEnum_defaultEncoding_VEC : _zz_290__string = "VEC     ";
      `ExcpEnum_defaultEncoding_VSX : _zz_290__string = "VSX     ";
      `ExcpEnum_defaultEncoding_FAC : _zz_290__string = "FAC     ";
      `ExcpEnum_defaultEncoding_SR : _zz_290__string = "SR      ";
      `ExcpEnum_defaultEncoding_MC : _zz_290__string = "MC      ";
      `ExcpEnum_defaultEncoding_EXT : _zz_290__string = "EXT     ";
      `ExcpEnum_defaultEncoding_DEC : _zz_290__string = "DEC     ";
      `ExcpEnum_defaultEncoding_TR : _zz_290__string = "TR      ";
      `ExcpEnum_defaultEncoding_PM : _zz_290__string = "PM      ";
      default : _zz_290__string = "????????";
    endcase
  end
  always @(*) begin
    case(SPRPlugin_intType)
      `ExcpEnum_defaultEncoding_NONE : SPRPlugin_intType_string = "NONE    ";
      `ExcpEnum_defaultEncoding_SC : SPRPlugin_intType_string = "SC      ";
      `ExcpEnum_defaultEncoding_SCV : SPRPlugin_intType_string = "SCV     ";
      `ExcpEnum_defaultEncoding_TRAP : SPRPlugin_intType_string = "TRAP    ";
      `ExcpEnum_defaultEncoding_RFI : SPRPlugin_intType_string = "RFI     ";
      `ExcpEnum_defaultEncoding_RFSCV : SPRPlugin_intType_string = "RFSCV   ";
      `ExcpEnum_defaultEncoding_DSI : SPRPlugin_intType_string = "DSI     ";
      `ExcpEnum_defaultEncoding_DSI_PROT : SPRPlugin_intType_string = "DSI_PROT";
      `ExcpEnum_defaultEncoding_DSS : SPRPlugin_intType_string = "DSS     ";
      `ExcpEnum_defaultEncoding_ISI : SPRPlugin_intType_string = "ISI     ";
      `ExcpEnum_defaultEncoding_ISI_PROT : SPRPlugin_intType_string = "ISI_PROT";
      `ExcpEnum_defaultEncoding_ISS : SPRPlugin_intType_string = "ISS     ";
      `ExcpEnum_defaultEncoding_ALG : SPRPlugin_intType_string = "ALG     ";
      `ExcpEnum_defaultEncoding_PGM_ILL : SPRPlugin_intType_string = "PGM_ILL ";
      `ExcpEnum_defaultEncoding_PGM_PRV : SPRPlugin_intType_string = "PGM_PRV ";
      `ExcpEnum_defaultEncoding_FP : SPRPlugin_intType_string = "FP      ";
      `ExcpEnum_defaultEncoding_VEC : SPRPlugin_intType_string = "VEC     ";
      `ExcpEnum_defaultEncoding_VSX : SPRPlugin_intType_string = "VSX     ";
      `ExcpEnum_defaultEncoding_FAC : SPRPlugin_intType_string = "FAC     ";
      `ExcpEnum_defaultEncoding_SR : SPRPlugin_intType_string = "SR      ";
      `ExcpEnum_defaultEncoding_MC : SPRPlugin_intType_string = "MC      ";
      `ExcpEnum_defaultEncoding_EXT : SPRPlugin_intType_string = "EXT     ";
      `ExcpEnum_defaultEncoding_DEC : SPRPlugin_intType_string = "DEC     ";
      `ExcpEnum_defaultEncoding_TR : SPRPlugin_intType_string = "TR      ";
      `ExcpEnum_defaultEncoding_PM : SPRPlugin_intType_string = "PM      ";
      default : SPRPlugin_intType_string = "????????";
    endcase
  end
  always @(*) begin
    case(execute_SPRPLUGIN_opExcp_codePPC)
      `ExcpEnum_defaultEncoding_NONE : execute_SPRPLUGIN_opExcp_codePPC_string = "NONE    ";
      `ExcpEnum_defaultEncoding_SC : execute_SPRPLUGIN_opExcp_codePPC_string = "SC      ";
      `ExcpEnum_defaultEncoding_SCV : execute_SPRPLUGIN_opExcp_codePPC_string = "SCV     ";
      `ExcpEnum_defaultEncoding_TRAP : execute_SPRPLUGIN_opExcp_codePPC_string = "TRAP    ";
      `ExcpEnum_defaultEncoding_RFI : execute_SPRPLUGIN_opExcp_codePPC_string = "RFI     ";
      `ExcpEnum_defaultEncoding_RFSCV : execute_SPRPLUGIN_opExcp_codePPC_string = "RFSCV   ";
      `ExcpEnum_defaultEncoding_DSI : execute_SPRPLUGIN_opExcp_codePPC_string = "DSI     ";
      `ExcpEnum_defaultEncoding_DSI_PROT : execute_SPRPLUGIN_opExcp_codePPC_string = "DSI_PROT";
      `ExcpEnum_defaultEncoding_DSS : execute_SPRPLUGIN_opExcp_codePPC_string = "DSS     ";
      `ExcpEnum_defaultEncoding_ISI : execute_SPRPLUGIN_opExcp_codePPC_string = "ISI     ";
      `ExcpEnum_defaultEncoding_ISI_PROT : execute_SPRPLUGIN_opExcp_codePPC_string = "ISI_PROT";
      `ExcpEnum_defaultEncoding_ISS : execute_SPRPLUGIN_opExcp_codePPC_string = "ISS     ";
      `ExcpEnum_defaultEncoding_ALG : execute_SPRPLUGIN_opExcp_codePPC_string = "ALG     ";
      `ExcpEnum_defaultEncoding_PGM_ILL : execute_SPRPLUGIN_opExcp_codePPC_string = "PGM_ILL ";
      `ExcpEnum_defaultEncoding_PGM_PRV : execute_SPRPLUGIN_opExcp_codePPC_string = "PGM_PRV ";
      `ExcpEnum_defaultEncoding_FP : execute_SPRPLUGIN_opExcp_codePPC_string = "FP      ";
      `ExcpEnum_defaultEncoding_VEC : execute_SPRPLUGIN_opExcp_codePPC_string = "VEC     ";
      `ExcpEnum_defaultEncoding_VSX : execute_SPRPLUGIN_opExcp_codePPC_string = "VSX     ";
      `ExcpEnum_defaultEncoding_FAC : execute_SPRPLUGIN_opExcp_codePPC_string = "FAC     ";
      `ExcpEnum_defaultEncoding_SR : execute_SPRPLUGIN_opExcp_codePPC_string = "SR      ";
      `ExcpEnum_defaultEncoding_MC : execute_SPRPLUGIN_opExcp_codePPC_string = "MC      ";
      `ExcpEnum_defaultEncoding_EXT : execute_SPRPLUGIN_opExcp_codePPC_string = "EXT     ";
      `ExcpEnum_defaultEncoding_DEC : execute_SPRPLUGIN_opExcp_codePPC_string = "DEC     ";
      `ExcpEnum_defaultEncoding_TR : execute_SPRPLUGIN_opExcp_codePPC_string = "TR      ";
      `ExcpEnum_defaultEncoding_PM : execute_SPRPLUGIN_opExcp_codePPC_string = "PM      ";
      default : execute_SPRPLUGIN_opExcp_codePPC_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_42)
      `AluRimiCtrlEnum_defaultEncoding_ROT : decode_to_execute_DECODER_stageables_42_string = "ROT    ";
      `AluRimiCtrlEnum_defaultEncoding_INS : decode_to_execute_DECODER_stageables_42_string = "INS    ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTL : decode_to_execute_DECODER_stageables_42_string = "SHIFTL ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTR : decode_to_execute_DECODER_stageables_42_string = "SHIFTR ";
      `AluRimiCtrlEnum_defaultEncoding_SHIFTRA : decode_to_execute_DECODER_stageables_42_string = "SHIFTRA";
      default : decode_to_execute_DECODER_stageables_42_string = "???????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_25)
      `BranchCtrlEnum_defaultEncoding_NONE : decode_to_execute_DECODER_stageables_25_string = "NONE ";
      `BranchCtrlEnum_defaultEncoding_BU : decode_to_execute_DECODER_stageables_25_string = "BU   ";
      `BranchCtrlEnum_defaultEncoding_BC : decode_to_execute_DECODER_stageables_25_string = "BC   ";
      `BranchCtrlEnum_defaultEncoding_BCLR : decode_to_execute_DECODER_stageables_25_string = "BCLR ";
      `BranchCtrlEnum_defaultEncoding_BCCTR : decode_to_execute_DECODER_stageables_25_string = "BCCTR";
      `BranchCtrlEnum_defaultEncoding_BCTAR : decode_to_execute_DECODER_stageables_25_string = "BCTAR";
      default : decode_to_execute_DECODER_stageables_25_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_18)
      `CRLogCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_DECODER_stageables_18_string = "AND_1 ";
      `CRLogCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_DECODER_stageables_18_string = "OR_1  ";
      `CRLogCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_DECODER_stageables_18_string = "XOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_NAND_1 : decode_to_execute_DECODER_stageables_18_string = "NAND_1";
      `CRLogCtrlEnum_defaultEncoding_NOR_1 : decode_to_execute_DECODER_stageables_18_string = "NOR_1 ";
      `CRLogCtrlEnum_defaultEncoding_EQV : decode_to_execute_DECODER_stageables_18_string = "EQV   ";
      `CRLogCtrlEnum_defaultEncoding_ANDC : decode_to_execute_DECODER_stageables_18_string = "ANDC  ";
      `CRLogCtrlEnum_defaultEncoding_ORC : decode_to_execute_DECODER_stageables_18_string = "ORC   ";
      default : decode_to_execute_DECODER_stageables_18_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_12)
      `Src2CtrlEnum_defaultEncoding_RB : decode_to_execute_DECODER_stageables_12_string = "RB      ";
      `Src2CtrlEnum_defaultEncoding_RB_0 : decode_to_execute_DECODER_stageables_12_string = "RB_0    ";
      `Src2CtrlEnum_defaultEncoding_RB_M1 : decode_to_execute_DECODER_stageables_12_string = "RB_M1   ";
      `Src2CtrlEnum_defaultEncoding_RB_UI : decode_to_execute_DECODER_stageables_12_string = "RB_UI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SI : decode_to_execute_DECODER_stageables_12_string = "RB_SI   ";
      `Src2CtrlEnum_defaultEncoding_RB_SH : decode_to_execute_DECODER_stageables_12_string = "RB_SH   ";
      `Src2CtrlEnum_defaultEncoding_RB_PCISD : decode_to_execute_DECODER_stageables_12_string = "RB_PCISD";
      `Src2CtrlEnum_defaultEncoding_RA : decode_to_execute_DECODER_stageables_12_string = "RA      ";
      default : decode_to_execute_DECODER_stageables_12_string = "????????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_52)
      `AluBitwiseCtrlEnum_defaultEncoding_AND_1 : decode_to_execute_DECODER_stageables_52_string = "AND_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_ANDC : decode_to_execute_DECODER_stageables_52_string = "ANDC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_OR_1 : decode_to_execute_DECODER_stageables_52_string = "OR_1  ";
      `AluBitwiseCtrlEnum_defaultEncoding_ORC : decode_to_execute_DECODER_stageables_52_string = "ORC   ";
      `AluBitwiseCtrlEnum_defaultEncoding_XOR_1 : decode_to_execute_DECODER_stageables_52_string = "XOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_XORC : decode_to_execute_DECODER_stageables_52_string = "XORC  ";
      `AluBitwiseCtrlEnum_defaultEncoding_EQV : decode_to_execute_DECODER_stageables_52_string = "EQV   ";
      `AluBitwiseCtrlEnum_defaultEncoding_NAND_1 : decode_to_execute_DECODER_stageables_52_string = "NAND_1";
      `AluBitwiseCtrlEnum_defaultEncoding_NOR_1 : decode_to_execute_DECODER_stageables_52_string = "NOR_1 ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSB : decode_to_execute_DECODER_stageables_52_string = "EXTSB ";
      `AluBitwiseCtrlEnum_defaultEncoding_EXTSH : decode_to_execute_DECODER_stageables_52_string = "EXTSH ";
      default : decode_to_execute_DECODER_stageables_52_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_39)
      `AluCtrlEnum_defaultEncoding_ADD : decode_to_execute_DECODER_stageables_39_string = "ADD  ";
      `AluCtrlEnum_defaultEncoding_BIT_1 : decode_to_execute_DECODER_stageables_39_string = "BIT_1";
      `AluCtrlEnum_defaultEncoding_RIMI : decode_to_execute_DECODER_stageables_39_string = "RIMI ";
      `AluCtrlEnum_defaultEncoding_SPEC : decode_to_execute_DECODER_stageables_39_string = "SPEC ";
      default : decode_to_execute_DECODER_stageables_39_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_14)
      `EnvCtrlEnum_defaultEncoding_NONE : decode_to_execute_DECODER_stageables_14_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : decode_to_execute_DECODER_stageables_14_string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : decode_to_execute_DECODER_stageables_14_string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : decode_to_execute_DECODER_stageables_14_string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : decode_to_execute_DECODER_stageables_14_string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : decode_to_execute_DECODER_stageables_14_string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : decode_to_execute_DECODER_stageables_14_string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : decode_to_execute_DECODER_stageables_14_string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : decode_to_execute_DECODER_stageables_14_string = "TWI  ";
      default : decode_to_execute_DECODER_stageables_14_string = "?????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_DECODER_stageables_14)
      `EnvCtrlEnum_defaultEncoding_NONE : execute_to_memory_DECODER_stageables_14_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : execute_to_memory_DECODER_stageables_14_string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : execute_to_memory_DECODER_stageables_14_string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : execute_to_memory_DECODER_stageables_14_string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : execute_to_memory_DECODER_stageables_14_string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : execute_to_memory_DECODER_stageables_14_string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : execute_to_memory_DECODER_stageables_14_string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : execute_to_memory_DECODER_stageables_14_string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : execute_to_memory_DECODER_stageables_14_string = "TWI  ";
      default : execute_to_memory_DECODER_stageables_14_string = "?????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_DECODER_stageables_14)
      `EnvCtrlEnum_defaultEncoding_NONE : memory_to_writeBack_DECODER_stageables_14_string = "NONE ";
      `EnvCtrlEnum_defaultEncoding_MFMSR : memory_to_writeBack_DECODER_stageables_14_string = "MFMSR";
      `EnvCtrlEnum_defaultEncoding_MTMSR : memory_to_writeBack_DECODER_stageables_14_string = "MTMSR";
      `EnvCtrlEnum_defaultEncoding_SC : memory_to_writeBack_DECODER_stageables_14_string = "SC   ";
      `EnvCtrlEnum_defaultEncoding_SCV : memory_to_writeBack_DECODER_stageables_14_string = "SCV  ";
      `EnvCtrlEnum_defaultEncoding_RFI : memory_to_writeBack_DECODER_stageables_14_string = "RFI  ";
      `EnvCtrlEnum_defaultEncoding_RFSCV : memory_to_writeBack_DECODER_stageables_14_string = "RFSCV";
      `EnvCtrlEnum_defaultEncoding_TW : memory_to_writeBack_DECODER_stageables_14_string = "TW   ";
      `EnvCtrlEnum_defaultEncoding_TWI : memory_to_writeBack_DECODER_stageables_14_string = "TWI  ";
      default : memory_to_writeBack_DECODER_stageables_14_string = "?????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_1)
      `AluSpecCtrlEnum_defaultEncoding_CNTLZW : decode_to_execute_DECODER_stageables_1_string = "CNTLZW ";
      `AluSpecCtrlEnum_defaultEncoding_CNTTZW : decode_to_execute_DECODER_stageables_1_string = "CNTTZW ";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTB : decode_to_execute_DECODER_stageables_1_string = "POPCNTB";
      `AluSpecCtrlEnum_defaultEncoding_POPCNTW : decode_to_execute_DECODER_stageables_1_string = "POPCNTW";
      `AluSpecCtrlEnum_defaultEncoding_CMPB : decode_to_execute_DECODER_stageables_1_string = "CMPB   ";
      `AluSpecCtrlEnum_defaultEncoding_PRTYW : decode_to_execute_DECODER_stageables_1_string = "PRTYW  ";
      default : decode_to_execute_DECODER_stageables_1_string = "???????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_40)
      `AluRimiAmtEnum_defaultEncoding_IMM : decode_to_execute_DECODER_stageables_40_string = "IMM";
      `AluRimiAmtEnum_defaultEncoding_RB : decode_to_execute_DECODER_stageables_40_string = "RB ";
      default : decode_to_execute_DECODER_stageables_40_string = "???";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_MSR_ENDIAN)
      `EndianEnum_defaultEncoding_BE : decode_to_execute_MSR_ENDIAN_string = "BE";
      `EndianEnum_defaultEncoding_LE : decode_to_execute_MSR_ENDIAN_string = "LE";
      default : decode_to_execute_MSR_ENDIAN_string = "??";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_MSR_ENDIAN)
      `EndianEnum_defaultEncoding_BE : execute_to_memory_MSR_ENDIAN_string = "BE";
      `EndianEnum_defaultEncoding_LE : execute_to_memory_MSR_ENDIAN_string = "LE";
      default : execute_to_memory_MSR_ENDIAN_string = "??";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_MSR_ENDIAN)
      `EndianEnum_defaultEncoding_BE : memory_to_writeBack_MSR_ENDIAN_string = "BE";
      `EndianEnum_defaultEncoding_LE : memory_to_writeBack_MSR_ENDIAN_string = "LE";
      default : memory_to_writeBack_MSR_ENDIAN_string = "??";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_32)
      `DataSizeEnum_defaultEncoding_B : decode_to_execute_DECODER_stageables_32_string = "B ";
      `DataSizeEnum_defaultEncoding_H : decode_to_execute_DECODER_stageables_32_string = "H ";
      `DataSizeEnum_defaultEncoding_HA : decode_to_execute_DECODER_stageables_32_string = "HA";
      `DataSizeEnum_defaultEncoding_W : decode_to_execute_DECODER_stageables_32_string = "W ";
      default : decode_to_execute_DECODER_stageables_32_string = "??";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_DECODER_stageables_32)
      `DataSizeEnum_defaultEncoding_B : execute_to_memory_DECODER_stageables_32_string = "B ";
      `DataSizeEnum_defaultEncoding_H : execute_to_memory_DECODER_stageables_32_string = "H ";
      `DataSizeEnum_defaultEncoding_HA : execute_to_memory_DECODER_stageables_32_string = "HA";
      `DataSizeEnum_defaultEncoding_W : execute_to_memory_DECODER_stageables_32_string = "W ";
      default : execute_to_memory_DECODER_stageables_32_string = "??";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_DECODER_stageables_32)
      `DataSizeEnum_defaultEncoding_B : memory_to_writeBack_DECODER_stageables_32_string = "B ";
      `DataSizeEnum_defaultEncoding_H : memory_to_writeBack_DECODER_stageables_32_string = "H ";
      `DataSizeEnum_defaultEncoding_HA : memory_to_writeBack_DECODER_stageables_32_string = "HA";
      `DataSizeEnum_defaultEncoding_W : memory_to_writeBack_DECODER_stageables_32_string = "W ";
      default : memory_to_writeBack_DECODER_stageables_32_string = "??";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_49)
      `CRMoveCtrlEnum_defaultEncoding_MCRF : decode_to_execute_DECODER_stageables_49_string = "MCRF  ";
      `CRMoveCtrlEnum_defaultEncoding_MCRXRX : decode_to_execute_DECODER_stageables_49_string = "MCRXRX";
      `CRMoveCtrlEnum_defaultEncoding_MTCRF : decode_to_execute_DECODER_stageables_49_string = "MTCRF ";
      default : decode_to_execute_DECODER_stageables_49_string = "??????";
    endcase
  end
  always @(*) begin
    case(execute_to_memory_CR_WRITE_op)
      `CRBusCmdEnum_defaultEncoding_NOP : execute_to_memory_CR_WRITE_op_string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : execute_to_memory_CR_WRITE_op_string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : execute_to_memory_CR_WRITE_op_string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : execute_to_memory_CR_WRITE_op_string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : execute_to_memory_CR_WRITE_op_string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : execute_to_memory_CR_WRITE_op_string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : execute_to_memory_CR_WRITE_op_string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : execute_to_memory_CR_WRITE_op_string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : execute_to_memory_CR_WRITE_op_string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : execute_to_memory_CR_WRITE_op_string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : execute_to_memory_CR_WRITE_op_string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : execute_to_memory_CR_WRITE_op_string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : execute_to_memory_CR_WRITE_op_string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : execute_to_memory_CR_WRITE_op_string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : execute_to_memory_CR_WRITE_op_string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : execute_to_memory_CR_WRITE_op_string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : execute_to_memory_CR_WRITE_op_string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : execute_to_memory_CR_WRITE_op_string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : execute_to_memory_CR_WRITE_op_string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : execute_to_memory_CR_WRITE_op_string = "DECLNK";
      default : execute_to_memory_CR_WRITE_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(memory_to_writeBack_CR_WRITE_op)
      `CRBusCmdEnum_defaultEncoding_NOP : memory_to_writeBack_CR_WRITE_op_string = "NOP   ";
      `CRBusCmdEnum_defaultEncoding_CR0 : memory_to_writeBack_CR_WRITE_op_string = "CR0   ";
      `CRBusCmdEnum_defaultEncoding_CR1 : memory_to_writeBack_CR_WRITE_op_string = "CR1   ";
      `CRBusCmdEnum_defaultEncoding_CR6 : memory_to_writeBack_CR_WRITE_op_string = "CR6   ";
      `CRBusCmdEnum_defaultEncoding_CMP : memory_to_writeBack_CR_WRITE_op_string = "CMP   ";
      `CRBusCmdEnum_defaultEncoding_AND_1 : memory_to_writeBack_CR_WRITE_op_string = "AND_1 ";
      `CRBusCmdEnum_defaultEncoding_OR_1 : memory_to_writeBack_CR_WRITE_op_string = "OR_1  ";
      `CRBusCmdEnum_defaultEncoding_XOR_1 : memory_to_writeBack_CR_WRITE_op_string = "XOR_1 ";
      `CRBusCmdEnum_defaultEncoding_NAND_1 : memory_to_writeBack_CR_WRITE_op_string = "NAND_1";
      `CRBusCmdEnum_defaultEncoding_NOR_1 : memory_to_writeBack_CR_WRITE_op_string = "NOR_1 ";
      `CRBusCmdEnum_defaultEncoding_EQV : memory_to_writeBack_CR_WRITE_op_string = "EQV   ";
      `CRBusCmdEnum_defaultEncoding_ANDC : memory_to_writeBack_CR_WRITE_op_string = "ANDC  ";
      `CRBusCmdEnum_defaultEncoding_ORC : memory_to_writeBack_CR_WRITE_op_string = "ORC   ";
      `CRBusCmdEnum_defaultEncoding_MCRF : memory_to_writeBack_CR_WRITE_op_string = "MCRF  ";
      `CRBusCmdEnum_defaultEncoding_MCRXRX : memory_to_writeBack_CR_WRITE_op_string = "MCRXRX";
      `CRBusCmdEnum_defaultEncoding_MTOCRF : memory_to_writeBack_CR_WRITE_op_string = "MTOCRF";
      `CRBusCmdEnum_defaultEncoding_MTCRF : memory_to_writeBack_CR_WRITE_op_string = "MTCRF ";
      `CRBusCmdEnum_defaultEncoding_DEC : memory_to_writeBack_CR_WRITE_op_string = "DEC   ";
      `CRBusCmdEnum_defaultEncoding_LNK : memory_to_writeBack_CR_WRITE_op_string = "LNK   ";
      `CRBusCmdEnum_defaultEncoding_DECLNK : memory_to_writeBack_CR_WRITE_op_string = "DECLNK";
      default : memory_to_writeBack_CR_WRITE_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_8)
      `Src3CtrlEnum_defaultEncoding_CA : decode_to_execute_DECODER_stageables_8_string = "CA  ";
      `Src3CtrlEnum_defaultEncoding_CA_0 : decode_to_execute_DECODER_stageables_8_string = "CA_0";
      `Src3CtrlEnum_defaultEncoding_CA_1 : decode_to_execute_DECODER_stageables_8_string = "CA_1";
      default : decode_to_execute_DECODER_stageables_8_string = "????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_27)
      `Src1CtrlEnum_defaultEncoding_RA : decode_to_execute_DECODER_stageables_27_string = "RA    ";
      `Src1CtrlEnum_defaultEncoding_RA_N : decode_to_execute_DECODER_stageables_27_string = "RA_N  ";
      `Src1CtrlEnum_defaultEncoding_RA_NIA : decode_to_execute_DECODER_stageables_27_string = "RA_NIA";
      `Src1CtrlEnum_defaultEncoding_RA_0 : decode_to_execute_DECODER_stageables_27_string = "RA_0  ";
      `Src1CtrlEnum_defaultEncoding_RS : decode_to_execute_DECODER_stageables_27_string = "RS    ";
      default : decode_to_execute_DECODER_stageables_27_string = "??????";
    endcase
  end
  always @(*) begin
    case(decode_to_execute_DECODER_stageables_26)
      `TgtCtrlEnum_defaultEncoding_RT : decode_to_execute_DECODER_stageables_26_string = "RT";
      `TgtCtrlEnum_defaultEncoding_RA : decode_to_execute_DECODER_stageables_26_string = "RA";
      default : decode_to_execute_DECODER_stageables_26_string = "??";
    endcase
  end
  `endif

  assign writeBack_REGFILE_WRITE_ADDR = memory_to_writeBack_REGFILE_WRITE_ADDR;
  assign memory_REGFILE_WRITE_ADDR = execute_to_memory_REGFILE_WRITE_ADDR;
  assign execute_REGFILE_WRITE_ADDR = _zz_227_;
  assign decode_DECODER_stageables_30 = _zz_438_[0];
  assign _zz_1_ = _zz_2_;
  assign decode_DECODER_stageables_43 = _zz_439_[0];
  assign execute_TARGET_MISSMATCH2 = (decode_PC != execute_BRANCH_CALC);
  assign memory_SRC1 = execute_to_memory_SRC1;
  assign execute_DECODER_stageables_35 = decode_to_execute_DECODER_stageables_35;
  assign decode_DECODER_stageables_35 = _zz_440_[0];
  assign decode_DECODER_stageables_29 = _zz_441_[0];
  assign decode_DECODER_stageables_27 = _zz_3_;
  assign _zz_4_ = _zz_5_;
  assign decode_DECODER_stageables_8 = _zz_6_;
  assign _zz_7_ = _zz_8_;
  assign _zz_9_ = _zz_10_;
  assign execute_CR_WRITE_op = _zz_11_;
  assign execute_CR_WRITE_ba = execute_IntAluPluginComp_crBus_ba;
  assign execute_CR_WRITE_bb = execute_IntAluPluginComp_crBus_bb;
  assign execute_CR_WRITE_bt = execute_IntAluPluginComp_crBus_bt;
  assign execute_CR_WRITE_imm = execute_IntAluPluginComp_crBus_imm;
  assign execute_CR_WRITE_fxm = execute_IntAluPluginComp_crBus_fxm;
  assign _zz_12_ = _zz_13_;
  assign decode_DECODER_stageables_16 = _zz_442_[0];
  assign memory_DECODER_stageables_37 = execute_to_memory_DECODER_stageables_37;
  assign execute_DECODER_stageables_37 = decode_to_execute_DECODER_stageables_37;
  assign decode_DECODER_stageables_37 = _zz_443_[0];
  assign decode_DECODER_stageables_22 = _zz_444_[0];
  assign execute_REGFILE_WRITE_DATA = _zz_107_;
  assign decode_DECODER_stageables_0 = _zz_445_[0];
  assign decode_DECODER_stageables_54 = _zz_446_[0];
  assign memory_DECODER_stageables_7 = execute_to_memory_DECODER_stageables_7;
  assign execute_DECODER_stageables_7 = decode_to_execute_DECODER_stageables_7;
  assign decode_DECODER_stageables_7 = _zz_447_[0];
  assign decode_RT_ADDR = _zz_217_;
  assign decode_DECODER_stageables_49 = _zz_14_;
  assign _zz_15_ = _zz_16_;
  assign decode_DECODER_stageables_50 = _zz_448_[0];
  assign memory_DECODER_stageables_32 = _zz_17_;
  assign _zz_18_ = _zz_19_;
  assign _zz_20_ = _zz_21_;
  assign decode_DECODER_stageables_32 = _zz_22_;
  assign _zz_23_ = _zz_24_;
  assign memory_MSR_ENDIAN = _zz_25_;
  assign _zz_26_ = _zz_27_;
  assign _zz_28_ = _zz_29_;
  assign _zz_30_ = _zz_31_;
  assign memory_SRC_ADD = execute_to_memory_SRC_ADD;
  assign decode_DECODER_stageables_48 = _zz_449_[0];
  assign execute_CR_FIELD_WR = _zz_77_;
  assign execute_BRANCH_DO = _zz_284_;
  assign execute_XER_SO = execute_IntAluPluginComp_XER[31];
  assign decode_DECODER_stageables_9 = _zz_450_[0];
  assign decode_DECODER_stageables_51 = _zz_451_[0];
  assign memory_MUL_HH = execute_to_memory_MUL_HH;
  assign execute_MUL_HH = MUL_HH_result;
  assign decode_DECODER_stageables_13 = _zz_452_[0];
  assign decode_DECODER_stageables_3 = _zz_453_[0];
  assign decode_CR_FIELD_RD = _zz_66_;
  assign execute_MUL_LL = MUL_LL_result;
  assign execute_DECODER_stageables_53 = decode_to_execute_DECODER_stageables_53;
  assign decode_DECODER_stageables_53 = _zz_454_[0];
  assign decode_DECODER_stageables_33 = _zz_455_[0];
  assign execute_DECODER_stageables_34 = decode_to_execute_DECODER_stageables_34;
  assign decode_DECODER_stageables_34 = _zz_456_[0];
  assign memory_MUL_LOW = MUL_ADD1_result;
  assign decode_DECODER_stageables_5 = _zz_457_[0];
  assign execute_MUL_LH = MUL_LH_result;
  assign execute_RA = decode_to_execute_RA;
  assign decode_DECODER_stageables_56 = _zz_458_[0];
  assign decode_DECODER_stageables_40 = _zz_32_;
  assign _zz_33_ = _zz_34_;
  assign decode_DECODER_stageables_21 = _zz_459_[0];
  assign execute_NEXT_PC2 = (execute_PC + 32'h00000004);
  assign writeBack_LOAD_UPDATE_ADDR = memory_to_writeBack_LOAD_UPDATE_ADDR;
  assign memory_LOAD_UPDATE_ADDR = execute_to_memory_LOAD_UPDATE_ADDR;
  assign execute_LOAD_UPDATE_ADDR = execute_R0_ADDR;
  assign decode_DECODER_stageables_6 = _zz_460_[0];
  assign memory_DECODER_stageables_47 = execute_to_memory_DECODER_stageables_47;
  assign execute_DECODER_stageables_47 = decode_to_execute_DECODER_stageables_47;
  assign decode_DECODER_stageables_47 = _zz_461_[0];
  assign execute_PREDICTION_CONTEXT_hazard = decode_to_execute_PREDICTION_CONTEXT_hazard;
  assign execute_PREDICTION_CONTEXT_hit = decode_to_execute_PREDICTION_CONTEXT_hit;
  assign execute_PREDICTION_CONTEXT_line_source = decode_to_execute_PREDICTION_CONTEXT_line_source;
  assign execute_PREDICTION_CONTEXT_line_branchWish = decode_to_execute_PREDICTION_CONTEXT_line_branchWish;
  assign execute_PREDICTION_CONTEXT_line_target = decode_to_execute_PREDICTION_CONTEXT_line_target;
  assign decode_PREDICTION_CONTEXT_hazard = IBusCachedPlugin_predictor_injectorContext_hazard;
  assign decode_PREDICTION_CONTEXT_hit = IBusCachedPlugin_predictor_injectorContext_hit;
  assign decode_PREDICTION_CONTEXT_line_source = IBusCachedPlugin_predictor_injectorContext_line_source;
  assign decode_PREDICTION_CONTEXT_line_branchWish = IBusCachedPlugin_predictor_injectorContext_line_branchWish;
  assign decode_PREDICTION_CONTEXT_line_target = IBusCachedPlugin_predictor_injectorContext_line_target;
  assign decode_DECODER_stageables_1 = _zz_35_;
  assign _zz_36_ = _zz_37_;
  assign decode_DECODER_stageables_36 = _zz_462_[0];
  assign decode_DECODER_stageables_17 = _zz_463_[0];
  assign execute_DECODER_stageables_55 = decode_to_execute_DECODER_stageables_55;
  assign decode_DECODER_stageables_55 = _zz_464_[0];
  assign memory_MEMORY_ADDRESS_LOW = execute_to_memory_MEMORY_ADDRESS_LOW;
  assign execute_MEMORY_ADDRESS_LOW = _zz_332_[1 : 0];
  assign execute_MUL_HL = MUL_HL_result;
  assign execute_DECODER_stageables_57 = decode_to_execute_DECODER_stageables_57;
  assign decode_DECODER_stageables_57 = _zz_465_[0];
  assign execute_XER_WRITE_validOV = execute_IntAluPluginComp_xerBus_validOV;
  assign execute_XER_WRITE_validCA = execute_IntAluPluginComp_xerBus_validCA;
  assign execute_XER_WRITE_imm = execute_IntAluPluginComp_xerBus_imm;
  assign memory_DECODER_stageables_14 = _zz_38_;
  assign _zz_39_ = _zz_40_;
  assign decode_DECODER_stageables_14 = _zz_41_;
  assign _zz_42_ = _zz_43_;
  assign memory_DECODER_stageables_15 = execute_to_memory_DECODER_stageables_15;
  assign execute_DECODER_stageables_15 = decode_to_execute_DECODER_stageables_15;
  assign decode_DECODER_stageables_15 = _zz_466_[0];
  assign memory_DECODER_stageables_31 = execute_to_memory_DECODER_stageables_31;
  assign decode_DECODER_stageables_31 = _zz_467_[0];
  assign decode_DECODER_stageables_39 = _zz_44_;
  assign _zz_45_ = _zz_46_;
  assign decode_DECODER_stageables_52 = _zz_47_;
  assign _zz_48_ = _zz_49_;
  assign writeBack_LOAD_UPDATE_DATA = memory_to_writeBack_LOAD_UPDATE_DATA;
  assign memory_LOAD_UPDATE_DATA = execute_to_memory_LOAD_UPDATE_DATA;
  assign execute_LOAD_UPDATE_DATA = execute_SRC_ADD;
  assign execute_BRANCH_LINK = _zz_286_;
  assign decode_DECODER_stageables_41 = _zz_468_[0];
  assign memory_DECODER_stageables_45 = execute_to_memory_DECODER_stageables_45;
  assign execute_DECODER_stageables_45 = decode_to_execute_DECODER_stageables_45;
  assign decode_DECODER_stageables_45 = _zz_469_[0];
  assign execute_XER_CA = (execute_IntAluPluginComp_XER[29] ? 1'b1 : 1'b0);
  assign execute_RB = decode_to_execute_RB;
  assign decode_DECODER_stageables_12 = _zz_50_;
  assign _zz_51_ = _zz_52_;
  assign decode_DECODER_stageables_18 = _zz_53_;
  assign _zz_54_ = _zz_55_;
  assign _zz_56_ = _zz_57_;
  assign writeBack_FORMAL_PC_NEXT = memory_to_writeBack_FORMAL_PC_NEXT;
  assign memory_FORMAL_PC_NEXT = execute_to_memory_FORMAL_PC_NEXT;
  assign execute_FORMAL_PC_NEXT = decode_to_execute_FORMAL_PC_NEXT;
  assign decode_FORMAL_PC_NEXT = (decode_PC + 32'h00000004);
  assign decode_DECODER_stageables_10 = _zz_470_[0];
  assign decode_DECODER_stageables_38 = _zz_471_[0];
  assign decode_DECODER_stageables_42 = _zz_58_;
  assign _zz_59_ = _zz_60_;
  assign writeBack_DECODER_stageables_14 = _zz_61_;
  assign writeBack_DECODER_stageables_47 = memory_to_writeBack_DECODER_stageables_47;
  assign execute_DECODER_stageables_9 = decode_to_execute_DECODER_stageables_9;
  assign execute_DECODER_stageables_28 = decode_to_execute_DECODER_stageables_28;
  always @ (*) begin
    _zz_62_ = _zz_63_;
    if(execute_arbitration_isValid)begin
      if(_zz_384_)begin
        if((! execute_SPRPLUGIN_trap))begin
          _zz_62_ = `EnvCtrlEnum_defaultEncoding_NONE;
        end
      end
      if((execute_DECODER_stageables_14 == `EnvCtrlEnum_defaultEncoding_TWI))begin
        if((! _zz_298_))begin
          _zz_62_ = `EnvCtrlEnum_defaultEncoding_NONE;
        end
      end
    end
  end

  assign execute_DECODER_stageables_14 = _zz_64_;
  assign writeBack_SRC_ADD = memory_to_writeBack_SRC_ADD;
  assign memory_NEXT_PC2 = execute_to_memory_NEXT_PC2;
  assign memory_PC = execute_to_memory_PC;
  assign memory_BRANCH_CALC = execute_to_memory_BRANCH_CALC;
  assign memory_TARGET_MISSMATCH2 = execute_to_memory_TARGET_MISSMATCH2;
  assign memory_BRANCH_DO = execute_to_memory_BRANCH_DO;
  assign execute_BRANCH_CALC = execute_BranchPlugin_branchAdder;
  assign execute_PC = decode_to_execute_PC;
  assign decode_DECODER_stageables_23 = _zz_472_[0];
  assign decode_DECODER_stageables_25 = _zz_67_;
  assign writeBack_CR_FIELD_WR = memory_to_writeBack_CR_FIELD_WR;
  assign execute_BRANCH_DEC = _zz_285_;
  assign execute_DECODER_stageables_17 = decode_to_execute_DECODER_stageables_17;
  assign memory_BRANCH_DEC = execute_to_memory_BRANCH_DEC;
  assign memory_BRANCH_LINK = execute_to_memory_BRANCH_LINK;
  assign memory_SPR_ID = execute_to_memory_SPR_ID;
  assign memory_DECODER_stageables_17 = execute_to_memory_DECODER_stageables_17;
  assign memory_XER_WRITE_validOV = execute_to_memory_XER_WRITE_validOV;
  assign memory_XER_WRITE_validCA = execute_to_memory_XER_WRITE_validCA;
  assign memory_XER_WRITE_imm = execute_to_memory_XER_WRITE_imm;
  assign memory_CR_WRITE_op = _zz_68_;
  assign memory_CR_WRITE_ba = execute_to_memory_CR_WRITE_ba;
  assign memory_CR_WRITE_bb = execute_to_memory_CR_WRITE_bb;
  assign memory_CR_WRITE_bt = execute_to_memory_CR_WRITE_bt;
  assign memory_CR_WRITE_imm = execute_to_memory_CR_WRITE_imm;
  assign memory_CR_WRITE_fxm = execute_to_memory_CR_WRITE_fxm;
  assign memory_DECODER_stageables_34 = execute_to_memory_DECODER_stageables_34;
  assign execute_DECODER_stageables_25 = _zz_69_;
  assign execute_CR_FIELD_RD = decode_to_execute_CR_FIELD_RD;
  assign memory_CR_FIELD_WR = execute_to_memory_CR_FIELD_WR;
  assign execute_DECODER_stageables_6 = decode_to_execute_DECODER_stageables_6;
  assign memory_DECODER_stageables_55 = execute_to_memory_DECODER_stageables_55;
  assign decode_DECODER_stageables_24 = _zz_473_[0];
  assign decode_DECODER_stageables_44 = _zz_474_[0];
  assign decode_DECODER_stageables_46 = _zz_475_[0];
  always @ (*) begin
    decode_RS = RegFilePluginComp_regFile_rd_dat_2;
    if((_zz_244_ != (4'b0000)))begin
      decode_RS = BYP_RS_result;
    end
  end

  always @ (*) begin
    decode_RB = RegFilePluginComp_regFile_rd_dat_1;
    if((_zz_243_ != (4'b0000)))begin
      decode_RB = BYP_RB_result;
    end
  end

  always @ (*) begin
    decode_RA = RegFilePluginComp_regFile_rd_dat_0;
    if((_zz_242_ != (4'b0000)))begin
      decode_RA = BYP_RA_result;
    end
  end

  always @ (*) begin
    _zz_70_ = execute_REGFILE_WRITE_DATA;
    if(execute_SPRPLUGIN_readInstruction)begin
      _zz_70_ = execute_SPRPLUGIN_readData;
    end
  end

  assign writeBack_DECODER_stageables_21 = memory_to_writeBack_DECODER_stageables_21;
  assign writeBack_RT_ADDR = memory_to_writeBack_RT_ADDR;
  assign memory_DECODER_stageables_21 = execute_to_memory_DECODER_stageables_21;
  assign memory_RT_ADDR = execute_to_memory_RT_ADDR;
  assign execute_DECODER_stageables_21 = decode_to_execute_DECODER_stageables_21;
  assign execute_RT_ADDR = decode_to_execute_RT_ADDR;
  assign decode_R2_ADDR = decode_INSTRUCTION[25 : 21];
  assign decode_R1_ADDR = decode_INSTRUCTION[15 : 11];
  assign decode_R0_ADDR = decode_INSTRUCTION[20 : 16];
  assign memory_SRC_CR = execute_to_memory_SRC_CR;
  assign memory_XER_SO = execute_to_memory_XER_SO;
  assign memory_INSTRUCTION = execute_to_memory_INSTRUCTION;
  assign memory_DECODER_stageables_35 = execute_to_memory_DECODER_stageables_35;
  always @ (*) begin
    _zz_71_ = memory_REGFILE_WRITE_DATA;
    if(_zz_385_)begin
      if(! _zz_386_) begin
        _zz_71_ = FX_DIV_result;
      end
    end
  end

  assign memory_DECODER_stageables_57 = execute_to_memory_DECODER_stageables_57;
  assign memory_DECODER_stageables_53 = execute_to_memory_DECODER_stageables_53;
  assign execute_DECODER_stageables_3 = decode_to_execute_DECODER_stageables_3;
  assign execute_DECODER_stageables_30 = decode_to_execute_DECODER_stageables_30;
  assign writeBack_DECODER_stageables_34 = memory_to_writeBack_DECODER_stageables_34;
  assign writeBack_DECODER_stageables_15 = memory_to_writeBack_DECODER_stageables_15;
  assign writeBack_SRC_CR = memory_to_writeBack_SRC_CR;
  assign writeBack_DECODER_stageables_7 = memory_to_writeBack_DECODER_stageables_7;
  assign writeBack_XER_SO = memory_to_writeBack_XER_SO;
  assign writeBack_DECODER_stageables_45 = memory_to_writeBack_DECODER_stageables_45;
  assign writeBack_MUL_HH = memory_to_writeBack_MUL_HH;
  assign writeBack_MUL_LOW = memory_to_writeBack_MUL_LOW;
  assign memory_MUL_HL = execute_to_memory_MUL_HL;
  assign memory_MUL_LH = execute_to_memory_MUL_LH;
  assign memory_MUL_LL = execute_to_memory_MUL_LL;
  assign execute_DECODER_stageables_33 = decode_to_execute_DECODER_stageables_33;
  assign memory_DECODER_stageables_48 = execute_to_memory_DECODER_stageables_48;
  assign execute_DECODER_stageables_48 = decode_to_execute_DECODER_stageables_48;
  assign writeBack_DECODER_stageables_48 = memory_to_writeBack_DECODER_stageables_48;
  assign execute_DECODER_stageables_38 = decode_to_execute_DECODER_stageables_38;
  assign execute_SRC3 = SRC_src3;
  assign execute_DECODER_stageables_8 = _zz_72_;
  assign execute_DECODER_stageables_12 = _zz_73_;
  assign execute_DECODER_stageables_27 = _zz_74_;
  assign _zz_75_ = execute_PC;
  assign _zz_76_ = execute_RA;
  assign decode_DECODER_stageables_2 = _zz_476_[0];
  assign execute_DECODER_stageables_18 = _zz_79_;
  assign execute_DECODER_stageables_49 = _zz_80_;
  assign execute_DECODER_stageables_50 = decode_to_execute_DECODER_stageables_50;
  assign execute_DECODER_stageables_51 = decode_to_execute_DECODER_stageables_51;
  assign execute_DECODER_stageables_29 = decode_to_execute_DECODER_stageables_29;
  assign execute_DECODER_stageables_54 = decode_to_execute_DECODER_stageables_54;
  assign execute_DECODER_stageables_56 = decode_to_execute_DECODER_stageables_56;
  assign execute_SRC_CR = (execute_DECODER_stageables_56 ? SRC_ADD_cmp_cr : FX_ALU_add_cr);
  assign execute_DECODER_stageables_36 = decode_to_execute_DECODER_stageables_36;
  assign execute_DECODER_stageables_43 = decode_to_execute_DECODER_stageables_43;
  assign execute_SRC_CAOV = {FX_ALU_ca,FX_ALU_ov};
  assign execute_DECODER_stageables_5 = decode_to_execute_DECODER_stageables_5;
  assign execute_DECODER_stageables_23 = decode_to_execute_DECODER_stageables_23;
  assign execute_R0_ADDR = decode_to_execute_R0_ADDR;
  assign execute_DECODER_stageables_26 = _zz_82_;
  assign execute_DECODER_stageables_0 = decode_to_execute_DECODER_stageables_0;
  assign execute_DECODER_stageables_13 = decode_to_execute_DECODER_stageables_13;
  assign execute_DECODER_stageables_41 = decode_to_execute_DECODER_stageables_41;
  assign execute_DECODER_stageables_40 = _zz_83_;
  assign execute_DECODER_stageables_1 = _zz_84_;
  assign execute_DECODER_stageables_42 = _zz_85_;
  assign execute_DECODER_stageables_52 = _zz_86_;
  assign execute_DECODER_stageables_39 = _zz_87_;
  assign execute_SRC2 = SRC2_result;
  assign execute_SRC1 = SRC1_result;
  assign execute_DECODER_stageables_10 = decode_to_execute_DECODER_stageables_10;
  assign execute_SPR_ID = _zz_81_;
  assign writeBack_SRC1 = memory_to_writeBack_SRC1;
  assign writeBack_DECODER_stageables_17 = memory_to_writeBack_DECODER_stageables_17;
  assign writeBack_SPR_ID = memory_to_writeBack_SPR_ID;
  assign writeBack_XER_WRITE_validOV = memory_to_writeBack_XER_WRITE_validOV;
  assign writeBack_XER_WRITE_validCA = memory_to_writeBack_XER_WRITE_validCA;
  assign writeBack_XER_WRITE_imm = memory_to_writeBack_XER_WRITE_imm;
  assign writeBack_BRANCH_LINK = memory_to_writeBack_BRANCH_LINK;
  assign writeBack_BRANCH_DEC = memory_to_writeBack_BRANCH_DEC;
  assign writeBack_CR_WRITE_op = _zz_88_;
  assign writeBack_CR_WRITE_ba = memory_to_writeBack_CR_WRITE_ba;
  assign writeBack_CR_WRITE_bb = memory_to_writeBack_CR_WRITE_bb;
  assign writeBack_CR_WRITE_bt = memory_to_writeBack_CR_WRITE_bt;
  assign writeBack_CR_WRITE_imm = memory_to_writeBack_CR_WRITE_imm;
  assign writeBack_CR_WRITE_fxm = memory_to_writeBack_CR_WRITE_fxm;
  assign lastStageRegFileWrite_payload_address = writeBack_REGFILE_WRITE_ADDR;
  assign _zz_89_ = writeBack_DECODER_stageables_21;
  assign decode_DECODER_stageables_26 = _zz_90_;
  assign decode_INSTRUCTION_ANTICIPATED = _zz_111_;
  assign decode = _zz_477_[0];
  assign decode_LEGAL_INSTRUCTION = ({_zz_179_,{((decode_INSTRUCTION & 32'h6c000000) == 32'h0c000000),{_zz_187_,{((decode_INSTRUCTION & 32'hb8000000) == 32'h28000000),{_zz_159_,{_zz_186_,{_zz_185_,{_zz_616_,_zz_617_}}}}}}}} != 101'h0);
  always @ (*) begin
    lastStageRegFileWrite_payload_data = writeBack_REGFILE_WRITE_DATA;
    if(((writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE) && (! writeBack_MEMORY_WR)))begin
      lastStageRegFileWrite_payload_data = writeBack_DBusCachedPlugin_rspFormated;
    end
    if(_zz_387_)begin
      lastStageRegFileWrite_payload_data = MUL3_result32;
    end
  end

  assign writeBack_SIGN_EXTEND = memory_to_writeBack_DECODER_stageables_37;
  assign writeBack_DATA_SIZE = _zz_105_;
  assign writeBack_MEMORY_ADDRESS_LOW = memory_to_writeBack_MEMORY_ADDRESS_LOW;
  assign writeBack_MEMORY_WR = memory_to_writeBack_DECODER_stageables_31;
  assign writeBack_MSR_ENDIAN = _zz_106_;
  assign writeBack_REGFILE_WRITE_DATA = memory_to_writeBack_REGFILE_WRITE_DATA;
  assign writeBack_MEMORY_ENABLE = memory_to_writeBack_DECODER_stageables_20;
  assign memory_REGFILE_WRITE_DATA = execute_to_memory_REGFILE_WRITE_DATA;
  assign memory_MEMORY_ENABLE = execute_to_memory_DECODER_stageables_20;
  assign execute_STORE_UPDATE = decode_to_execute_DECODER_stageables_22;
  assign execute_MEMORY_MANAGMENT = decode_to_execute_DECODER_stageables_16;
  assign execute_RS = decode_to_execute_RS;
  assign execute_MEMORY_WR = decode_to_execute_DECODER_stageables_31;
  assign execute_SRC_ADD = FX_ALU_result;
  assign execute_MEMORY_ENABLE = decode_to_execute_DECODER_stageables_20;
  assign execute_DATA_SIZE = _zz_108_;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign execute_MSR_ENDIAN = _zz_109_;
  assign decode_MEMORY_ENABLE = _zz_478_[0];
  assign decode_FLUSH_ALL = _zz_479_[0];
  always @ (*) begin
    _zz_110_ = _zz_110__3;
    if(_zz_388_)begin
      _zz_110_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_110__3 = _zz_110__2;
    if(_zz_389_)begin
      _zz_110__3 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_110__2 = _zz_110__1;
    if(_zz_390_)begin
      if(_zz_391_)begin
        _zz_110__2 = 1'b1;
      end
    end
  end

  always @ (*) begin
    _zz_110__1 = _zz_110__0;
    if(_zz_392_)begin
      _zz_110__1 = 1'b1;
    end
  end

  always @ (*) begin
    _zz_110__0 = IBusCachedPlugin_rsp_issueDetected;
    if(_zz_393_)begin
      _zz_110__0 = 1'b1;
    end
  end

  assign decode_INSTRUCTION = IBusCachedPlugin_iBusRsp_output_payload_rsp_inst;
  assign decode_MSR_ENDIAN = _zz_112_;
  assign memory_PREDICTION_CONTEXT_hazard = execute_to_memory_PREDICTION_CONTEXT_hazard;
  assign memory_PREDICTION_CONTEXT_hit = execute_to_memory_PREDICTION_CONTEXT_hit;
  assign memory_PREDICTION_CONTEXT_line_source = execute_to_memory_PREDICTION_CONTEXT_line_source;
  assign memory_PREDICTION_CONTEXT_line_branchWish = execute_to_memory_PREDICTION_CONTEXT_line_branchWish;
  assign memory_PREDICTION_CONTEXT_line_target = execute_to_memory_PREDICTION_CONTEXT_line_target;
  always @ (*) begin
    _zz_113_ = 1'b0;
    if(IBusCachedPlugin_predictor_historyWriteDelayPatched_valid)begin
      _zz_113_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_114_ = memory_FORMAL_PC_NEXT;
    if(BranchPlugin_jumpInterface_valid)begin
      _zz_114_ = BranchPlugin_jumpInterface_payload;
    end
  end

  assign decode_PC = IBusCachedPlugin_iBusRsp_output_payload_pc;
  assign writeBack_PC = memory_to_writeBack_PC;
  assign writeBack_INSTRUCTION = memory_to_writeBack_INSTRUCTION;
  always @ (*) begin
    decode_arbitration_haltItself = 1'b0;
    if(((DBusCachedPlugin_mmuBus_busy && decode_arbitration_isValid) && decode_MEMORY_ENABLE))begin
      decode_arbitration_haltItself = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_haltByOther = 1'b0;
    if(((((execute_arbitration_isValid && execute_DECODER_stageables_48) || (memory_arbitration_isValid && memory_DECODER_stageables_48)) || (writeBack_arbitration_isValid && writeBack_DECODER_stageables_48)) || _zz_231_))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if((decode_arbitration_isValid && ((_zz_239_ || _zz_240_) || _zz_241_)))begin
      decode_arbitration_haltByOther = 1'b1;
    end
    if(SPRPlugin_pipelineLiberator_active)begin
      decode_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    decode_arbitration_removeIt = 1'b0;
    if(_zz_394_)begin
      decode_arbitration_removeIt = _zz_291_;
    end
    if(decode_arbitration_isFlushed)begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  assign decode_arbitration_flushNext = 1'b0;
  always @ (*) begin
    execute_arbitration_haltItself = 1'b0;
    if((_zz_341_ && (! dataCache_1__io_cpu_flush_ready)))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if(((dataCache_1__io_cpu_redo && execute_arbitration_isValid) && execute_MEMORY_ENABLE))begin
      execute_arbitration_haltItself = 1'b1;
    end
    if((execute_SPRPLUGIN_readInstruction || execute_SPRPLUGIN_writeInstruction))begin
      if(execute_SPRPLUGIN_blockedBySideEffects)begin
        execute_arbitration_haltItself = 1'b1;
      end
    end
  end

  always @ (*) begin
    execute_arbitration_haltByOther = 1'b0;
    if((_zz_246_ || _zz_262_))begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if((_zz_248_ || _zz_264_))begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if((_zz_249_ || _zz_265_))begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if((_zz_247_ || _zz_263_))begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if((_zz_250_ || _zz_266_))begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if((_zz_251_ || _zz_267_))begin
      execute_arbitration_haltByOther = 1'b1;
    end
    if((_zz_252_ || _zz_268_))begin
      execute_arbitration_haltByOther = 1'b1;
    end
  end

  always @ (*) begin
    execute_arbitration_removeIt = 1'b0;
    if(SPRPlugin_selfException_valid)begin
      execute_arbitration_removeIt = _zz_292_;
    end
    if(execute_arbitration_isFlushed)begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushIt = 1'b0;
  assign execute_arbitration_flushNext = 1'b0;
  always @ (*) begin
    memory_arbitration_haltItself = 1'b0;
    if(_zz_385_)begin
      if(_zz_386_)begin
        memory_arbitration_haltItself = 1'b1;
      end
    end
  end

  assign memory_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    memory_arbitration_removeIt = 1'b0;
    if(BranchPlugin_branchExceptionPort_valid)begin
      memory_arbitration_removeIt = _zz_293_;
    end
    if(memory_arbitration_isFlushed)begin
      memory_arbitration_removeIt = 1'b1;
    end
  end

  assign memory_arbitration_flushIt = 1'b0;
  always @ (*) begin
    memory_arbitration_flushNext = 1'b0;
    if(BranchPlugin_jumpInterface_valid)begin
      memory_arbitration_flushNext = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_haltItself = 1'b0;
    if(dataCache_1__io_cpu_writeBack_haltIt)begin
      writeBack_arbitration_haltItself = 1'b1;
    end
  end

  assign writeBack_arbitration_haltByOther = 1'b0;
  always @ (*) begin
    writeBack_arbitration_removeIt = 1'b0;
    if(DBusCachedPlugin_exceptionBus_valid)begin
      writeBack_arbitration_removeIt = _zz_294_;
    end
    if(writeBack_arbitration_isFlushed)begin
      writeBack_arbitration_removeIt = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_flushIt = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid)begin
      writeBack_arbitration_flushIt = 1'b1;
    end
  end

  always @ (*) begin
    writeBack_arbitration_flushNext = 1'b0;
    if(DBusCachedPlugin_redoBranch_valid)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_395_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_396_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_397_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_398_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_399_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_400_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
    if(_zz_401_)begin
      writeBack_arbitration_flushNext = 1'b1;
    end
  end

  assign lastStageInstruction = writeBack_INSTRUCTION;
  assign lastStagePc = writeBack_PC;
  assign lastStageIsValid = writeBack_arbitration_isValid;
  assign lastStageIsFiring = writeBack_arbitration_isFiring;
  always @ (*) begin
    IBusCachedPlugin_fetcherHalt = 1'b0;
    if(({SPRPlugin_exceptionPortCtrl_exceptionValids_writeBack,{SPRPlugin_exceptionPortCtrl_exceptionValids_memory,{SPRPlugin_exceptionPortCtrl_exceptionValids_execute,SPRPlugin_exceptionPortCtrl_exceptionValids_decode}}} != (4'b0000)))begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_395_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_396_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_397_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_398_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_399_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_400_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
    if(_zz_401_)begin
      IBusCachedPlugin_fetcherHalt = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_incomingInstruction = 1'b0;
    if((IBusCachedPlugin_iBusRsp_stages_1_input_valid || IBusCachedPlugin_iBusRsp_stages_2_input_valid))begin
      IBusCachedPlugin_incomingInstruction = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_codePPC = (5'bxxxxx);
    if(_zz_392_)begin
      IBusCachedPlugin_decodeExceptionPort_payload_codePPC = `ExcpEnum_defaultEncoding_ISI;
    end
    if(_zz_390_)begin
      if(_zz_391_)begin
        IBusCachedPlugin_decodeExceptionPort_payload_codePPC = `ExcpEnum_defaultEncoding_ISI_PROT;
      end
    end
    if(_zz_389_)begin
      IBusCachedPlugin_decodeExceptionPort_payload_codePPC = `ExcpEnum_defaultEncoding_MC;
    end
  end

  assign IBusCachedPlugin_decodeExceptionPort_payload_imm = 7'h0;
  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_badAddr = 32'h0;
    IBusCachedPlugin_decodeExceptionPort_payload_badAddr = {IBusCachedPlugin_iBusRsp_stages_2_input_payload[31 : 2],(2'b00)};
  end

  always @ (*) begin
    DBusCachedPlugin_exceptionBus_payload_codePPC = (5'bxxxxx);
    if(_zz_402_)begin
      if(dataCache_1__io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_payload_codePPC = `ExcpEnum_defaultEncoding_MC;
      end
      if(_zz_403_)begin
        if(_zz_404_)begin
          DBusCachedPlugin_exceptionBus_payload_codePPC = `ExcpEnum_defaultEncoding_DSI_PROT;
        end else begin
          if(_zz_405_)begin
            DBusCachedPlugin_exceptionBus_payload_codePPC = `ExcpEnum_defaultEncoding_DSI_PROT;
          end
        end
      end
      if(dataCache_1__io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_payload_codePPC = `ExcpEnum_defaultEncoding_ALG;
      end
      if(dataCache_1__io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_payload_codePPC = `ExcpEnum_defaultEncoding_DSI;
      end
    end
  end

  assign DBusCachedPlugin_exceptionBus_payload_imm = 7'h0;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_payload_badAddr = 32'h0;
    DBusCachedPlugin_exceptionBus_payload_badAddr = writeBack_PC;
  end

  always @ (*) begin
    decodeExceptionPort_payload_codePPC = (5'bxxxxx);
    decodeExceptionPort_payload_codePPC = (5'bxxxxx);
    if(decode_arbitration_isValid)begin
      if(_zz_406_)begin
        decodeExceptionPort_payload_codePPC = `ExcpEnum_defaultEncoding_PGM_ILL;
      end
      if(_zz_407_)begin
        decodeExceptionPort_payload_codePPC = `ExcpEnum_defaultEncoding_PGM_PRV;
      end
    end
  end

  assign decodeExceptionPort_payload_imm = 7'h0;
  always @ (*) begin
    decodeExceptionPort_payload_badAddr = 32'h0;
    decodeExceptionPort_payload_badAddr = 32'h0;
    if(decode_arbitration_isValid)begin
      if(_zz_406_)begin
        decodeExceptionPort_payload_badAddr = decode_PC;
      end
      if(_zz_407_)begin
        decodeExceptionPort_payload_badAddr = decode_PC;
      end
    end
  end

  assign BranchPlugin_branchExceptionPort_payload_codePPC = (5'bxxxxx);
  assign BranchPlugin_branchExceptionPort_payload_imm = 7'h0;
  always @ (*) begin
    BranchPlugin_branchExceptionPort_payload_badAddr = 32'h0;
    BranchPlugin_branchExceptionPort_payload_badAddr = memory_BRANCH_CALC;
  end

  always @ (*) begin
    SPRPlugin_jumpInterface_valid = 1'b0;
    if(_zz_395_)begin
      SPRPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_396_)begin
      SPRPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_397_)begin
      SPRPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_398_)begin
      SPRPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_399_)begin
      SPRPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_400_)begin
      SPRPlugin_jumpInterface_valid = 1'b1;
    end
    if(_zz_401_)begin
      SPRPlugin_jumpInterface_valid = 1'b1;
    end
  end

  always @ (*) begin
    SPRPlugin_jumpInterface_payload = 32'h0;
    if(_zz_395_)begin
      SPRPlugin_jumpInterface_payload = _zz_295_;
    end
    if(_zz_396_)begin
      SPRPlugin_jumpInterface_payload = (writeBack_PC + 32'h00000004);
    end
    if(_zz_397_)begin
      SPRPlugin_jumpInterface_payload = 32'h00000c00;
    end
    if(_zz_398_)begin
      SPRPlugin_jumpInterface_payload = 32'h00000c00;
    end
    if(_zz_400_)begin
      SPRPlugin_jumpInterface_payload = SPRPlugin_srr0;
    end
  end

  assign SPRPlugin_forceMachineWire = 1'b0;
  always @ (*) begin
    SPRPlugin_selfException_payload_codePPC = (5'bxxxxx);
    SPRPlugin_selfException_payload_codePPC = `ExcpEnum_defaultEncoding_NONE;
    if(execute_SPRPLUGIN_illegalAccess)begin
      SPRPlugin_selfException_payload_codePPC = `ExcpEnum_defaultEncoding_PGM_PRV;
    end
  end

  assign _zz_1532_ = zz_SPRPlugin_selfException_payload_imm(1'b0);
  always @ (*) SPRPlugin_selfException_payload_imm = _zz_1532_;
  always @ (*) begin
    SPRPlugin_selfException_payload_badAddr = 32'h0;
    SPRPlugin_selfException_payload_badAddr = execute_PC;
  end

  assign SPRPlugin_allowInterrupts = 1'b1;
  assign SPRPlugin_allowException = 1'b1;
  assign IBusCachedPlugin_externalFlush = ({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != (4'b0000));
  assign IBusCachedPlugin_jump_pcLoad_valid = ({SPRPlugin_jumpInterface_valid,{BranchPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}} != (3'b000));
  assign _zz_317_ = DBusCachedPlugin_redoBranch_payload;
  assign _zz_318_ = SPRPlugin_jumpInterface_payload;
  assign _zz_319_ = BranchPlugin_jumpInterface_payload;
  assign _zz_320_ = {BranchPlugin_jumpInterface_valid,{SPRPlugin_jumpInterface_valid,DBusCachedPlugin_redoBranch_valid}};
  assign IBusCachedPlugin_jump_pcLoad_payload = PC_LOAD_result;
  always @ (*) begin
    IBusCachedPlugin_fetchPc_correction = 1'b0;
    if(IBusCachedPlugin_fetchPc_predictionPcLoad_valid)begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_correction = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_corrected = (IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_correctionReg);
  assign IBusCachedPlugin_fetchPc_pcRegPropagate = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_fetchPc_pc = (IBusCachedPlugin_fetchPc_pcReg + _zz_481_);
    if(IBusCachedPlugin_fetchPc_predictionPcLoad_valid)begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_fetchPc_predictionPcLoad_payload;
    end
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_fetchPc_redo_payload;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_pc = IBusCachedPlugin_jump_pcLoad_payload;
    end
    IBusCachedPlugin_fetchPc_pc[0] = 1'b0;
  end

  always @ (*) begin
    IBusCachedPlugin_fetchPc_flushed = 1'b0;
    if(IBusCachedPlugin_fetchPc_redo_valid)begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
    if(IBusCachedPlugin_jump_pcLoad_valid)begin
      IBusCachedPlugin_fetchPc_flushed = 1'b1;
    end
  end

  assign IBusCachedPlugin_fetchPc_output_valid = ((! IBusCachedPlugin_fetcherHalt) && IBusCachedPlugin_fetchPc_booted);
  assign IBusCachedPlugin_fetchPc_output_payload = IBusCachedPlugin_fetchPc_pc;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_redoFetch = 1'b0;
    if(IBusCachedPlugin_rsp_redoFetch)begin
      IBusCachedPlugin_iBusRsp_redoFetch = 1'b1;
    end
  end

  assign IBusCachedPlugin_iBusRsp_stages_0_input_valid = IBusCachedPlugin_fetchPc_output_valid;
  assign IBusCachedPlugin_fetchPc_output_ready = IBusCachedPlugin_iBusRsp_stages_0_input_ready;
  assign IBusCachedPlugin_iBusRsp_stages_0_input_payload = IBusCachedPlugin_fetchPc_output_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_prefetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_0_halt = 1'b1;
    end
  end

  assign _zz_115_ = (! IBusCachedPlugin_iBusRsp_stages_0_halt);
  assign IBusCachedPlugin_iBusRsp_stages_0_input_ready = (IBusCachedPlugin_iBusRsp_stages_0_output_ready && _zz_115_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_valid = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && _zz_115_);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_payload = IBusCachedPlugin_iBusRsp_stages_0_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b0;
    if(IBusCachedPlugin_cache_io_cpu_fetch_haltIt)begin
      IBusCachedPlugin_iBusRsp_stages_1_halt = 1'b1;
    end
  end

  assign _zz_116_ = (! IBusCachedPlugin_iBusRsp_stages_1_halt);
  assign IBusCachedPlugin_iBusRsp_stages_1_input_ready = (IBusCachedPlugin_iBusRsp_stages_1_output_ready && _zz_116_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_valid = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && _zz_116_);
  assign IBusCachedPlugin_iBusRsp_stages_1_output_payload = IBusCachedPlugin_iBusRsp_stages_1_input_payload;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b0;
    if((_zz_110_ || IBusCachedPlugin_rsp_iBusRspOutputHalt))begin
      IBusCachedPlugin_iBusRsp_stages_2_halt = 1'b1;
    end
  end

  assign _zz_117_ = (! IBusCachedPlugin_iBusRsp_stages_2_halt);
  assign IBusCachedPlugin_iBusRsp_stages_2_input_ready = (IBusCachedPlugin_iBusRsp_stages_2_output_ready && _zz_117_);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_valid = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && _zz_117_);
  assign IBusCachedPlugin_iBusRsp_stages_2_output_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_fetchPc_redo_valid = IBusCachedPlugin_iBusRsp_redoFetch;
  assign IBusCachedPlugin_fetchPc_redo_payload = IBusCachedPlugin_iBusRsp_stages_2_input_payload;
  assign IBusCachedPlugin_iBusRsp_flush = ((decode_arbitration_removeIt || (decode_arbitration_flushNext && (! decode_arbitration_isStuck))) || IBusCachedPlugin_iBusRsp_redoFetch);
  assign IBusCachedPlugin_iBusRsp_stages_0_output_ready = ((1'b0 && (! _zz_118_)) || IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_118_ = _zz_119_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_valid = _zz_118_;
  assign IBusCachedPlugin_iBusRsp_stages_1_input_payload = _zz_120_;
  assign IBusCachedPlugin_iBusRsp_stages_1_output_ready = ((1'b0 && (! _zz_121_)) || IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_121_ = _zz_122_;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_valid = _zz_121_;
  assign IBusCachedPlugin_iBusRsp_stages_2_input_payload = _zz_123_;
  always @ (*) begin
    IBusCachedPlugin_iBusRsp_readyForError = 1'b1;
    if((! IBusCachedPlugin_pcValids_0))begin
      IBusCachedPlugin_iBusRsp_readyForError = 1'b0;
    end
  end

  assign IBusCachedPlugin_pcValids_0 = IBusCachedPlugin_injector_nextPcCalc_valids_1;
  assign IBusCachedPlugin_pcValids_1 = IBusCachedPlugin_injector_nextPcCalc_valids_2;
  assign IBusCachedPlugin_pcValids_2 = IBusCachedPlugin_injector_nextPcCalc_valids_3;
  assign IBusCachedPlugin_pcValids_3 = IBusCachedPlugin_injector_nextPcCalc_valids_4;
  assign IBusCachedPlugin_iBusRsp_output_ready = (! decode_arbitration_isStuck);
  assign decode_arbitration_isValid = IBusCachedPlugin_iBusRsp_output_valid;
  assign IBusCachedPlugin_predictor_historyWriteDelayPatched_valid = IBusCachedPlugin_predictor_historyWrite_valid;
  assign IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_address = (IBusCachedPlugin_predictor_historyWrite_payload_address - (2'b01));
  assign IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_data_source = IBusCachedPlugin_predictor_historyWrite_payload_data_source;
  assign IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_data_branchWish = IBusCachedPlugin_predictor_historyWrite_payload_data_branchWish;
  assign IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_data_target = IBusCachedPlugin_predictor_historyWrite_payload_data_target;
  assign _zz_124_ = (IBusCachedPlugin_iBusRsp_stages_0_input_payload >>> 2);
  assign _zz_125_ = _zz_383_;
  assign IBusCachedPlugin_predictor_buffer_line_source = _zz_125_[27 : 0];
  assign IBusCachedPlugin_predictor_buffer_line_branchWish = _zz_125_[29 : 28];
  assign IBusCachedPlugin_predictor_buffer_line_target = _zz_125_[61 : 30];
  assign IBusCachedPlugin_predictor_buffer_hazard = (IBusCachedPlugin_predictor_writeLast_valid && (IBusCachedPlugin_predictor_writeLast_payload_address == _zz_484_));
  assign IBusCachedPlugin_predictor_hazard = (IBusCachedPlugin_predictor_buffer_hazard_regNextWhen || IBusCachedPlugin_predictor_buffer_pcCorrected);
  assign IBusCachedPlugin_predictor_hit = (IBusCachedPlugin_predictor_line_source == _zz_485_);
  assign IBusCachedPlugin_fetchPc_predictionPcLoad_valid = (((IBusCachedPlugin_predictor_line_branchWish[1] && IBusCachedPlugin_predictor_hit) && (! IBusCachedPlugin_predictor_hazard)) && IBusCachedPlugin_iBusRsp_stages_1_input_valid);
  assign IBusCachedPlugin_fetchPc_predictionPcLoad_payload = IBusCachedPlugin_predictor_line_target;
  assign IBusCachedPlugin_predictor_fetchContext_hazard = IBusCachedPlugin_predictor_hazard;
  assign IBusCachedPlugin_predictor_fetchContext_hit = IBusCachedPlugin_predictor_hit;
  assign IBusCachedPlugin_predictor_fetchContext_line_source = IBusCachedPlugin_predictor_line_source;
  assign IBusCachedPlugin_predictor_fetchContext_line_branchWish = IBusCachedPlugin_predictor_line_branchWish;
  assign IBusCachedPlugin_predictor_fetchContext_line_target = IBusCachedPlugin_predictor_line_target;
  assign IBusCachedPlugin_predictor_iBusRspContextOutput_hazard = IBusCachedPlugin_predictor_iBusRspContext_hazard;
  assign IBusCachedPlugin_predictor_iBusRspContextOutput_hit = IBusCachedPlugin_predictor_iBusRspContext_hit;
  assign IBusCachedPlugin_predictor_iBusRspContextOutput_line_source = IBusCachedPlugin_predictor_iBusRspContext_line_source;
  assign IBusCachedPlugin_predictor_iBusRspContextOutput_line_branchWish = IBusCachedPlugin_predictor_iBusRspContext_line_branchWish;
  assign IBusCachedPlugin_predictor_iBusRspContextOutput_line_target = IBusCachedPlugin_predictor_iBusRspContext_line_target;
  assign IBusCachedPlugin_predictor_injectorContext_hazard = IBusCachedPlugin_predictor_iBusRspContextOutput_hazard;
  assign IBusCachedPlugin_predictor_injectorContext_hit = IBusCachedPlugin_predictor_iBusRspContextOutput_hit;
  assign IBusCachedPlugin_predictor_injectorContext_line_source = IBusCachedPlugin_predictor_iBusRspContextOutput_line_source;
  assign IBusCachedPlugin_predictor_injectorContext_line_branchWish = IBusCachedPlugin_predictor_iBusRspContextOutput_line_branchWish;
  assign IBusCachedPlugin_predictor_injectorContext_line_target = IBusCachedPlugin_predictor_iBusRspContextOutput_line_target;
  assign IBusCachedPlugin_fetchPrediction_cmd_hadBranch = ((memory_PREDICTION_CONTEXT_hit && (! memory_PREDICTION_CONTEXT_hazard)) && memory_PREDICTION_CONTEXT_line_branchWish[1]);
  assign IBusCachedPlugin_fetchPrediction_cmd_targetPc = memory_PREDICTION_CONTEXT_line_target;
  always @ (*) begin
    IBusCachedPlugin_predictor_historyWrite_valid = 1'b0;
    if(IBusCachedPlugin_fetchPrediction_rsp_wasRight)begin
      IBusCachedPlugin_predictor_historyWrite_valid = memory_PREDICTION_CONTEXT_hit;
    end else begin
      if(memory_PREDICTION_CONTEXT_hit)begin
        IBusCachedPlugin_predictor_historyWrite_valid = 1'b1;
      end else begin
        IBusCachedPlugin_predictor_historyWrite_valid = 1'b1;
      end
    end
    if((memory_PREDICTION_CONTEXT_hazard || (! memory_arbitration_isFiring)))begin
      IBusCachedPlugin_predictor_historyWrite_valid = 1'b0;
    end
  end

  assign IBusCachedPlugin_predictor_historyWrite_payload_address = IBusCachedPlugin_fetchPrediction_rsp_sourceLastWord[3 : 2];
  assign IBusCachedPlugin_predictor_historyWrite_payload_data_source = (IBusCachedPlugin_fetchPrediction_rsp_sourceLastWord >>> 4);
  assign IBusCachedPlugin_predictor_historyWrite_payload_data_target = IBusCachedPlugin_fetchPrediction_rsp_finalPc;
  always @ (*) begin
    if(IBusCachedPlugin_fetchPrediction_rsp_wasRight)begin
      IBusCachedPlugin_predictor_historyWrite_payload_data_branchWish = (_zz_486_ - _zz_490_);
    end else begin
      if(memory_PREDICTION_CONTEXT_hit)begin
        IBusCachedPlugin_predictor_historyWrite_payload_data_branchWish = (_zz_491_ + _zz_495_);
      end else begin
        IBusCachedPlugin_predictor_historyWrite_payload_data_branchWish = (2'b10);
      end
    end
  end

  assign iBus_cmd_valid = IBusCachedPlugin_cache_io_mem_cmd_valid;
  always @ (*) begin
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
    iBus_cmd_payload_address = IBusCachedPlugin_cache_io_mem_cmd_payload_address;
  end

  assign iBus_cmd_payload_size = IBusCachedPlugin_cache_io_mem_cmd_payload_size;
  assign IBusCachedPlugin_s0_tightlyCoupledHit = 1'b0;
  assign _zz_322_ = (IBusCachedPlugin_iBusRsp_stages_0_input_valid && (! IBusCachedPlugin_s0_tightlyCoupledHit));
  assign IBusCachedPlugin_s1_bigEndian = (decode_MSR_ENDIAN == `EndianEnum_defaultEncoding_BE);
  assign _zz_323_ = (IBusCachedPlugin_iBusRsp_stages_1_input_valid && (! IBusCachedPlugin_s1_tightlyCoupledHit));
  assign _zz_324_ = (! IBusCachedPlugin_iBusRsp_stages_1_input_ready);
  assign _zz_325_ = (! SPRPlugin_msr_ir);
  assign IBusCachedPlugin_s2_bigEndian = (decode_MSR_ENDIAN == `EndianEnum_defaultEncoding_BE);
  assign _zz_326_ = (IBusCachedPlugin_iBusRsp_stages_2_input_valid && (! IBusCachedPlugin_s2_tightlyCoupledHit));
  assign _zz_327_ = (! IBusCachedPlugin_iBusRsp_stages_2_input_ready);
  assign _zz_328_ = (SPRPlugin_privilege == (2'b00));
  always @ (*) begin
    if(IBusCachedPlugin_s2_bigEndian)begin
      _zz_111_ = (decode_arbitration_isStuck ? decode_INSTRUCTION : IBusCachedPlugin_cache_io_cpu_fetch_data);
    end else begin
      _zz_111_ = (decode_arbitration_isStuck ? decode_INSTRUCTION : {{{IBusCachedPlugin_cache_io_cpu_fetch_data[7 : 0],IBusCachedPlugin_cache_io_cpu_fetch_data[15 : 8]},IBusCachedPlugin_cache_io_cpu_fetch_data[23 : 16]},IBusCachedPlugin_cache_io_cpu_fetch_data[31 : 24]});
    end
  end

  assign IBusCachedPlugin_rsp_iBusRspOutputHalt = 1'b0;
  assign IBusCachedPlugin_rsp_issueDetected = 1'b0;
  always @ (*) begin
    IBusCachedPlugin_rsp_redoFetch = 1'b0;
    if(_zz_393_)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
    if(_zz_388_)begin
      IBusCachedPlugin_rsp_redoFetch = 1'b1;
    end
  end

  assign IBusCachedPlugin_rsp_bigEndian = (decode_MSR_ENDIAN == `EndianEnum_defaultEncoding_BE);
  always @ (*) begin
    _zz_329_ = (IBusCachedPlugin_rsp_redoFetch && (! IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling));
    if(_zz_388_)begin
      _zz_329_ = 1'b1;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_valid = 1'b0;
    if(_zz_392_)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
    if(_zz_390_)begin
      if(_zz_391_)begin
        IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
      end
    end
    if(_zz_389_)begin
      IBusCachedPlugin_decodeExceptionPort_valid = IBusCachedPlugin_iBusRsp_readyForError;
    end
  end

  always @ (*) begin
    IBusCachedPlugin_decodeExceptionPort_payload_code = (4'bxxxx);
    if(_zz_392_)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b1011);
    end
    if(_zz_390_)begin
      if(_zz_391_)begin
        IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b1100);
      end
    end
    if(_zz_389_)begin
      IBusCachedPlugin_decodeExceptionPort_payload_code = (4'b0001);
    end
  end

  assign IBusCachedPlugin_iBusRsp_output_valid = IBusCachedPlugin_iBusRsp_stages_2_output_valid;
  assign IBusCachedPlugin_iBusRsp_stages_2_output_ready = IBusCachedPlugin_iBusRsp_output_ready;
  always @ (*) begin
    if(IBusCachedPlugin_rsp_bigEndian)begin
      IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = IBusCachedPlugin_cache_io_cpu_decode_data;
    end else begin
      IBusCachedPlugin_iBusRsp_output_payload_rsp_inst = {{{IBusCachedPlugin_cache_io_cpu_decode_data[7 : 0],IBusCachedPlugin_cache_io_cpu_decode_data[15 : 8]},IBusCachedPlugin_cache_io_cpu_decode_data[23 : 16]},IBusCachedPlugin_cache_io_cpu_decode_data[31 : 24]};
    end
  end

  assign IBusCachedPlugin_iBusRsp_output_payload_pc = IBusCachedPlugin_iBusRsp_stages_2_output_payload;
  assign IBusCachedPlugin_mmuBus_cmd_isValid = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_isValid;
  assign IBusCachedPlugin_mmuBus_cmd_virtualAddress = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_virtualAddress;
  assign IBusCachedPlugin_mmuBus_cmd_bypassTranslation = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_cmd_bypassTranslation;
  assign IBusCachedPlugin_mmuBus_spr_valid = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_spr_valid;
  assign IBusCachedPlugin_mmuBus_spr_payload_id = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_spr_payload_id;
  assign IBusCachedPlugin_mmuBus_spr_payload_data = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_spr_payload_data;
  assign IBusCachedPlugin_mmuBus_end = IBusCachedPlugin_cache_io_cpu_fetch_mmuBus_end;
  assign _zz_321_ = (decode_arbitration_isValid && decode_FLUSH_ALL);
  assign _zz_342_ = ((1'b1 && (! dataCache_1__io_mem_cmd_m2sPipe_valid)) || dataCache_1__io_mem_cmd_m2sPipe_ready);
  assign dataCache_1__io_mem_cmd_m2sPipe_valid = dataCache_1__io_mem_cmd_m2sPipe_rValid;
  assign dataCache_1__io_mem_cmd_m2sPipe_payload_wr = dataCache_1__io_mem_cmd_m2sPipe_rData_wr;
  assign dataCache_1__io_mem_cmd_m2sPipe_payload_address = dataCache_1__io_mem_cmd_m2sPipe_rData_address;
  assign dataCache_1__io_mem_cmd_m2sPipe_payload_data = dataCache_1__io_mem_cmd_m2sPipe_rData_data;
  assign dataCache_1__io_mem_cmd_m2sPipe_payload_mask = dataCache_1__io_mem_cmd_m2sPipe_rData_mask;
  assign dataCache_1__io_mem_cmd_m2sPipe_payload_length = dataCache_1__io_mem_cmd_m2sPipe_rData_length;
  assign dataCache_1__io_mem_cmd_m2sPipe_payload_last = dataCache_1__io_mem_cmd_m2sPipe_rData_last;
  assign dBus_cmd_valid = dataCache_1__io_mem_cmd_m2sPipe_valid;
  assign dataCache_1__io_mem_cmd_m2sPipe_ready = dBus_cmd_ready;
  assign dBus_cmd_payload_wr = dataCache_1__io_mem_cmd_m2sPipe_payload_wr;
  assign dBus_cmd_payload_address = dataCache_1__io_mem_cmd_m2sPipe_payload_address;
  assign dBus_cmd_payload_data = dataCache_1__io_mem_cmd_m2sPipe_payload_data;
  assign dBus_cmd_payload_mask = dataCache_1__io_mem_cmd_m2sPipe_payload_mask;
  assign dBus_cmd_payload_length = dataCache_1__io_mem_cmd_m2sPipe_payload_length;
  assign dBus_cmd_payload_last = dataCache_1__io_mem_cmd_m2sPipe_payload_last;
  assign execute_DBusCachedPlugin_bigEndian = (execute_MSR_ENDIAN == `EndianEnum_defaultEncoding_BE);
  always @ (*) begin
    case(execute_DATA_SIZE)
      `DataSizeEnum_defaultEncoding_B : begin
        execute_DBusCachedPlugin_size = (2'b00);
      end
      `DataSizeEnum_defaultEncoding_H : begin
        execute_DBusCachedPlugin_size = (2'b01);
      end
      `DataSizeEnum_defaultEncoding_W : begin
        execute_DBusCachedPlugin_size = (2'b10);
      end
      default : begin
        execute_DBusCachedPlugin_size = (2'b00);
      end
    endcase
  end

  assign _zz_331_ = (execute_arbitration_isValid && execute_MEMORY_ENABLE);
  assign _zz_332_ = execute_SRC_ADD[31 : 0];
  always @ (*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_128_ = {{{execute_RS[7 : 0],execute_RS[7 : 0]},execute_RS[7 : 0]},execute_RS[7 : 0]};
      end
      2'b01 : begin
        _zz_128_ = {execute_RS[15 : 0],execute_RS[15 : 0]};
      end
      default : begin
        _zz_128_ = execute_RS;
      end
    endcase
  end

  always @ (*) begin
    if(execute_DBusCachedPlugin_bigEndian)begin
      _zz_333_ = _zz_128_;
    end else begin
      _zz_333_ = _zz_131_;
    end
  end

  assign _zz_129_ = execute_RS[15 : 0];
  assign _zz_130_ = execute_RS[15 : 0];
  always @ (*) begin
    case(execute_DBusCachedPlugin_size)
      2'b00 : begin
        _zz_131_ = {{{execute_RS[7 : 0],execute_RS[7 : 0]},execute_RS[7 : 0]},execute_RS[7 : 0]};
      end
      2'b01 : begin
        _zz_131_ = {{_zz_129_[7 : 0],_zz_129_[15 : 8]},{_zz_130_[7 : 0],_zz_130_[15 : 8]}};
      end
      default : begin
        _zz_131_ = {{{execute_RS[7 : 0],execute_RS[15 : 8]},execute_RS[23 : 16]},execute_RS[31 : 24]};
      end
    endcase
  end

  assign _zz_341_ = (execute_arbitration_isValid && execute_MEMORY_MANAGMENT);
  always @ (*) begin
    if(execute_STORE_UPDATE)begin
      _zz_107_ = execute_SRC_ADD;
    end
    if(execute_DECODER_stageables_10)begin
      if(execute_IntAluPluginComp_sprReadValid)begin
        _zz_107_ = WB_EXECUTE_result;
      end else begin
        if(execute_DECODER_stageables_41)begin
          _zz_107_ = WB_EXECUTE_result;
        end else begin
          if(execute_DECODER_stageables_13)begin
            if(_zz_225_)begin
              _zz_107_ = WB_EXECUTE_result;
            end else begin
              if(_zz_226_)begin
                _zz_107_ = WB_EXECUTE_result;
              end else begin
                _zz_107_ = WB_EXECUTE_result;
              end
            end
          end else begin
            if(execute_DECODER_stageables_0)begin
              _zz_107_ = WB_EXECUTE_result;
            end else begin
              _zz_107_ = WB_EXECUTE_result;
            end
          end
        end
      end
    end else begin
      _zz_107_ = WB_EXECUTE_result;
    end
  end

  assign _zz_334_ = ((((memory_arbitration_isValid && memory_MEMORY_ENABLE) && (! DBusCachedPlugin_exceptionBus_valid)) && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign _zz_335_ = memory_REGFILE_WRITE_DATA;
  assign _zz_337_ = (! SPRPlugin_msr_dr);
  assign DBusCachedPlugin_mmuBus_cmd_isValid = dataCache_1__io_cpu_memory_mmuBus_cmd_isValid;
  assign DBusCachedPlugin_mmuBus_cmd_virtualAddress = dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress;
  assign DBusCachedPlugin_mmuBus_cmd_bypassTranslation = dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation;
  always @ (*) begin
    _zz_336_ = DBusCachedPlugin_mmuBus_rsp_isIoAccess;
    if((1'b0 && (! dataCache_1__io_cpu_memory_isWrite)))begin
      _zz_336_ = 1'b1;
    end
  end

  assign DBusCachedPlugin_mmuBus_spr_valid = dataCache_1__io_cpu_memory_mmuBus_spr_valid;
  assign DBusCachedPlugin_mmuBus_spr_payload_id = dataCache_1__io_cpu_memory_mmuBus_spr_payload_id;
  assign DBusCachedPlugin_mmuBus_spr_payload_data = dataCache_1__io_cpu_memory_mmuBus_spr_payload_data;
  assign DBusCachedPlugin_mmuBus_end = dataCache_1__io_cpu_memory_mmuBus_end;
  assign _zz_338_ = (writeBack_arbitration_isValid && writeBack_MEMORY_ENABLE);
  assign _zz_339_ = (SPRPlugin_privilege == (2'b00));
  assign _zz_340_ = writeBack_REGFILE_WRITE_DATA;
  assign writeBack_DBusCachedPlugin_bigEndian = (writeBack_MSR_ENDIAN == `EndianEnum_defaultEncoding_BE);
  always @ (*) begin
    DBusCachedPlugin_redoBranch_valid = 1'b0;
    if(_zz_402_)begin
      if(dataCache_1__io_cpu_redo)begin
        DBusCachedPlugin_redoBranch_valid = 1'b1;
      end
    end
  end

  assign DBusCachedPlugin_redoBranch_payload = writeBack_PC;
  always @ (*) begin
    DBusCachedPlugin_exceptionBus_valid = 1'b0;
    if(_zz_402_)begin
      if(dataCache_1__io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(_zz_403_)begin
        if(_zz_404_)begin
          DBusCachedPlugin_exceptionBus_valid = 1'b1;
        end else begin
          if(_zz_405_)begin
            DBusCachedPlugin_exceptionBus_valid = 1'b1;
          end
        end
      end
      if(dataCache_1__io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1__io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b1;
      end
      if(dataCache_1__io_cpu_redo)begin
        DBusCachedPlugin_exceptionBus_valid = 1'b0;
      end
    end
  end

  always @ (*) begin
    DBusCachedPlugin_exceptionBus_payload_code = (4'bxxxx);
    if(_zz_402_)begin
      if(dataCache_1__io_cpu_writeBack_accessError)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_496_};
      end
      if(_zz_403_)begin
        if(_zz_404_)begin
          DBusCachedPlugin_exceptionBus_payload_code = (4'b0000);
        end else begin
          if(_zz_405_)begin
            DBusCachedPlugin_exceptionBus_payload_code = (4'b0000);
          end
        end
      end
      if(dataCache_1__io_cpu_writeBack_unalignedAccess)begin
        DBusCachedPlugin_exceptionBus_payload_code = {1'd0, _zz_497_};
      end
      if(dataCache_1__io_cpu_writeBack_mmuException)begin
        DBusCachedPlugin_exceptionBus_payload_code = (writeBack_MEMORY_WR ? (4'b1111) : (4'b1101));
      end
    end
  end

  always @ (*) begin
    writeBack_DBusCachedPlugin_rspShifted = dataCache_1__io_cpu_writeBack_data;
    if(writeBack_DBusCachedPlugin_bigEndian)begin
      case(writeBack_MEMORY_ADDRESS_LOW)
        2'b00 : begin
          case(writeBack_DATA_SIZE)
            `DataSizeEnum_defaultEncoding_B : begin
              writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1__io_cpu_writeBack_data[31 : 24];
            end
            `DataSizeEnum_defaultEncoding_H : begin
              writeBack_DBusCachedPlugin_rspShifted[15 : 0] = dataCache_1__io_cpu_writeBack_data[31 : 16];
            end
            default : begin
            end
          endcase
        end
        2'b01 : begin
          writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1__io_cpu_writeBack_data[23 : 16];
        end
        2'b10 : begin
          case(writeBack_DATA_SIZE)
            `DataSizeEnum_defaultEncoding_B : begin
              writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1__io_cpu_writeBack_data[15 : 8];
            end
            default : begin
            end
          endcase
        end
        default : begin
        end
      endcase
    end else begin
      case(writeBack_MEMORY_ADDRESS_LOW)
        2'b01 : begin
          writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1__io_cpu_writeBack_data[15 : 8];
        end
        2'b10 : begin
          writeBack_DBusCachedPlugin_rspShifted[15 : 0] = dataCache_1__io_cpu_writeBack_data[31 : 16];
        end
        2'b11 : begin
          writeBack_DBusCachedPlugin_rspShifted[7 : 0] = dataCache_1__io_cpu_writeBack_data[31 : 24];
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    writeBack_DBusCachedPlugin_rspHW = 16'h0;
    case(writeBack_DATA_SIZE)
      `DataSizeEnum_defaultEncoding_B : begin
      end
      `DataSizeEnum_defaultEncoding_H : begin
        if((writeBack_MEMORY_ADDRESS_LOW == (2'b00)))begin
          if(writeBack_DBusCachedPlugin_bigEndian)begin
            writeBack_DBusCachedPlugin_rspHW = writeBack_DBusCachedPlugin_rspShifted[15 : 0];
          end else begin
            writeBack_DBusCachedPlugin_rspHW = {_zz_132_[7 : 0],_zz_132_[15 : 8]};
          end
        end else begin
          if(writeBack_DBusCachedPlugin_bigEndian)begin
            writeBack_DBusCachedPlugin_rspHW = writeBack_DBusCachedPlugin_rspShifted[31 : 16];
          end else begin
            writeBack_DBusCachedPlugin_rspHW = {_zz_133_[7 : 0],_zz_133_[15 : 8]};
          end
        end
      end
      default : begin
      end
    endcase
  end

  always @ (*) begin
    case(writeBack_DATA_SIZE)
      `DataSizeEnum_defaultEncoding_B : begin
        writeBack_DBusCachedPlugin_rspFormated = {24'h0,writeBack_DBusCachedPlugin_rspShifted[7 : 0]};
      end
      `DataSizeEnum_defaultEncoding_H : begin
        if(writeBack_SIGN_EXTEND)begin
          writeBack_DBusCachedPlugin_rspFormated = {_zz_135_,writeBack_DBusCachedPlugin_rspHW};
        end else begin
          writeBack_DBusCachedPlugin_rspFormated = {16'h0,writeBack_DBusCachedPlugin_rspHW};
        end
      end
      default : begin
        if(writeBack_DBusCachedPlugin_bigEndian)begin
          writeBack_DBusCachedPlugin_rspFormated = writeBack_DBusCachedPlugin_rspShifted;
        end else begin
          writeBack_DBusCachedPlugin_rspFormated = {{{writeBack_DBusCachedPlugin_rspShifted[7 : 0],writeBack_DBusCachedPlugin_rspShifted[15 : 8]},writeBack_DBusCachedPlugin_rspShifted[23 : 16]},writeBack_DBusCachedPlugin_rspShifted[31 : 24]};
        end
      end
    endcase
  end

  assign _zz_132_ = writeBack_DBusCachedPlugin_rspShifted[15 : 0];
  assign _zz_133_ = writeBack_DBusCachedPlugin_rspShifted[31 : 16];
  assign _zz_134_ = writeBack_DBusCachedPlugin_rspHW[15];
  always @ (*) begin
    _zz_135_[15] = _zz_134_;
    _zz_135_[14] = _zz_134_;
    _zz_135_[13] = _zz_134_;
    _zz_135_[12] = _zz_134_;
    _zz_135_[11] = _zz_134_;
    _zz_135_[10] = _zz_134_;
    _zz_135_[9] = _zz_134_;
    _zz_135_[8] = _zz_134_;
    _zz_135_[7] = _zz_134_;
    _zz_135_[6] = _zz_134_;
    _zz_135_[5] = _zz_134_;
    _zz_135_[4] = _zz_134_;
    _zz_135_[3] = _zz_134_;
    _zz_135_[2] = _zz_134_;
    _zz_135_[1] = _zz_134_;
    _zz_135_[0] = _zz_134_;
  end

  assign IBusCachedPlugin_mmuBus_rsp_physicalAddress = IBusCachedPlugin_mmuBus_cmd_virtualAddress;
  assign IBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign IBusCachedPlugin_mmuBus_rsp_isIoAccess = (IBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == (4'b1111));
  assign IBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign IBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign IBusCachedPlugin_mmuBus_busy = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_physicalAddress = DBusCachedPlugin_mmuBus_cmd_virtualAddress;
  assign DBusCachedPlugin_mmuBus_rsp_allowRead = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowWrite = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_allowExecute = 1'b1;
  assign DBusCachedPlugin_mmuBus_rsp_isIoAccess = (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31 : 28] == (4'b1111));
  assign DBusCachedPlugin_mmuBus_rsp_exception = 1'b0;
  assign DBusCachedPlugin_mmuBus_rsp_refilling = 1'b0;
  assign DBusCachedPlugin_mmuBus_busy = 1'b0;
  assign _zz_137_ = ((decode_INSTRUCTION & 32'h78000038) == 32'h78000018);
  assign _zz_138_ = ((decode_INSTRUCTION & 32'h00000300) == 32'h00000100);
  assign _zz_139_ = ((decode_INSTRUCTION & 32'h00000500) == 32'h00000400);
  assign _zz_140_ = ((decode_INSTRUCTION & 32'h00000040) == 32'h00000040);
  assign _zz_141_ = ((decode_INSTRUCTION & 32'h78000698) == 32'h78000080);
  assign _zz_142_ = ((decode_INSTRUCTION & 32'h78000416) == 32'h78000004);
  assign _zz_143_ = ((decode_INSTRUCTION & 32'he0000000) == 32'h20000000);
  assign _zz_144_ = ((decode_INSTRUCTION & 32'h70000000) == 32'h50000000);
  assign _zz_145_ = ((decode_INSTRUCTION & 32'h90000000) == 32'h90000000);
  assign _zz_146_ = ((decode_INSTRUCTION & 32'h50000000) == 32'h10000000);
  assign _zz_147_ = ((decode_INSTRUCTION & 32'h80000000) == 32'h80000000);
  assign _zz_148_ = ((decode_INSTRUCTION & 32'h78000498) == 32'h78000080);
  assign _zz_149_ = ((decode_INSTRUCTION & 32'h7800002c) == 32'h78000008);
  assign _zz_150_ = ((decode_INSTRUCTION & 32'hfc000000) == 32'h44000000);
  assign _zz_151_ = ((decode_INSTRUCTION & 32'hfc000000) == 32'h0c000000);
  assign _zz_152_ = ((decode_INSTRUCTION & 32'h780001b8) == 32'h78000020);
  assign _zz_153_ = ((decode_INSTRUCTION & 32'h78000138) == 32'h78000100);
  assign _zz_154_ = ((decode_INSTRUCTION & 32'hd40f0000) == 32'h80000000);
  assign _zz_155_ = ((decode_INSTRUCTION & 32'hd4020000) == 32'h80020000);
  assign _zz_156_ = ((decode_INSTRUCTION & 32'hd4080000) == 32'h80080000);
  assign _zz_157_ = ((decode_INSTRUCTION & 32'hd4040000) == 32'h80040000);
  assign _zz_158_ = ((decode_INSTRUCTION & 32'hd4010000) == 32'h80010000);
  assign _zz_159_ = ((decode_INSTRUCTION & 32'hd4000000) == 32'h84000000);
  assign _zz_160_ = ((decode_INSTRUCTION & 32'h90100000) == 32'h80100000);
  assign _zz_161_ = ((decode_INSTRUCTION & 32'h9c000000) == 32'h08000000);
  assign _zz_162_ = ((decode_INSTRUCTION & 32'h70000000) == 32'h60000000);
  assign _zz_163_ = ((decode_INSTRUCTION & 32'h48000000) == 32'h40000000);
  assign _zz_164_ = ((decode_INSTRUCTION & 32'h28000000) == 32'h0);
  assign _zz_165_ = ((decode_INSTRUCTION & 32'h7c000460) == 32'h4c000060);
  assign _zz_166_ = ((decode_INSTRUCTION & 32'hfc000002) == 32'h44000002);
  assign _zz_167_ = ((decode_INSTRUCTION & 32'h7c0004a0) == 32'h4c0000a0);
  assign _zz_168_ = ((decode_INSTRUCTION & 32'h7800022a) == 32'h78000002);
  assign _zz_169_ = ((decode_INSTRUCTION & 32'h01f0707f) == 32'h0000500f);
  assign _zz_170_ = ((decode_INSTRUCTION & 32'hcc080000) == 32'h80080000);
  assign _zz_171_ = ((decode_INSTRUCTION & 32'he4020000) == 32'h80020000);
  assign _zz_172_ = ((decode_INSTRUCTION & 32'hcc020000) == 32'h80020000);
  assign _zz_173_ = ((decode_INSTRUCTION & 32'he4040000) == 32'h80040000);
  assign _zz_174_ = ((decode_INSTRUCTION & 32'hcc010000) == 32'h80010000);
  assign _zz_175_ = ((decode_INSTRUCTION & 32'he4080000) == 32'h80080000);
  assign _zz_176_ = ((decode_INSTRUCTION & 32'hcc040000) == 32'h80040000);
  assign _zz_177_ = ((decode_INSTRUCTION & 32'he4010000) == 32'h80010000);
  assign _zz_178_ = ((decode_INSTRUCTION & 32'he4000000) == 32'h84000000);
  assign _zz_179_ = ((decode_INSTRUCTION & 32'hcc000000) == 32'h84000000);
  assign _zz_180_ = ((decode_INSTRUCTION & 32'hf8010000) == 32'h38010000);
  assign _zz_181_ = ((decode_INSTRUCTION & 32'hf8020000) == 32'h38020000);
  assign _zz_182_ = ((decode_INSTRUCTION & 32'hf8040000) == 32'h38040000);
  assign _zz_183_ = ((decode_INSTRUCTION & 32'hf8080000) == 32'h38080000);
  assign _zz_184_ = ((decode_INSTRUCTION & 32'hbc000000) == 32'h1c000000);
  assign _zz_185_ = ((decode_INSTRUCTION & 32'hb8000000) == 32'h30000000);
  assign _zz_186_ = ((decode_INSTRUCTION & 32'hd8000000) == 32'h50000000);
  assign _zz_187_ = ((decode_INSTRUCTION & 32'hf0000000) == 32'h60000000);
  assign _zz_188_ = ((decode_INSTRUCTION & 32'hdc000000) == 32'h94000000);
  assign _zz_189_ = ((decode_INSTRUCTION & 32'hf4000000) == 32'h94000000);
  assign _zz_190_ = ((decode_INSTRUCTION & 32'hf4000000) == 32'h54000000);
  assign _zz_191_ = ((decode_INSTRUCTION & 32'h381f0038) == 32'h38000028);
  assign _zz_192_ = ((decode_INSTRUCTION & 32'h381f0038) == 32'h38000018);
  assign _zz_193_ = ((decode_INSTRUCTION & 32'h781f0000) == 32'h38000000);
  assign _zz_194_ = ((decode_INSTRUCTION & 32'h78000034) == 32'h78000010);
  assign _zz_195_ = ((decode_INSTRUCTION & 32'h801f0000) == 32'h80000000);
  assign _zz_196_ = ((decode_INSTRUCTION & 32'h7800030a) == 32'h78000102);
  assign _zz_197_ = ((decode_INSTRUCTION & 32'hfc000000) == 32'h1c000000);
  assign _zz_198_ = ((decode_INSTRUCTION & 32'h78000328) == 32'h78000300);
  assign _zz_199_ = ((decode_INSTRUCTION & 32'h78000382) == 32'h78000180);
  assign _zz_200_ = ((decode_INSTRUCTION & 32'hec000000) == 32'h20000000);
  assign _zz_201_ = ((decode_INSTRUCTION & 32'hf8000000) == 32'h28000000);
  assign _zz_136_ = {({(_zz_695_ == _zz_696_),_zz_198_} != (2'b00)),{({_zz_201_,_zz_697_} != (2'b00)),{({_zz_698_,_zz_699_} != 10'h0),{(_zz_700_ != _zz_701_),{_zz_702_,{_zz_703_,_zz_704_}}}}}};
  assign _zz_202_ = _zz_136_[3 : 1];
  assign _zz_104_ = _zz_202_;
  assign _zz_203_ = _zz_136_[11 : 10];
  assign _zz_103_ = _zz_203_;
  assign _zz_204_ = _zz_136_[17 : 15];
  assign _zz_102_ = _zz_204_;
  assign _zz_205_ = _zz_136_[22 : 19];
  assign _zz_101_ = _zz_205_;
  assign _zz_206_ = _zz_136_[28 : 26];
  assign _zz_100_ = _zz_206_;
  assign _zz_207_ = _zz_136_[37 : 35];
  assign _zz_99_ = _zz_207_;
  assign _zz_208_ = _zz_136_[38 : 38];
  assign _zz_98_ = _zz_208_;
  assign _zz_209_ = _zz_136_[41 : 39];
  assign _zz_97_ = _zz_209_;
  assign _zz_210_ = _zz_136_[47 : 46];
  assign _zz_96_ = _zz_210_;
  assign _zz_211_ = _zz_136_[55 : 54];
  assign _zz_95_ = _zz_211_;
  assign _zz_212_ = _zz_136_[56 : 56];
  assign _zz_94_ = _zz_212_;
  assign _zz_213_ = _zz_136_[60 : 58];
  assign _zz_93_ = _zz_213_;
  assign _zz_214_ = _zz_136_[68 : 67];
  assign _zz_92_ = _zz_214_;
  assign _zz_215_ = _zz_136_[74 : 71];
  assign _zz_91_ = _zz_215_;
  always @ (*) begin
    decodeExceptionPort_valid = 1'b0;
    if(decode_arbitration_isValid)begin
      if(_zz_406_)begin
        decodeExceptionPort_valid = 1'b1;
      end
      if(_zz_407_)begin
        decodeExceptionPort_valid = 1'b1;
      end
    end
  end

  always @ (*) begin
    decodeExceptionPort_payload_code = (4'bxxxx);
    if(decode_arbitration_isValid)begin
      if(_zz_406_)begin
        decodeExceptionPort_payload_code = (4'b0010);
      end
      if(_zz_407_)begin
        decodeExceptionPort_payload_code = (4'b0010);
      end
    end
  end

  assign _zz_330_ = _zz_498_[9 : 0];
  assign decode_RegFilePluginComp_regFileReadAddress1 = decode_INSTRUCTION_ANTICIPATED[20 : 16];
  assign decode_RegFilePluginComp_regFileReadAddress2 = decode_INSTRUCTION_ANTICIPATED[15 : 11];
  assign decode_RegFilePluginComp_regFileReadAddress3 = decode_INSTRUCTION_ANTICIPATED[25 : 21];
  always @ (*) begin
    case(decode_DECODER_stageables_26)
      `TgtCtrlEnum_defaultEncoding_RT : begin
        _zz_217_ = decode_INSTRUCTION[25 : 21];
      end
      default : begin
        _zz_217_ = decode_INSTRUCTION[20 : 16];
      end
    endcase
  end

  assign lastStageRegFileWrite_valid = (_zz_89_ && writeBack_arbitration_isFiring);
  always @ (*) begin
    _zz_343_ = (lastStageRegFileWrite_valid || UpdateRegFileWrite_valid);
    if(_zz_218_)begin
      _zz_343_ = 1'b1;
    end
  end

  always @ (*) begin
    if(_zz_408_)begin
      _zz_344_ = lastStageRegFileWrite_payload_address;
    end else begin
      _zz_344_ = UpdateRegFileWrite_payload_address;
    end
  end

  always @ (*) begin
    if(_zz_408_)begin
      _zz_345_ = lastStageRegFileWrite_payload_data;
    end else begin
      _zz_345_ = UpdateRegFileWrite_payload_data;
    end
  end

  always @ (*) begin
    if(writeBack_arbitration_isFiring)begin
      writeBack_RegFilePluginComp_crBusPort_valid = ((1'b1 || writeBack_BRANCH_DEC) || writeBack_BRANCH_LINK);
    end else begin
      writeBack_RegFilePluginComp_crBusPort_valid = 1'b0;
    end
  end

  always @ (*) begin
    if((writeBack_BRANCH_DEC && writeBack_BRANCH_LINK))begin
      writeBack_RegFilePluginComp_crBusPort_payload_op = `CRBusCmdEnum_defaultEncoding_DECLNK;
    end else begin
      if(writeBack_BRANCH_DEC)begin
        writeBack_RegFilePluginComp_crBusPort_payload_op = `CRBusCmdEnum_defaultEncoding_DEC;
      end else begin
        if(writeBack_BRANCH_LINK)begin
          writeBack_RegFilePluginComp_crBusPort_payload_op = `CRBusCmdEnum_defaultEncoding_LNK;
        end else begin
          writeBack_RegFilePluginComp_crBusPort_payload_op = writeBack_CR_WRITE_op;
        end
      end
    end
  end

  assign writeBack_RegFilePluginComp_crBusPort_payload_ba = writeBack_CR_WRITE_ba;
  assign writeBack_RegFilePluginComp_crBusPort_payload_bb = writeBack_CR_WRITE_bb;
  assign writeBack_RegFilePluginComp_crBusPort_payload_bt = writeBack_CR_WRITE_bt;
  always @ (*) begin
    if(writeBack_BRANCH_LINK)begin
      writeBack_RegFilePluginComp_crBusPort_payload_imm = _zz_499_;
    end else begin
      writeBack_RegFilePluginComp_crBusPort_payload_imm = writeBack_CR_WRITE_imm;
    end
  end

  assign writeBack_RegFilePluginComp_crBusPort_payload_fxm = writeBack_CR_WRITE_fxm;
  always @ (*) begin
    if(writeBack_arbitration_isFiring)begin
      writeBack_RegFilePluginComp_xerBusPort_valid = (writeBack_XER_WRITE_validOV || writeBack_XER_WRITE_validCA);
    end else begin
      writeBack_RegFilePluginComp_xerBusPort_valid = 1'b0;
    end
  end

  assign writeBack_RegFilePluginComp_xerBusPort_payload_validOV = writeBack_XER_WRITE_validOV;
  assign writeBack_RegFilePluginComp_xerBusPort_payload_validCA = writeBack_XER_WRITE_validCA;
  assign writeBack_RegFilePluginComp_xerBusPort_payload_imm = writeBack_XER_WRITE_imm;
  always @ (*) begin
    case(writeBack_SPR_ID)
      11'b00000000001 : begin
        writeBack_RegFilePluginComp_sprWriteXERPort_valid = (writeBack_DECODER_stageables_17 && writeBack_arbitration_isFiring);
      end
      default : begin
        writeBack_RegFilePluginComp_sprWriteXERPort_valid = 1'b0;
      end
    endcase
  end

  assign writeBack_RegFilePluginComp_sprWriteXERPort_payload_id = 10'h0;
  assign writeBack_RegFilePluginComp_sprWriteXERPort_payload_data = writeBack_SRC1;
  always @ (*) begin
    case(writeBack_SPR_ID)
      11'b00000001001 : begin
        writeBack_RegFilePluginComp_sprWriteCLTPort_valid = (writeBack_DECODER_stageables_17 && writeBack_arbitration_isFiring);
      end
      11'b00000001000 : begin
        writeBack_RegFilePluginComp_sprWriteCLTPort_valid = (writeBack_DECODER_stageables_17 && writeBack_arbitration_isFiring);
      end
      11'b01100101111 : begin
        writeBack_RegFilePluginComp_sprWriteCLTPort_valid = (writeBack_DECODER_stageables_17 && writeBack_arbitration_isFiring);
      end
      default : begin
        writeBack_RegFilePluginComp_sprWriteCLTPort_valid = 1'b0;
      end
    endcase
  end

  assign writeBack_RegFilePluginComp_sprWriteCLTPort_payload_id = _zz_500_[9 : 0];
  assign writeBack_RegFilePluginComp_sprWriteCLTPort_payload_data = writeBack_SRC1;
  always @ (*) begin
    _zz_216_ = 1'b0;
    if((writeBack_DECODER_stageables_17 && writeBack_arbitration_isFiring))begin
      case(writeBack_SPR_ID)
        11'b01111101000 : begin
          _zz_216_ = 1'b1;
        end
        11'b01111101001 : begin
          _zz_216_ = 1'b1;
        end
        11'b01111101010 : begin
          _zz_216_ = 1'b1;
        end
        default : begin
        end
      endcase
    end
  end

  always @ (*) begin
    _zz_220_ = 1'b0;
    if(writeBack_RegFilePluginComp_xerBusPort_valid)begin
      _zz_220_ = writeBack_RegFilePluginComp_xerBusPort_payload_validCA;
    end
  end

  always @ (*) begin
    _zz_219_ = 1'b0;
    if(writeBack_RegFilePluginComp_xerBusPort_valid)begin
      _zz_219_ = writeBack_RegFilePluginComp_xerBusPort_payload_validOV;
    end
  end

  always @ (*) begin
    _zz_221_ = (2'bxx);
    if(writeBack_RegFilePluginComp_xerBusPort_valid)begin
      _zz_221_ = writeBack_RegFilePluginComp_xerBusPort_payload_imm;
    end
  end

  always @ (*) begin
    case(execute_SPR_ID)
      11'b00000000001 : begin
        execute_IntAluPluginComp_sprReadValid = execute_DECODER_stageables_10;
      end
      default : begin
        execute_IntAluPluginComp_sprReadValid = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    _zz_222_ = 1'b0;
    if(writeBack_RegFilePluginComp_xerBusPort_valid)begin
      _zz_222_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_353_ = 7'h0;
    if(execute_DECODER_stageables_10)begin
      if(execute_IntAluPluginComp_sprReadValid)begin
        _zz_353_[0] = 1'b1;
      end else begin
        if(execute_DECODER_stageables_41)begin
          _zz_353_[1] = 1'b1;
        end else begin
          if(! execute_DECODER_stageables_13) begin
            if(execute_DECODER_stageables_0)begin
              _zz_353_[2] = 1'b1;
            end else begin
              _zz_353_[3] = 1'b1;
            end
          end
        end
      end
    end else begin
      _zz_353_[4] = (execute_DECODER_stageables_39 == `AluCtrlEnum_defaultEncoding_ADD);
      _zz_353_[5] = (execute_DECODER_stageables_39 != `AluCtrlEnum_defaultEncoding_ADD);
    end
  end

  always @ (*) begin
    _zz_354_ = (3'b000);
    if(execute_DECODER_stageables_10)begin
      if(! execute_IntAluPluginComp_sprReadValid) begin
        if(! execute_DECODER_stageables_41) begin
          if(execute_DECODER_stageables_13)begin
            if(_zz_225_)begin
              _zz_354_[2] = 1'b1;
            end else begin
              if(_zz_226_)begin
                _zz_354_[1] = 1'b1;
              end else begin
                _zz_354_[0] = 1'b1;
              end
            end
          end
        end
      end
    end
  end

  always @ (*) begin
    _zz_346_ = 32'h0;
    if(execute_DECODER_stageables_10)begin
      if(execute_IntAluPluginComp_sprReadValid)begin
        _zz_346_ = execute_IntAluPluginComp_XER;
      end
    end
  end

  always @ (*) begin
    _zz_347_ = 32'h0;
    if(execute_DECODER_stageables_10)begin
      if(! execute_IntAluPluginComp_sprReadValid) begin
        if(execute_DECODER_stageables_41)begin
          _zz_347_ = _zz_224_;
        end
      end
    end
  end

  always @ (*) begin
    _zz_348_ = 32'h0;
    if(execute_DECODER_stageables_10)begin
      if(! execute_IntAluPluginComp_sprReadValid) begin
        if(! execute_DECODER_stageables_41) begin
          if(! execute_DECODER_stageables_13) begin
            if(execute_DECODER_stageables_0)begin
              _zz_348_ = (_zz_525_[_zz_526_] ? execute_SRC1 : execute_SRC2);
            end
          end
        end
      end
    end
  end

  always @ (*) begin
    _zz_349_ = 32'h0;
    if(execute_DECODER_stageables_10)begin
      if(! execute_IntAluPluginComp_sprReadValid) begin
        if(! execute_DECODER_stageables_41) begin
          if(! execute_DECODER_stageables_13) begin
            if(! execute_DECODER_stageables_0) begin
              _zz_349_ = sprReadBU_payload_data;
            end
          end
        end
      end
    end
  end

  always @ (*) begin
    _zz_350_ = 32'h0;
    if(! execute_DECODER_stageables_10) begin
      _zz_350_ = execute_SRC_ADD;
    end
  end

  always @ (*) begin
    _zz_351_ = 32'h0;
    if(! execute_DECODER_stageables_10) begin
      _zz_351_ = FX_ALUL_result;
    end
  end

  assign _zz_352_ = 32'h0;
  always @ (*) begin
    case(execute_DECODER_stageables_40)
      `AluRimiAmtEnum_defaultEncoding_IMM : begin
        _zz_223_ = execute_INSTRUCTION[15 : 11];
      end
      default : begin
        _zz_223_ = execute_SRC2[4 : 0];
      end
    endcase
  end

  assign _zz_355_ = execute_INSTRUCTION[10 : 6];
  assign _zz_356_ = execute_INSTRUCTION[5 : 1];
  always @ (*) begin
    case(_zz_432_)
      8'b10000000 : begin
        _zz_224_ = {_zz_501_[31 : 28],28'h0};
      end
      8'b01000000 : begin
        _zz_224_ = {{(4'b0000),_zz_502_[27 : 24]},24'h0};
      end
      8'b00100000 : begin
        _zz_224_ = {{8'h0,_zz_503_[23 : 20]},20'h0};
      end
      8'b00010000 : begin
        _zz_224_ = {{12'h0,_zz_504_[19 : 16]},16'h0};
      end
      8'b00001000 : begin
        _zz_224_ = {{16'h0,_zz_505_[15 : 12]},12'h0};
      end
      8'b00000100 : begin
        _zz_224_ = {{20'h0,_zz_506_[11 : 8]},8'h0};
      end
      8'b00000010 : begin
        _zz_224_ = {{24'h0,_zz_507_[7 : 4]},(4'b0000)};
      end
      default : begin
        _zz_224_ = {28'h0,_zz_508_[3 : 0]};
      end
    endcase
  end

  always @ (*) begin
    case(_zz_433_)
      3'b000 : begin
        _zz_225_ = _zz_509_[31];
      end
      3'b001 : begin
        _zz_225_ = _zz_510_[27];
      end
      3'b010 : begin
        _zz_225_ = _zz_511_[23];
      end
      3'b011 : begin
        _zz_225_ = _zz_512_[19];
      end
      3'b100 : begin
        _zz_225_ = _zz_513_[15];
      end
      3'b101 : begin
        _zz_225_ = _zz_514_[11];
      end
      3'b110 : begin
        _zz_225_ = _zz_515_[7];
      end
      default : begin
        _zz_225_ = _zz_516_[3];
      end
    endcase
  end

  always @ (*) begin
    case(_zz_434_)
      3'b000 : begin
        _zz_226_ = _zz_517_[30];
      end
      3'b001 : begin
        _zz_226_ = _zz_518_[26];
      end
      3'b010 : begin
        _zz_226_ = _zz_519_[22];
      end
      3'b011 : begin
        _zz_226_ = _zz_520_[18];
      end
      3'b100 : begin
        _zz_226_ = _zz_521_[14];
      end
      3'b101 : begin
        _zz_226_ = _zz_522_[10];
      end
      3'b110 : begin
        _zz_226_ = _zz_523_[6];
      end
      default : begin
        _zz_226_ = _zz_524_[2];
      end
    endcase
  end

  always @ (*) begin
    case(execute_DECODER_stageables_26)
      `TgtCtrlEnum_defaultEncoding_RT : begin
        _zz_227_ = execute_INSTRUCTION[25 : 21];
      end
      default : begin
        _zz_227_ = execute_INSTRUCTION[20 : 16];
      end
    endcase
  end

  always @ (*) begin
    if(execute_DECODER_stageables_23)begin
      _zz_81_ = 11'h402;
    end else begin
      if(execute_DECODER_stageables_5)begin
        _zz_81_ = 11'h401;
      end else begin
        _zz_81_ = {{(1'b0),execute_INSTRUCTION[15 : 11]},execute_INSTRUCTION[20 : 16]};
      end
    end
  end

  always @ (*) begin
    execute_IntAluPluginComp_xer_ca = 1'b0;
    if((execute_DECODER_stageables_42 == `AluRimiCtrlEnum_defaultEncoding_SHIFTRA))begin
      execute_IntAluPluginComp_xer_ca = FX_ALUL_xer_ca;
    end else begin
      execute_IntAluPluginComp_xer_ca = execute_SRC_CAOV[1];
    end
  end

  assign execute_IntAluPluginComp_xer_ov = execute_SRC_CAOV[0];
  assign execute_IntAluPluginComp_xer_so = (execute_IntAluPluginComp_XER[31] || execute_IntAluPluginComp_xer_ov);
  assign execute_IntAluPluginComp_xerBus_validOV = (execute_DECODER_stageables_43 && execute_INSTRUCTION[10]);
  assign execute_IntAluPluginComp_xerBus_validCA = execute_DECODER_stageables_36;
  assign execute_IntAluPluginComp_xerBus_imm = {execute_IntAluPluginComp_xer_ov,execute_IntAluPluginComp_xer_ca};
  always @ (*) begin
    case(execute_SRC_CR)
      2'b00 : begin
        execute_IntAluPluginComp_alu_cr = (3'b010);
      end
      2'b01 : begin
        execute_IntAluPluginComp_alu_cr = (3'b001);
      end
      default : begin
        execute_IntAluPluginComp_alu_cr = (3'b100);
      end
    endcase
  end

  always @ (*) begin
    case(execute_DECODER_stageables_39)
      `AluCtrlEnum_defaultEncoding_ADD : begin
        execute_IntAluPluginComp_cr0_val_a = execute_IntAluPluginComp_alu_cr;
      end
      default : begin
        execute_IntAluPluginComp_cr0_val_a = FX_ALUL_cr;
      end
    endcase
  end

  assign execute_IntAluPluginComp_cr0_val = {execute_IntAluPluginComp_cr0_val_a,execute_IntAluPluginComp_xer_so};
  assign execute_IntAluPluginComp_cr_record = ((! execute_DECODER_stageables_56) && (execute_DECODER_stageables_54 || (execute_DECODER_stageables_29 && (execute_INSTRUCTION[0] == 1'b1))));
  assign execute_IntAluPluginComp_cr_mcrf = (execute_DECODER_stageables_49 == `CRMoveCtrlEnum_defaultEncoding_MCRF);
  assign execute_IntAluPluginComp_cr_update_valid = (((execute_IntAluPluginComp_cr_record || execute_DECODER_stageables_51) || execute_DECODER_stageables_50) || execute_DECODER_stageables_56);
  always @ (*) begin
    if(execute_IntAluPluginComp_cr_record)begin
      execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_CR0;
    end else begin
      if(execute_DECODER_stageables_56)begin
        execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_CMP;
      end else begin
        if(execute_DECODER_stageables_51)begin
          case(execute_DECODER_stageables_18)
            `CRLogCtrlEnum_defaultEncoding_AND_1 : begin
              execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_AND_1;
            end
            `CRLogCtrlEnum_defaultEncoding_OR_1 : begin
              execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_OR_1;
            end
            `CRLogCtrlEnum_defaultEncoding_XOR_1 : begin
              execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_XOR_1;
            end
            `CRLogCtrlEnum_defaultEncoding_NAND_1 : begin
              execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_NAND_1;
            end
            `CRLogCtrlEnum_defaultEncoding_NOR_1 : begin
              execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_NOR_1;
            end
            `CRLogCtrlEnum_defaultEncoding_EQV : begin
              execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_EQV;
            end
            `CRLogCtrlEnum_defaultEncoding_ANDC : begin
              execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_ANDC;
            end
            default : begin
              execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_ORC;
            end
          endcase
        end else begin
          if(execute_DECODER_stageables_50)begin
            case(execute_DECODER_stageables_49)
              `CRMoveCtrlEnum_defaultEncoding_MCRF : begin
                execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_MCRF;
              end
              `CRMoveCtrlEnum_defaultEncoding_MCRXRX : begin
                execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_MTCRF;
              end
              default : begin
                execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_MTCRF;
              end
            endcase
          end else begin
            execute_IntAluPluginComp_crBus_op = `CRBusCmdEnum_defaultEncoding_NOP;
          end
        end
      end
    end
  end

  always @ (*) begin
    if(execute_DECODER_stageables_51)begin
      execute_IntAluPluginComp_crBus_ba = execute_INSTRUCTION[20 : 16];
    end else begin
      if(execute_IntAluPluginComp_cr_mcrf)begin
        execute_IntAluPluginComp_crBus_ba = {(2'b00),execute_INSTRUCTION[20 : 18]};
      end else begin
        execute_IntAluPluginComp_crBus_ba = 5'h0;
      end
    end
  end

  always @ (*) begin
    if(execute_DECODER_stageables_51)begin
      execute_IntAluPluginComp_crBus_bb = execute_INSTRUCTION[15 : 11];
    end else begin
      if(execute_IntAluPluginComp_cr_mcrf)begin
        execute_IntAluPluginComp_crBus_bb = 5'h0;
      end else begin
        execute_IntAluPluginComp_crBus_bb = 5'h0;
      end
    end
  end

  always @ (*) begin
    if(execute_DECODER_stageables_51)begin
      execute_IntAluPluginComp_crBus_bt = execute_INSTRUCTION[25 : 21];
    end else begin
      if(execute_IntAluPluginComp_cr_mcrf)begin
        execute_IntAluPluginComp_crBus_bt = {(2'b00),execute_INSTRUCTION[25 : 23]};
      end else begin
        execute_IntAluPluginComp_crBus_bt = 5'h0;
      end
    end
  end

  always @ (*) begin
    if(execute_IntAluPluginComp_cr_record)begin
      execute_IntAluPluginComp_crBus_imm = {28'h0,execute_IntAluPluginComp_cr0_val};
    end else begin
      if(execute_DECODER_stageables_56)begin
        execute_IntAluPluginComp_crBus_imm = {28'h0,execute_IntAluPluginComp_cr0_val};
      end else begin
        if(execute_DECODER_stageables_50)begin
          case(execute_DECODER_stageables_49)
            `CRMoveCtrlEnum_defaultEncoding_MCRXRX : begin
              execute_IntAluPluginComp_crBus_imm = {{{{28'h0,execute_IntAluPluginComp_XER[30]},execute_IntAluPluginComp_XER[19]},execute_IntAluPluginComp_XER[29]},execute_IntAluPluginComp_XER[18]};
            end
            default : begin
              execute_IntAluPluginComp_crBus_imm = execute_SRC1;
            end
          endcase
        end else begin
          execute_IntAluPluginComp_crBus_imm = 32'h0;
        end
      end
    end
  end

  always @ (*) begin
    execute_IntAluPluginComp_crBus_fxm = 8'h0;
    if(execute_DECODER_stageables_56)begin
      execute_IntAluPluginComp_crBus_fxm[_zz_527_] = 1'b1;
    end else begin
      if(execute_DECODER_stageables_50)begin
        case(execute_DECODER_stageables_49)
          `CRMoveCtrlEnum_defaultEncoding_MCRXRX : begin
            execute_IntAluPluginComp_crBus_fxm = execute_INSTRUCTION[19 : 12];
          end
          default : begin
            execute_IntAluPluginComp_crBus_fxm = execute_INSTRUCTION[19 : 12];
          end
        endcase
      end
    end
  end

  assign _zz_78_ = execute_IntAluPluginComp_crBus_op;
  always @ (*) begin
    if(execute_IntAluPluginComp_cr_update_valid)begin
      case(execute_IntAluPluginComp_crBus_op)
        `CRBusCmdEnum_defaultEncoding_CR0 : begin
          _zz_77_ = 8'h80;
        end
        `CRBusCmdEnum_defaultEncoding_CR1 : begin
          _zz_77_ = 8'h40;
        end
        `CRBusCmdEnum_defaultEncoding_CR6 : begin
          _zz_77_ = 8'h02;
        end
        `CRBusCmdEnum_defaultEncoding_CMP : begin
          _zz_77_ = execute_IntAluPluginComp_crBus_fxm;
        end
        default : begin
          _zz_77_ = 8'hff;
        end
      endcase
    end else begin
      _zz_77_ = 8'h0;
    end
  end

  assign SRC_ra = execute_INSTRUCTION[20 : 16];
  assign SRC_rb = execute_INSTRUCTION[15 : 11];
  assign SRC_rs = execute_INSTRUCTION[25 : 21];
  assign SRC_rt = execute_INSTRUCTION[25 : 21];
  assign _zz_357_ = (~ _zz_76_);
  assign _zz_358_ = _zz_75_;
  always @ (*) begin
    _zz_359_[0] = (execute_DECODER_stageables_27 == `Src1CtrlEnum_defaultEncoding_RA);
    _zz_359_[1] = (execute_DECODER_stageables_27 == `Src1CtrlEnum_defaultEncoding_RA_N);
    _zz_359_[2] = (execute_DECODER_stageables_27 == `Src1CtrlEnum_defaultEncoding_RA_NIA);
    _zz_359_[3] = (execute_DECODER_stageables_27 == `Src1CtrlEnum_defaultEncoding_RS);
  end

  assign _zz_360_ = {16'h0,execute_INSTRUCTION[15 : 0]};
  assign _zz_228_ = execute_INSTRUCTION[15];
  always @ (*) begin
    _zz_229_[15] = _zz_228_;
    _zz_229_[14] = _zz_228_;
    _zz_229_[13] = _zz_228_;
    _zz_229_[12] = _zz_228_;
    _zz_229_[11] = _zz_228_;
    _zz_229_[10] = _zz_228_;
    _zz_229_[9] = _zz_228_;
    _zz_229_[8] = _zz_228_;
    _zz_229_[7] = _zz_228_;
    _zz_229_[6] = _zz_228_;
    _zz_229_[5] = _zz_228_;
    _zz_229_[4] = _zz_228_;
    _zz_229_[3] = _zz_228_;
    _zz_229_[2] = _zz_228_;
    _zz_229_[1] = _zz_228_;
    _zz_229_[0] = _zz_228_;
  end

  assign _zz_361_ = {_zz_229_,execute_INSTRUCTION[15 : 0]};
  assign _zz_362_ = {execute_INSTRUCTION[15 : 0],16'h0};
  assign _zz_363_ = {{{execute_INSTRUCTION[15 : 6],execute_INSTRUCTION[20 : 16]},execute_INSTRUCTION[0]},16'h0004};
  always @ (*) begin
    _zz_364_[0] = (execute_DECODER_stageables_12 == `Src2CtrlEnum_defaultEncoding_RB_UI);
    _zz_364_[1] = (execute_DECODER_stageables_12 == `Src2CtrlEnum_defaultEncoding_RB_SI);
    _zz_364_[2] = (execute_DECODER_stageables_12 == `Src2CtrlEnum_defaultEncoding_RB_SH);
    _zz_364_[3] = (execute_DECODER_stageables_12 == `Src2CtrlEnum_defaultEncoding_RB_PCISD);
  end

  always @ (*) begin
    SRC_src2ctrl_other = 1'b0;
    if(SRC_sel_m1)begin
      SRC_src2ctrl_other = 1'b1;
    end else begin
      SRC_src2ctrl_other = 1'b1;
    end
  end

  assign SRC_sel_m1 = 1'b0;
  always @ (*) begin
    if(SRC_sel_m1)begin
      SRC_src2_other = 32'hffffffff;
    end else begin
      SRC_src2_other = SRC2_A_result;
    end
  end

  always @ (*) begin
    _zz_365_[0] = (execute_DECODER_stageables_12 == `Src2CtrlEnum_defaultEncoding_RB);
    _zz_365_[1] = (execute_DECODER_stageables_12 == `Src2CtrlEnum_defaultEncoding_RA);
    _zz_365_[2] = SRC_src2ctrl_other;
  end

  always @ (*) begin
    case(execute_DECODER_stageables_8)
      `Src3CtrlEnum_defaultEncoding_CA : begin
        _zz_230_ = execute_XER_CA;
      end
      `Src3CtrlEnum_defaultEncoding_CA_0 : begin
        _zz_230_ = 1'b0;
      end
      default : begin
        _zz_230_ = 1'b1;
      end
    endcase
  end

  assign SRC_src3[0] = _zz_230_;
  assign SRC_ADD_cmp_cr = (execute_DECODER_stageables_38 ? FX_ALU_cmpl_cr : FX_ALU_cmp_cr);
  assign UpdateRegFileWrite_valid = _zz_231_;
  assign UpdateRegFileWrite_payload_address = _zz_232_;
  assign UpdateRegFileWrite_payload_data = _zz_233_;
  assign MUL1_a = execute_SRC1;
  assign MUL1_b = execute_SRC2;
  assign MUL1_aSigned = execute_DECODER_stageables_33;
  assign MUL1_bSigned = execute_DECODER_stageables_33;
  assign MUL1_aULow = MUL1_a[15 : 0];
  assign MUL1_bULow = MUL1_b[15 : 0];
  assign MUL1_aSLow = {1'b0,MUL1_a[15 : 0]};
  assign MUL1_bSLow = {1'b0,MUL1_b[15 : 0]};
  assign MUL1_aHigh = {(MUL1_aSigned && MUL1_a[31]),MUL1_a[31 : 16]};
  assign MUL1_bHigh = {(MUL1_bSigned && MUL1_b[31]),MUL1_b[31 : 16]};
  assign _zz_366_ = MUL1_aULow;
  assign _zz_367_ = MUL1_bULow;
  assign _zz_368_ = MUL1_aSLow;
  assign _zz_369_ = MUL1_bHigh;
  assign _zz_370_ = MUL1_aHigh;
  assign _zz_371_ = MUL1_bSLow;
  assign _zz_372_ = MUL1_aHigh;
  assign _zz_373_ = MUL1_bHigh;
  assign _zz_374_ = _zz_528_;
  assign _zz_375_ = _zz_529_;
  assign _zz_376_ = _zz_530_;
  assign _zz_377_ = writeBack_MUL_LOW;
  assign _zz_378_ = writeBack_MUL_HH;
  assign MUL3_result = MUL_ADD2_result;
  assign MUL3_xer_ov = MUL3_result[32];
  always @ (*) begin
    MUL3_xer_so = 1'b0;
    if((writeBack_DECODER_stageables_45 && writeBack_INSTRUCTION[10]))begin
      MUL3_xer_so = (writeBack_XER_SO || MUL3_xer_ov);
    end else begin
      MUL3_xer_so = writeBack_XER_SO;
    end
  end

  always @ (*) begin
    if(writeBack_DECODER_stageables_7)begin
      MUL3_result32 = _zz_531_;
    end else begin
      MUL3_result32 = _zz_532_;
    end
  end

  assign MUL3_cr = {MUL3_result32[31],(MUL3_result32[31 : 0] == 32'h0)};
  always @ (*) begin
    case(writeBack_SRC_CR)
      2'b00 : begin
        MUL3_cr_decode = {(3'b010),MUL3_xer_so};
      end
      2'b01 : begin
        MUL3_cr_decode = {(3'b001),MUL3_xer_so};
      end
      default : begin
        MUL3_cr_decode = {(3'b100),MUL3_xer_so};
      end
    endcase
  end

  always @ (*) begin
    _zz_234_ = 1'b0;
    if(_zz_387_)begin
      _zz_234_ = 1'b1;
    end
  end

  always @ (*) begin
    _zz_235_ = (5'bxxxxx);
    if(MUL3_cr_record)begin
      _zz_235_ = `CRBusCmdEnum_defaultEncoding_CR0;
    end else begin
      _zz_235_ = `CRBusCmdEnum_defaultEncoding_NOP;
    end
  end

  always @ (*) begin
    _zz_236_ = 32'h0;
    _zz_236_ = {28'h0,MUL3_cr_decode};
  end

  assign MUL3_cr_record = (writeBack_DECODER_stageables_15 && writeBack_INSTRUCTION[0]);
  always @ (*) begin
    DIV_MEM_crBusPort_valid = 1'b0;
    if(_zz_385_)begin
      if(! _zz_386_) begin
        DIV_MEM_crBusPort_valid = 1'b1;
      end
    end
  end

  always @ (*) begin
    DIV_MEM_crBusPort_payload_op = (5'bxxxxx);
    if(_zz_385_)begin
      if(! _zz_386_) begin
        if(memory_INSTRUCTION[0])begin
          DIV_MEM_crBusPort_payload_op = `CRBusCmdEnum_defaultEncoding_CR0;
        end else begin
          DIV_MEM_crBusPort_payload_op = `CRBusCmdEnum_defaultEncoding_NOP;
        end
      end
    end
  end

  assign DIV_MEM_crBusPort_payload_ba = 5'h0;
  assign DIV_MEM_crBusPort_payload_bb = 5'h0;
  assign DIV_MEM_crBusPort_payload_bt = 5'h0;
  always @ (*) begin
    DIV_MEM_crBusPort_payload_imm = 32'h0;
    if(_zz_385_)begin
      if(! _zz_386_) begin
        DIV_MEM_crBusPort_payload_imm = {28'h0,_zz_238_};
      end
    end
  end

  assign DIV_MEM_crBusPort_payload_fxm = 8'h0;
  always @ (*) begin
    DIV_MEM_xerBusPort_valid = 1'b0;
    if(_zz_385_)begin
      if(! _zz_386_) begin
        DIV_MEM_xerBusPort_valid = 1'b1;
      end
    end
  end

  always @ (*) begin
    DIV_MEM_xerBusPort_payload_validOV = 1'bx;
    if(_zz_385_)begin
      if(! _zz_386_) begin
        DIV_MEM_xerBusPort_payload_validOV = 1'b0;
        if(_zz_409_)begin
          DIV_MEM_xerBusPort_payload_validOV = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    DIV_MEM_xerBusPort_payload_validCA = 1'bx;
    if(_zz_385_)begin
      if(! _zz_386_) begin
        DIV_MEM_xerBusPort_payload_validCA = 1'b0;
      end
    end
  end

  always @ (*) begin
    DIV_MEM_xerBusPort_payload_imm = (2'bxx);
    if(_zz_385_)begin
      if(! _zz_386_) begin
        DIV_MEM_xerBusPort_payload_imm = {FX_DIV_ov,(1'b0)};
      end
    end
  end

  assign DIV_MEM_rs1NeedRevert = (execute_SRC1[31] && execute_DECODER_stageables_30);
  assign DIV_MEM_rs2NeedRevert = (execute_SRC2[31] && execute_DECODER_stageables_3);
  always @ (*) begin
    DIV_MEM_rs1Extended[32] = (execute_DECODER_stageables_30 && execute_SRC1[31]);
    DIV_MEM_rs1Extended[31 : 0] = execute_SRC1;
  end

  assign _zz_379_ = _zz_533_;
  assign _zz_380_ = _zz_536_;
  assign _zz_382_ = ((DIV_MEM_rs1NeedRevert ^ DIV_MEM_rs2NeedRevert) && (! ((execute_SRC2 == 32'h0) && execute_DECODER_stageables_3)));
  always @ (*) begin
    _zz_381_ = 1'b0;
    if((! memory_arbitration_isStuck))begin
      _zz_381_ = memory_DECODER_stageables_57;
    end
  end

  always @ (*) begin
    _zz_237_ = 1'b0;
    if(_zz_409_)begin
      _zz_237_ = (memory_XER_SO || FX_DIV_ov);
    end else begin
      _zz_237_ = memory_XER_SO;
    end
  end

  always @ (*) begin
    case(memory_SRC_CR)
      2'b00 : begin
        _zz_238_ = {(3'b010),_zz_237_};
      end
      2'b01 : begin
        _zz_238_ = {(3'b001),_zz_237_};
      end
      default : begin
        _zz_238_ = {(3'b100),_zz_237_};
      end
    endcase
  end

  always @ (*) begin
    _zz_239_ = 1'b0;
    if(_zz_410_)begin
      if(_zz_411_)begin
        if((writeBack_RT_ADDR == decode_R0_ADDR))begin
          _zz_239_ = 1'b1;
        end
      end
    end
    if(_zz_412_)begin
      if(_zz_413_)begin
        if((memory_RT_ADDR == decode_R0_ADDR))begin
          _zz_239_ = 1'b1;
        end
      end
    end
    if(_zz_414_)begin
      if(_zz_415_)begin
        if((execute_RT_ADDR == decode_R0_ADDR))begin
          _zz_239_ = 1'b1;
        end
      end
    end
    if((! decode_DECODER_stageables_46))begin
      _zz_239_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_240_ = 1'b0;
    if(_zz_410_)begin
      if(_zz_411_)begin
        if((writeBack_RT_ADDR == decode_R1_ADDR))begin
          _zz_240_ = 1'b1;
        end
      end
    end
    if(_zz_412_)begin
      if(_zz_413_)begin
        if((memory_RT_ADDR == decode_R1_ADDR))begin
          _zz_240_ = 1'b1;
        end
      end
    end
    if(_zz_414_)begin
      if(_zz_415_)begin
        if((execute_RT_ADDR == decode_R1_ADDR))begin
          _zz_240_ = 1'b1;
        end
      end
    end
    if((! decode_DECODER_stageables_44))begin
      _zz_240_ = 1'b0;
    end
  end

  always @ (*) begin
    _zz_241_ = 1'b0;
    if((writeBack_arbitration_isValid && writeBack_DECODER_stageables_21))begin
      if(((1'b0 || (! _zz_245_)) || (! 1'b1)))begin
        if((writeBack_RT_ADDR == decode_R2_ADDR))begin
          _zz_241_ = 1'b1;
        end
      end
    end
    if((memory_arbitration_isValid && memory_DECODER_stageables_21))begin
      if(((1'b0 || (! memory_DECODER_stageables_55)) || (! 1'b1)))begin
        if((memory_RT_ADDR == decode_R2_ADDR))begin
          _zz_241_ = 1'b1;
        end
      end
    end
    if((execute_arbitration_isValid && execute_DECODER_stageables_21))begin
      if(((1'b0 || (! execute_DECODER_stageables_6)) || (! 1'b1)))begin
        if((execute_RT_ADDR == decode_R2_ADDR))begin
          _zz_241_ = 1'b1;
        end
      end
    end
    if((! decode_DECODER_stageables_24))begin
      _zz_241_ = 1'b0;
    end
  end

  assign Hazards_writeBackWrites_valid = (_zz_89_ && writeBack_arbitration_isFiring);
  assign Hazards_writeBackWrites_payload_address = writeBack_RT_ADDR;
  assign Hazards_writeBackWrites_payload_data = lastStageRegFileWrite_payload_data;
  assign Hazards_addr0Match = (Hazards_writeBackBuffer_payload_address == decode_R0_ADDR);
  assign Hazards_addr1Match = (Hazards_writeBackBuffer_payload_address == decode_R1_ADDR);
  assign Hazards_addr2Match = (Hazards_writeBackBuffer_payload_address == decode_R2_ADDR);
  always @ (*) begin
    _zz_242_ = (4'b0000);
    if(_zz_416_)begin
      if(_zz_417_)begin
        _zz_242_[0] = (execute_RT_ADDR == decode_R0_ADDR);
      end
    end
    if(_zz_418_)begin
      if(_zz_419_)begin
        _zz_242_[1] = (memory_RT_ADDR == decode_R0_ADDR);
      end
    end
    if(_zz_420_)begin
      if(_zz_421_)begin
        _zz_242_[2] = (writeBack_RT_ADDR == decode_R0_ADDR);
      end
    end
    if(Hazards_writeBackBuffer_valid)begin
      _zz_242_[3] = (Hazards_writeBackBuffer_payload_address == decode_R0_ADDR);
    end
  end

  always @ (*) begin
    _zz_243_ = (4'b0000);
    if(_zz_416_)begin
      if(_zz_417_)begin
        _zz_243_[0] = (execute_RT_ADDR == decode_R1_ADDR);
      end
    end
    if(_zz_418_)begin
      if(_zz_419_)begin
        _zz_243_[1] = (memory_RT_ADDR == decode_R1_ADDR);
      end
    end
    if(_zz_420_)begin
      if(_zz_421_)begin
        _zz_243_[2] = (writeBack_RT_ADDR == decode_R1_ADDR);
      end
    end
    if(Hazards_writeBackBuffer_valid)begin
      _zz_243_[3] = (Hazards_writeBackBuffer_payload_address == decode_R1_ADDR);
    end
  end

  always @ (*) begin
    _zz_244_ = (4'b0000);
    if(_zz_416_)begin
      if(_zz_417_)begin
        _zz_244_[0] = (execute_RT_ADDR == decode_R2_ADDR);
      end
    end
    if(_zz_418_)begin
      if(_zz_419_)begin
        _zz_244_[1] = (memory_RT_ADDR == decode_R2_ADDR);
      end
    end
    if(_zz_420_)begin
      if(_zz_421_)begin
        _zz_244_[2] = (writeBack_RT_ADDR == decode_R2_ADDR);
      end
    end
    if(Hazards_writeBackBuffer_valid)begin
      _zz_244_[3] = (Hazards_writeBackBuffer_payload_address == decode_R2_ADDR);
    end
  end

  assign _zz_245_ = 1'b1;
  always @ (*) begin
    _zz_246_ = 1'b0;
    if(_zz_422_)begin
      if(_zz_423_)begin
        if(_zz_424_)begin
          if(! _zz_253_) begin
            _zz_246_ = 1'b1;
          end
        end else begin
          _zz_246_ = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    _zz_247_ = 1'b0;
    if((memory_arbitration_isValid && execute_arbitration_isValid))begin
      _zz_247_ = (_zz_259_ && ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)));
    end
  end

  always @ (*) begin
    _zz_248_ = 1'b0;
    if((memory_arbitration_isValid && execute_arbitration_isValid))begin
      _zz_248_ = (((execute_DECODER_stageables_10 && (execute_SPR_ID == 11'h001)) || _zz_258_) && (memory_XER_WRITE_validCA || memory_XER_WRITE_validOV));
    end
  end

  always @ (*) begin
    _zz_249_ = 1'b0;
    if((memory_arbitration_isValid && execute_arbitration_isValid))begin
      _zz_249_ = ((memory_DECODER_stageables_17 && (memory_SPR_ID == 11'h001)) && _zz_258_);
    end
  end

  always @ (*) begin
    _zz_250_ = 1'b0;
    if((memory_arbitration_isValid && execute_arbitration_isValid))begin
      _zz_250_ = ((((((memory_SPR_ID == _zz_1524_) && memory_DECODER_stageables_17) && _zz_261_) || (((memory_SPR_ID == _zz_1525_) && memory_DECODER_stageables_17) && (execute_DECODER_stageables_25 == `BranchCtrlEnum_defaultEncoding_BCCTR))) || (((memory_SPR_ID == 11'h32f) && memory_DECODER_stageables_17) && (execute_DECODER_stageables_25 == `BranchCtrlEnum_defaultEncoding_BCTAR))) && ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)));
    end
  end

  always @ (*) begin
    _zz_251_ = 1'b0;
    if((memory_arbitration_isValid && execute_arbitration_isValid))begin
      _zz_251_ = (((memory_BRANCH_LINK && ((execute_SPR_ID == 11'h008) && (! execute_DECODER_stageables_17))) || (memory_BRANCH_DEC && ((execute_SPR_ID == 11'h009) && (! execute_DECODER_stageables_17)))) && ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)));
    end
  end

  always @ (*) begin
    _zz_252_ = 1'b0;
    if((memory_arbitration_isValid && execute_arbitration_isValid))begin
      _zz_252_ = (((memory_BRANCH_LINK && _zz_261_) || (memory_BRANCH_DEC && execute_BRANCH_DEC)) && ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)));
    end
  end

  always @ (*) begin
    _zz_253_ = 1'b0;
    if(_zz_422_)begin
      if(_zz_423_)begin
        if(_zz_424_)begin
          _zz_253_ = (_zz_255_ && _zz_256_);
        end
      end
    end
  end

  always @ (*) begin
    _zz_254_ = (4'b0000);
    if(_zz_422_)begin
      if(_zz_423_)begin
        if(_zz_424_)begin
          if(_zz_253_)begin
            _zz_254_ = memory_CR_WRITE_imm[3 : 0];
          end
        end
      end
    end
  end

  always @ (*) begin
    case(execute_DECODER_stageables_25)
      `BranchCtrlEnum_defaultEncoding_BC : begin
        _zz_255_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_BCLR : begin
        _zz_255_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_BCCTR : begin
        _zz_255_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_BCTAR : begin
        _zz_255_ = 1'b1;
      end
      default : begin
        _zz_255_ = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    _zz_256_ = 1'b0;
    if((! (memory_DECODER_stageables_34 || memory_DECODER_stageables_57)))begin
      _zz_256_ = _zz_257_;
    end
  end

  always @ (*) begin
    case(memory_CR_WRITE_op)
      `CRBusCmdEnum_defaultEncoding_CR0 : begin
        _zz_257_ = 1'b1;
      end
      `CRBusCmdEnum_defaultEncoding_CR1 : begin
        _zz_257_ = 1'b1;
      end
      `CRBusCmdEnum_defaultEncoding_CR6 : begin
        _zz_257_ = 1'b1;
      end
      `CRBusCmdEnum_defaultEncoding_CMP : begin
        _zz_257_ = 1'b1;
      end
      default : begin
        _zz_257_ = 1'b0;
      end
    endcase
  end

  assign _zz_258_ = (execute_DECODER_stageables_8 == `Src3CtrlEnum_defaultEncoding_CA);
  always @ (*) begin
    _zz_259_ = 1'b0;
    if(memory_DECODER_stageables_17)begin
      _zz_259_ = _zz_260_;
    end
  end

  always @ (*) begin
    case(_zz_435_)
      2'b10 : begin
        _zz_260_ = 1'b1;
      end
      2'b01 : begin
        _zz_260_ = execute_DECODER_stageables_10;
      end
      default : begin
        _zz_260_ = (execute_DECODER_stageables_10 && (execute_SPR_ID == memory_SPR_ID));
      end
    endcase
  end

  assign _zz_261_ = (execute_DECODER_stageables_25 == `BranchCtrlEnum_defaultEncoding_BCLR);
  always @ (*) begin
    _zz_262_ = 1'b0;
    if(_zz_425_)begin
      if(_zz_426_)begin
        if(_zz_427_)begin
          if(! _zz_269_) begin
            _zz_262_ = 1'b1;
          end
        end else begin
          _zz_262_ = 1'b1;
        end
      end
    end
  end

  always @ (*) begin
    _zz_263_ = 1'b0;
    if((writeBack_arbitration_isValid && execute_arbitration_isValid))begin
      _zz_263_ = (_zz_274_ && ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)));
    end
  end

  always @ (*) begin
    _zz_264_ = 1'b0;
    if((writeBack_arbitration_isValid && execute_arbitration_isValid))begin
      _zz_264_ = (((execute_DECODER_stageables_10 && (execute_SPR_ID == 11'h001)) || _zz_273_) && (writeBack_XER_WRITE_validCA || writeBack_XER_WRITE_validOV));
    end
  end

  always @ (*) begin
    _zz_265_ = 1'b0;
    if((writeBack_arbitration_isValid && execute_arbitration_isValid))begin
      _zz_265_ = ((writeBack_DECODER_stageables_17 && (writeBack_SPR_ID == 11'h001)) && _zz_273_);
    end
  end

  always @ (*) begin
    _zz_266_ = 1'b0;
    if((writeBack_arbitration_isValid && execute_arbitration_isValid))begin
      _zz_266_ = ((((((writeBack_SPR_ID == 11'h008) && writeBack_DECODER_stageables_17) && _zz_276_) || (((writeBack_SPR_ID == 11'h009) && writeBack_DECODER_stageables_17) && (execute_DECODER_stageables_25 == `BranchCtrlEnum_defaultEncoding_BCCTR))) || (((writeBack_SPR_ID == 11'h32f) && writeBack_DECODER_stageables_17) && (execute_DECODER_stageables_25 == `BranchCtrlEnum_defaultEncoding_BCTAR))) && ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)));
    end
  end

  always @ (*) begin
    _zz_267_ = 1'b0;
    if((writeBack_arbitration_isValid && execute_arbitration_isValid))begin
      _zz_267_ = (((writeBack_BRANCH_LINK && ((execute_SPR_ID == 11'h008) && (! execute_DECODER_stageables_17))) || (writeBack_BRANCH_DEC && ((execute_SPR_ID == 11'h009) && (! execute_DECODER_stageables_17)))) && ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)));
    end
  end

  always @ (*) begin
    _zz_268_ = 1'b0;
    if((writeBack_arbitration_isValid && execute_arbitration_isValid))begin
      _zz_268_ = (((writeBack_BRANCH_LINK && _zz_276_) || (writeBack_BRANCH_DEC && execute_BRANCH_DEC)) && ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00)));
    end
  end

  always @ (*) begin
    _zz_269_ = 1'b0;
    if(_zz_425_)begin
      if(_zz_426_)begin
        if(_zz_427_)begin
          _zz_269_ = (_zz_271_ && _zz_272_);
        end
      end
    end
  end

  always @ (*) begin
    _zz_270_ = (4'b0000);
    if(_zz_425_)begin
      if(_zz_426_)begin
        if(_zz_427_)begin
          if(_zz_269_)begin
            _zz_270_ = writeBack_CR_WRITE_imm[3 : 0];
          end
        end
      end
    end
  end

  always @ (*) begin
    case(execute_DECODER_stageables_25)
      `BranchCtrlEnum_defaultEncoding_BC : begin
        _zz_271_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_BCLR : begin
        _zz_271_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_BCCTR : begin
        _zz_271_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_BCTAR : begin
        _zz_271_ = 1'b1;
      end
      default : begin
        _zz_271_ = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(writeBack_CR_WRITE_op)
      `CRBusCmdEnum_defaultEncoding_CR0 : begin
        _zz_272_ = 1'b1;
      end
      `CRBusCmdEnum_defaultEncoding_CR1 : begin
        _zz_272_ = 1'b1;
      end
      `CRBusCmdEnum_defaultEncoding_CR6 : begin
        _zz_272_ = 1'b1;
      end
      `CRBusCmdEnum_defaultEncoding_CMP : begin
        _zz_272_ = 1'b1;
      end
      default : begin
        _zz_272_ = 1'b0;
      end
    endcase
  end

  assign _zz_273_ = (execute_DECODER_stageables_8 == `Src3CtrlEnum_defaultEncoding_CA);
  always @ (*) begin
    _zz_274_ = 1'b0;
    if(writeBack_DECODER_stageables_17)begin
      _zz_274_ = _zz_275_;
    end
  end

  always @ (*) begin
    case(_zz_436_)
      2'b10 : begin
        _zz_275_ = 1'b1;
      end
      2'b01 : begin
        _zz_275_ = execute_DECODER_stageables_10;
      end
      default : begin
        _zz_275_ = (execute_DECODER_stageables_10 && (execute_SPR_ID == writeBack_SPR_ID));
      end
    endcase
  end

  assign _zz_276_ = (execute_DECODER_stageables_25 == `BranchCtrlEnum_defaultEncoding_BCLR);
  always @ (*) begin
    case(decode_DECODER_stageables_25)
      `BranchCtrlEnum_defaultEncoding_BC : begin
        decode_BranchPlugin_bc = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_BCLR : begin
        decode_BranchPlugin_bc = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_BCCTR : begin
        decode_BranchPlugin_bc = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_BCTAR : begin
        decode_BranchPlugin_bc = 1'b1;
      end
      default : begin
        decode_BranchPlugin_bc = 1'b0;
      end
    endcase
  end

  assign decode_BranchPlugin_bi = decode_INSTRUCTION[20 : 16];
  assign decode_BranchPlugin_crbiField = decode_BranchPlugin_bi[4 : 2];
  assign decode_BranchPlugin_bo = decode_INSTRUCTION[25 : 21];
  assign decode_BranchPlugin_crbiRead = ((decode_BranchPlugin_bc && (! decode_BranchPlugin_bo[4])) && ((decode_DECODER_stageables_25 != `BranchCtrlEnum_defaultEncoding_BU) && (decode_DECODER_stageables_25 != `BranchCtrlEnum_defaultEncoding_NONE)));
  always @ (*) begin
    case(decode_BranchPlugin_crbiField)
      3'b000 : begin
        decode_BranchPlugin_crFieldRd = {decode_BranchPlugin_crbiRead,7'h0};
      end
      3'b001 : begin
        decode_BranchPlugin_crFieldRd = {{(1'b0),decode_BranchPlugin_crbiRead},6'h0};
      end
      3'b010 : begin
        decode_BranchPlugin_crFieldRd = {{(2'b00),decode_BranchPlugin_crbiRead},5'h0};
      end
      3'b011 : begin
        decode_BranchPlugin_crFieldRd = {{(3'b000),decode_BranchPlugin_crbiRead},(4'b0000)};
      end
      3'b100 : begin
        decode_BranchPlugin_crFieldRd = {{(4'b0000),decode_BranchPlugin_crbiRead},(3'b000)};
      end
      3'b101 : begin
        decode_BranchPlugin_crFieldRd = {{5'h0,decode_BranchPlugin_crbiRead},(2'b00)};
      end
      3'b110 : begin
        decode_BranchPlugin_crFieldRd = {{6'h0,decode_BranchPlugin_crbiRead},(1'b0)};
      end
      default : begin
        decode_BranchPlugin_crFieldRd = {7'h0,decode_BranchPlugin_crbiRead};
      end
    endcase
  end

  always @ (*) begin
    if(decode_BranchPlugin_crbiRead)begin
      _zz_66_ = decode_BranchPlugin_crFieldRd;
    end else begin
      if(decode_DECODER_stageables_23)begin
        _zz_66_ = 8'hff;
      end else begin
        _zz_66_ = 8'h0;
      end
    end
  end

  assign execute_BranchPlugin_ctrOne = (execute_BranchPlugin_CTR == 32'h00000001);
  always @ (*) begin
    case(execute_SPR_ID)
      11'b00000001001 : begin
        execute_BranchPlugin_sprReadData = execute_BranchPlugin_CTR;
      end
      11'b00000001000 : begin
        execute_BranchPlugin_sprReadData = execute_BranchPlugin_LR;
      end
      11'b01100101111 : begin
        execute_BranchPlugin_sprReadData = execute_BranchPlugin_TAR;
      end
      default : begin
        execute_BranchPlugin_sprReadData = execute_BranchPlugin_CR;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SPR_ID)
      11'b10000000010 : begin
        execute_BranchPlugin_sprReadValid = execute_DECODER_stageables_10;
      end
      11'b00000001001 : begin
        execute_BranchPlugin_sprReadValid = execute_DECODER_stageables_10;
      end
      11'b00000001000 : begin
        execute_BranchPlugin_sprReadValid = execute_DECODER_stageables_10;
      end
      11'b01100101111 : begin
        execute_BranchPlugin_sprReadValid = execute_DECODER_stageables_10;
      end
      default : begin
        execute_BranchPlugin_sprReadValid = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    case(execute_SPR_ID)
      11'b10000000010 : begin
        execute_BranchPlugin_crReadValid = execute_DECODER_stageables_10;
      end
      default : begin
        execute_BranchPlugin_crReadValid = 1'b0;
      end
    endcase
  end

  assign sprReadBU_valid = execute_BranchPlugin_sprReadValid;
  assign sprReadBU_payload_data = execute_BranchPlugin_sprReadData;
  assign execute_BranchPlugin_crBusPort_valid = ((writeBack_RegFilePluginComp_crBusPort_valid || _zz_234_) || DIV_MEM_crBusPort_valid);
  always @ (*) begin
    if(writeBack_RegFilePluginComp_crBusPort_valid)begin
      execute_BranchPlugin_crBusPort_op = writeBack_RegFilePluginComp_crBusPort_payload_op;
    end else begin
      if(_zz_234_)begin
        execute_BranchPlugin_crBusPort_op = _zz_235_;
      end else begin
        execute_BranchPlugin_crBusPort_op = DIV_MEM_crBusPort_payload_op;
      end
    end
  end

  always @ (*) begin
    if(writeBack_RegFilePluginComp_crBusPort_valid)begin
      execute_BranchPlugin_crBusPort_ba = writeBack_RegFilePluginComp_crBusPort_payload_ba;
    end else begin
      if(_zz_234_)begin
        execute_BranchPlugin_crBusPort_ba = 5'h0;
      end else begin
        execute_BranchPlugin_crBusPort_ba = DIV_MEM_crBusPort_payload_ba;
      end
    end
  end

  always @ (*) begin
    if(writeBack_RegFilePluginComp_crBusPort_valid)begin
      execute_BranchPlugin_crBusPort_bb = writeBack_RegFilePluginComp_crBusPort_payload_bb;
    end else begin
      if(_zz_234_)begin
        execute_BranchPlugin_crBusPort_bb = 5'h0;
      end else begin
        execute_BranchPlugin_crBusPort_bb = DIV_MEM_crBusPort_payload_bb;
      end
    end
  end

  always @ (*) begin
    if(writeBack_RegFilePluginComp_crBusPort_valid)begin
      execute_BranchPlugin_crBusPort_bt = writeBack_RegFilePluginComp_crBusPort_payload_bt;
    end else begin
      if(_zz_234_)begin
        execute_BranchPlugin_crBusPort_bt = 5'h0;
      end else begin
        execute_BranchPlugin_crBusPort_bt = DIV_MEM_crBusPort_payload_bt;
      end
    end
  end

  always @ (*) begin
    if(writeBack_RegFilePluginComp_crBusPort_valid)begin
      execute_BranchPlugin_crBusPort_imm = writeBack_RegFilePluginComp_crBusPort_payload_imm;
    end else begin
      if(_zz_234_)begin
        execute_BranchPlugin_crBusPort_imm = _zz_236_;
      end else begin
        execute_BranchPlugin_crBusPort_imm = DIV_MEM_crBusPort_payload_imm;
      end
    end
  end

  always @ (*) begin
    if(writeBack_RegFilePluginComp_crBusPort_valid)begin
      execute_BranchPlugin_crBusPort_fxm = writeBack_RegFilePluginComp_crBusPort_payload_fxm;
    end else begin
      if(_zz_234_)begin
        execute_BranchPlugin_crBusPort_fxm = 8'h0;
      end else begin
        execute_BranchPlugin_crBusPort_fxm = DIV_MEM_crBusPort_payload_fxm;
      end
    end
  end

  always @ (*) begin
    case(_zz_437_)
      3'b000 : begin
        _zz_277_ = execute_BranchPlugin_CR[31 : 28];
      end
      3'b001 : begin
        _zz_277_ = execute_BranchPlugin_CR[27 : 24];
      end
      3'b010 : begin
        _zz_277_ = execute_BranchPlugin_CR[23 : 20];
      end
      3'b011 : begin
        _zz_277_ = execute_BranchPlugin_CR[19 : 16];
      end
      3'b100 : begin
        _zz_277_ = execute_BranchPlugin_CR[15 : 12];
      end
      3'b101 : begin
        _zz_277_ = execute_BranchPlugin_CR[11 : 8];
      end
      3'b110 : begin
        _zz_277_ = execute_BranchPlugin_CR[7 : 4];
      end
      default : begin
        _zz_277_ = execute_BranchPlugin_CR[3 : 0];
      end
    endcase
  end

  assign _zz_278_ = execute_BranchPlugin_crBusPort_imm[3 : 0];
  assign _zz_279_ = execute_INSTRUCTION[25];
  always @ (*) begin
    _zz_280_[5] = _zz_279_;
    _zz_280_[4] = _zz_279_;
    _zz_280_[3] = _zz_279_;
    _zz_280_[2] = _zz_279_;
    _zz_280_[1] = _zz_279_;
    _zz_280_[0] = _zz_279_;
  end

  assign execute_BranchPlugin_li = {{_zz_280_,execute_INSTRUCTION[25 : 2]},(2'b00)};
  assign _zz_281_ = execute_INSTRUCTION[15];
  always @ (*) begin
    _zz_282_[15] = _zz_281_;
    _zz_282_[14] = _zz_281_;
    _zz_282_[13] = _zz_281_;
    _zz_282_[12] = _zz_281_;
    _zz_282_[11] = _zz_281_;
    _zz_282_[10] = _zz_281_;
    _zz_282_[9] = _zz_281_;
    _zz_282_[8] = _zz_281_;
    _zz_282_[7] = _zz_281_;
    _zz_282_[6] = _zz_281_;
    _zz_282_[5] = _zz_281_;
    _zz_282_[4] = _zz_281_;
    _zz_282_[3] = _zz_281_;
    _zz_282_[2] = _zz_281_;
    _zz_282_[1] = _zz_281_;
    _zz_282_[0] = _zz_281_;
  end

  assign execute_BranchPlugin_bd = {{_zz_282_,execute_INSTRUCTION[15 : 2]},(2'b00)};
  assign _zz_283_ = (! execute_INSTRUCTION[1]);
  always @ (*) begin
    execute_BranchPlugin_aaMask[31] = _zz_283_;
    execute_BranchPlugin_aaMask[30] = _zz_283_;
    execute_BranchPlugin_aaMask[29] = _zz_283_;
    execute_BranchPlugin_aaMask[28] = _zz_283_;
    execute_BranchPlugin_aaMask[27] = _zz_283_;
    execute_BranchPlugin_aaMask[26] = _zz_283_;
    execute_BranchPlugin_aaMask[25] = _zz_283_;
    execute_BranchPlugin_aaMask[24] = _zz_283_;
    execute_BranchPlugin_aaMask[23] = _zz_283_;
    execute_BranchPlugin_aaMask[22] = _zz_283_;
    execute_BranchPlugin_aaMask[21] = _zz_283_;
    execute_BranchPlugin_aaMask[20] = _zz_283_;
    execute_BranchPlugin_aaMask[19] = _zz_283_;
    execute_BranchPlugin_aaMask[18] = _zz_283_;
    execute_BranchPlugin_aaMask[17] = _zz_283_;
    execute_BranchPlugin_aaMask[16] = _zz_283_;
    execute_BranchPlugin_aaMask[15] = _zz_283_;
    execute_BranchPlugin_aaMask[14] = _zz_283_;
    execute_BranchPlugin_aaMask[13] = _zz_283_;
    execute_BranchPlugin_aaMask[12] = _zz_283_;
    execute_BranchPlugin_aaMask[11] = _zz_283_;
    execute_BranchPlugin_aaMask[10] = _zz_283_;
    execute_BranchPlugin_aaMask[9] = _zz_283_;
    execute_BranchPlugin_aaMask[8] = _zz_283_;
    execute_BranchPlugin_aaMask[7] = _zz_283_;
    execute_BranchPlugin_aaMask[6] = _zz_283_;
    execute_BranchPlugin_aaMask[5] = _zz_283_;
    execute_BranchPlugin_aaMask[4] = _zz_283_;
    execute_BranchPlugin_aaMask[3] = _zz_283_;
    execute_BranchPlugin_aaMask[2] = _zz_283_;
    execute_BranchPlugin_aaMask[1] = _zz_283_;
    execute_BranchPlugin_aaMask[0] = _zz_283_;
  end

  always @ (*) begin
    case(execute_DECODER_stageables_25)
      `BranchCtrlEnum_defaultEncoding_BCLR : begin
        execute_BranchPlugin_branch_tgt0 = execute_BranchPlugin_LR;
      end
      `BranchCtrlEnum_defaultEncoding_BCCTR : begin
        execute_BranchPlugin_branch_tgt0 = execute_BranchPlugin_CTR;
      end
      `BranchCtrlEnum_defaultEncoding_BCTAR : begin
        execute_BranchPlugin_branch_tgt0 = execute_BranchPlugin_TAR;
      end
      default : begin
        execute_BranchPlugin_branch_tgt0 = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    case(execute_DECODER_stageables_25)
      `BranchCtrlEnum_defaultEncoding_BU : begin
        execute_BranchPlugin_branch_tgt1 = (execute_PC & execute_BranchPlugin_aaMask);
      end
      `BranchCtrlEnum_defaultEncoding_BC : begin
        execute_BranchPlugin_branch_tgt1 = (execute_PC & execute_BranchPlugin_aaMask);
      end
      default : begin
        execute_BranchPlugin_branch_tgt1 = 32'h0;
      end
    endcase
  end

  assign execute_BranchPlugin_use_li = (execute_DECODER_stageables_25 == `BranchCtrlEnum_defaultEncoding_BU);
  assign execute_BranchPlugin_branch_tgt2 = (execute_BranchPlugin_use_li ? _zz_563_ : _zz_564_);
  always @ (*) begin
    case(execute_DECODER_stageables_25)
      `BranchCtrlEnum_defaultEncoding_BU : begin
        execute_BranchPlugin_branchAdder = _zz_565_;
      end
      `BranchCtrlEnum_defaultEncoding_BC : begin
        execute_BranchPlugin_branchAdder = _zz_566_;
      end
      default : begin
        execute_BranchPlugin_branchAdder = execute_BranchPlugin_branch_tgt0;
      end
    endcase
  end

  assign execute_BranchPlugin_opbi = execute_INSTRUCTION[20 : 16];
  assign execute_BranchPlugin_crbiField = execute_BranchPlugin_opbi[4 : 2];
  assign execute_BranchPlugin_crbiBit = execute_BranchPlugin_opbi[1 : 0];
  assign execute_BranchPlugin_bo = execute_INSTRUCTION[25 : 21];
  assign execute_BranchPlugin_crBypassPort_valid = (_zz_253_ || _zz_269_);
  always @ (*) begin
    if(_zz_253_)begin
      execute_BranchPlugin_crBypassPort_field = _zz_254_;
    end else begin
      execute_BranchPlugin_crBypassPort_field = _zz_270_;
    end
  end

  always @ (*) begin
    if(execute_BranchPlugin_crBypassPort_valid)begin
      execute_BranchPlugin_crbi = execute_BranchPlugin_crBypassPort_field[_zz_567_];
    end else begin
      case(execute_BranchPlugin_crbiField)
        3'b000 : begin
          execute_BranchPlugin_crbi = execute_BranchPlugin_CR[_zz_568_];
        end
        3'b001 : begin
          execute_BranchPlugin_crbi = execute_BranchPlugin_CR[_zz_571_];
        end
        3'b010 : begin
          execute_BranchPlugin_crbi = execute_BranchPlugin_CR[_zz_574_];
        end
        3'b011 : begin
          execute_BranchPlugin_crbi = execute_BranchPlugin_CR[_zz_577_];
        end
        3'b100 : begin
          execute_BranchPlugin_crbi = execute_BranchPlugin_CR[_zz_580_];
        end
        3'b101 : begin
          execute_BranchPlugin_crbi = execute_BranchPlugin_CR[_zz_583_];
        end
        3'b110 : begin
          execute_BranchPlugin_crbi = execute_BranchPlugin_CR[_zz_586_];
        end
        default : begin
          execute_BranchPlugin_crbi = execute_BranchPlugin_CR[_zz_589_];
        end
      endcase
    end
  end

  assign execute_BranchPlugin_ctrOK = (execute_BranchPlugin_bo[2] || ((! execute_BranchPlugin_ctrOne) ^ execute_BranchPlugin_bo[1]));
  assign execute_BranchPlugin_condOK = (execute_BranchPlugin_bo[4] || (! (execute_BranchPlugin_crbi ^ execute_BranchPlugin_bo[3])));
  assign execute_BranchPlugin_lk = execute_INSTRUCTION[0];
  always @ (*) begin
    case(execute_DECODER_stageables_25)
      `BranchCtrlEnum_defaultEncoding_NONE : begin
        _zz_284_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_BU : begin
        _zz_284_ = 1'b1;
      end
      `BranchCtrlEnum_defaultEncoding_BC : begin
        _zz_284_ = (execute_BranchPlugin_ctrOK && execute_BranchPlugin_condOK);
      end
      `BranchCtrlEnum_defaultEncoding_BCLR : begin
        _zz_284_ = (execute_BranchPlugin_ctrOK && execute_BranchPlugin_condOK);
      end
      `BranchCtrlEnum_defaultEncoding_BCCTR : begin
        _zz_284_ = execute_BranchPlugin_condOK;
      end
      default : begin
        _zz_284_ = (execute_BranchPlugin_ctrOK && execute_BranchPlugin_condOK);
      end
    endcase
  end

  always @ (*) begin
    case(execute_DECODER_stageables_25)
      `BranchCtrlEnum_defaultEncoding_NONE : begin
        _zz_285_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_BU : begin
        _zz_285_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_BC : begin
        _zz_285_ = (! execute_BranchPlugin_bo[2]);
      end
      `BranchCtrlEnum_defaultEncoding_BCLR : begin
        _zz_285_ = (! execute_BranchPlugin_bo[2]);
      end
      `BranchCtrlEnum_defaultEncoding_BCCTR : begin
        _zz_285_ = 1'b0;
      end
      default : begin
        _zz_285_ = (! execute_BranchPlugin_bo[2]);
      end
    endcase
  end

  always @ (*) begin
    case(execute_DECODER_stageables_25)
      `BranchCtrlEnum_defaultEncoding_NONE : begin
        _zz_286_ = 1'b0;
      end
      `BranchCtrlEnum_defaultEncoding_BU : begin
        _zz_286_ = execute_BranchPlugin_lk;
      end
      `BranchCtrlEnum_defaultEncoding_BC : begin
        _zz_286_ = execute_BranchPlugin_lk;
      end
      `BranchCtrlEnum_defaultEncoding_BCLR : begin
        _zz_286_ = execute_BranchPlugin_lk;
      end
      `BranchCtrlEnum_defaultEncoding_BCCTR : begin
        _zz_286_ = execute_BranchPlugin_lk;
      end
      default : begin
        _zz_286_ = execute_BranchPlugin_lk;
      end
    endcase
  end

  assign memory_BranchPlugin_predictionMissmatch = ((IBusCachedPlugin_fetchPrediction_cmd_hadBranch != memory_BRANCH_DO) || (memory_BRANCH_DO && memory_TARGET_MISSMATCH2));
  assign IBusCachedPlugin_fetchPrediction_rsp_wasRight = (! memory_BranchPlugin_predictionMissmatch);
  assign IBusCachedPlugin_fetchPrediction_rsp_finalPc = memory_BRANCH_CALC;
  assign IBusCachedPlugin_fetchPrediction_rsp_sourceLastWord = memory_PC;
  assign BranchPlugin_jumpInterface_valid = ((memory_arbitration_isValid && memory_BranchPlugin_predictionMissmatch) && (! 1'b0));
  assign BranchPlugin_jumpInterface_payload = (memory_BRANCH_DO ? memory_BRANCH_CALC : memory_NEXT_PC2);
  assign BranchPlugin_branchExceptionPort_valid = ((memory_arbitration_isValid && memory_BRANCH_DO) && memory_BRANCH_CALC[1]);
  assign BranchPlugin_branchExceptionPort_payload_code = (4'b0000);
  always @ (*) begin
    SPRPlugin_msr_ir = MSR_IR;
    if(_zz_397_)begin
      SPRPlugin_msr_ir = 1'b0;
    end
    if(_zz_398_)begin
      SPRPlugin_msr_ir = 1'b0;
    end
    if(_zz_400_)begin
      SPRPlugin_msr_ir = SPRPlugin_srr1[5];
    end
  end

  assign SPRPlugin_msr_dr = MSR_DR;
  assign SPRPlugin_msr_pr = MSR_PR;
  assign SPRPlugin_incTB = 1'b1;
  always @ (*) begin
    SPRPlugin_intDecTkn = 1'b0;
    if(_zz_395_)begin
      SPRPlugin_intDecTkn = (SPRPlugin_intType == `ExcpEnum_defaultEncoding_DEC);
    end
  end

  assign _zz_288_ = {decodeExceptionPort_valid,IBusCachedPlugin_decodeExceptionPort_valid};
  assign _zz_289_ = _zz_591_[0];
  assign _zz_290_ = (_zz_289_ ? IBusCachedPlugin_decodeExceptionPort_payload_codePPC : decodeExceptionPort_payload_codePPC);
  assign _zz_287_ = _zz_290_;
  always @ (*) begin
    SPRPlugin_exceptionPortCtrl_exceptionValids_decode = SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
    if(_zz_394_)begin
      SPRPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b1;
    end
    if(decode_arbitration_isFlushed)begin
      SPRPlugin_exceptionPortCtrl_exceptionValids_decode = 1'b0;
    end
  end

  always @ (*) begin
    SPRPlugin_exceptionPortCtrl_exceptionValids_execute = SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
    if(SPRPlugin_selfException_valid)begin
      SPRPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b1;
    end
    if(execute_arbitration_isFlushed)begin
      SPRPlugin_exceptionPortCtrl_exceptionValids_execute = 1'b0;
    end
  end

  always @ (*) begin
    SPRPlugin_exceptionPortCtrl_exceptionValids_memory = SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
    if(BranchPlugin_branchExceptionPort_valid)begin
      SPRPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b1;
    end
    if(memory_arbitration_isFlushed)begin
      SPRPlugin_exceptionPortCtrl_exceptionValids_memory = 1'b0;
    end
  end

  always @ (*) begin
    SPRPlugin_exceptionPortCtrl_exceptionValids_writeBack = SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
    if(DBusCachedPlugin_exceptionBus_valid)begin
      SPRPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b1;
    end
    if(writeBack_arbitration_isFlushed)begin
      SPRPlugin_exceptionPortCtrl_exceptionValids_writeBack = 1'b0;
    end
  end

  always @ (*) begin
    case(SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC)
      `ExcpEnum_defaultEncoding_SC : begin
        _zz_291_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_SCV : begin
        _zz_291_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_TRAP : begin
        _zz_291_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_RFI : begin
        _zz_291_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_RFSCV : begin
        _zz_291_ = 1'b0;
      end
      default : begin
        _zz_291_ = 1'b1;
      end
    endcase
  end

  always @ (*) begin
    case(SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC)
      `ExcpEnum_defaultEncoding_SC : begin
        _zz_292_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_SCV : begin
        _zz_292_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_TRAP : begin
        _zz_292_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_RFI : begin
        _zz_292_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_RFSCV : begin
        _zz_292_ = 1'b0;
      end
      default : begin
        _zz_292_ = 1'b1;
      end
    endcase
  end

  always @ (*) begin
    case(SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC)
      `ExcpEnum_defaultEncoding_SC : begin
        _zz_293_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_SCV : begin
        _zz_293_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_TRAP : begin
        _zz_293_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_RFI : begin
        _zz_293_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_RFSCV : begin
        _zz_293_ = 1'b0;
      end
      default : begin
        _zz_293_ = 1'b1;
      end
    endcase
  end

  always @ (*) begin
    case(SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC)
      `ExcpEnum_defaultEncoding_SC : begin
        _zz_294_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_SCV : begin
        _zz_294_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_TRAP : begin
        _zz_294_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_RFI : begin
        _zz_294_ = 1'b0;
      end
      `ExcpEnum_defaultEncoding_RFSCV : begin
        _zz_294_ = 1'b0;
      end
      default : begin
        _zz_294_ = 1'b1;
      end
    endcase
  end

  assign SPRPlugin_exceptionPendings_0 = SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_decode;
  assign SPRPlugin_exceptionPendings_1 = SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_execute;
  assign SPRPlugin_exceptionPendings_2 = SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_memory;
  assign SPRPlugin_exceptionPendings_3 = SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack;
  assign SPRPlugin_pipelineLiberator_active = ((SPRPlugin_interrupt_valid && SPRPlugin_allowInterrupts) && decode_arbitration_isValid);
  always @ (*) begin
    SPRPlugin_pipelineLiberator_done = SPRPlugin_pipelineLiberator_pcValids_2;
    if(({SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack,{SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_memory,SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_execute}} != (3'b000)))begin
      SPRPlugin_pipelineLiberator_done = 1'b0;
    end
    if(SPRPlugin_hadException)begin
      SPRPlugin_pipelineLiberator_done = 1'b0;
    end
  end

  assign SPRPlugin_exception = (SPRPlugin_exceptionPortCtrl_exceptionValids_writeBack && SPRPlugin_allowException);
  always @ (*) begin
    SPRPlugin_interruptJump = 1'b0;
    if(_zz_428_)begin
      SPRPlugin_interruptJump = ((SPRPlugin_interrupt_valid && SPRPlugin_pipelineLiberator_done) && SPRPlugin_allowInterrupts);
    end
  end

  always @ (*) begin
    SPRPlugin_intType = `ExcpEnum_defaultEncoding_NONE;
    if(_zz_395_)begin
      if(SPRPlugin_interruptJump)begin
        case(SPRPlugin_interrupt_code)
          4'b1001 : begin
            SPRPlugin_intType = `ExcpEnum_defaultEncoding_DEC;
          end
          default : begin
          end
        endcase
      end else begin
        SPRPlugin_intType = SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC;
      end
    end
  end

  always @ (*) begin
    SPRPlugin_intSRR0 = 32'h0;
    if(_zz_395_)begin
      if(SPRPlugin_interruptJump)begin
        SPRPlugin_intSRR0 = writeBack_PC;
      end else begin
        SPRPlugin_intSRR0 = SPRPlugin_exceptionPortCtrl_exceptionContext_badAddr;
      end
    end
  end

  always @ (*) begin
    case(SPRPlugin_intType)
      `ExcpEnum_defaultEncoding_SR : begin
        _zz_295_ = 32'h00000100;
      end
      `ExcpEnum_defaultEncoding_MC : begin
        _zz_295_ = 32'h00000200;
      end
      `ExcpEnum_defaultEncoding_EXT : begin
        _zz_295_ = 32'h00000500;
      end
      `ExcpEnum_defaultEncoding_DEC : begin
        _zz_295_ = 32'h00000900;
      end
      `ExcpEnum_defaultEncoding_PM : begin
        _zz_295_ = 32'h00000f00;
      end
      `ExcpEnum_defaultEncoding_DSI : begin
        _zz_295_ = 32'h00000300;
      end
      `ExcpEnum_defaultEncoding_DSI_PROT : begin
        _zz_295_ = 32'h00000300;
      end
      `ExcpEnum_defaultEncoding_ISI : begin
        _zz_295_ = 32'h00000400;
      end
      `ExcpEnum_defaultEncoding_ISI_PROT : begin
        _zz_295_ = 32'h00000400;
      end
      `ExcpEnum_defaultEncoding_ALG : begin
        _zz_295_ = 32'h00000600;
      end
      `ExcpEnum_defaultEncoding_PGM_ILL : begin
        _zz_295_ = 32'h00000700;
      end
      `ExcpEnum_defaultEncoding_PGM_PRV : begin
        _zz_295_ = 32'h00000700;
      end
      `ExcpEnum_defaultEncoding_FP : begin
        _zz_295_ = 32'h00000800;
      end
      `ExcpEnum_defaultEncoding_TR : begin
        _zz_295_ = 32'h00000d00;
      end
      `ExcpEnum_defaultEncoding_VEC : begin
        _zz_295_ = 32'h00000f20;
      end
      `ExcpEnum_defaultEncoding_VSX : begin
        _zz_295_ = 32'h00000f40;
      end
      `ExcpEnum_defaultEncoding_FAC : begin
        _zz_295_ = 32'h00000f60;
      end
      default : begin
        _zz_295_ = 32'h0;
      end
    endcase
  end

  always @ (*) begin
    if(MSR_LE)begin
      _zz_65_ = `EndianEnum_defaultEncoding_LE;
    end else begin
      _zz_65_ = `EndianEnum_defaultEncoding_BE;
    end
  end

  assign execute_SPRPLUGIN_blockedBySideEffects = ({writeBack_arbitration_isValid,memory_arbitration_isValid} != (2'b00));
  always @ (*) begin
    case(execute_SPR_ID)
      11'b10000000001 : begin
        execute_SPRPLUGIN_sprHere = 1'b1;
      end
      11'b00000011010 : begin
        execute_SPRPLUGIN_sprHere = 1'b1;
      end
      11'b00000011011 : begin
        execute_SPRPLUGIN_sprHere = 1'b1;
      end
      11'b00000010011 : begin
        execute_SPRPLUGIN_sprHere = 1'b1;
      end
      11'b00000010010 : begin
        execute_SPRPLUGIN_sprHere = 1'b1;
      end
      11'b00100001100 : begin
        execute_SPRPLUGIN_sprHere = 1'b1;
      end
      11'b00000010110 : begin
        execute_SPRPLUGIN_sprHere = 1'b1;
      end
      11'b00100000011 : begin
        execute_SPRPLUGIN_sprHere = 1'b1;
      end
      default : begin
        execute_SPRPLUGIN_sprHere = 1'b0;
      end
    endcase
  end

  always @ (*) begin
    execute_SPRPLUGIN_illegalAccess = 1'b1;
    if((! execute_SPRPLUGIN_sprHere))begin
      execute_SPRPLUGIN_illegalAccess = 1'b0;
    end
    if(execute_arbitration_isValid)begin
      if((execute_DECODER_stageables_28 && SPRPlugin_msr_pr))begin
        execute_SPRPLUGIN_illegalAccess = 1'b1;
      end
    end
    if(execute_SPRPLUGIN_SPR_1025)begin
      execute_SPRPLUGIN_illegalAccess = 1'b0;
    end
    if(execute_SPRPLUGIN_SPR_26)begin
      execute_SPRPLUGIN_illegalAccess = 1'b0;
    end
    if(execute_SPRPLUGIN_SPR_27)begin
      execute_SPRPLUGIN_illegalAccess = 1'b0;
    end
    if(execute_SPRPLUGIN_SPR_19)begin
      execute_SPRPLUGIN_illegalAccess = 1'b0;
    end
    if(execute_SPRPLUGIN_SPR_259)begin
      execute_SPRPLUGIN_illegalAccess = 1'b0;
    end
    if(execute_SPRPLUGIN_SPR_18)begin
      execute_SPRPLUGIN_illegalAccess = 1'b0;
    end
    if(execute_SPRPLUGIN_SPR_268)begin
      execute_SPRPLUGIN_illegalAccess = 1'b0;
    end
    if(execute_SPRPLUGIN_SPR_22)begin
      execute_SPRPLUGIN_illegalAccess = 1'b0;
    end
    if(execute_SPRPLUGIN_privViolation)begin
      execute_SPRPLUGIN_illegalAccess = 1'b1;
    end
    if(((! execute_arbitration_isValid) || (! execute_DECODER_stageables_9)))begin
      execute_SPRPLUGIN_illegalAccess = 1'b0;
    end
  end

  always @ (*) begin
    SPRPlugin_selfException_valid = 1'b0;
    if(execute_SPRPLUGIN_illegalAccess)begin
      SPRPlugin_selfException_valid = 1'b1;
    end
  end

  always @ (*) begin
    SPRPlugin_selfException_payload_code = (4'bxxxx);
    if(execute_SPRPLUGIN_illegalAccess)begin
      SPRPlugin_selfException_payload_code = (4'b0010);
    end
  end

  assign _zz_296_ = execute_INSTRUCTION[15];
  always @ (*) begin
    _zz_297_[15] = _zz_296_;
    _zz_297_[14] = _zz_296_;
    _zz_297_[13] = _zz_296_;
    _zz_297_[12] = _zz_296_;
    _zz_297_[11] = _zz_296_;
    _zz_297_[10] = _zz_296_;
    _zz_297_[9] = _zz_296_;
    _zz_297_[8] = _zz_296_;
    _zz_297_[7] = _zz_296_;
    _zz_297_[6] = _zz_296_;
    _zz_297_[5] = _zz_296_;
    _zz_297_[4] = _zz_296_;
    _zz_297_[3] = _zz_296_;
    _zz_297_[2] = _zz_296_;
    _zz_297_[1] = _zz_296_;
    _zz_297_[0] = _zz_296_;
  end

  assign execute_SPRPLUGIN_si = {_zz_297_,execute_INSTRUCTION[15 : 0]};
  assign execute_SPRPLUGIN_tmask = execute_INSTRUCTION[25 : 21];
  always @ (*) begin
    execute_SPRPLUGIN_trap = 1'b0;
    if(execute_arbitration_isValid)begin
      if(_zz_384_)begin
        if(($signed(_zz_593_) < $signed(_zz_594_)))begin
          execute_SPRPLUGIN_trap = execute_SPRPLUGIN_tmask[4];
        end else begin
          if(($signed(_zz_595_) < $signed(_zz_596_)))begin
            execute_SPRPLUGIN_trap = execute_SPRPLUGIN_tmask[3];
          end else begin
            if((execute_SRC1 == execute_SRC2))begin
              execute_SPRPLUGIN_trap = execute_SPRPLUGIN_tmask[2];
            end else begin
              if((execute_SRC1 < execute_SRC2))begin
                execute_SPRPLUGIN_trap = execute_SPRPLUGIN_tmask[1];
              end else begin
                if((execute_SRC2 < execute_SRC1))begin
                  execute_SPRPLUGIN_trap = execute_SPRPLUGIN_tmask[0];
                end
              end
            end
          end
        end
      end
    end
  end

  assign execute_SPRPLUGIN_opExcp_codePPC = `ExcpEnum_defaultEncoding_NONE;
  assign execute_SPRPLUGIN_opExcp_imm = 7'h0;
  assign execute_SPRPLUGIN_opExcp_badAddr = execute_PC;
  always @ (*) begin
    _zz_298_ = 1'b0;
    if(($signed(_zz_597_) < $signed(_zz_598_)))begin
      _zz_298_ = execute_SPRPLUGIN_tmask[4];
    end else begin
      if(($signed(_zz_599_) < $signed(_zz_600_)))begin
        _zz_298_ = execute_SPRPLUGIN_tmask[3];
      end else begin
        if((execute_SRC1 == execute_SPRPLUGIN_si))begin
          _zz_298_ = execute_SPRPLUGIN_tmask[2];
        end else begin
          if((execute_SRC1 < execute_SPRPLUGIN_si))begin
            _zz_298_ = execute_SPRPLUGIN_tmask[1];
          end else begin
            if((execute_SPRPLUGIN_si < execute_SRC1))begin
              _zz_298_ = execute_SPRPLUGIN_tmask[0];
            end
          end
        end
      end
    end
  end

  assign execute_SPRPLUGIN_readToWriteData = execute_SPRPLUGIN_readData;
  assign execute_SPRPLUGIN_sprg3read = 1'b0;
  assign execute_SPRPLUGIN_privViolation = ((execute_SPRPLUGIN_sprHere && MSR_PR) && (! execute_SPRPLUGIN_sprg3read));
  assign execute_SPRPLUGIN_readInstruction = ((((execute_arbitration_isValid && execute_SPRPLUGIN_sprHere) && execute_DECODER_stageables_10) && execute_DECODER_stageables_9) && (! execute_SPRPLUGIN_privViolation));
  assign execute_SPRPLUGIN_readEnable = ((execute_SPRPLUGIN_readInstruction && (! execute_SPRPLUGIN_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  assign execute_SPRPLUGIN_writeInstruction = ((((execute_arbitration_isValid && execute_SPRPLUGIN_sprHere) && execute_DECODER_stageables_17) && execute_DECODER_stageables_9) && (! execute_SPRPLUGIN_privViolation));
  assign execute_SPRPLUGIN_writeEnable = ((execute_SPRPLUGIN_writeInstruction && (! execute_SPRPLUGIN_blockedBySideEffects)) && (! execute_arbitration_isStuckByOthers));
  always @ (*) begin
    execute_SPRPLUGIN_SPRAddress = {(1'b0),execute_SPR_ID[9 : 0]};
    if((execute_DECODER_stageables_14 == `EnvCtrlEnum_defaultEncoding_MFMSR))begin
      execute_SPRPLUGIN_SPRAddress = 11'h401;
    end else begin
      if((execute_DECODER_stageables_14 == `EnvCtrlEnum_defaultEncoding_MTMSR))begin
        execute_SPRPLUGIN_SPRAddress = 11'h401;
      end
    end
  end

  assign contextSwitching = SPRPlugin_jumpInterface_valid;
  assign _zz_60_ = decode_DECODER_stageables_42;
  assign _zz_58_ = _zz_93_;
  assign _zz_85_ = decode_to_execute_DECODER_stageables_42;
  assign _zz_57_ = decode_DECODER_stageables_25;
  assign _zz_67_ = _zz_99_;
  assign _zz_69_ = decode_to_execute_DECODER_stageables_25;
  assign _zz_55_ = decode_DECODER_stageables_18;
  assign _zz_53_ = _zz_100_;
  assign _zz_79_ = decode_to_execute_DECODER_stageables_18;
  assign _zz_52_ = decode_DECODER_stageables_12;
  assign _zz_50_ = _zz_102_;
  assign _zz_73_ = decode_to_execute_DECODER_stageables_12;
  assign _zz_49_ = decode_DECODER_stageables_52;
  assign _zz_47_ = _zz_91_;
  assign _zz_86_ = decode_to_execute_DECODER_stageables_52;
  assign _zz_46_ = decode_DECODER_stageables_39;
  assign _zz_44_ = _zz_95_;
  assign _zz_87_ = decode_to_execute_DECODER_stageables_39;
  assign _zz_43_ = decode_DECODER_stageables_14;
  assign _zz_63_ = execute_DECODER_stageables_14;
  assign _zz_40_ = memory_DECODER_stageables_14;
  assign _zz_41_ = _zz_101_;
  assign _zz_64_ = decode_to_execute_DECODER_stageables_14;
  assign _zz_38_ = execute_to_memory_DECODER_stageables_14;
  assign _zz_61_ = memory_to_writeBack_DECODER_stageables_14;
  assign _zz_37_ = decode_DECODER_stageables_1;
  assign _zz_35_ = _zz_104_;
  assign _zz_84_ = decode_to_execute_DECODER_stageables_1;
  assign _zz_34_ = decode_DECODER_stageables_40;
  assign _zz_32_ = _zz_94_;
  assign _zz_83_ = decode_to_execute_DECODER_stageables_40;
  assign _zz_31_ = decode_MSR_ENDIAN;
  assign _zz_29_ = execute_MSR_ENDIAN;
  assign _zz_27_ = memory_MSR_ENDIAN;
  assign _zz_112_ = _zz_65_;
  assign _zz_109_ = decode_to_execute_MSR_ENDIAN;
  assign _zz_25_ = execute_to_memory_MSR_ENDIAN;
  assign _zz_106_ = memory_to_writeBack_MSR_ENDIAN;
  assign _zz_24_ = decode_DECODER_stageables_32;
  assign _zz_21_ = execute_DATA_SIZE;
  assign _zz_19_ = memory_DECODER_stageables_32;
  assign _zz_22_ = _zz_96_;
  assign _zz_108_ = decode_to_execute_DECODER_stageables_32;
  assign _zz_17_ = execute_to_memory_DECODER_stageables_32;
  assign _zz_105_ = memory_to_writeBack_DECODER_stageables_32;
  assign _zz_16_ = decode_DECODER_stageables_49;
  assign _zz_14_ = _zz_92_;
  assign _zz_80_ = decode_to_execute_DECODER_stageables_49;
  assign _zz_13_ = execute_CR_WRITE_op;
  assign _zz_10_ = memory_CR_WRITE_op;
  assign _zz_11_ = _zz_78_;
  assign _zz_68_ = execute_to_memory_CR_WRITE_op;
  assign _zz_88_ = memory_to_writeBack_CR_WRITE_op;
  assign _zz_8_ = decode_DECODER_stageables_8;
  assign _zz_6_ = _zz_103_;
  assign _zz_72_ = decode_to_execute_DECODER_stageables_8;
  assign _zz_5_ = decode_DECODER_stageables_27;
  assign _zz_3_ = _zz_97_;
  assign _zz_74_ = decode_to_execute_DECODER_stageables_27;
  assign _zz_2_ = decode_DECODER_stageables_26;
  assign _zz_90_ = _zz_98_;
  assign _zz_82_ = decode_to_execute_DECODER_stageables_26;
  assign decode_arbitration_isFlushed = (({writeBack_arbitration_flushNext,{memory_arbitration_flushNext,execute_arbitration_flushNext}} != (3'b000)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != (4'b0000)));
  assign execute_arbitration_isFlushed = (({writeBack_arbitration_flushNext,memory_arbitration_flushNext} != (2'b00)) || ({writeBack_arbitration_flushIt,{memory_arbitration_flushIt,execute_arbitration_flushIt}} != (3'b000)));
  assign memory_arbitration_isFlushed = ((writeBack_arbitration_flushNext != (1'b0)) || ({writeBack_arbitration_flushIt,memory_arbitration_flushIt} != (2'b00)));
  assign writeBack_arbitration_isFlushed = (1'b0 || (writeBack_arbitration_flushIt != (1'b0)));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memory_arbitration_isStuck) || writeBack_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memory_arbitration_isStuckByOthers = (memory_arbitration_haltByOther || (1'b0 || writeBack_arbitration_isStuck));
  assign memory_arbitration_isStuck = (memory_arbitration_haltItself || memory_arbitration_isStuckByOthers);
  assign memory_arbitration_isMoving = ((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt));
  assign memory_arbitration_isFiring = ((memory_arbitration_isValid && (! memory_arbitration_isStuck)) && (! memory_arbitration_removeIt));
  assign writeBack_arbitration_isStuckByOthers = (writeBack_arbitration_haltByOther || 1'b0);
  assign writeBack_arbitration_isStuck = (writeBack_arbitration_haltItself || writeBack_arbitration_isStuckByOthers);
  assign writeBack_arbitration_isMoving = ((! writeBack_arbitration_isStuck) && (! writeBack_arbitration_removeIt));
  assign writeBack_arbitration_isFiring = ((writeBack_arbitration_isValid && (! writeBack_arbitration_isStuck)) && (! writeBack_arbitration_removeIt));
  always @ (*) begin
    _zz_299_ = {{(1'b0),decode_INSTRUCTION[15 : 11]},decode_INSTRUCTION[20 : 16]};
    if((decode_DECODER_stageables_14 == `EnvCtrlEnum_defaultEncoding_MFMSR))begin
      _zz_299_ = 11'h401;
    end else begin
      if((decode_DECODER_stageables_14 == `EnvCtrlEnum_defaultEncoding_MTMSR))begin
        _zz_299_ = 11'h401;
      end
    end
  end

  always @ (*) begin
    _zz_300_ = 32'h0;
    if(execute_SPRPLUGIN_SPR_1025)begin
      _zz_300_[23 : 23] = MSR_VSX;
      _zz_300_[8 : 8] = MSR_FE1;
      _zz_300_[11 : 11] = MSR_FE0;
      _zz_300_[2 : 2] = MSR_PMM;
      _zz_300_[5 : 5] = MSR_IR;
      _zz_300_[14 : 14] = MSR_PR;
      _zz_300_[13 : 13] = MSR_FP;
      _zz_300_[4 : 4] = MSR_DR;
      _zz_300_[25 : 25] = MSR_VEC;
      _zz_300_[1 : 1] = MSR_RI;
      _zz_300_[12 : 12] = MSR_ME;
      _zz_300_[15 : 15] = MSR_EE;
      _zz_300_[0 : 0] = MSR_LE;
    end
  end

  always @ (*) begin
    _zz_301_ = 32'h0;
    if(execute_SPRPLUGIN_SPR_26)begin
      _zz_301_[31 : 0] = SPRPlugin_srr0;
    end
  end

  always @ (*) begin
    _zz_302_ = 32'h0;
    if(execute_SPRPLUGIN_SPR_27)begin
      _zz_302_[31 : 0] = SPRPlugin_srr1;
    end
  end

  always @ (*) begin
    _zz_303_ = 32'h0;
    if(execute_SPRPLUGIN_SPR_19)begin
      _zz_303_[31 : 0] = SPRPlugin_dar;
    end
  end

  always @ (*) begin
    _zz_304_ = 32'h0;
    if(execute_SPRPLUGIN_SPR_259)begin
      _zz_304_[31 : 0] = SPRPlugin_sprg3;
    end
  end

  always @ (*) begin
    _zz_305_ = 32'h0;
    if(execute_SPRPLUGIN_SPR_18)begin
      _zz_305_[31 : 0] = SPRPlugin_dsisr;
    end
  end

  always @ (*) begin
    _zz_306_ = 32'h0;
    if(execute_SPRPLUGIN_SPR_268)begin
      _zz_306_[31 : 0] = SPRPlugin_tb;
    end
  end

  always @ (*) begin
    _zz_307_ = 32'h0;
    if(execute_SPRPLUGIN_SPR_22)begin
      _zz_307_[31 : 0] = SPRPlugin_dec;
    end
  end

  assign execute_SPRPLUGIN_readData = (((_zz_300_ | _zz_301_) | (_zz_302_ | _zz_303_)) | ((_zz_304_ | _zz_305_) | (_zz_306_ | _zz_307_)));
  assign iBusWB_ADR = {_zz_614_,_zz_308_};
  assign iBusWB_CTI = ((_zz_308_ == (3'b111)) ? (3'b111) : (3'b010));
  assign iBusWB_BTE = (2'b00);
  assign iBusWB_SEL = (4'b1111);
  assign iBusWB_WE = 1'b0;
  assign iBusWB_DAT_MOSI = 32'h0;
  always @ (*) begin
    iBusWB_CYC = 1'b0;
    if(_zz_429_)begin
      iBusWB_CYC = 1'b1;
    end
  end

  always @ (*) begin
    iBusWB_STB = 1'b0;
    if(_zz_429_)begin
      iBusWB_STB = 1'b1;
    end
  end

  assign iBus_cmd_ready = (iBus_cmd_valid && iBusWB_ACK);
  assign iBus_rsp_valid = _zz_309_;
  assign iBus_rsp_payload_data = iBusWB_DAT_MISO_regNext;
  assign iBus_rsp_payload_error = 1'b0;
  assign _zz_315_ = (dBus_cmd_payload_length != (3'b000));
  assign _zz_311_ = dBus_cmd_valid;
  assign _zz_313_ = dBus_cmd_payload_wr;
  assign _zz_314_ = (_zz_310_ == dBus_cmd_payload_length);
  assign dBus_cmd_ready = (_zz_312_ && (_zz_313_ || _zz_314_));
  assign dBusWB_ADR = ((_zz_315_ ? {{dBus_cmd_payload_address[31 : 5],_zz_310_},(2'b00)} : {dBus_cmd_payload_address[31 : 2],(2'b00)}) >>> 2);
  assign dBusWB_CTI = (_zz_315_ ? (_zz_314_ ? (3'b111) : (3'b010)) : (3'b000));
  assign dBusWB_BTE = (2'b00);
  assign dBusWB_SEL = (_zz_313_ ? dBus_cmd_payload_mask : (4'b1111));
  assign dBusWB_WE = _zz_313_;
  assign dBusWB_DAT_MOSI = dBus_cmd_payload_data;
  assign _zz_312_ = (_zz_311_ && dBusWB_ACK);
  assign dBusWB_CYC = _zz_311_;
  assign dBusWB_STB = _zz_311_;
  assign dBus_rsp_valid = _zz_316_;
  assign dBus_rsp_payload_data = dBusWB_DAT_MISO_regNext;
  assign dBus_rsp_payload_error = 1'b0;
 //wtf ********************************************************************************
  // get rid of yosys: module $_ALDFFE_PPP_ not found
  always @ (posedge clk) begin
    if (reset) begin
      IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;
    end
  end

  always @ (posedge clk or posedge reset) begin
    if (reset) begin
      //IBusCachedPlugin_fetchPc_pcReg <= externalResetVector;

      IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      IBusCachedPlugin_fetchPc_booted <= 1'b0;
      IBusCachedPlugin_fetchPc_inc <= 1'b0;
      _zz_119_ <= 1'b0;
      _zz_122_ <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      IBusCachedPlugin_rspCounter <= _zz_126_;
      IBusCachedPlugin_rspCounter <= 32'h0;
      dataCache_1__io_mem_cmd_m2sPipe_rValid <= 1'b0;
      DBusCachedPlugin_rspCounter <= _zz_127_;
      DBusCachedPlugin_rspCounter <= 32'h0;
      _zz_218_ <= 1'b1;
      execute_IntAluPluginComp_XER <= 32'h0;
      Hazards_writeBackBuffer_valid <= 1'b0;
      execute_BranchPlugin_CR <= 32'h0;
      execute_BranchPlugin_CTR <= 32'h0;
      execute_BranchPlugin_LR <= 32'h0;
      execute_BranchPlugin_TAR <= 32'h0;
      MSR_VEC <= 1'b0;
      MSR_VSX <= 1'b0;
      MSR_EE <= 1'b0;
      MSR_PR <= 1'b0;
      MSR_FP <= 1'b0;
      MSR_ME <= 1'b0;
      MSR_FE0 <= 1'b0;
      MSR_FE1 <= 1'b0;
      MSR_IR <= 1'b0;
      MSR_DR <= 1'b0;
      MSR_PMM <= 1'b0;
      MSR_RI <= 1'b0;
      MSR_LE <= 1'b0;
      SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= 1'b0;
      SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= 1'b0;
      SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      SPRPlugin_interrupt_valid <= 1'b0;
      SPRPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
      SPRPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
      SPRPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      SPRPlugin_hadException <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memory_arbitration_isValid <= 1'b0;
      writeBack_arbitration_isValid <= 1'b0;
      memory_to_writeBack_REGFILE_WRITE_DATA <= 32'h0;
      memory_to_writeBack_INSTRUCTION <= 32'h0;
      _zz_308_ <= (3'b000);
      _zz_309_ <= 1'b0;
      _zz_310_ <= (3'b000);
      _zz_316_ <= 1'b0;
    end else begin
      if(IBusCachedPlugin_fetchPc_correction)begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b1;
      end
      if((IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_correctionReg <= 1'b0;
      end
      IBusCachedPlugin_fetchPc_booted <= 1'b1;
      if((IBusCachedPlugin_fetchPc_correction || IBusCachedPlugin_fetchPc_pcRegPropagate))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_output_valid && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b1;
      end
      if(((! IBusCachedPlugin_fetchPc_output_valid) && IBusCachedPlugin_fetchPc_output_ready))begin
        IBusCachedPlugin_fetchPc_inc <= 1'b0;
      end
      if((IBusCachedPlugin_fetchPc_booted && ((IBusCachedPlugin_fetchPc_output_ready || IBusCachedPlugin_fetchPc_correction) || IBusCachedPlugin_fetchPc_pcRegPropagate)))begin
        IBusCachedPlugin_fetchPc_pcReg <= IBusCachedPlugin_fetchPc_pc;
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_119_ <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_0_output_ready)begin
        _zz_119_ <= (IBusCachedPlugin_iBusRsp_stages_0_output_valid && (! 1'b0));
      end
      if(IBusCachedPlugin_iBusRsp_flush)begin
        _zz_122_ <= 1'b0;
      end
      if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
        _zz_122_ <= (IBusCachedPlugin_iBusRsp_stages_1_output_valid && (! IBusCachedPlugin_iBusRsp_flush));
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_stages_1_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_0 <= 1'b1;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if((! (! IBusCachedPlugin_iBusRsp_stages_2_input_ready)))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= IBusCachedPlugin_injector_nextPcCalc_valids_0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_1 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if((! execute_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= IBusCachedPlugin_injector_nextPcCalc_valids_1;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_2 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if((! memory_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= IBusCachedPlugin_injector_nextPcCalc_valids_2;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_3 <= 1'b0;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if((! writeBack_arbitration_isStuck))begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= IBusCachedPlugin_injector_nextPcCalc_valids_3;
      end
      if(IBusCachedPlugin_fetchPc_flushed)begin
        IBusCachedPlugin_injector_nextPcCalc_valids_4 <= 1'b0;
      end
      if(iBus_rsp_valid)begin
        IBusCachedPlugin_rspCounter <= (IBusCachedPlugin_rspCounter + 32'h00000001);
      end
      if(_zz_342_)begin
        dataCache_1__io_mem_cmd_m2sPipe_rValid <= dataCache_1__io_mem_cmd_valid;
      end
      if(dBus_rsp_valid)begin
        DBusCachedPlugin_rspCounter <= (DBusCachedPlugin_rspCounter + 32'h00000001);
      end
      _zz_218_ <= 1'b0;
      execute_IntAluPluginComp_XER[31 : 29] <= execute_IntAluPluginComp_XER[31 : 29];
      if(_zz_222_)begin
        if(_zz_219_)begin
          execute_IntAluPluginComp_XER[30] <= _zz_221_[1];
          execute_IntAluPluginComp_XER[31] <= (execute_IntAluPluginComp_XER[31] || _zz_221_[1]);
        end
        if(_zz_220_)begin
          execute_IntAluPluginComp_XER[29] <= _zz_221_[0];
        end
      end
      if(writeBack_RegFilePluginComp_sprWriteXERPort_valid)begin
        execute_IntAluPluginComp_XER <= writeBack_RegFilePluginComp_sprWriteXERPort_payload_data;
      end
      Hazards_writeBackBuffer_valid <= Hazards_writeBackWrites_valid;
      if(writeBack_RegFilePluginComp_sprWriteCLTPort_valid)begin
        case(writeBack_RegFilePluginComp_sprWriteCLTPort_payload_id)
          10'b0000001001 : begin
            execute_BranchPlugin_CTR <= writeBack_RegFilePluginComp_sprWriteCLTPort_payload_data;
          end
          10'b0000001000 : begin
            execute_BranchPlugin_LR <= writeBack_RegFilePluginComp_sprWriteCLTPort_payload_data;
          end
          10'b1100101111 : begin
            execute_BranchPlugin_TAR <= writeBack_RegFilePluginComp_sprWriteCLTPort_payload_data;
          end
          default : begin
          end
        endcase
      end
      if(execute_BranchPlugin_crBusPort_valid)begin
        case(execute_BranchPlugin_crBusPort_op)
          `CRBusCmdEnum_defaultEncoding_CR0 : begin
            execute_BranchPlugin_CR[31 : 28] <= execute_BranchPlugin_crBusPort_imm[3 : 0];
          end
          `CRBusCmdEnum_defaultEncoding_CR1 : begin
            execute_BranchPlugin_CR[27 : 24] <= execute_BranchPlugin_crBusPort_imm[3 : 0];
          end
          `CRBusCmdEnum_defaultEncoding_CR6 : begin
            execute_BranchPlugin_CR[7 : 4] <= execute_BranchPlugin_crBusPort_imm[3 : 0];
          end
          `CRBusCmdEnum_defaultEncoding_CMP : begin
            if(execute_BranchPlugin_crBusPort_fxm[7])begin
              execute_BranchPlugin_CR[31 : 28] <= execute_BranchPlugin_crBusPort_imm[3 : 0];
            end
            if(execute_BranchPlugin_crBusPort_fxm[6])begin
              execute_BranchPlugin_CR[27 : 24] <= execute_BranchPlugin_crBusPort_imm[3 : 0];
            end
            if(execute_BranchPlugin_crBusPort_fxm[5])begin
              execute_BranchPlugin_CR[23 : 20] <= execute_BranchPlugin_crBusPort_imm[3 : 0];
            end
            if(execute_BranchPlugin_crBusPort_fxm[4])begin
              execute_BranchPlugin_CR[19 : 16] <= execute_BranchPlugin_crBusPort_imm[3 : 0];
            end
            if(execute_BranchPlugin_crBusPort_fxm[3])begin
              execute_BranchPlugin_CR[15 : 12] <= execute_BranchPlugin_crBusPort_imm[3 : 0];
            end
            if(execute_BranchPlugin_crBusPort_fxm[2])begin
              execute_BranchPlugin_CR[11 : 8] <= execute_BranchPlugin_crBusPort_imm[3 : 0];
            end
            if(execute_BranchPlugin_crBusPort_fxm[1])begin
              execute_BranchPlugin_CR[7 : 4] <= execute_BranchPlugin_crBusPort_imm[3 : 0];
            end
            if(execute_BranchPlugin_crBusPort_fxm[0])begin
              execute_BranchPlugin_CR[3 : 0] <= execute_BranchPlugin_crBusPort_imm[3 : 0];
            end
          end
          `CRBusCmdEnum_defaultEncoding_AND_1 : begin
            execute_BranchPlugin_CR[_zz_539_] <= (execute_BranchPlugin_CR[_zz_540_] && execute_BranchPlugin_CR[_zz_541_]);
          end
          `CRBusCmdEnum_defaultEncoding_OR_1 : begin
            execute_BranchPlugin_CR[_zz_542_] <= (execute_BranchPlugin_CR[_zz_543_] || execute_BranchPlugin_CR[_zz_544_]);
          end
          `CRBusCmdEnum_defaultEncoding_XOR_1 : begin
            execute_BranchPlugin_CR[_zz_545_] <= (execute_BranchPlugin_CR[_zz_546_] ^ execute_BranchPlugin_CR[_zz_547_]);
          end
          `CRBusCmdEnum_defaultEncoding_NAND_1 : begin
            execute_BranchPlugin_CR[_zz_548_] <= (! (execute_BranchPlugin_CR[_zz_549_] && execute_BranchPlugin_CR[_zz_550_]));
          end
          `CRBusCmdEnum_defaultEncoding_NOR_1 : begin
            execute_BranchPlugin_CR[_zz_551_] <= (! (execute_BranchPlugin_CR[_zz_552_] || execute_BranchPlugin_CR[_zz_553_]));
          end
          `CRBusCmdEnum_defaultEncoding_EQV : begin
            execute_BranchPlugin_CR[_zz_554_] <= (! (execute_BranchPlugin_CR[_zz_555_] ^ execute_BranchPlugin_CR[_zz_556_]));
          end
          `CRBusCmdEnum_defaultEncoding_ANDC : begin
            execute_BranchPlugin_CR[_zz_557_] <= (execute_BranchPlugin_CR[_zz_558_] && (! execute_BranchPlugin_CR[_zz_559_]));
          end
          `CRBusCmdEnum_defaultEncoding_ORC : begin
            execute_BranchPlugin_CR[_zz_560_] <= (execute_BranchPlugin_CR[_zz_561_] || (! execute_BranchPlugin_CR[_zz_562_]));
          end
          `CRBusCmdEnum_defaultEncoding_MCRF : begin
            case(execute_BranchPlugin_crBusPort_bt)
              5'b00000 : begin
                execute_BranchPlugin_CR[31 : 28] <= _zz_277_;
              end
              5'b00001 : begin
                execute_BranchPlugin_CR[27 : 24] <= _zz_277_;
              end
              5'b00010 : begin
                execute_BranchPlugin_CR[23 : 20] <= _zz_277_;
              end
              5'b00011 : begin
                execute_BranchPlugin_CR[19 : 16] <= _zz_277_;
              end
              5'b00100 : begin
                execute_BranchPlugin_CR[15 : 12] <= _zz_277_;
              end
              5'b00101 : begin
                execute_BranchPlugin_CR[11 : 8] <= _zz_277_;
              end
              5'b00110 : begin
                execute_BranchPlugin_CR[7 : 4] <= _zz_277_;
              end
              5'b00111 : begin
                execute_BranchPlugin_CR[3 : 0] <= _zz_277_;
              end
              default : begin
              end
            endcase
          end
          `CRBusCmdEnum_defaultEncoding_MCRXRX : begin
            case(execute_BranchPlugin_crBusPort_bt)
              5'b00000 : begin
                execute_BranchPlugin_CR[31 : 28] <= _zz_278_;
              end
              5'b00001 : begin
                execute_BranchPlugin_CR[27 : 24] <= _zz_278_;
              end
              5'b00010 : begin
                execute_BranchPlugin_CR[23 : 20] <= _zz_278_;
              end
              5'b00011 : begin
                execute_BranchPlugin_CR[19 : 16] <= _zz_278_;
              end
              5'b00100 : begin
                execute_BranchPlugin_CR[15 : 12] <= _zz_278_;
              end
              5'b00101 : begin
                execute_BranchPlugin_CR[11 : 8] <= _zz_278_;
              end
              5'b00110 : begin
                execute_BranchPlugin_CR[7 : 4] <= _zz_278_;
              end
              5'b00111 : begin
                execute_BranchPlugin_CR[3 : 0] <= _zz_278_;
              end
              default : begin
              end
            endcase
          end
          `CRBusCmdEnum_defaultEncoding_MTCRF : begin
            if(execute_BranchPlugin_crBusPort_fxm[7])begin
              execute_BranchPlugin_CR[31 : 28] <= execute_BranchPlugin_crBusPort_imm[31 : 28];
            end
            if(execute_BranchPlugin_crBusPort_fxm[6])begin
              execute_BranchPlugin_CR[27 : 24] <= execute_BranchPlugin_crBusPort_imm[27 : 24];
            end
            if(execute_BranchPlugin_crBusPort_fxm[5])begin
              execute_BranchPlugin_CR[23 : 20] <= execute_BranchPlugin_crBusPort_imm[23 : 20];
            end
            if(execute_BranchPlugin_crBusPort_fxm[4])begin
              execute_BranchPlugin_CR[19 : 16] <= execute_BranchPlugin_crBusPort_imm[19 : 16];
            end
            if(execute_BranchPlugin_crBusPort_fxm[3])begin
              execute_BranchPlugin_CR[15 : 12] <= execute_BranchPlugin_crBusPort_imm[15 : 12];
            end
            if(execute_BranchPlugin_crBusPort_fxm[2])begin
              execute_BranchPlugin_CR[11 : 8] <= execute_BranchPlugin_crBusPort_imm[11 : 8];
            end
            if(execute_BranchPlugin_crBusPort_fxm[1])begin
              execute_BranchPlugin_CR[7 : 4] <= execute_BranchPlugin_crBusPort_imm[7 : 4];
            end
            if(execute_BranchPlugin_crBusPort_fxm[0])begin
              execute_BranchPlugin_CR[3 : 0] <= execute_BranchPlugin_crBusPort_imm[3 : 0];
            end
          end
          `CRBusCmdEnum_defaultEncoding_MTOCRF : begin
            if(execute_BranchPlugin_crBusPort_fxm[7])begin
              execute_BranchPlugin_CR[31 : 28] <= execute_BranchPlugin_crBusPort_imm[31 : 28];
            end
            if(execute_BranchPlugin_crBusPort_fxm[6])begin
              execute_BranchPlugin_CR[27 : 24] <= execute_BranchPlugin_crBusPort_imm[27 : 24];
            end
            if(execute_BranchPlugin_crBusPort_fxm[5])begin
              execute_BranchPlugin_CR[23 : 20] <= execute_BranchPlugin_crBusPort_imm[23 : 20];
            end
            if(execute_BranchPlugin_crBusPort_fxm[4])begin
              execute_BranchPlugin_CR[19 : 16] <= execute_BranchPlugin_crBusPort_imm[19 : 16];
            end
            if(execute_BranchPlugin_crBusPort_fxm[3])begin
              execute_BranchPlugin_CR[15 : 12] <= execute_BranchPlugin_crBusPort_imm[15 : 12];
            end
            if(execute_BranchPlugin_crBusPort_fxm[2])begin
              execute_BranchPlugin_CR[11 : 8] <= execute_BranchPlugin_crBusPort_imm[11 : 8];
            end
            if(execute_BranchPlugin_crBusPort_fxm[1])begin
              execute_BranchPlugin_CR[7 : 4] <= execute_BranchPlugin_crBusPort_imm[7 : 4];
            end
            if(execute_BranchPlugin_crBusPort_fxm[0])begin
              execute_BranchPlugin_CR[3 : 0] <= execute_BranchPlugin_crBusPort_imm[3 : 0];
            end
          end
          `CRBusCmdEnum_defaultEncoding_DEC : begin
            execute_BranchPlugin_CTR <= (execute_BranchPlugin_CTR - 32'h00000001);
          end
          `CRBusCmdEnum_defaultEncoding_LNK : begin
            execute_BranchPlugin_LR <= execute_BranchPlugin_crBusPort_imm;
          end
          `CRBusCmdEnum_defaultEncoding_DECLNK : begin
            execute_BranchPlugin_CTR <= (execute_BranchPlugin_CTR - 32'h00000001);
            execute_BranchPlugin_LR <= execute_BranchPlugin_crBusPort_imm;
          end
          default : begin
          end
        endcase
      end
      if((! decode_arbitration_isStuck))begin
        SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= 1'b0;
      end else begin
        SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_decode <= SPRPlugin_exceptionPortCtrl_exceptionValids_decode;
      end
      if((! execute_arbitration_isStuck))begin
        SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= (SPRPlugin_exceptionPortCtrl_exceptionValids_decode && (! decode_arbitration_isStuck));
      end else begin
        SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_execute <= SPRPlugin_exceptionPortCtrl_exceptionValids_execute;
      end
      if((! memory_arbitration_isStuck))begin
        SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= (SPRPlugin_exceptionPortCtrl_exceptionValids_execute && (! execute_arbitration_isStuck));
      end else begin
        SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_memory <= SPRPlugin_exceptionPortCtrl_exceptionValids_memory;
      end
      if((! writeBack_arbitration_isStuck))begin
        SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= (SPRPlugin_exceptionPortCtrl_exceptionValids_memory && (! memory_arbitration_isStuck));
      end else begin
        SPRPlugin_exceptionPortCtrl_exceptionValidsRegs_writeBack <= 1'b0;
      end
      SPRPlugin_interrupt_valid <= 1'b0;
      if(_zz_430_)begin
        if(_zz_431_)begin
          SPRPlugin_interrupt_valid <= 1'b1;
        end
      end
      if(SPRPlugin_pipelineLiberator_active)begin
        if((! execute_arbitration_isStuck))begin
          SPRPlugin_pipelineLiberator_pcValids_0 <= 1'b1;
        end
        if((! memory_arbitration_isStuck))begin
          SPRPlugin_pipelineLiberator_pcValids_1 <= SPRPlugin_pipelineLiberator_pcValids_0;
        end
        if((! writeBack_arbitration_isStuck))begin
          SPRPlugin_pipelineLiberator_pcValids_2 <= SPRPlugin_pipelineLiberator_pcValids_1;
        end
      end
      if(((! SPRPlugin_pipelineLiberator_active) || decode_arbitration_removeIt))begin
        SPRPlugin_pipelineLiberator_pcValids_0 <= 1'b0;
        SPRPlugin_pipelineLiberator_pcValids_1 <= 1'b0;
        SPRPlugin_pipelineLiberator_pcValids_2 <= 1'b0;
      end
      SPRPlugin_hadException <= SPRPlugin_exception;
      if(_zz_428_)begin
        if(SPRPlugin_interruptJump)begin
          SPRPlugin_interrupt_valid <= 1'b0;
        end
      end
      if(_zz_395_)begin
        MSR_VEC <= 1'b0;
        MSR_VSX <= 1'b0;
        MSR_EE <= 1'b0;
        MSR_PR <= 1'b0;
        MSR_FP <= 1'b0;
        MSR_ME <= 1'b0;
        MSR_FE0 <= 1'b0;
        MSR_FE1 <= 1'b0;
        MSR_IR <= 1'b0;
        MSR_DR <= 1'b0;
        MSR_PMM <= 1'b0;
        MSR_RI <= 1'b0;
      end
      if(_zz_397_)begin
        MSR_VEC <= 1'b0;
        MSR_VSX <= 1'b0;
        MSR_EE <= 1'b0;
        MSR_PR <= 1'b0;
        MSR_FP <= 1'b0;
        MSR_ME <= 1'b0;
        MSR_FE0 <= 1'b0;
        MSR_FE1 <= 1'b0;
        MSR_IR <= 1'b0;
        MSR_DR <= 1'b0;
        MSR_PMM <= 1'b0;
        MSR_RI <= 1'b0;
      end
      if(_zz_398_)begin
        MSR_VEC <= 1'b0;
        MSR_VSX <= 1'b0;
        MSR_EE <= 1'b0;
        MSR_PR <= 1'b0;
        MSR_FP <= 1'b0;
        MSR_ME <= 1'b0;
        MSR_FE0 <= 1'b0;
        MSR_FE1 <= 1'b0;
        MSR_IR <= 1'b0;
        MSR_DR <= 1'b0;
        MSR_PMM <= 1'b0;
        MSR_RI <= 1'b0;
      end
      if(_zz_400_)begin
        MSR_VEC <= SPRPlugin_srr1[25];
        MSR_VSX <= SPRPlugin_srr1[23];
        MSR_EE <= SPRPlugin_srr1[15];
        MSR_PR <= SPRPlugin_srr1[14];
        MSR_FP <= SPRPlugin_srr1[13];
        MSR_ME <= SPRPlugin_srr1[12];
        MSR_FE0 <= SPRPlugin_srr1[11];
        MSR_FE1 <= SPRPlugin_srr1[8];
        MSR_IR <= SPRPlugin_srr1[5];
        MSR_DR <= SPRPlugin_srr1[4];
        MSR_PMM <= SPRPlugin_srr1[2];
        MSR_RI <= SPRPlugin_srr1[1];
        MSR_LE <= SPRPlugin_srr1[0];
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_INSTRUCTION <= memory_INSTRUCTION;
      end
      if((! writeBack_arbitration_isStuck))begin
        memory_to_writeBack_REGFILE_WRITE_DATA <= _zz_71_;
      end
      if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt))begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)))begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(((! memory_arbitration_isStuck) || memory_arbitration_removeIt))begin
        memory_arbitration_isValid <= 1'b0;
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)))begin
        memory_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(((! writeBack_arbitration_isStuck) || writeBack_arbitration_removeIt))begin
        writeBack_arbitration_isValid <= 1'b0;
      end
      if(((! memory_arbitration_isStuck) && (! memory_arbitration_removeIt)))begin
        writeBack_arbitration_isValid <= memory_arbitration_isValid;
      end
      if(execute_SPRPLUGIN_SPR_1025)begin
        if(execute_SPRPLUGIN_writeEnable)begin
          MSR_VSX <= _zz_601_[0];
          MSR_FE1 <= _zz_602_[0];
          MSR_FE0 <= _zz_603_[0];
          MSR_PMM <= _zz_604_[0];
          MSR_IR <= _zz_605_[0];
          MSR_PR <= _zz_606_[0];
          MSR_FP <= _zz_607_[0];
          MSR_DR <= _zz_608_[0];
          MSR_VEC <= _zz_609_[0];
          MSR_RI <= _zz_610_[0];
          MSR_ME <= _zz_611_[0];
          MSR_EE <= _zz_612_[0];
          MSR_LE <= _zz_613_[0];
        end
      end
      if(_zz_429_)begin
        if(iBusWB_ACK)begin
          _zz_308_ <= (_zz_308_ + (3'b001));
        end
      end
      _zz_309_ <= (iBusWB_CYC && iBusWB_ACK);
      if((_zz_311_ && _zz_312_))begin
        _zz_310_ <= (_zz_310_ + (3'b001));
        if(_zz_314_)begin
          _zz_310_ <= (3'b000);
        end
      end
      _zz_316_ <= ((_zz_311_ && (! dBusWB_WE)) && dBusWB_ACK);
    end
  end

  always @ (posedge clk) begin
    if(IBusCachedPlugin_iBusRsp_stages_0_output_ready)begin
      _zz_120_ <= IBusCachedPlugin_iBusRsp_stages_0_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      _zz_123_ <= IBusCachedPlugin_iBusRsp_stages_1_output_payload;
    end
    if(IBusCachedPlugin_iBusRsp_stages_0_output_ready)begin
      IBusCachedPlugin_predictor_writeLast_valid <= IBusCachedPlugin_predictor_historyWriteDelayPatched_valid;
      IBusCachedPlugin_predictor_writeLast_payload_address <= IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_address;
      IBusCachedPlugin_predictor_writeLast_payload_data_source <= IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_data_source;
      IBusCachedPlugin_predictor_writeLast_payload_data_branchWish <= IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_data_branchWish;
      IBusCachedPlugin_predictor_writeLast_payload_data_target <= IBusCachedPlugin_predictor_historyWriteDelayPatched_payload_data_target;
    end
    if(IBusCachedPlugin_iBusRsp_stages_0_input_ready)begin
      IBusCachedPlugin_predictor_buffer_pcCorrected <= IBusCachedPlugin_fetchPc_corrected;
    end
    if(IBusCachedPlugin_iBusRsp_stages_0_output_ready)begin
      IBusCachedPlugin_predictor_line_source <= IBusCachedPlugin_predictor_buffer_line_source;
      IBusCachedPlugin_predictor_line_branchWish <= IBusCachedPlugin_predictor_buffer_line_branchWish;
      IBusCachedPlugin_predictor_line_target <= IBusCachedPlugin_predictor_buffer_line_target;
    end
    if(IBusCachedPlugin_iBusRsp_stages_0_output_ready)begin
      IBusCachedPlugin_predictor_buffer_hazard_regNextWhen <= IBusCachedPlugin_predictor_buffer_hazard;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_output_ready)begin
      IBusCachedPlugin_predictor_iBusRspContext_hazard <= IBusCachedPlugin_predictor_fetchContext_hazard;
      IBusCachedPlugin_predictor_iBusRspContext_hit <= IBusCachedPlugin_predictor_fetchContext_hit;
      IBusCachedPlugin_predictor_iBusRspContext_line_source <= IBusCachedPlugin_predictor_fetchContext_line_source;
      IBusCachedPlugin_predictor_iBusRspContext_line_branchWish <= IBusCachedPlugin_predictor_fetchContext_line_branchWish;
      IBusCachedPlugin_predictor_iBusRspContext_line_target <= IBusCachedPlugin_predictor_fetchContext_line_target;
    end
    if(IBusCachedPlugin_iBusRsp_stages_1_input_ready)begin
      IBusCachedPlugin_s1_tightlyCoupledHit <= IBusCachedPlugin_s0_tightlyCoupledHit;
    end
    if(IBusCachedPlugin_iBusRsp_stages_2_input_ready)begin
      IBusCachedPlugin_s2_tightlyCoupledHit <= IBusCachedPlugin_s1_tightlyCoupledHit;
    end
    if(_zz_342_)begin
      dataCache_1__io_mem_cmd_m2sPipe_rData_wr <= dataCache_1__io_mem_cmd_payload_wr;
      dataCache_1__io_mem_cmd_m2sPipe_rData_address <= dataCache_1__io_mem_cmd_payload_address;
      dataCache_1__io_mem_cmd_m2sPipe_rData_data <= dataCache_1__io_mem_cmd_payload_data;
      dataCache_1__io_mem_cmd_m2sPipe_rData_mask <= dataCache_1__io_mem_cmd_payload_mask;
      dataCache_1__io_mem_cmd_m2sPipe_rData_length <= dataCache_1__io_mem_cmd_payload_length;
      dataCache_1__io_mem_cmd_m2sPipe_rData_last <= dataCache_1__io_mem_cmd_payload_last;
    end
    _zz_231_ <= (writeBack_arbitration_isFiring && writeBack_DECODER_stageables_48);
    _zz_232_ <= writeBack_LOAD_UPDATE_ADDR;
    _zz_233_ <= writeBack_LOAD_UPDATE_DATA;
    Hazards_writeBackBuffer_payload_address <= Hazards_writeBackWrites_payload_address;
    Hazards_writeBackBuffer_payload_data <= Hazards_writeBackWrites_payload_data;
    SPRPlugin_dec31Prev <= SPRPlugin_dec[31];
    if((SPRPlugin_dec31Prev && (! SPRPlugin_dec[31])))begin
      SPRPlugin_intDec <= 1'b0;
    end else begin
      if(((! SPRPlugin_dec31Prev) && SPRPlugin_dec[31]))begin
        SPRPlugin_intDec <= 1'b1;
      end else begin
        if(SPRPlugin_intDecTkn)begin
          SPRPlugin_intDec <= 1'b0;
        end
      end
    end
    if(writeBack_arbitration_isFiring)begin
      SPRPlugin_minstret <= (SPRPlugin_minstret + 32'h00000001);
    end
    if(_zz_394_)begin
      SPRPlugin_exceptionPortCtrl_exceptionContext_code <= (_zz_289_ ? IBusCachedPlugin_decodeExceptionPort_payload_code : decodeExceptionPort_payload_code);
      SPRPlugin_exceptionPortCtrl_exceptionContext_badAddr <= (_zz_289_ ? IBusCachedPlugin_decodeExceptionPort_payload_badAddr : decodeExceptionPort_payload_badAddr);
      SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC <= _zz_287_;
      SPRPlugin_exceptionPortCtrl_exceptionContext_imm <= (_zz_289_ ? IBusCachedPlugin_decodeExceptionPort_payload_imm : decodeExceptionPort_payload_imm);
    end
    if(SPRPlugin_selfException_valid)begin
      SPRPlugin_exceptionPortCtrl_exceptionContext_code <= SPRPlugin_selfException_payload_code;
      SPRPlugin_exceptionPortCtrl_exceptionContext_badAddr <= SPRPlugin_selfException_payload_badAddr;
      SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC <= SPRPlugin_selfException_payload_codePPC;
      SPRPlugin_exceptionPortCtrl_exceptionContext_imm <= SPRPlugin_selfException_payload_imm;
    end
    if(BranchPlugin_branchExceptionPort_valid)begin
      SPRPlugin_exceptionPortCtrl_exceptionContext_code <= BranchPlugin_branchExceptionPort_payload_code;
      SPRPlugin_exceptionPortCtrl_exceptionContext_badAddr <= BranchPlugin_branchExceptionPort_payload_badAddr;
      SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC <= BranchPlugin_branchExceptionPort_payload_codePPC;
      SPRPlugin_exceptionPortCtrl_exceptionContext_imm <= BranchPlugin_branchExceptionPort_payload_imm;
    end
    if(DBusCachedPlugin_exceptionBus_valid)begin
      SPRPlugin_exceptionPortCtrl_exceptionContext_code <= DBusCachedPlugin_exceptionBus_payload_code;
      SPRPlugin_exceptionPortCtrl_exceptionContext_badAddr <= DBusCachedPlugin_exceptionBus_payload_badAddr;
      SPRPlugin_exceptionPortCtrl_exceptionContext_codePPC <= DBusCachedPlugin_exceptionBus_payload_codePPC;
      SPRPlugin_exceptionPortCtrl_exceptionContext_imm <= DBusCachedPlugin_exceptionBus_payload_imm;
    end
    if(_zz_430_)begin
      if(_zz_431_)begin
        SPRPlugin_interrupt_code <= (4'b1001);
        SPRPlugin_interrupt_targetPrivilege <= (2'b11);
      end
    end
    SPRPlugin_darSave <= writeBack_SRC_ADD;
    if(_zz_395_)begin
      SPRPlugin_srr0 <= SPRPlugin_intSRR0;
      SPRPlugin_srr1 <= {{{{{{{{{{{{_zz_1526_,_zz_1527_},MSR_ME},MSR_FE0},(2'b00)},MSR_FE1},(2'b00)},MSR_IR},MSR_DR},(1'b0)},MSR_PMM},MSR_RI},MSR_LE};
      if((SPRPlugin_intType == `ExcpEnum_defaultEncoding_PGM_ILL))begin
        SPRPlugin_srr1[19] <= 1'b1;
      end
      if((SPRPlugin_intType == `ExcpEnum_defaultEncoding_PGM_PRV))begin
        SPRPlugin_srr1[18] <= 1'b1;
      end
      if((SPRPlugin_intType == `ExcpEnum_defaultEncoding_ISI))begin
        SPRPlugin_srr1[30] <= 1'b1;
      end else begin
        if((SPRPlugin_intType == `ExcpEnum_defaultEncoding_ISI_PROT))begin
          SPRPlugin_srr1[29] <= 1'b1;
        end else begin
          if((SPRPlugin_intType == `ExcpEnum_defaultEncoding_DSI))begin
            SPRPlugin_dsisr <= 32'h0;
            SPRPlugin_dsisr[30] <= 1'b1;
            SPRPlugin_dar <= SPRPlugin_darSave;
          end else begin
            if((SPRPlugin_intType == `ExcpEnum_defaultEncoding_DSI_PROT))begin
              SPRPlugin_dsisr <= 32'h0;
              SPRPlugin_dsisr[27] <= 1'b1;
              SPRPlugin_dar <= SPRPlugin_darSave;
            end else begin
              if((SPRPlugin_intType == `ExcpEnum_defaultEncoding_ALG))begin
                SPRPlugin_dar <= SPRPlugin_darSave;
              end
            end
          end
        end
      end
    end
    if(! (execute_SPRPLUGIN_writeEnable && (execute_SPR_ID == 11'h10c))) begin
      if(SPRPlugin_incTB)begin
        SPRPlugin_tb <= (SPRPlugin_tb + 32'h00000001);
      end
    end
    if(! (execute_SPRPLUGIN_writeEnable && (execute_SPR_ID == 11'h016))) begin
      SPRPlugin_dec <= (SPRPlugin_dec - 32'h00000001);
    end
    if(_zz_397_)begin
      SPRPlugin_srr0 <= (writeBack_PC + 32'h00000004);
      SPRPlugin_srr1 <= {{{{{{{{{{{{_zz_1528_,_zz_1529_},MSR_ME},MSR_FE0},(2'b00)},MSR_FE1},(2'b00)},MSR_IR},MSR_DR},(1'b0)},MSR_PMM},MSR_RI},MSR_LE};
    end
    if(_zz_398_)begin
      SPRPlugin_srr0 <= (writeBack_PC + 32'h00000004);
      SPRPlugin_srr1 <= {{{{{{{{{{{{_zz_1530_,_zz_1531_},MSR_ME},MSR_FE0},(2'b00)},MSR_FE1},(2'b00)},MSR_IR},MSR_DR},(1'b0)},MSR_PMM},MSR_RI},MSR_LE};
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RS <= decode_RS;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_R0_ADDR <= decode_R0_ADDR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_42 <= _zz_59_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_38 <= decode_DECODER_stageables_38;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_10 <= decode_DECODER_stageables_10;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_FORMAL_PC_NEXT <= decode_FORMAL_PC_NEXT;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_FORMAL_PC_NEXT <= execute_FORMAL_PC_NEXT;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_FORMAL_PC_NEXT <= _zz_114_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_25 <= _zz_56_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_18 <= _zz_54_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_12 <= _zz_51_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RB <= decode_RB;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_45 <= decode_DECODER_stageables_45;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_45 <= execute_DECODER_stageables_45;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_DECODER_stageables_45 <= memory_DECODER_stageables_45;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_41 <= decode_DECODER_stageables_41;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_LINK <= execute_BRANCH_LINK;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_BRANCH_LINK <= memory_BRANCH_LINK;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_LOAD_UPDATE_DATA <= execute_LOAD_UPDATE_DATA;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_LOAD_UPDATE_DATA <= memory_LOAD_UPDATE_DATA;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_52 <= _zz_48_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_39 <= _zz_45_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_31 <= decode_DECODER_stageables_31;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_31 <= execute_MEMORY_WR;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_DECODER_stageables_31 <= memory_DECODER_stageables_31;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_15 <= decode_DECODER_stageables_15;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_15 <= execute_DECODER_stageables_15;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_DECODER_stageables_15 <= memory_DECODER_stageables_15;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_14 <= _zz_42_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_14 <= _zz_62_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_DECODER_stageables_14 <= _zz_39_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_XER_WRITE_validOV <= execute_XER_WRITE_validOV;
      execute_to_memory_XER_WRITE_validCA <= execute_XER_WRITE_validCA;
      execute_to_memory_XER_WRITE_imm <= execute_XER_WRITE_imm;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_XER_WRITE_validOV <= memory_XER_WRITE_validOV;
      memory_to_writeBack_XER_WRITE_validCA <= memory_XER_WRITE_validCA;
      memory_to_writeBack_XER_WRITE_imm <= memory_XER_WRITE_imm;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_57 <= decode_DECODER_stageables_57;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_57 <= execute_DECODER_stageables_57;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_20 <= decode_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_20 <= execute_MEMORY_ENABLE;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_DECODER_stageables_20 <= memory_MEMORY_ENABLE;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HL <= execute_MUL_HL;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MEMORY_ADDRESS_LOW <= execute_MEMORY_ADDRESS_LOW;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MEMORY_ADDRESS_LOW <= memory_MEMORY_ADDRESS_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_55 <= decode_DECODER_stageables_55;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_55 <= execute_DECODER_stageables_55;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_17 <= decode_DECODER_stageables_17;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_17 <= execute_DECODER_stageables_17;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_DECODER_stageables_17 <= memory_DECODER_stageables_17;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_CALC <= execute_BRANCH_CALC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_36 <= decode_DECODER_stageables_36;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_1 <= _zz_36_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PREDICTION_CONTEXT_hazard <= decode_PREDICTION_CONTEXT_hazard;
      decode_to_execute_PREDICTION_CONTEXT_hit <= decode_PREDICTION_CONTEXT_hit;
      decode_to_execute_PREDICTION_CONTEXT_line_source <= decode_PREDICTION_CONTEXT_line_source;
      decode_to_execute_PREDICTION_CONTEXT_line_branchWish <= decode_PREDICTION_CONTEXT_line_branchWish;
      decode_to_execute_PREDICTION_CONTEXT_line_target <= decode_PREDICTION_CONTEXT_line_target;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PREDICTION_CONTEXT_hazard <= execute_PREDICTION_CONTEXT_hazard;
      execute_to_memory_PREDICTION_CONTEXT_hit <= execute_PREDICTION_CONTEXT_hit;
      execute_to_memory_PREDICTION_CONTEXT_line_source <= execute_PREDICTION_CONTEXT_line_source;
      execute_to_memory_PREDICTION_CONTEXT_line_branchWish <= execute_PREDICTION_CONTEXT_line_branchWish;
      execute_to_memory_PREDICTION_CONTEXT_line_target <= execute_PREDICTION_CONTEXT_line_target;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_47 <= decode_DECODER_stageables_47;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_47 <= execute_DECODER_stageables_47;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_DECODER_stageables_47 <= memory_DECODER_stageables_47;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_6 <= decode_DECODER_stageables_6;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_LOAD_UPDATE_ADDR <= execute_LOAD_UPDATE_ADDR;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_LOAD_UPDATE_ADDR <= memory_LOAD_UPDATE_ADDR;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_NEXT_PC2 <= execute_NEXT_PC2;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SRC_CR <= execute_SRC_CR;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_SRC_CR <= memory_SRC_CR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_21 <= decode_DECODER_stageables_21;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_21 <= execute_DECODER_stageables_21;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_DECODER_stageables_21 <= memory_DECODER_stageables_21;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_40 <= _zz_33_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_56 <= decode_DECODER_stageables_56;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_INSTRUCTION <= execute_INSTRUCTION;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RA <= decode_RA;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LH <= execute_MUL_LH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_5 <= decode_DECODER_stageables_5;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_LOW <= memory_MUL_LOW;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_34 <= decode_DECODER_stageables_34;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_34 <= execute_DECODER_stageables_34;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_DECODER_stageables_34 <= memory_DECODER_stageables_34;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_33 <= decode_DECODER_stageables_33;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_28 <= decode;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_53 <= decode_DECODER_stageables_53;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_53 <= execute_DECODER_stageables_53;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SPR_ID <= execute_SPR_ID;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_SPR_ID <= memory_SPR_ID;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_LL <= execute_MUL_LL;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_CR_FIELD_RD <= decode_CR_FIELD_RD;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_3 <= decode_DECODER_stageables_3;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_13 <= decode_DECODER_stageables_13;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MUL_HH <= execute_MUL_HH;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MUL_HH <= memory_MUL_HH;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_51 <= decode_DECODER_stageables_51;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_9 <= decode_DECODER_stageables_9;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_XER_SO <= execute_XER_SO;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_XER_SO <= memory_XER_SO;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DO <= execute_BRANCH_DO;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_23 <= decode_DECODER_stageables_23;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_CR_FIELD_WR <= execute_CR_FIELD_WR;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_CR_FIELD_WR <= memory_CR_FIELD_WR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_48 <= decode_DECODER_stageables_48;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_48 <= execute_DECODER_stageables_48;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_DECODER_stageables_48 <= memory_DECODER_stageables_48;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SRC_ADD <= execute_SRC_ADD;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_SRC_ADD <= memory_SRC_ADD;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_MSR_ENDIAN <= _zz_30_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_MSR_ENDIAN <= _zz_28_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_MSR_ENDIAN <= _zz_26_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_32 <= _zz_23_;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_32 <= _zz_20_;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_DECODER_stageables_32 <= _zz_18_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_50 <= decode_DECODER_stageables_50;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_49 <= _zz_15_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_RT_ADDR <= decode_RT_ADDR;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_RT_ADDR <= execute_RT_ADDR;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_RT_ADDR <= memory_RT_ADDR;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_7 <= decode_DECODER_stageables_7;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_7 <= execute_DECODER_stageables_7;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_DECODER_stageables_7 <= memory_DECODER_stageables_7;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_54 <= decode_DECODER_stageables_54;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_0 <= decode_DECODER_stageables_0;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_DATA <= _zz_70_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_22 <= decode_DECODER_stageables_22;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_37 <= decode_DECODER_stageables_37;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_37 <= execute_DECODER_stageables_37;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_DECODER_stageables_37 <= memory_DECODER_stageables_37;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_16 <= decode_DECODER_stageables_16;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_CR_WRITE_op <= _zz_12_;
      execute_to_memory_CR_WRITE_ba <= execute_CR_WRITE_ba;
      execute_to_memory_CR_WRITE_bb <= execute_CR_WRITE_bb;
      execute_to_memory_CR_WRITE_bt <= execute_CR_WRITE_bt;
      execute_to_memory_CR_WRITE_imm <= execute_CR_WRITE_imm;
      execute_to_memory_CR_WRITE_fxm <= execute_CR_WRITE_fxm;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_CR_WRITE_op <= _zz_9_;
      memory_to_writeBack_CR_WRITE_ba <= memory_CR_WRITE_ba;
      memory_to_writeBack_CR_WRITE_bb <= memory_CR_WRITE_bb;
      memory_to_writeBack_CR_WRITE_bt <= memory_CR_WRITE_bt;
      memory_to_writeBack_CR_WRITE_imm <= memory_CR_WRITE_imm;
      memory_to_writeBack_CR_WRITE_fxm <= memory_CR_WRITE_fxm;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_8 <= _zz_7_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_27 <= _zz_4_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_29 <= decode_DECODER_stageables_29;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_35 <= decode_DECODER_stageables_35;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_DECODER_stageables_35 <= execute_DECODER_stageables_35;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_SRC1 <= execute_SRC1;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_SRC1 <= memory_SRC1;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_BRANCH_DEC <= execute_BRANCH_DEC;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_BRANCH_DEC <= memory_BRANCH_DEC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_TARGET_MISSMATCH2 <= execute_TARGET_MISSMATCH2;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_PC <= decode_PC;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_PC <= _zz_75_;
    end
    if(((! writeBack_arbitration_isStuck) && (! SPRPlugin_exceptionPortCtrl_exceptionValids_writeBack)))begin
      memory_to_writeBack_PC <= memory_PC;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_43 <= decode_DECODER_stageables_43;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_26 <= _zz_1_;
    end
    if((! execute_arbitration_isStuck))begin
      decode_to_execute_DECODER_stageables_30 <= decode_DECODER_stageables_30;
    end
    if((! memory_arbitration_isStuck))begin
      execute_to_memory_REGFILE_WRITE_ADDR <= execute_REGFILE_WRITE_ADDR;
    end
    if((! writeBack_arbitration_isStuck))begin
      memory_to_writeBack_REGFILE_WRITE_ADDR <= memory_REGFILE_WRITE_ADDR;
    end
    if((! execute_arbitration_isStuck))begin
      execute_SPRPLUGIN_SPR_1025 <= (_zz_299_ == 11'h401);
    end
    if((! execute_arbitration_isStuck))begin
      execute_SPRPLUGIN_SPR_26 <= (_zz_299_ == 11'h01a);
    end
    if((! execute_arbitration_isStuck))begin
      execute_SPRPLUGIN_SPR_27 <= (_zz_299_ == 11'h01b);
    end
    if((! execute_arbitration_isStuck))begin
      execute_SPRPLUGIN_SPR_19 <= (_zz_299_ == 11'h013);
    end
    if((! execute_arbitration_isStuck))begin
      execute_SPRPLUGIN_SPR_259 <= (_zz_299_ == 11'h103);
    end
    if((! execute_arbitration_isStuck))begin
      execute_SPRPLUGIN_SPR_18 <= (_zz_299_ == 11'h012);
    end
    if((! execute_arbitration_isStuck))begin
      execute_SPRPLUGIN_SPR_268 <= (_zz_299_ == 11'h10c);
    end
    if((! execute_arbitration_isStuck))begin
      execute_SPRPLUGIN_SPR_22 <= (_zz_299_ == 11'h016);
    end
    if(execute_SPRPLUGIN_SPR_26)begin
      if(execute_SPRPLUGIN_writeEnable)begin
        SPRPlugin_srr0 <= execute_SRC1[31 : 0];
      end
    end
    if(execute_SPRPLUGIN_SPR_27)begin
      if(execute_SPRPLUGIN_writeEnable)begin
        SPRPlugin_srr1 <= execute_SRC1[31 : 0];
      end
    end
    if(execute_SPRPLUGIN_SPR_19)begin
      if(execute_SPRPLUGIN_writeEnable)begin
        SPRPlugin_dar <= execute_SRC1[31 : 0];
      end
    end
    if(execute_SPRPLUGIN_SPR_259)begin
      if(execute_SPRPLUGIN_writeEnable)begin
        SPRPlugin_sprg3 <= execute_SRC1[31 : 0];
      end
    end
    if(execute_SPRPLUGIN_SPR_18)begin
      if(execute_SPRPLUGIN_writeEnable)begin
        SPRPlugin_dsisr <= execute_SRC1[31 : 0];
      end
    end
    if(execute_SPRPLUGIN_SPR_268)begin
      if(execute_SPRPLUGIN_writeEnable)begin
        SPRPlugin_tb <= execute_SRC1[31 : 0];
      end
    end
    if(execute_SPRPLUGIN_SPR_22)begin
      if(execute_SPRPLUGIN_writeEnable)begin
        SPRPlugin_dec <= execute_SRC1[31 : 0];
      end
    end
    iBusWB_DAT_MISO_regNext <= iBusWB_DAT_MISO;
    dBusWB_DAT_MISO_regNext <= dBusWB_DAT_MISO;
  end


endmodule
