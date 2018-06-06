module Queue_14(
  input   clk,
  input   reset,
  output  io_enq_ready,
  input   io_enq_valid,
  input  [1:0] io_enq_bits_resp,
  input  [4:0] io_enq_bits_id,
  input   io_enq_bits_user,
  input   io_deq_ready,
  output  io_deq_valid,
  output [1:0] io_deq_bits_resp,
  output [4:0] io_deq_bits_id,
  output  io_deq_bits_user,
  output  io_count
);
  reg [1:0] ram_resp [0:0];
  reg [31:0] GEN_0;
  wire [1:0] ram_resp_T_64_data;
  wire  ram_resp_T_64_addr;
  wire  ram_resp_T_64_en;
  wire [1:0] ram_resp_T_53_data;
  wire  ram_resp_T_53_addr;
  wire  ram_resp_T_53_mask;
  wire  ram_resp_T_53_en;
  reg [4:0] ram_id [0:0];
  reg [31:0] GEN_1;
  wire [4:0] ram_id_T_64_data;
  wire  ram_id_T_64_addr;
  wire  ram_id_T_64_en;
  wire [4:0] ram_id_T_53_data;
  wire  ram_id_T_53_addr;
  wire  ram_id_T_53_mask;
  wire  ram_id_T_53_en;
  reg  ram_user [0:0];
  reg [31:0] GEN_2;
  wire  ram_user_T_64_data;
  wire  ram_user_T_64_addr;
  wire  ram_user_T_64_en;
  wire  ram_user_T_53_data;
  wire  ram_user_T_53_addr;
  wire  ram_user_T_53_mask;
  wire  ram_user_T_53_en;
  reg  maybe_full;
  reg [31:0] GEN_3;
  wire  T_50;
  wire  T_51;
  wire  do_enq;
  wire  T_52;
  wire  do_deq;
  wire  T_59;
  wire  GEN_9;
  wire  T_61;
  wire [1:0] T_68;
  wire  ptr_diff;
  wire [1:0] T_70;
  assign io_enq_ready = T_50;
  assign io_deq_valid = T_61;
  assign io_deq_bits_resp = ram_resp_T_64_data;
  assign io_deq_bits_id = ram_id_T_64_data;
  assign io_deq_bits_user = ram_user_T_64_data;
  assign io_count = T_70[0];
  assign ram_resp_T_64_addr = 1'h0;
  assign ram_resp_T_64_en = 1'h1;
  assign ram_resp_T_64_data = ram_resp[ram_resp_T_64_addr];
  assign ram_resp_T_53_data = io_enq_bits_resp;
  assign ram_resp_T_53_addr = 1'h0;
  assign ram_resp_T_53_mask = do_enq;
  assign ram_resp_T_53_en = do_enq;
  assign ram_id_T_64_addr = 1'h0;
  assign ram_id_T_64_en = 1'h1;
  assign ram_id_T_64_data = ram_id[ram_id_T_64_addr];
  assign ram_id_T_53_data = io_enq_bits_id;
  assign ram_id_T_53_addr = 1'h0;
  assign ram_id_T_53_mask = do_enq;
  assign ram_id_T_53_en = do_enq;
  assign ram_user_T_64_addr = 1'h0;
  assign ram_user_T_64_en = 1'h1;
  assign ram_user_T_64_data = ram_user[ram_user_T_64_addr];
  assign ram_user_T_53_data = io_enq_bits_user;
  assign ram_user_T_53_addr = 1'h0;
  assign ram_user_T_53_mask = do_enq;
  assign ram_user_T_53_en = do_enq;
  assign T_50 = maybe_full == 1'h0;
  assign T_51 = io_enq_ready & io_enq_valid;
  assign do_enq = T_51;
  assign T_52 = io_deq_ready & io_deq_valid;
  assign do_deq = T_52;
  assign T_59 = do_enq != do_deq;
  assign GEN_9 = T_59 ? do_enq : maybe_full;
  assign T_61 = T_50 == 1'h0;
  assign T_68 = 1'h0 - 1'h0;
  assign ptr_diff = T_68[0:0];
  assign T_70 = {maybe_full,ptr_diff};
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifndef verilator
      #0.002;
    `endif
  GEN_0 = {1{$random}};
  `ifdef RANDOMIZE
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_resp[initvar] = GEN_0[1:0];
  `endif
  GEN_1 = {1{$random}};
  `ifdef RANDOMIZE
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_id[initvar] = GEN_1[4:0];
  `endif
  GEN_2 = {1{$random}};
  `ifdef RANDOMIZE
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_user[initvar] = GEN_2[0:0];
  `endif
  `ifdef RANDOMIZE
  GEN_3 = {1{$random}};
  maybe_full = GEN_3[0:0];
  `endif
  end
`endif
  always @(posedge clk) begin
    if(ram_resp_T_53_en & ram_resp_T_53_mask) begin
      ram_resp[ram_resp_T_53_addr] <= ram_resp_T_53_data;
    end
    if(ram_id_T_53_en & ram_id_T_53_mask) begin
      ram_id[ram_id_T_53_addr] <= ram_id_T_53_data;
    end
    if(ram_user_T_53_en & ram_user_T_53_mask) begin
      ram_user[ram_user_T_53_addr] <= ram_user_T_53_data;
    end
    if(reset) begin
      maybe_full <= 1'h0;
    end else begin
      if(T_59) begin
        maybe_full <= do_enq;
      end
    end
  end
endmodule
