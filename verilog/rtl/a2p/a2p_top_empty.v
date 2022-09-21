// an empty top connecting all the macros currently in place
//


// Generator : SpinalHDL v1.4.0    git head : ecb5a80b713566f417ea3ea061f9969e73770a7f
// Date      : 19/09/2022, 12:02:23
// Component : A2P_MPW7



`define SYNTHESIS
`include "defs.v"

module a2p_macros (
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

// -----------------------------------------------------------------------------------------
// Phony Top
//

(* keep *) reg   [255:0]  ins_a2p_q;
(* keep *) reg   [255:0]  outs_a2p_q;

// someone should gen these with python or rust!
(* keep *) reg   [98:0]   ins_pc_load_q;
(* keep *) wire  [31:0]   outs_pc_load;
(* keep *) reg   [31:0]   outs_pc_load_q;

(* keep *) reg   [131:0]  ins_byp_ra_q;
(* keep *) wire  [31:0]   outs_byp_ra;
(* keep *) reg   [31:0]   outs_byp_ra_q;

(* keep *) reg   [131:0]  ins_byp_rb_q;
(* keep *) wire  [31:0]  outs_byp_rb;
(* keep *) reg   [31:0]   outs_byp_rb_q;

(* keep *) reg   [131:0]  ins_byp_rs_q;
(* keep *) wire  [31:0]   outs_byp_rs;
(* keep *) reg   [31:0]   outs_byp_rs_q;


always @(posedge clk) begin

   ins_a2p_q       <= {externalResetVector, timerInterrupt, externalInterrupt, softwareInterrupt, externalInterruptS,
                       iBusWB_ACK,iBusWB_DAT_MISO,iBusWB_ERR,dBusWB_ACK,dBusWB_DAT_MISO,dBusWB_ERR,
                       reset};
   outs_a2p_q      <= ~outs_a2p_q;

   ins_pc_load_q   <= ins_pc_load_q + 1;
   outs_pc_load_q  <= outs_pc_load;

   ins_byp_ra_q    <= ins_byp_ra_q  + 1;
   outs_byp_ra_q   <= outs_byp_ra;
   ins_byp_rb_q    <= ins_byp_rb_q + 1;
   outs_byp_rb_q   <= outs_byp_rb;
   ins_byp_rs_q    <= ins_byp_rs_q + 1;
   outs_byp_rs_q   <= outs_byp_rs;

end

assign iBusWB_CYC  = outs_a2p_q[0];
assign iBusWB_STB  = outs_a2p_q[1];
assign iBusWB_WE   = outs_a2p_q[2];
assign iBusWB_ADR  = outs_a2p_q[32:3];
assign iBusWB_DAT_MOSI = outs_a2p_q[64:33];
assign iBusWB_SEL = outs_a2p_q[68:65];
assign iBusWB_BTE = outs_a2p_q[70:69];
assign iBusWB_CTI = outs_a2p_q[73:71];

assign dBusWB_CYC  = outs_a2p_q[100];
assign dBusWB_STB  = outs_a2p_q[101];
assign dBusWB_WE   = outs_a2p_q[102];
assign dBusWB_ADR  = outs_a2p_q[132:103];
assign dBusWB_DAT_MOSI = outs_a2p_q[164:133];
assign dBusWB_SEL = outs_a2p_q[168:165];
assign dBusWB_BTE = outs_a2p_q[170:169];
assign dBusWB_CTI = outs_a2p_q[173:171];

// -----------------------------------------------------------------------------------------

  SEL_PRI_32x3 PC_LOAD (
    .src0      (ins_pc_load_q[31:0]   ), //i
    .src1      (ins_pc_load_q[63:32]  ), //i
    .src2      (ins_pc_load_q[95:64]  ), //i
    .sel       (ins_pc_load_q[98:96]  ), //i
    .result    (outs_pc_load[31:0]  )  //o
  );

  /*
  InstructionCache IBusCachedPlugin_cache (
    .io_flush                                     (_zz_328_                                                             ), //i
    .io_cpu_prefetch_isValid                      (_zz_329_                                                             ), //i
    .io_cpu_prefetch_haltIt                       (IBusCachedPlugin_cache_io_cpu_prefetch_haltIt                        ), //o
    .io_cpu_prefetch_pc                           (IBusCachedPlugin_iBusRsp_stages_0_input_payload[31:0]                ), //i
    .io_cpu_fetch_isValid                         (_zz_330_                                                             ), //i
    .io_cpu_fetch_isStuck                         (_zz_331_                                                             ), //i
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
    .io_cpu_fetch_bypassTranslation               (_zz_332_                                                             ), //i
    .io_cpu_fetch_haltIt                          (IBusCachedPlugin_cache_io_cpu_fetch_haltIt                           ), //o
    .io_cpu_decode_isValid                        (_zz_333_                                                             ), //i
    .io_cpu_decode_isStuck                        (_zz_334_                                                             ), //i
    .io_cpu_decode_pc                             (IBusCachedPlugin_iBusRsp_stages_2_input_payload[31:0]                ), //i
    .io_cpu_decode_physicalAddress                (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]           ), //o
    .io_cpu_decode_data                           (IBusCachedPlugin_cache_io_cpu_decode_data[31:0]                      ), //o
    .io_cpu_decode_cacheMiss                      (IBusCachedPlugin_cache_io_cpu_decode_cacheMiss                       ), //o
    .io_cpu_decode_error                          (IBusCachedPlugin_cache_io_cpu_decode_error                           ), //o
    .io_cpu_decode_mmuRefilling                   (IBusCachedPlugin_cache_io_cpu_decode_mmuRefilling                    ), //o
    .io_cpu_decode_mmuException                   (IBusCachedPlugin_cache_io_cpu_decode_mmuException                    ), //o
    .io_cpu_decode_isUser                         (_zz_335_                                                             ), //i
    .io_cpu_decode_exceptionType                  (IBusCachedPlugin_cache_io_cpu_decode_exceptionType[3:0]              ), //o
    .io_cpu_fill_valid                            (_zz_336_                                                             ), //i
    .io_cpu_fill_payload                          (IBusCachedPlugin_cache_io_cpu_decode_physicalAddress[31:0]           ), //i
    .io_mem_cmd_valid                             (IBusCachedPlugin_cache_io_mem_cmd_valid                              ), //o
    .io_mem_cmd_ready                             (iBus_cmd_ready                                                       ), //i
    .io_mem_cmd_payload_address                   (IBusCachedPlugin_cache_io_mem_cmd_payload_address[31:0]              ), //o
    .io_mem_cmd_payload_size                      (IBusCachedPlugin_cache_io_mem_cmd_payload_size[2:0]                  ), //o
    .io_mem_rsp_valid                             (iBus_rsp_valid                                                       ), //i
    .io_mem_rsp_payload_data                      (iBus_rsp_payload_data[31:0]                                          ), //i
    .io_mem_rsp_payload_error                     (iBus_rsp_payload_error                                               ), //i
    .io_spr_valid                                 (_zz_216_                                                             ), //i
    .io_spr_payload_id                            (_zz_337_[9:0]                                                        ), //i
    .io_spr_payload_data                          (writeBack_SRC1[31:0]                                                 ), //i
    .clk                                          (clk                                                                  ), //i
    .reset                                        (reset                                                                )  //i
  );
  DataCache dataCache_1_ (
    .io_cpu_execute_isValid                        (_zz_338_                                                    ), //i
    .io_cpu_execute_address                        (_zz_339_[31:0]                                              ), //i
    .io_cpu_execute_args_wr                        (execute_MEMORY_WR                                           ), //i
    .io_cpu_execute_args_data                      (_zz_340_[31:0]                                              ), //i
    .io_cpu_execute_args_size                      (execute_DBusCachedPlugin_size[1:0]                          ), //i
    .io_cpu_memory_isValid                         (_zz_341_                                                    ), //i
    .io_cpu_memory_isStuck                         (memory_arbitration_isStuck                                  ), //i
    .io_cpu_memory_isRemoved                       (memory_arbitration_removeIt                                 ), //i
    .io_cpu_memory_isWrite                         (dataCache_1__io_cpu_memory_isWrite                          ), //o
    .io_cpu_memory_address                         (_zz_342_[31:0]                                              ), //i
    .io_cpu_memory_mmuBus_cmd_isValid              (dataCache_1__io_cpu_memory_mmuBus_cmd_isValid               ), //o
    .io_cpu_memory_mmuBus_cmd_virtualAddress       (dataCache_1__io_cpu_memory_mmuBus_cmd_virtualAddress[31:0]  ), //o
    .io_cpu_memory_mmuBus_cmd_bypassTranslation    (dataCache_1__io_cpu_memory_mmuBus_cmd_bypassTranslation     ), //o
    .io_cpu_memory_mmuBus_rsp_physicalAddress      (DBusCachedPlugin_mmuBus_rsp_physicalAddress[31:0]           ), //i
    .io_cpu_memory_mmuBus_rsp_isIoAccess           (_zz_343_                                                    ), //i
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
    .io_cpu_memory_bypassTranslation               (_zz_344_                                                    ), //i
    .io_cpu_writeBack_isValid                      (_zz_345_                                                    ), //i
    .io_cpu_writeBack_isStuck                      (writeBack_arbitration_isStuck                               ), //i
    .io_cpu_writeBack_isUser                       (_zz_346_                                                    ), //i
    .io_cpu_writeBack_haltIt                       (dataCache_1__io_cpu_writeBack_haltIt                        ), //o
    .io_cpu_writeBack_isWrite                      (dataCache_1__io_cpu_writeBack_isWrite                       ), //o
    .io_cpu_writeBack_data                         (dataCache_1__io_cpu_writeBack_data[31:0]                    ), //o
    .io_cpu_writeBack_address                      (_zz_347_[31:0]                                              ), //i
    .io_cpu_writeBack_mmuException                 (dataCache_1__io_cpu_writeBack_mmuException                  ), //o
    .io_cpu_writeBack_unalignedAccess              (dataCache_1__io_cpu_writeBack_unalignedAccess               ), //o
    .io_cpu_writeBack_accessError                  (dataCache_1__io_cpu_writeBack_accessError                   ), //o
    .io_cpu_writeBack_exceptionType                (dataCache_1__io_cpu_writeBack_exceptionType[3:0]            ), //o
    .io_cpu_redo                                   (dataCache_1__io_cpu_redo                                    ), //o
    .io_cpu_flush_valid                            (_zz_348_                                                    ), //i
    .io_cpu_flush_ready                            (dataCache_1__io_cpu_flush_ready                             ), //o
    .io_mem_cmd_valid                              (dataCache_1__io_mem_cmd_valid                               ), //o
    .io_mem_cmd_ready                              (_zz_349_                                                    ), //i
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
  GPR RegFilePluginComp_regFile (
    .rd_adr_0    (decode_RegFilePluginComp_regFileReadAddress1[4:0]  ), //i
    .rd_dat_0    (RegFilePluginComp_regFile_rd_dat_0[31:0]           ), //o
    .rd_adr_1    (decode_RegFilePluginComp_regFileReadAddress2[4:0]  ), //i
    .rd_dat_1    (RegFilePluginComp_regFile_rd_dat_1[31:0]           ), //o
    .rd_adr_2    (decode_RegFilePluginComp_regFileReadAddress3[4:0]  ), //i
    .rd_dat_2    (RegFilePluginComp_regFile_rd_dat_2[31:0]           ), //o
    .wr_en_0     (_zz_350_                                           ), //i
    .wr_adr_0    (_zz_351_[4:0]                                      ), //i
    .wr_dat_0    (_zz_352_[31:0]                                     ), //i
    .clk         (clk                                                ), //i
    .reset       (reset                                              )  //i
  );
  ALUL FX_ALUL (
    .src1         (execute_SRC1[31:0]                  ), //i
    .src2         (execute_SRC2[31:0]                  ), //i
    .alu_ctrl     (execute_DECODER_stageables_7[1:0]   ), //i
    .bit_ctrl     (execute_DECODER_stageables_31[3:0]  ), //i
    .rimi_ctrl    (execute_DECODER_stageables_45[2:0]  ), //i
    .spec_ctrl    (execute_DECODER_stageables_12[2:0]  ), //i
    .shift_amt    (_zz_223_[4:0]                       ), //i
    .mask_mb      (_zz_353_[4:0]                       ), //i
    .mask_me      (_zz_354_[4:0]                       ), //i
    .result       (FX_ALUL_result[31:0]                ), //o
    .cr           (FX_ALUL_cr[2:0]                     ), //o
    .xer_ca       (FX_ALUL_xer_ca                      ), //o
    .xer_ov       (FX_ALUL_xer_ov                      )  //o
  );
  SEL_32x4 SRC1 (
    .src0      (_zz_76_[31:0]      ), //i
    .src1      (_zz_355_[31:0]     ), //i
    .src2      (_zz_356_[31:0]     ), //i
    .src3      (execute_RS[31:0]   ), //i
    .sel       (_zz_357_[3:0]      ), //i
    .result    (SRC1_result[31:0]  )  //o
  );
  SEL_32x4 SRC2_A (
    .src0      (_zz_358_[31:0]       ), //i
    .src1      (_zz_359_[31:0]       ), //i
    .src2      (_zz_360_[31:0]       ), //i
    .src3      (_zz_361_[31:0]       ), //i
    .sel       (_zz_362_[3:0]        ), //i
    .result    (SRC2_A_result[31:0]  )  //o
  );
  SEL_32x3 SRC2 (
    .src0      (execute_RB[31:0]      ), //i
    .src1      (_zz_76_[31:0]         ), //i
    .src2      (SRC_src2_other[31:0]  ), //i
    .sel       (_zz_363_[2:0]         ), //i
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
    .src1      (_zz_364_[15:0]       ), //i
    .src2      (_zz_365_[15:0]       ), //i
    .result    (MUL_LL_result[31:0]  )  //o
  );
  MUL17_S MUL_LH (
    .src1      (_zz_366_[16:0]       ), //i
    .src2      (_zz_367_[16:0]       ), //i
    .result    (MUL_LH_result[33:0]  )  //o
  );
  MUL17_S MUL_HL (
    .src1      (_zz_368_[16:0]       ), //i
    .src2      (_zz_369_[16:0]       ), //i
    .result    (MUL_HL_result[33:0]  )  //o
  );
  MUL17_S MUL_HH (
    .src1      (_zz_370_[16:0]       ), //i
    .src2      (_zz_371_[16:0]       ), //i
    .result    (MUL_HH_result[33:0]  )  //o
  );
  */

  SEL_PRI_32x4 BYP_RA (
    .src0      (ins_byp_ra_q[31:0]                               ), //i
    .src1      (ins_byp_ra_q[63:32]                               ), //i
    .src2      (ins_byp_ra_q[95:64]    ), //i
    .src3      (ins_byp_ra_q[95:64]  ), //i
    .sel       (ins_byp_ra_q[131:128]                               ), //i
    .result    (outs_byp_ra[31:0]                         )  //o
  );
  SEL_PRI_32x4 BYP_RB (
    .src0      (ins_byp_rb_q[31:0]                               ), //i
    .src1      (ins_byp_rb_q[63:32]                               ), //i
    .src2      (ins_byp_rb_q[95:64]    ), //i
    .src3      (ins_byp_rb_q[95:64]  ), //i
    .sel       (ins_byp_rb_q[131:128]                          ), //i
    .result    (outs_byp_rb[31:0]                         )  //o
  );
  SEL_PRI_32x4 BYP_RS (
    .src0      (ins_byp_rs_q[31:0]                               ), //i
    .src1      (ins_byp_rs_q[63:32]                               ), //i
    .src2      (ins_byp_rs_q[95:64]   ), //i
    .src3      (ins_byp_rs_q[95:64] ), //i
    .sel       (ins_byp_rs_q[131:128]                               ), //i
    .result    (outs_byp_rs[31:0]                         )  //o
  );


endmodule
