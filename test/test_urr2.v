//crc

// ============================================================================
// test_urr - periodicheskii generator impulsa  CRC
//
// Naznachenie:
//   Kagdie DELAY_MAX taktov clk vidaet impuls crc_check_i (shirina PULSE_LEN
//   taktov). Prednaznachen dla zapuska vnesnego modula podshceta CRC. Cicl zamknut:IDLE -> PULSE -> WAIT -> IDLE -> ...
//
// Ports:
//   clk            - taktirovanie
//   rst            - sinhronnii sbros, aktivnii visokii
//   urr_connected_i- zaglushka "soedinenie ustanovleno", vsegda 1
//   crc_check_i    - impuls starta scheta CRC
// ============================================================================
 module test_urr(
     input  clk,
     input  rst,
     (* DONT_TOUCH = "yes" *) output        urr_connected_i,
     (* DONT_TOUCH = "yes" *) output        en_i,
     (* DONT_TOUCH = "yes" *) output [7:0]  addr_i,
     (* DONT_TOUCH = "yes" *) output        crc_check_i
 );

     // ---------------------------------------------------------------
     // Параметры
     // ---------------------------------------------------------------
     localparam [7:0]  ADDR_START = 8'd1;              // nachalnii adres (for addr_i)
     localparam [23:0] DELAY_MAX  = 24'd15_300_000;    // pauza megdu impulsami, taktov
     localparam [1:0]  PULSE_LEN  = 2'd3;              // shirina impulsa crc_check_i

     localparam [1:0] ST_IDLE  = 2'd0;
     localparam [1:0] ST_PULSE = 2'd1;
     localparam [1:0] ST_WAIT  = 2'd2;

     // ---------------------------------------------------------------
     // Регистры
     // ---------------------------------------------------------------
     (* DONT_TOUCH = "yes" *) reg [7:0]  addr_r;
     (* DONT_TOUCH = "yes" *) reg        en_r;
     (* DONT_TOUCH = "yes" *) reg        crc_check_r;
     (* DONT_TOUCH = "yes" *) reg        connected_r;
     (* DONT_TOUCH = "yes" *) reg [1:0]  state;
     (* DONT_TOUCH = "yes" *) reg [23:0] send_delay;
     (* DONT_TOUCH = "yes" *) reg [1:0]  pulse_cnt;

     // ---------------------------------------------------------------
     // Выходы
     // ---------------------------------------------------------------
     assign addr_i          = addr_r;
     assign en_i            = en_r;
     assign crc_check_i     = crc_check_r;
     assign urr_connected_i = connected_r;

     // ---------------------------------------------------------------
     // FSM
     //   IDLE  : sbros schetchikov, podgotovka k impulsu
     //   PULSE : crc_check_i=1 и en_i=1 v techenie PULSE_LEN taktov
     //   WAIT  : crc_check_i=0, en_i=0, pauza DELAY_MAX taktov
     // ---------------------------------------------------------------
     always @(posedge clk) begin
         if (rst) begin
             addr_r      <= ADDR_START;
             en_r        <= 1'b0;
             crc_check_r <= 1'b0;
             connected_r <= 1'b1;
             state       <= ST_IDLE;
             send_delay  <= 24'd0;
             pulse_cnt   <= 2'd0;
         end else begin
             case (state)

                 // ---------------------------------------------------
                 ST_IDLE: begin
                     en_r        <= 1'b0;
                     crc_check_r <= 1'b0;
                     send_delay  <= 24'd0;
                     pulse_cnt   <= 2'd0;
                     state       <= ST_PULSE;
                 end

                 // ---------------------------------------------------
                 ST_PULSE: begin
                     crc_check_r <= 1'b1;         //impuls starta CRC
                    // en_r        <= 1'b1;         // razreshenie scheta

                     if (pulse_cnt == PULSE_LEN - 1) begin
                         pulse_cnt <= 2'd0;
                         state     <= ST_WAIT;
                     end else begin
                         pulse_cnt <= pulse_cnt + 1'b1;
                     end
                 end

                 // ---------------------------------------------------
                 ST_WAIT: begin
                     crc_check_r <= 1'b0;
                     en_r        <= 1'b0;

                     if (send_delay == DELAY_MAX - 1) begin
                         send_delay <= 24'd0;
                         state      <= ST_IDLE;   // -> snova ST_PULSE (cikl)
                     end else begin
                         send_delay <= send_delay + 1'b1;
                     end
                 end

                 // ---------------------------------------------------
                 default: state <= ST_IDLE;
             endcase
         end
     end

 endmodule



//-------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------


// No connect crc 

// module test_urr(
//     input  clk,
//     input  rst,
//     (* DONT_TOUCH = "yes" *) output        urr_connected_i,
//     (* DONT_TOUCH = "yes" *) output        en_i,
//     (* DONT_TOUCH = "yes" *) output [7:0]  addr_i,
//     (* DONT_TOUCH = "yes" *) output        crc_check_i
// );

//     // ---------------------------------------------------------------
//     // Параметры
//     // ---------------------------------------------------------------
//     localparam [7:0]  ADDR_START = 8'd1;
//     localparam [23:0] DELAY_MAX  = 24'd15_300_000;
//     localparam [1:0]  PULSE_LEN  = 2'd3;

//     localparam [1:0] ST_IDLE  = 2'd0;
//     localparam [1:0] ST_PULSE = 2'd1;
//     localparam [1:0] ST_WAIT  = 2'd2;

//     // --- параметры периодического отключения ---
//     localparam [13:0] HIGH_PERIOD = 14'd9000;   // 1 -> 0 через 9000 тактов
//     localparam [9:0]  LOW_PERIOD  = 10'd5000;   // 0 -> 1 через 1000 тактов

//     // ---------------------------------------------------------------
//     // Регистры
//     // ---------------------------------------------------------------
//     (* DONT_TOUCH = "yes" *) reg [7:0]  addr_r;
//     (* DONT_TOUCH = "yes" *) reg        en_r;
//     (* DONT_TOUCH = "yes" *) reg        crc_check_r;
//     (* DONT_TOUCH = "yes" *) reg        connected_r;
//     (* DONT_TOUCH = "yes" *) reg [1:0]  state;
//     (* DONT_TOUCH = "yes" *) reg [23:0] send_delay;
//     (* DONT_TOUCH = "yes" *) reg [1:0]  pulse_cnt;

//     (* DONT_TOUCH = "yes" *) reg [13:0] conn_high_cnt;  // счётчик "в 1"
//     (* DONT_TOUCH = "yes" *) reg [9:0]  conn_low_cnt;   // счётчик "в 0"

//     // ---------------------------------------------------------------
//     // Выходы
//     // ---------------------------------------------------------------
//     assign addr_i          = addr_r;
//     assign en_i            = en_r;
//     assign crc_check_i     = crc_check_r;
//     assign urr_connected_i = connected_r;

//     // ---------------------------------------------------------------
//     // FSM
//     // ---------------------------------------------------------------
//     always @(posedge clk) begin
//         if (rst) begin
//             addr_r        <= ADDR_START;
//             en_r          <= 1'b0;
//             crc_check_r   <= 1'b0;
//             connected_r   <= 1'b1;
//             state         <= ST_IDLE;
//             send_delay    <= 24'd0;
//             pulse_cnt     <= 2'd0;

//             conn_high_cnt <= 14'd0;
//             conn_low_cnt  <= 10'd0;
//         end else begin

//             // ============================================================
//             // Периодическое отключение/включение urr_connected_i
//             // ============================================================
//             if (connected_r) begin
//                 // Держим 1 ровно HIGH_PERIOD тактов
//                 if (conn_high_cnt == HIGH_PERIOD - 1) begin
//                     conn_high_cnt <= 14'd0;
//                     connected_r   <= 1'b0;
//                 end else begin
//                     conn_high_cnt <= conn_high_cnt + 1'b1;
//                 end
//             end else begin
//                 // Держим 0 ровно LOW_PERIOD тактов
//                 if (conn_low_cnt == LOW_PERIOD - 1) begin
//                     conn_low_cnt <= 10'd0;
//                     connected_r  <= 1'b1;
//                 end else begin
//                     conn_low_cnt <= conn_low_cnt + 1'b1;
//                 end
//             end
//             // ============================================================

//             case (state)

//                 ST_IDLE: begin
//                     en_r        <= 1'b0;
//                     crc_check_r <= 1'b0;
//                     send_delay  <= 24'd0;
//                     pulse_cnt   <= 2'd0;
//                     state       <= ST_PULSE;
//                 end

//                 ST_PULSE: begin
//                     crc_check_r <= 1'b1;

//                     if (pulse_cnt == PULSE_LEN - 1) begin
//                         pulse_cnt <= 2'd0;
//                         state     <= ST_WAIT;
//                     end else begin
//                         pulse_cnt <= pulse_cnt + 1'b1;
//                     end
//                 end

//                 ST_WAIT: begin
//                     crc_check_r <= 1'b0;
//                     en_r        <= 1'b0;

//                     if (send_delay == DELAY_MAX - 1) begin
//                         send_delay <= 24'd0;
//                         state      <= ST_IDLE;
//                     end else begin
//                         send_delay <= send_delay + 1'b1;
//                     end
//                 end

//                 default: state <= ST_IDLE;
//             endcase
//         end
//     end

// endmodule



//------------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------------

 //freq

//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Module Name: test_urr
//// Description: Перебор адресов 1..50, по каждому адресу одиночный импульс en
////              (1 такт), затем пауза DELAY_MAX тактов и переход к следующему.
////////////////////////////////////////////////////////////////////////////////////

//module test_urr(
//  input  clk,
//  input  rst,
//  output urr_connected_i,
//  output en_i,
//  output [7:0] addr_i,
//  output crc_check_i
//   );

//   // ---------------------------------------------------------------
//   // Параметры
//   // ---------------------------------------------------------------
//   localparam [7:0]  ADDR_START = 8'd1;
//   localparam [7:0]  ADDR_STOP  = 8'd50;
//   localparam [21:0] DELAY_MAX  = 22'd300000;  // тактов паузы между адресами

//   localparam [1:0] ST_IDLE  = 2'd0;
//   localparam [1:0] ST_PULSE = 2'd1;
//   localparam [1:0] ST_WAIT  = 2'd2;

//   // ---------------------------------------------------------------
//   // Регистры
//   // ---------------------------------------------------------------
//   reg [7:0]  addr_r;
//   reg        en_r;
//   reg        crc_check_r;
//   reg        connected_r;
//   reg [1:0]  state;
//   reg [21:0] send_delay;

//   // ---------------------------------------------------------------
//   // Выходы
//   // ---------------------------------------------------------------
//   assign addr_i          = addr_r;
//   assign en_i            = en_r;
//   assign crc_check_i     = crc_check_r;
//   assign urr_connected_i = connected_r;  // заглушка, см. примечание

//   // ---------------------------------------------------------------
//   // FSM
//   //   IDLE  : en=0, crc=0, готовим адрес
//   //   PULSE : en=1 (ровно один такт)
//   //   WAIT  : en=0, ждём DELAY_MAX тактов, затем addr++ и обратно в IDLE
//   // ---------------------------------------------------------------
//   always @(posedge clk) begin
//       if (rst) begin
//           addr_r      <= ADDR_START;
//           en_r        <= 1'b0;
//           crc_check_r <= 1'b0;
//           connected_r <= 1'b1;
//           state       <= ST_IDLE;
//           send_delay  <= 22'd0;
//       end else begin
//           case (state)

//               ST_IDLE: begin
//                   en_r        <= 1'b0;
//                   crc_check_r <= 1'b0;
//                   send_delay  <= 22'd0;    // гарантированно обнуляем счётчик
//                   state       <= ST_PULSE;
//               end

//               ST_PULSE: begin
//                   en_r  <= 1'b1;            // одиночный импульс en
//                   state <= ST_WAIT;
//               end

//               ST_WAIT: begin
//                   en_r        <= 1'b0;
//                   crc_check_r <= 1'b0;

//                   if (send_delay == DELAY_MAX - 1) begin
//                       // Пауза закончилась - переход к следующему адресу
//                       send_delay  <= 22'd0;
//                       connected_r <= 1'b1;
//                       if (addr_r == ADDR_STOP)
//                           addr_r <= ADDR_START;   // заворот 50 -> 1
//                       else
//                           addr_r <= addr_r + 1'b1;
//                       state <= ST_IDLE;
//                   end else begin
//                       send_delay <= send_delay + 1'b1;
//                   end
//               end

//               default: state <= ST_IDLE;
//           endcase
//       end
//   end

//endmodule




// ---------------------------------------------------------------
    // No urr_connect freq
    //   
    //   
    //   
    // ---------------------------------------------------------------

//  module test_urr(
//     input  clk,
//     input  rst,
//     output urr_connected_i,
//     output en_i,
//     output [7:0] addr_i,
//     output crc_check_i
//      );

//      // ---------------------------------------------------------------
//      // Параметры
//      // ---------------------------------------------------------------
//      localparam [7:0]  ADDR_START = 8'd1;
//      localparam [7:0]  ADDR_STOP  = 8'd50;
//      localparam [23:0] DELAY_MAX  = 24'd15_300_000;
//      localparam [1:0]  PULSE_LEN  = 2'd3;

//      localparam [1:0] ST_IDLE  = 2'd0;
//      localparam [1:0] ST_PULSE = 2'd1;
//      localparam [1:0] ST_WAIT  = 2'd2;

//      // --- параметры периодического отключения ---
//      localparam [13:0] HIGH_PERIOD = 14'd9000;   // 1 -> 0 через 9000 тактов
//      localparam [13:0]  LOW_PERIOD  = 14'd5000;   // 0 -> 1 через 1000 тактов




// //      // ---------------------------------------------------------------
// //     // Регистры
// //    // ---------------------------------------------------------------
//      (* DONT_TOUCH = "yes" *) reg [7:0]  addr_r;
//      (* DONT_TOUCH = "yes" *) reg        en_r;
//      (* DONT_TOUCH = "yes" *) reg        crc_check_r;
//      (* DONT_TOUCH = "yes" *) reg        connected_r;
//      (* DONT_TOUCH = "yes" *) reg [1:0]  state;
//      (* DONT_TOUCH = "yes" *) reg [23:0] send_delay;
//      (* DONT_TOUCH = "yes" *) reg [1:0]  pulse_cnt;

//      (* DONT_TOUCH = "yes" *) reg [13:0] conn_high_cnt;  // счётчик "в 1"
//      (* DONT_TOUCH = "yes" *) reg [13:0]  conn_low_cnt;   // счётчик "в 0"

//      // ---------------------------------------------------------------
//      // Выходы
//      // ---------------------------------------------------------------
//      assign addr_i          = addr_r;
//      assign en_i            = en_r;
//      assign crc_check_i     = crc_check_r;
//      assign urr_connected_i = connected_r;  // заглушка, см. примечание

   






    
//    // ---------------------------------------------------------------
// //     // FSM
//     // ---------------------------------------------------------------
//      always @(posedge clk) begin
//          if (rst) begin
//              addr_r        <= ADDR_START;
//              en_r          <= 1'b0;
//              crc_check_r   <= 1'b0;
//              connected_r   <= 1'b1;
//              state         <= ST_IDLE;
//              send_delay    <= 24'd0;
//              pulse_cnt     <= 2'd0;

//              conn_high_cnt <= 14'd0;
//              conn_low_cnt  <= 14'd0;
//          end else begin

// //             // ============================================================
// //             // Периодическое отключение/включение urr_connected_i
// //             // ============================================================
//              if (connected_r) begin
//                  // Держим 1 ровно HIGH_PERIOD тактов
//                  if (conn_high_cnt == HIGH_PERIOD - 1) begin
//                      conn_high_cnt <= 14'd0;
//                      connected_r   <= 1'b0;
//                  end else begin
//                      conn_high_cnt <= conn_high_cnt + 1'b1;
//                  end
//              end else begin
//                  // Держим 0 ровно LOW_PERIOD тактов
//                  if (conn_low_cnt == LOW_PERIOD - 1) begin
//                      conn_low_cnt <= 14'd0;
//                      connected_r  <= 1'b1;
//                  end else begin
//                      conn_low_cnt <= conn_low_cnt + 1'b1;
//                  end
//              end
//              case (state)

//                  ST_IDLE: begin
//                      en_r        <= 1'b0;
//                      crc_check_r <= 1'b0;
//                      send_delay  <= 24'd0;    // гарантированно обнуляем счётчик
//                      state       <= ST_PULSE;
//                  end

//                  ST_PULSE: begin
//                      en_r  <= 1'b1;            // одиночный импульс en
//                      state <= ST_WAIT;
//                  end

//                  ST_WAIT: begin
//                      en_r        <= 1'b0;
//                      crc_check_r <= 1'b0;

//                      if (send_delay == DELAY_MAX - 1) begin
//                          // Пауза закончилась - переход к следующему адресу
//                          send_delay  <= 24'd0;
//                         // connected_r <= 1'b1;
//                          if (addr_r == ADDR_STOP)
//                              addr_r <= ADDR_START;   // заворот 50 -> 1
//                          else
//                              addr_r <= addr_r + 1'b1;
//                          state <= ST_IDLE;
//                      end else begin
//                          send_delay <= send_delay + 1'b1;
//                      end
//                  end

//                  default: state <= ST_IDLE;
//              endcase
//          end
//      end

//  endmodule
