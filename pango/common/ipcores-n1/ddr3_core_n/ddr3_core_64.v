// Created by IP Generator (Version 2021.1-SP7.3 build 94852)



//////////////////////////////////////////////////////////////////////////////
//
// Copyright (c) 2019 PANGO MICROSYSTEMS, INC
// ALL RIGHTS RESERVED.
//
// THE SOURCE CODE CONTAINED HEREIN IS PROPRIETARY TQ PANGO MICROSYSTEMS, INC.
// IT SHALL NOT BE REPRODUCED OR DISCLOSED IN WHOLE OR IN PART OR USED BY
// PARTIES WITHOUT WRITTEN AUTHORIZATION FROM THE OWNER.
//
/////////////////////////////////////////////////////////////////////////////
// Revision:1.0(initial)
//
//////////////////////////////////////////////////////////////////////////////

`timescale 1ps/1ps

module ddr3_core_64 (
    input               pll_refclk_in  ,
    input               top_rst_n      ,
                       
    output              pll_aclk_0     ,
    output              pll_aclk_1     ,
    output              pll_aclk_2     , 
    
    output              pll_lock       ,
    output              ddrphy_rst_done,
    output              ddrc_init_done ,
    input               ddrc_rst, 
    
                                         
    input                areset_1,      
    input                aclk_1,        
                                         
    input [7:0]          awid_1,        
    input [31:0]         awaddr_1,      
    input [7:0]          awlen_1,       
    input [2:0]          awsize_1,      
    input [1:0]          awburst_1,     
    input                awlock_1,      
                                         
    input                awvalid_1,     
    output               awready_1,     
    input                awurgent_1,    
    input                awpoison_1,    
                                         
    input [63:0]         wdata_1,       
    input [7:0]          wstrb_1,       
    input                wlast_1,       
    input                wvalid_1,      
    output               wready_1,      
                                         
    output [7:0]         bid_1,         
    output [1:0]         bresp_1,       
    output               bvalid_1,      
    input                bready_1,      
                                         
    input [7:0]          arid_1,        
    input [31:0]         araddr_1,      
    input [7:0]          arlen_1,       
    input [2:0]          arsize_1,      
    input [1:0]          arburst_1,     
    input                arlock_1,      
                                         
    input                arvalid_1,     
    output               arready_1,   
    input                arurgent_1,      
    input                arpoison_1,        
                                         
    output [7:0]         rid_1,         
    output [63:0]        rdata_1,       
    output [1:0]         rresp_1,       
    output               rlast_1,       
    output               rvalid_1,      
    input                rready_1,
                                      
    input                csysreq_1,     
    output               csysack_1,     
    output               cactive_1,             

                                         
    input                csysreq_ddrc,  
    output               csysack_ddrc,  
    output               cactive_ddrc,  

 
   
    input               pad_loop_in            ,
    input               pad_loop_in_h          ,
    output              pad_rstn_ch0           ,
    output              pad_ddr_clk_w          ,
    output              pad_ddr_clkn_w         ,
    output              pad_csn_ch0            ,
    output [15:0]       pad_addr_ch0           ,
    inout  [16-1:0]     pad_dq_ch0             ,
    inout  [16/8-1:0]   pad_dqs_ch0            ,
    inout  [16/8-1:0]   pad_dqsn_ch0           ,
    output [16/8-1:0]   pad_dm_rdqs_ch0        ,
    output              pad_cke_ch0            ,
    output              pad_odt_ch0            ,
    output              pad_rasn_ch0           ,
    output              pad_casn_ch0           ,
    output              pad_wen_ch0            ,
    output [2:0]        pad_ba_ch0             ,
    output              pad_loop_out           ,
    output              pad_loop_out_h         
);


localparam DDR_TYPE   = "DDR3";    

localparam ADDRESS_MAPPING_SEL = 8'd0;

localparam MEM_ROW_ADDRESS = 8'd14;

localparam MEM_COLUMN_ADDRESS = 8'd10;

localparam MEM_BANK_ADDRESS = 8'd3;

localparam AXI0_RMASK = 1'b0;

localparam AXI0_WMASK = 1'b0;

localparam AXI1_RMASK = 1'b0;

localparam AXI1_WMASK = 1'b0;

localparam AXI2_RMASK = 1'b0;

localparam AXI2_WMASK = 1'b0;

localparam AXI_RMASK = {AXI2_RMASK,AXI1_RMASK,AXI0_RMASK};
localparam AXI_WMASK = {AXI2_WMASK,AXI1_WMASK,AXI0_WMASK};
                                                                                                 

localparam DATA_WIDTH = "16BIT";

localparam DFI_CLK_PERIOD = 4000000 / 800.0;


//MR0_DDR3
localparam [0:0] DDR3_PPD      = 1'b1;

localparam [2:0] DDR3_WR       =  6 - 4; 

localparam [0:0] DDR3_DLL      = 1'b1;
localparam [0:0] DDR3_TM       = 1'b0;
localparam [0:0] DDR3_RBT      = 1'b0;

localparam [3:0] DDR3_CL       = (6 - 4) * 2; 
    
localparam [1:0] DDR3_BL       = 2'b00;
localparam [15:0] MR0_DDR3     = {3'b000, DDR3_PPD, DDR3_WR, DDR3_DLL, DDR3_TM, DDR3_CL[3:1], DDR3_RBT, DDR3_CL[0], DDR3_BL};
//MR1_DDR3
localparam [0:0] DDR3_QOFF     = 1'b0;
localparam [0:0] DDR3_TDQS     = 1'b0;

localparam [2:0] DDR3_RTT_NOM  = 3'b001;       

localparam [0:0] DDR3_LEVEL    = 1'b0;

localparam [1:0] DDR3_DIC      = 2'b00;

localparam [1:0] DDR3_AL       = 2'b10;     
localparam [0:0] DDR3_DLL_EN   = 1'b0;
localparam [15:0] MR1_DDR3 = {1'b0, DDR3_QOFF, DDR3_TDQS, 1'b0, DDR3_RTT_NOM[2], 1'b0, DDR3_LEVEL, DDR3_RTT_NOM[1], DDR3_DIC[1], DDR3_AL, DDR3_RTT_NOM[0], DDR3_DIC[0], DDR3_DLL_EN};
//MR2_DDR3
localparam [1:0] DDR3_RTT_WR   = 2'b00;
localparam [0:0] DDR3_SRT      = 1'b0;
localparam [0:0] DDR3_ASR      = 1'b0;

localparam [2:0] DDR3_CWL      = 5 - 5;

localparam [2:0] DDR3_PASR     = 3'b000;
localparam [15:0] MR2_DDR3     = {5'b00000, DDR3_RTT_WR, 1'b0, DDR3_SRT, DDR3_ASR, DDR3_CWL, DDR3_PASR};
//MR3_DDR3
localparam [0:0] DDR3_MPR      = 1'b0;
localparam [1:0] DDR3_MPR_LOC  = 2'b00;
localparam [15:0] MR3_DDR3     = {13'b0, DDR3_MPR, DDR3_MPR_LOC};

//MR_DDR2
localparam [2:0] DDR2_BL       = 3'b011;
localparam [0:0] DDR2_BT       = 1'b0; //Sequential

localparam [2:0] DDR2_CL       = 3'd5;

localparam [0:0] DDR2_TM       = 1'b0;
localparam [0:0] DDR2_DLL      = 1'b1;

localparam [2:0] DDR2_WR       =  6 - 1; 

localparam [0:0] DDR2_PD       = 1'b0;
localparam [15:0]  MR_DDR2     = {3'b000,DDR2_PD,DDR2_WR,DDR2_DLL,DDR2_TM,DDR2_CL,DDR2_BT,DDR2_BL};

//EMR1_DDR2
localparam [0:0] DDR2_DLL_EN      = 1'b0;

localparam [0:0] DDR2_DIC      = 1'b0;

localparam [1:0] DDR2_RTT_NOM  = 2'b01;     

localparam [2:0] DDR2_AL       = 3'd3; 
 
localparam [2:0] DDR2_OCD      = 3'b000;
localparam [0:0] DDR2_DQS      = 1'b0;
localparam [0:0] DDR2_RDQS     = 1'b0;
localparam [0:0] DDR2_QOFF     = 1'b0;
localparam [15:0] EMR1_DDR2    = {3'b000,DDR2_QOFF,DDR2_RDQS,DDR2_DQS,DDR2_OCD,DDR2_RTT_NOM[1],DDR2_AL,DDR2_RTT_NOM[0],DDR2_DIC,DDR2_DLL_EN};

localparam [15:0] EMR2_DDR2    =16'h0000;
localparam [15:0] EMR3_DDR2    =16'h0000;
 
//MR_LPDDR
localparam [2:0] LPDDR_BL      = 3'b011;
localparam [0:0] LPDDR_BT      = 1'b0;

localparam [2:0] LPDDR_CL      = 3'd3;

localparam [15:0] MR_LPDDR    = {9'd0,LPDDR_CL,LPDDR_BT,LPDDR_BL};

//EMR_LPDDR

localparam [2:0] LPDDR_DS      = 3'b000;

localparam [15:0] EMR_LPDDR    = {8'd0,LPDDR_DS,5'd0};

localparam [15:0] MR = (DDR_TYPE=="DDR3") ? MR0_DDR3 :
                       (DDR_TYPE=="DDR2") ? MR_DDR2 :
                       (DDR_TYPE=="LPDDR") ? MR_LPDDR : MR0_DDR3; 
localparam [15:0] EMR1 = (DDR_TYPE=="DDR3") ? MR1_DDR3 :
                         (DDR_TYPE=="DDR2") ? EMR1_DDR2 :
                         (DDR_TYPE=="LPDDR") ? EMR_LPDDR:MR1_DDR3;
localparam [15:0] EMR2 = (DDR_TYPE=="DDR3") ? MR2_DDR3 :
                         (DDR_TYPE=="DDR2") ? EMR2_DDR2 : MR2_DDR3;
localparam [15:0] EMR3 = (DDR_TYPE=="DDR3") ? MR3_DDR3 :
                         (DDR_TYPE=="DDR2") ? EMR3_DDR2 : MR3_DDR3;


localparam integer PHY_TMRD   = 4 / 2;

localparam integer PHY_TMOD   = 12 / 2;

localparam integer PHY_TZQINIT= 512 / 2;

localparam integer PHY_TXPR   = 34;

localparam integer PHY_TRP    = 3;

localparam integer PHY_TRFC   = 32;

localparam integer T400NS     = 400*1000 / DFI_CLK_PERIOD;      //0~127
localparam [7:0]   PHY_TXS    = PHY_TXPR[7:0];    

`ifdef SIMULATION
localparam T200US         = (200*1000*1000 / DFI_CLK_PERIOD) / 100;
`else
localparam T200US         = (200*1000*1000 / DFI_CLK_PERIOD);
`endif

localparam  DQS_GATE_LOOP       ="TRUE";
localparam  TEST_PATTERN2       = 32'h7f7f_7f7f;
localparam  TEST_PATTERN3       = 32'h50bc_50bc;
localparam  R_EXTEND            ="FALSE";
localparam  GATE_SEL            ="FALSE";
localparam  CORE_CLK_SEL        = 1'b0; 
localparam  WL_EN               ="TRUE";   //"TRUE" or  "FALSE"
//dqs gate mode
localparam [1:0]   DQS_GATE_MODE    = 2'b01;
localparam         WRDATA_PATH_ADJ  = "FALSE";
localparam         CTRL_PATH_ADJ    = "FALSE";

localparam [7:0]   WL_MAX_STEP      = 8'hff;
localparam [4:0]   WL_MAX_CHECK     = 5'h1f;
localparam         MAN_WRLVL_DQS_L  = "FALSE";   //"TRUE" or  "FALSE"
localparam         MAN_WRLVL_DQS_H  = "FALSE";   //"TRUE" or  "FALSE"
localparam [2:0]   WL_CTRL_L        = 3'b001;
localparam [2:0]   WL_CTRL_H        = 3'b001;

//init dqs gate pos
localparam [1:0]   INIT_READ_CLK_CTRL        = 2'b11;
localparam [1:0]   INIT_READ_CLK_CTRL_H      = 2'b11;
localparam [3:0]   INIT_SLIP_STEP            = 4'h7;
localparam [3:0]   INIT_SLIP_STEP_H          = 4'h7;
localparam         FORCE_READ_CLK_CTRL_L     ="FALSE";   //"TRUE" or  "FALSE"
localparam         FORCE_READ_CLK_CTRL_H     ="FALSE";   //"TRUE" or  "FALSE"
localparam         STOP_WITH_ERROR           ="FALSE";   //"TRUE" or  "FALSE"
localparam         DQGT_DEBUG                = 1'b0;
localparam         WRITE_DEBUG               = 1'b0;

//rdel relate
localparam [4:0]   RDEL_ADJ_MAX_RANG         = 5'h1f;
localparam [3:0]   MIN_DQSI_WIN              = 4'h6;
localparam [7:0]   INIT_SAMP_POSITION        = 8'h0;
localparam [7:0]   INIT_SAMP_POSITION_H      = 8'h0;
localparam         FORCE_SAMP_POSITION_L     ="FALSE";   //"TRUE" or  "FALSE"
localparam         FORCE_SAMP_POSITION_H     ="FALSE";  //"TRUE" or  "FALSE"

localparam [18:0]  RDEL_RD_CNT               = 64;

localparam [8:0]   T_LPDDR                   = 9'h0;
localparam [7:0]   REF_CNT                   = 8'b0011_0100;
localparam         APB_VLD                   = "FALSE";  //"TRUE" or  "FALSE"
localparam [127:0] TEST_PATTERN1             = 128'h0000ffff0000ffff0000ffff0000ffff;
localparam         TRAIN_RST_TYPE            ="TRUE";    //"TRUE" or  "FALSE"

localparam         WL_SETTING                = 1'b0;
localparam         WCLK_DEL_SEL              = 1'b0;
localparam [7:0]   INIT_WRLVL_STEP_L         = 8'h0;
localparam [7:0]   INIT_WRLVL_STEP_H         = 8'h0;

//ddrc parameter

localparam [9:0] DDRC_TRFC_MIN        = 10'd32;

localparam [11:0] DDRC_TREFI           = 12'd48; 
   
localparam [6:0] DDRC_WR2PRE          = 7'd10;

localparam [5:0] DDRC_T_FAW           = 6'd9;

localparam [6:0] DDRC_T_RAS_MAX       = 7'd127;

localparam [5:0] DDRC_T_RAS_MIN       = 6'd8;

localparam [4:0] DDRC_T_XP            = 5'd2;

localparam [5:0] DDRC_RD2PRE          = 6'd4;

localparam [6:0] DDRC_T_RC            = 7'd10;

localparam [5:0] DDRC_WL              = 6'd5;

localparam [5:0] DDRC_RL              = 6'd5;

localparam [5:0] DDRC_RD2WR           = 6'd4;

localparam [5:0] DDRC_WR2RD           = 6'd6;
                                                         
localparam [4:0] DDRC_T_RCD           = (DDR_TYPE=="LPDDR") ? 5'h2 : 5'h1;
localparam [3:0] DDRC_T_CCD           = 4'h2;

localparam [3:0] DDRC_T_RRD           = 4'd2;

localparam [4:0] DDRC_T_RP            = 5'd3;
 
localparam [3:0] DDRC_T_CKSRX         = (DDR_TYPE == "DDR3") ? 4 :
                                        (DDR_TYPE == "DDR2" || DDR_TYPE == "LPDDR") ? 1 : 4;
localparam [3:0] DDRC_T_CKSRE         = (DDR_TYPE == "DDR3") ? 6 :
                                        (DDR_TYPE == "DDR2") ? 1 :
                                        (DDR_TYPE == "LPDDR") ? 0 : 6;
localparam [5:0] DDRC_T_CKESR         = (DDR_TYPE == "LPDDR") ? DDRC_TRFC_MIN/2 : 3;
localparam [4:0] DDRC_T_CKE           = 2;

localparam [6:0] DDRC_DFI_T_RDDATA_EN = 7'd4;

localparam [5:0] DDRC_DFI_TPHY_WRLAT  = 6'd9;

localparam [1:0] DDRC_DATA_BUS_WIDTH  = 2'd0;
 

wire                   ddrc_core_clk         ;
wire                   global_reset_n        ;
wire                   dfi_error             ;            
wire   [2:0]           dfi_error_info        ;
wire   [63:0]          dfi_rddata            ; 
wire   [3:0]           dfi_rddata_valid      ; 
wire                   dfi_ctrlupd_ack       ; 
wire                   dfi_init_complete     ;
wire                   dfi_phyupd_req        ; 
wire   [1:0]           dfi_phyupd_type       ; 
wire                   dfi_lp_ack            ; 
wire   [31:0]          dfi_address           ;
wire   [5:0]           dfi_bank              ;
wire   [1:0]           dfi_cas_n             ;
wire   [1:0]           dfi_ras_n             ; 
wire   [1:0]           dfi_we_n              ; 
wire   [1:0]           dfi_cke               ;
wire   [1:0]           dfi_cs                ;
wire   [1:0]           dfi_odt               ;
wire   [1:0]           dfi_reset_n           ; 
wire   [63:0]          dfi_wrdata            ; 
wire   [7:0]           dfi_wrdata_mask       ;
wire   [3:0]           dfi_wrdata_en         ;
wire   [3:0]           dfi_rddata_en         ;
wire                   dfi_ctrlupd_req       ;
wire                   dfi_dram_clk_disable  ; 
wire                   dfi_init_start        ;
wire   [4:0]           dfi_frequency         ;
wire                   dfi_phyupd_ack        ; 
wire                   dfi_lp_req            ;      
wire   [3:0]           dfi_lp_wakeup         ;

wire                   ddrc_preset  ;
wire [11:0]            ddrc_paddr   ;
wire [31:0]            ddrc_pwdata  ;
wire                   ddrc_pwrite  ;
wire                   ddrc_penable ;

wire pll_rst;
wire pll_phy_clk_gate;

assign pll_rst = ~top_rst_n;

pll_50_400_v1_1 u_pll_50_400 (
    .clkout0 (pll_phy_clk),  //PHY clk     
       
    .clkout1 (pll_pclk ),   //APB clk

    .clkout2 (pll_aclk_0),  //AXI0 clk
    
    .clkout3 (pll_aclk_1),  //AXI1 clk
    
    .clkout4 (pll_aclk_2),    //AXI2 clk
        
    .clkin1 (pll_refclk_in),
    
    .clkout0_gate (pll_phy_clk_gate),
    
    .pll_rst (pll_rst),
    
    .pll_lock (pll_lock)
);


ipsl_hmic_h_phy_top_v1_1  #( 
    .DQS_GATE_LOOP                    (DQS_GATE_LOOP        ),
    .TEST_PATTERN2                    (TEST_PATTERN2        ),  	
    .TEST_PATTERN3                    (TEST_PATTERN3        ),
    .T200US                           (T200US               ),
    .MR0_DDR3                         (MR0_DDR3             ),
    .MR1_DDR3                         (MR1_DDR3             ),
    .MR2_DDR3                         (MR2_DDR3             ),
    .MR3_DDR3                         (MR3_DDR3             ),
    .MR_DDR2                          (MR_DDR2              ),
    .EMR1_DDR2                        (EMR1_DDR2            ),
    .EMR2_DDR2                        (EMR2_DDR2            ),
    .EMR3_DDR2                        (EMR3_DDR2            ),
    .MR_LPDDR                         (MR_LPDDR             ),
    .EMR_LPDDR                        (EMR_LPDDR            ),
    .PHY_TMRD                         (PHY_TMRD             ),
    .PHY_TMOD                         (PHY_TMOD             ),
    .PHY_TZQINIT                      (PHY_TZQINIT          ),
    .PHY_TXPR                         (PHY_TXPR[3:0]        ),
    .PHY_TRP                          (PHY_TRP              ),
    .PHY_TRFC                         (PHY_TRFC             ),
    .WL_EN                            (WL_EN                ),
    .DDR_TYPE                         (DDR_TYPE             ),
    .DATA_WIDTH                       (DATA_WIDTH           ),
    .DQS_GATE_MODE                    (DQS_GATE_MODE        ),
    .WRDATA_PATH_ADJ                  (WRDATA_PATH_ADJ      ),
    .CTRL_PATH_ADJ                    (CTRL_PATH_ADJ        ),
    .WL_MAX_STEP                      (WL_MAX_STEP          ),
    .WL_MAX_CHECK                     (WL_MAX_CHECK         ),
    .MAN_WRLVL_DQS_L                  (MAN_WRLVL_DQS_L      ),
    .MAN_WRLVL_DQS_H                  (MAN_WRLVL_DQS_H      ),
    .WL_CTRL_L                        (WL_CTRL_L            ),
    .WL_CTRL_H                        (WL_CTRL_H            ),
    .INIT_READ_CLK_CTRL               (INIT_READ_CLK_CTRL   ),
    .INIT_READ_CLK_CTRL_H             (INIT_READ_CLK_CTRL_H ),
    .INIT_SLIP_STEP                   (INIT_SLIP_STEP       ),
    .INIT_SLIP_STEP_H                 (INIT_SLIP_STEP_H     ),
    .FORCE_READ_CLK_CTRL_L            (FORCE_READ_CLK_CTRL_L),
    .FORCE_READ_CLK_CTRL_H            (FORCE_READ_CLK_CTRL_H),
    .STOP_WITH_ERROR                  (STOP_WITH_ERROR      ),
    .DQGT_DEBUG                       (DQGT_DEBUG           ),
    .WRITE_DEBUG                      (WRITE_DEBUG          ),
    .RDEL_ADJ_MAX_RANG                (RDEL_ADJ_MAX_RANG    ),
    .MIN_DQSI_WIN                     (MIN_DQSI_WIN         ),
    .INIT_SAMP_POSITION               (INIT_SAMP_POSITION   ),
    .INIT_SAMP_POSITION_H             (INIT_SAMP_POSITION_H ),
    .FORCE_SAMP_POSITION_L            (FORCE_SAMP_POSITION_L),
    .FORCE_SAMP_POSITION_H            (FORCE_SAMP_POSITION_H),
    .RDEL_RD_CNT                      (RDEL_RD_CNT          ),
    .T400NS                           (T400NS               ),
    .T_LPDDR                          (T_LPDDR              ),
    .REF_CNT                          (REF_CNT              ),
    .APB_VLD                          (APB_VLD              ),
    .TEST_PATTERN1                    (TEST_PATTERN1        ),
    .TRAIN_RST_TYPE                   (TRAIN_RST_TYPE       ),    
    .PHY_TXS                          (PHY_TXS              ),
    .WL_SETTING                       (WL_SETTING           ),
    .WCLK_DEL_SEL                     (WCLK_DEL_SEL         ),
    .INIT_WRLVL_STEP_L                (INIT_WRLVL_STEP_L    ),
    .INIT_WRLVL_STEP_H                (INIT_WRLVL_STEP_H    )
) u_ipsl_hmic_h_phy_top (
    .top_rst_n                        (top_rst_n            ),     
    .logic_clk                        (pll_pclk             ),
    .pll_lock                         (pll_lock             ),  
    .ddrc_init_done                   (ddrc_init_done       ),    
    .phy_clk                          (pll_phy_clk          ), 
      
    .phy_pclk                         (pll_pclk             ),
           
    .phy_preset                       (ddrc_preset          ),   
    .phy_paddr                        (ddrc_paddr           ),      
    .phy_pwdata                       (ddrc_pwdata          ),  
    .phy_pwrite                       (ddrc_pwrite          ),   
    .phy_penable                      (ddrc_penable         ), 
    .pll_phy_clk_gate                 (pll_phy_clk_gate     ),                                                      
    .ddrc_core_clk                    (ddrc_core_clk        ),   
    .global_reset_n                   (global_reset_n       ), 
    .ddrphy_rst_done                  (ddrphy_rst_done      ),    
                                      
    .dfi_error                        (dfi_error            ), 
    .dfi_error_info                   (dfi_error_info       ),     
    .dfi_rddata                       (dfi_rddata           ), 
    .dfi_rddata_valid                 (dfi_rddata_valid     ),       
    .dfi_ctrlupd_ack                  (dfi_ctrlupd_ack      ),    
    .dfi_init_complete                (dfi_init_complete    ),        
    .dfi_phyupd_req                   (dfi_phyupd_req       ),         
    .dfi_phyupd_type                  (dfi_phyupd_type      ),           
    .dfi_lp_ack                       (dfi_lp_ack           ),      
    .dfi_address                      (dfi_address          ),     
    .dfi_bank                         (dfi_bank             ),        
    .dfi_cas_n                        (dfi_cas_n            ),       
    .dfi_ras_n                        (dfi_ras_n            ),       
    .dfi_we_n                         (dfi_we_n             ),        
    .dfi_cke                          (dfi_cke              ),         
    .dfi_cs                           (dfi_cs               ),          
    .dfi_odt                          (dfi_odt              ),         
    .dfi_reset_n                      (dfi_reset_n          ),     
    .dfi_wrdata                       (dfi_wrdata           ),      
    .dfi_wrdata_mask                  (dfi_wrdata_mask      ), 
    .dfi_wrdata_en                    (dfi_wrdata_en        ),   
    .dfi_rddata_en                    (dfi_rddata_en        ),   
    .dfi_ctrlupd_req                  (dfi_ctrlupd_req      ),             
    .dfi_dram_clk_disable             (dfi_dram_clk_disable ),           
    .dfi_init_start                   (dfi_init_start       ),  
    .dfi_frequency                    (dfi_frequency        ),   
    .dfi_phyupd_ack                   (dfi_phyupd_ack       ),  
    .dfi_lp_req                       (dfi_lp_req           ),      
    .dfi_lp_wakeup                    (dfi_lp_wakeup        ),       
    .pad_loop_in                      (pad_loop_in          ),   
    .pad_loop_in_h                    (pad_loop_in_h        ),    
    .pad_rstn_ch0                     (pad_rstn_ch0         ),
    .pad_ddr_clk_w                    (pad_ddr_clk_w        ),
    .pad_ddr_clkn_w                   (pad_ddr_clkn_w       ),   
    .pad_csn_ch0                      (pad_csn_ch0          ),  
    .pad_addr_ch0                     (pad_addr_ch0         ),
    .pad_dq_ch0                       (pad_dq_ch0           ),
    .pad_dqs_ch0                      (pad_dqs_ch0          ),
    .pad_dqsn_ch0                     (pad_dqsn_ch0         ),   
    .pad_dm_rdqs_ch0                  (pad_dm_rdqs_ch0      ),
    .pad_cke_ch0                      (pad_cke_ch0          ), 
    .pad_odt_ch0                      (pad_odt_ch0          ),
    .pad_rasn_ch0                     (pad_rasn_ch0         ), 
    .pad_casn_ch0                     (pad_casn_ch0         ), 
    .pad_wen_ch0                      (pad_wen_ch0          ),  
    .pad_ba_ch0                       (pad_ba_ch0           ),
    .pad_loop_out                     (pad_loop_out         ), 
    .pad_loop_out_h                   (pad_loop_out_h       )
);    



ipsl_hmic_h_ddrc_top_v1_1 #(
    .TRFC_MIN                         (DDRC_TRFC_MIN        ),  
    .TREFI                            (DDRC_TREFI           ),  
    .T_MRD                            (PHY_TMRD             ),  
    .T_MOD                            (PHY_TMOD             ),  
    .DDR_TYPE                         (DDR_TYPE             ),
    .MR                               (MR                   ),  
    .EMR                              (EMR1                 ),  
    .EMR2                             (EMR2                 ),  
    .EMR3                             (EMR3                 ),  
    .WR2PRE                           (DDRC_WR2PRE          ),  
    .T_FAW                            (DDRC_T_FAW           ),  
    .T_RAS_MAX                        (DDRC_T_RAS_MAX       ),  
    .T_RAS_MIN                        (DDRC_T_RAS_MIN       ),  
    .T_XP                             (DDRC_T_XP            ),  
    .RD2PRE                           (DDRC_RD2PRE          ),  
    .T_RC                             (DDRC_T_RC            ),  
    .WL                               (DDRC_WL              ),  
    .RL                               (DDRC_RL              ),  
    .RD2WR                            (DDRC_RD2WR           ),  
    .WR2RD                            (DDRC_WR2RD           ),  
    .T_RCD                            (DDRC_T_RCD           ),  
    .T_CCD                            (DDRC_T_CCD           ),  
    .T_RRD                            (DDRC_T_RRD           ),  
    .T_RP                             (DDRC_T_RP            ),  
    .T_CKSRX                          (DDRC_T_CKSRX         ),  
    .T_CKSRE                          (DDRC_T_CKSRE         ),  
    .T_CKESR                          (DDRC_T_CKESR         ),  
    .T_CKE                            (DDRC_T_CKE           ),  
    .DFI_T_RDDATA_EN                  (DDRC_DFI_T_RDDATA_EN ),  
    .DFI_TPHY_WRLAT                   (DDRC_DFI_TPHY_WRLAT  ),  
    .DATA_BUS_WIDTH                   (DDRC_DATA_BUS_WIDTH  ),
    .ADDRESS_MAPPING_SEL              (ADDRESS_MAPPING_SEL  ),
    .MEM_ROW_ADDRESS                  (MEM_ROW_ADDRESS      ),
    .MEM_COLUMN_ADDRESS               (MEM_COLUMN_ADDRESS   ),
    .MEM_BANK_ADDRESS                 (MEM_BANK_ADDRESS     ) 
   
) u_ipsl_hmic_h_ddrc_top (                                             
    .resetn                           (global_reset_n       ),       
    .ddrc_init_done                   (ddrc_init_done       ),       
    .core_clk                         (ddrc_core_clk        ),       
    .ddrc_rst                         (ddrc_rst             ),       

    .areset_0                         (1'b1                 ),  
    .aclk_0                           (                     ),  
    .awid_0                           (                     ),  
    .awaddr_0                         (                     ),  
    .awlen_0                          (                     ),  
    .awsize_0                         (                     ),  
    .awburst_0                        (                     ),  
    .awlock_0                         (                     ),  
    .awvalid_0                        (                     ),  
    .awready_0                        (                     ),  
    .awurgent_0                       (                     ),  
    .awpoison_0                       (                     ),  
    .wdata_0                          (                     ),  
    .wstrb_0                          (                     ),  
    .wlast_0                          (                     ),  
    .wvalid_0                         (                     ),  
    .wready_0                         (                     ),  
    .bid_0                            (                     ),  
    .bresp_0                          (                     ),  
    .bvalid_0                         (                     ),  
    .bready_0                         (                     ),  
    .arid_0                           (                     ),  
    .araddr_0                         (                     ),  
    .arlen_0                          (                     ),  
    .arsize_0                         (                     ),  
    .arburst_0                        (                     ),  
    .arlock_0                         (                     ),  
    .arvalid_0                        (                     ),  
    .arready_0                        (                     ),
    .arurgent_0                       (                     ),      
    .arpoison_0                       (                     ),  
    .rid_0                            (                     ),  
    .rdata_0                          (                     ),  
    .rresp_0                          (                     ),  
    .rlast_0                          (                     ),  
    .rvalid_0                         (                     ),  
    .rready_0                         (                     ),
    .raq_push_0                       (                     ),   
    .raq_split_0                      (                     ),   
    .waq_push_0                       (                     ),   
    .waq_split_0                      (                     ),       
    .awqos_0                          (4'b0000              ),   
    .arqos_0                          (4'b0000              ),   
    .csysreq_0                        (                     ),   
    .csysack_0                        (                     ),   
    .cactive_0                        (                     ), 
    
    .areset_1                         (areset_1             ),  
    .aclk_1                           (aclk_1               ),  
    .awid_1                           (awid_1               ),  
    .awaddr_1                         (awaddr_1             ),  
    .awlen_1                          (awlen_1              ),  
    .awsize_1                         (awsize_1             ),  
    .awburst_1                        (awburst_1            ),  
    .awlock_1                         (awlock_1             ),  
    .awvalid_1                        (awvalid_1            ),  
    .awready_1                        (awready_1            ),  
    .awurgent_1                       (awurgent_1           ),  
    .awpoison_1                       (awpoison_1           ),  
    .wdata_1                          (wdata_1              ),  
    .wstrb_1                          (wstrb_1              ),  
    .wlast_1                          (wlast_1              ),  
    .wvalid_1                         (wvalid_1             ),  
    .wready_1                         (wready_1             ),  
    .bid_1                            (bid_1                ),  
    .bresp_1                          (bresp_1              ),  
    .bvalid_1                         (bvalid_1             ),   
    .bready_1                         (bready_1             ),   
    .arid_1                           (arid_1               ),   
    .araddr_1                         (araddr_1             ),   
    .arlen_1                          (arlen_1              ),   
    .arsize_1                         (arsize_1             ),   
    .arburst_1                        (arburst_1            ),   
    .arlock_1                         (arlock_1             ),   
    .arvalid_1                        (arvalid_1            ),   
    .arready_1                        (arready_1            ),
    .arurgent_1                       (arurgent_1           ),       
    .arpoison_1                       (arpoison_1           ),   
    .rid_1                            (rid_1                ),   
    .rdata_1                          (rdata_1              ),   
    .rresp_1                          (rresp_1              ),   
    .rlast_1                          (rlast_1              ),   
    .rvalid_1                         (rvalid_1             ),   
    .rready_1                         (rready_1             ), 
    .raq_push_1                       (                     ),   
    .raq_split_1                      (                     ),   
    .waq_push_1                       (                     ),   
    .waq_split_1                      (                     ),          
    .awqos_1                          (4'b0000              ),   
    .arqos_1                          (4'b0000              ),   
    .csysreq_1                        (csysreq_1            ),   
    .csysack_1                        (csysack_1            ),   
    .cactive_1                        (cactive_1            ),           
        
    .areset_2                         (1'b1                 ),   
    .aclk_2                           (                     ),   
    .awid_2                           (                     ),   
    .awaddr_2                         (                     ),   
    .awlen_2                          (                     ),   
    .awsize_2                         (                     ),   
    .awburst_2                        (                     ),   
    .awlock_2                         (                     ),   
    .awvalid_2                        (                     ),   
    .awready_2                        (                     ),   
    .awurgent_2                       (                     ),   
    .awpoison_2                       (                     ),   
    .wdata_2                          (                     ),   
    .wstrb_2                          (                     ),   
    .wlast_2                          (                     ),   
    .wvalid_2                         (                     ),   
    .wready_2                         (                     ),   
    .bid_2                            (                     ),   
    .bresp_2                          (                     ),   
    .bvalid_2                         (                     ),   
    .bready_2                         (                     ),   
    .arid_2                           (                     ),   
    .araddr_2                         (                     ),   
    .arlen_2                          (                     ),   
    .arsize_2                         (                     ),   
    .arburst_2                        (                     ),   
    .arlock_2                         (                     ),   
    .arvalid_2                        (                     ),   
    .arready_2                        (                     ),
    .arurgent_2                       (                     ),       
    .arpoison_2                       (                     ),   
    .rid_2                            (                     ),   
    .rdata_2                          (                     ),   
    .rresp_2                          (                     ),   
    .rlast_2                          (                     ),   
    .rvalid_2                         (                     ),   
    .rready_2                         (                     ),   
   
    .raq_push_2                       (                     ),   
    .raq_split_2                      (                     ),   
    .waq_push_2                       (                     ),   
    .waq_split_2                      (                     ),   
    .awqos_2                          (4'b0000              ),   
    .arqos_2                          (4'b0000              ),   
    .csysreq_2                        (                     ),   
    .csysack_2                        (                     ),   
    .cactive_2                        (                     ),   
                                  
    .csysreq_ddrc                     (csysreq_ddrc         ),   
    .csysack_ddrc                     (csysack_ddrc         ),   
    .cactive_ddrc                     (cactive_ddrc         ),  
 
    .pa_rmask                         (AXI_RMASK            ),   
    .pa_wmask                         (AXI_WMASK            ), 
    
    .dfi_error                        (dfi_error            ),     
    .dfi_error_info                   (dfi_error_info       ),     
    .dfi_rddata                       (dfi_rddata           ),      
    .dfi_rddata_valid                 (dfi_rddata_valid     ),   
    .dfi_ctrlupd_ack                  (dfi_ctrlupd_ack      ),        
    .dfi_phyupd_req                   (dfi_phyupd_req       ),    
    .dfi_phyupd_type                  (dfi_phyupd_type      ),     
    .dfi_lp_ack                       (dfi_lp_ack           ),   
    .dfi_init_complete                (dfi_init_complete    ),   
                                                          
    .dfi_address                      (dfi_address          ),   
    .dfi_bank                         (dfi_bank             ),  
    .dfi_cas_n                        (dfi_cas_n            ),   
    .dfi_ras_n                        (dfi_ras_n            ),   
    .dfi_we_n                         (dfi_we_n             ),     
    .dfi_cke                          (dfi_cke              ),   
    .dfi_cs                           (dfi_cs               ),   
    .dfi_odt                          (dfi_odt              ),   
    .dfi_reset_n                      (dfi_reset_n          ),    
    .dfi_wrdata                       (dfi_wrdata           ),    
    .dfi_wrdata_mask                  (dfi_wrdata_mask      ),    
    .dfi_wrdata_en                    (dfi_wrdata_en        ),    
    .dfi_rddata_en                    (dfi_rddata_en        ),    
    .dfi_ctrlupd_req                  (dfi_ctrlupd_req      ),       
    .dfi_dram_clk_disable             (dfi_dram_clk_disable ),       
    .dfi_init_start                   (dfi_init_start       ),      
    .dfi_frequency                    (dfi_frequency        ),      
    .dfi_phyupd_ack                   (dfi_phyupd_ack       ),       
    .dfi_lp_req                       (dfi_lp_req           ),       
    .dfi_lp_wakeup                    (dfi_lp_wakeup        ),       

    .ddrc_preset                      (ddrc_preset          ),
    .ddrc_paddr                       (ddrc_paddr           ),
    .ddrc_pwdata                      (ddrc_pwdata          ),
    .ddrc_pwrite                      (ddrc_pwrite          ),
    .ddrc_penable                     (ddrc_penable         ),
                                                         
    .pclk                             (pll_pclk             ),   
    .preset                           (1'b0                 ),    
    .paddr                            (                     ),   
    .pwdata                           (                     ),   
    .pwrite                           (                     ),   
    .penable                          (                     ),     
    .pslverr                          (                     ),     
    .psel                             (                     ),    
    .pready                           (                     ),    
    .prdata                           (                     )    

);

endmodule
