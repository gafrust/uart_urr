module uart_top (
    input  wire       sys_clk,      // 50 МГц
    input  wire       rst_n,
    output wire       tx,           // UART TX
    input  wire       rx,           // UART RX
    output wire       led           // светодиод для индикации работы
);

    // ---- Внутренние сигналы ----
    wire       tx_busy;
    reg      tx_start;
    reg [7:0] tx_data;
    wire       rx_valid;
    wire [7:0] rx_data;
    wire       rx_error;

    reg [5:0]  cmd_cnt;          // 0..5
    reg [31:0] timer_cnt;
    reg        start_internal;
    reg [7:0]  cmd_byte;
    reg timer_done;
    reg tx_busy_prev;

    wire [23:0] freq;
    wire        done;
    wire        error;

    // ---- Светодиод ----
    reg [31:0] led_cnt;
    reg        led_reg;
    assign led = led_reg;

    // ---- Пониженная частота для ILA (1 МГц) ----
    reg [31:0] clk_div_cnt;
    reg        ila_clk;
    localparam DIV_FACTOR = 50;   // 50_000_000 / 50 = 1_000_000 Гц

    // ---- Инстансы модулей ----
    uart_tx u_tx (
        .clk   (sys_clk),
        .rst_n (rst_n),
        .start (tx_start),
        .data  (tx_data),
        .busy  (tx_busy),
        .tx    (tx)
    );

     uart_rx u_rx (
         .clk   (sys_clk),
         .rst_n (rst_n),
         .rx    (rx),
         .data  (rx_data),
         .valid (rx_valid),
         .error (rx_error)
     );

     urr u_urr (
         .clk      (sys_clk),
         .rst_n    (rst_n),
         .start    (start_internal),
         .cmd      (cmd_byte),
         .tx_busy  (tx_busy),
         .tx_start (),
         .tx_data  (),
         .rx_valid (rx_valid),
         .rx_data  (rx_data),
         .rx_error (rx_error),
         .freq     (freq),
         .done     (done),
         .error    (error)
     );

     //---- ILA с пониженной частотой ----
     ila_0 u_ila (
         .clk   (sys_clk),
         .probe0 (tx),
         .probe1 (rx),
         .probe2 (freq),
         .probe3 (timer_done),
         .probe4 (tx_start),
         .probe5 (led),
         .probe6 (cmd_cnt),
         .probe7 (tx_busy_prev),
         .probe8 (tx_busy),
         .probe9 (rx_valid),
         .probe10 (rx_data)
     );

    // ---- Генерация ila_clk (1 МГц) ----
    always @(posedge sys_clk or negedge rst_n) begin
        if (!rst_n) begin
            clk_div_cnt <= 0;
            ila_clk     <= 0;
        end else begin
            if (clk_div_cnt < DIV_FACTOR/2 - 1) begin
                clk_div_cnt <= clk_div_cnt + 1;
            end else begin
                clk_div_cnt <= 0;
                ila_clk     <= ~ila_clk;
            end
        end
    end


always @(posedge sys_clk or negedge rst_n) begin
    if (!rst_n) begin
        cmd_cnt     <= 6'd0;
        timer_cnt   <= 32'd0;
        timer_done  <= 1'b0;
        tx_start    <= 1'b0;
        tx_data     <= 8'd0;
        tx_busy_prev <= 1'b0;
        led_cnt     <= 32'd0;
        led_reg     <= 1'b0;
    end else begin
        // ------------------------------------------------------------
        // 1. Сброс tx_start по умолчанию (импульс на 1 такт)
        // ------------------------------------------------------------
        tx_start <= 1'b0;

        // 2. Запоминаем предыдущее состояние tx_busy
        tx_busy_prev <= tx_busy;

        // ------------------------------------------------------------
        // 3. Таймер считает только если timer_done = 0
        // ------------------------------------------------------------
        if (!timer_done) begin
            if (timer_cnt < 50_000_000 - 1) begin
                timer_cnt <= timer_cnt + 1;
            end else begin
                timer_cnt <= 32'd0;
                timer_done <= 1'b1;   // секунда прошла
            end
        end
        // Если timer_done = 1 - таймер стоит (ждём освобождения UART)

        // ------------------------------------------------------------
        // 4. Запуск передачи (только когда timer_done=1 и UART свободен)
        // ------------------------------------------------------------
        if (timer_done && !tx_busy) begin
            tx_start   <= 1'b1;       // импульс на 1 такт
            tx_data    <= cmd_cnt;    // данные - текущая команда
            timer_done <= 1'b0;       // сбрасываем флаг - начинаем отсчёт следующей секунды
        end

        // ------------------------------------------------------------
        // 5. Инкремент счётчика команд после завершения передачи
        // ------------------------------------------------------------
        if (tx_busy_prev && !tx_busy) begin
            if (cmd_cnt < 6'd50)      // 51 команда (0..50)
                cmd_cnt <= cmd_cnt + 1;
            else
                cmd_cnt <= 6'd0;       // циклический возврат
        end

        // ------------------------------------------------------------
        // 6. Мигание светодиода (без изменений)
        // ------------------------------------------------------------
        if (led_cnt < 50_000_000 - 1) begin
            led_cnt <= led_cnt + 1;
        end else begin
            led_cnt <= 32'd0;
            led_reg <= ~led_reg;
        end
    end
end



    // ---- Генерация команд 1..5 с интервалом 1 секунда ----
//     always @(posedge sys_clk or negedge rst_n) begin
//         if (!rst_n) begin
//             cmd_cnt       <= 6'b000000;
//             timer_cnt     <= 32'd0;
//             tx_start <= 1'b0;
//             tx_data      <= 8'd1;
//             led_cnt       <= 32'd0;
//             led_reg       <= 1'b0;
//         end else begin
//             tx_start <= 1'b0; // сброс импульса
            

//             // if(!tx_busy) begin
//             // if (cmd_cnt < 6'd51) begin
//             //     if (timer_cnt < 50 - 1) begin
//             //         timer_cnt <= timer_cnt + 1;
//             //     end else begin
//             //         timer_cnt <= 32'd0;
//             //         tx_start <= 1'b1;
//             //         cmd_cnt <= cmd_cnt + 1;
//             //         tx_data <= cmd_cnt + 1; // 1,2,3,4,5
//             //     end
//             // end
//             // end


//             if (timer_cnt == 50_000_000 - 1) begin  ///if (!tx_busy) begin
//                timer_cnt <= 32'd0;          // сброс таймера
//                if (!tx_busy) begin    //if (cmd_cnt < 6'd51) begin
//                 tx_start  <= 1'b1;           // импульс старта передачи
//                 cmd_cnt   <= cmd_cnt + 1;    // переход к следующей команде
//                 tx_data   <= cmd_cnt + 1;    // данные: 1,2,3,...,51
//                 if (cmd_cnt == 6'd51)  //if (timer_cnt < 50 - 1) begin
//                     cmd_cnt <= 0;                       //timer_cnt <= timer_cnt + 1;
                  
//                end else tx_start  <= 0;
//             end else begin
//                   // Конец цикла: сбрасываем счётчик команд и таймер, начинаем заново
//                  //cmd_cnt   <= 6'd0;
//                   timer_cnt <= timer_cnt + 1;
//             // tx_start не трогаем - он будет сброшен в 0 в другом месте
//                 end
//            end

// // if(tx_busy==0) begin
// //    tx_data <= cmd_cnt;
// //    tx_start <= 1; 
// // end else begin
// //     cmd_cnt <= cmd_cnt +1;
// //     tx_start <= 0;
// //     end

// //end


//             // Мигание светодиода (1 Гц)
//         //     if (led_cnt < 50_000_000 - 1) begin
//         //         led_cnt <= led_cnt + 1;
//         //     end else begin
//         //         led_cnt <= 32'd0;
//         //         led_reg <= ~led_reg;
//         //     end
//         // end
//     end

endmodule







//module uart_top (
//    input  wire       sys_clk,      // 50 МГц
//    input  wire       rst_n,
//    output wire       tx,       // UART TX
//    input  wire       rx,       // UART RX
//    output wire       led       // светодиод для индикации работы
//);

    
//    wire       tx_busy;
//    wire       tx_start;
//    wire [7:0] tx_data;
//    wire       rx_valid;
//    wire [7:0] rx_data;
//    wire       rx_error;

//    reg [2:0]  cmd_cnt;          // 0..5
//    reg [31:0] timer_cnt;
//    reg        start_internal;
//    reg [7:0]  cmd_byte;

//    wire [23:0] freq;
//    wire        done;
//    wire        error;

//    // ---- Счётчик и состояние светодиода ----
//    reg [31:0] led_cnt;
//    reg        led_reg;
//    assign led = led_reg;

//    // ---- Генератор сброса ----
////    RES RES(
////         .clk(clk),
////         .rst(rst_n) 
////    );

//    // ---- UART передатчик ----
//    uart_tx u_tx (
//        .clk   (sys_clk),
//        .rst_n (rst_n),
//        .start (tx_start),
//        .data  (tx_data),
//        .busy  (tx_busy),
//        .tx    (tx)
//    );

//    // ---- UART приёмник ----
//    uart_rx u_rx (
//        .clk   (sys_clk),
//        .rst_n (rst_n),
//        .rx    (rx),
//        .data  (rx_data),
//        .valid (rx_valid),
//        .error (rx_error)
//    );

//    // ---- Управляющий модуль URR ----
//    urr u_urr (
//        .clk      (sys_clk),
//        .rst_n    (rst_n),
//        .start    (start_internal),
//        .cmd      (cmd_byte),
//        .tx_busy  (tx_busy),
//        .tx_start (tx_start),
//        .tx_data  (tx_data),
//        .rx_valid (rx_valid),
//        .rx_data  (rx_data),
//        .rx_error (rx_error),
//        .freq     (freq),
//        .done     (done),
//        .error    (error)
//    );

//    // ---- ILA для отладки (опционально) ----
//    ila_0 u_ila (
//        .clk   (sys_clk),
//        .probe0 (tx),
//        .probe1 (rx),
//        .probe2 (freq),
//        .probe3 (done),
//        .probe4 (start_internal),
//        .probe5 (led)
//    );

//    // ---- Генерация команд 1..5 с интервалом 1 секунда ----
//    always @(posedge sys_clk or negedge rst_n) begin
//        if (!rst_n) begin
//            cmd_cnt       <= 3'b000;
//            timer_cnt     <= 32'd0;
//            start_internal <= 1'b0;
//            cmd_byte      <= 8'd1;
//            // Сброс светодиода
//            led_cnt       <= 32'd0;
//            led_reg       <= 1'b0;
//        end else begin
//            // Сброс импульса запуска
//            start_internal <= 1'b0;

//            // ---- Логика отправки команд ----
//            if (cmd_cnt < 3'd5) begin
//                if (timer_cnt < 50_000_000 - 1) begin
//                    timer_cnt <= timer_cnt + 1;
//                end else begin
//                    timer_cnt <= 32'd0;
//                    start_internal <= 1'b1;
//                    cmd_cnt <= cmd_cnt + 1;
//                    cmd_byte <= cmd_cnt + 1; // команды 1,2,3,4,5
//                end
//            end

//            // ---- Мигание светодиода (1 Гц) ----
//            if (led_cnt < 50_000_000 - 1) begin
//                led_cnt <= led_cnt + 1;
//            end else begin
//                led_cnt <= 32'd0;
//                led_reg <= ~led_reg;
//            end
//        end
//    end

//endmodule









//module uart_top (
//    input  wire       clk,
    
//    output wire       tx,
//    input  wire       rx
    
//);
//    wire       rst_n;
//    wire        tx_busy;
//    wire        tx_start;
//    wire [7:0]  tx_data;
//    wire        rx_valid;
//    wire [7:0]  rx_data;
//    wire        rx_error;

//    reg [2:0]  cmd_cnt;          // 0..5
//    reg [31:0] timer_cnt;
//    reg        start_internal;
//    reg [7:0]  cmd_byte;
    
//    wire [23:0] freq;
//    wire        done;
//    wire        error;
    
    
//    RES RES(
//         .clk(clk),
//         .rst(rst_n) 
//    );

//    uart_tx u_tx (
//        .clk   (clk),
//        .rst_n (rst_n),
//        .start (tx_start),
//        .data  (tx_data),
//        .busy  (tx_busy),
//        .tx    (tx)
//    );

//    uart_rx u_rx (
//        .clk   (clk),
//        .rst_n (rst_n),
//        .rx    (rx),
//        .data  (rx_data),
//        .valid (rx_valid),
//        .error (rx_error)
//    );

//    urr u_urr (
//        .clk      (clk),
//        .rst_n    (rst_n),
//        .start    (start_internal),
//        .cmd      (cmd_byte),
//        .tx_busy  (tx_busy),
//        .tx_start (tx_start),
//        .tx_data  (tx_data),
//        .rx_valid (rx_valid),
//        .rx_data  (rx_data),
//        .rx_error (rx_error),
//        .freq     (freq),
//        .done     (done),
//        .error    (error)
//    );
    
    
//    ila_0 u_ila (
//    .clk (clk),
//    .probe0 (tx),
//    .probe1 (rx),
//    .probe2 (freq),
//    .probe3 (done),
//    .probe4 (start_internal)
  
//);
    

//    // Генерация команд 1..5 с интервалом 1 секунда
//    always @(posedge clk or negedge rst_n) begin
//        if (!rst_n) begin
//            cmd_cnt <= 3'b000;
//            timer_cnt <= 32'd0;
//            start_internal <= 1'b0;
//            cmd_byte <= 8'd1;
//        end else begin
//            start_internal <= 1'b0; // сброс импульса

//            if (cmd_cnt < 3'd5) begin
//                if (timer_cnt < 50_000_000 - 1) begin
//                    timer_cnt <= timer_cnt + 1;
//                end else begin
//                    timer_cnt <= 32'd0;
//                    start_internal <= 1'b1;
//                    cmd_cnt <= cmd_cnt + 1;
//                    cmd_byte <= cmd_cnt + 1; // так как cmd_cnt ещё старое, то будет 1,2,3,4,5
//                end
//            end
//        end
//    end

//endmodule









//module uart_top (
//    input  wire       clk,        // 50 Mhz
//    input  wire       rst_n,      // sbros, aktivnii 0
//    input  wire       start,      // zapusk obmena (izvne)
//    input  wire [7:0] cmd,        // komanda dla otpravki

//    output wire       tx,         // vihod UART (k pinu)
//    input  wire       rx,         // vhod UART (s pina)

//    output wire [23:0] freq,      // poluchennaya chastota
//    output wire        done,      // uspeshnoe zavershenie
//    output wire        error      // oshibka
//);

//    // ---- Vnutrennie signali dla soedinenia ----
//    wire        tx_busy;
//    wire        tx_start;    // ot urr k uart_tx
//    wire [7:0]  tx_data;

//    wire        rx_valid;
//    wire [7:0]  rx_data;
//    wire        rx_error;

//    // ---- Instans peredatchika ----
//    uart_tx u_tx (
//        .clk   (clk),
//        .rst_n (rst_n),
//        .start (tx_start),   // ot urr
//        .data  (tx_data),    // ot urr
//        .busy  (tx_busy),    // k urr
//        .tx    (tx)          // na vneshii vivod
//    );

//    // ---- Instans priemnika ----
//    uart_rx u_rx (
//        .clk   (clk),
//        .rst_n (rst_n),
//        .rx    (rx),         // s vneshnego vivoda
//        .data  (rx_data),    // k urr
//        .valid (rx_valid),   // k urr
//        .error (rx_error)    // k urr
//    );

//    // ---- Instans upravlaushego modula ----
//    urr u_urr (
//        .clk      (clk),
//        .rst_n    (rst_n),
//        .start    (start),
//        .cmd      (cmd),
//        .tx_busy  (tx_busy),
//        .tx_start (tx_start),
//        .tx_data  (tx_data),
//        .rx_valid (rx_valid),
//        .rx_data  (rx_data),
//        .rx_error (rx_error),
//        .freq     (freq),
//        .done     (done),
//        .error    (error)
//    );

//endmodule






// module uart_top (
//     input  wire       clk,        // 50 Mhz
//     input  wire       rst_n,      // sbros, aktivnii 0
//     input  wire       start,      // zapusk obmena (izvne)
//     input  wire [7:0] cmd,        // komanda dla otpravki

//     output wire       tx,         // vihod UART (k pinu)
//     input  wire       rx,         // vhod UART (s pina)

//     output wire [23:0] freq,      // poluchennaya chastota
//     output wire        done,      // uspeshnoe zavershenie
//     output wire        error      // oshibka
// );

//     // ---- Vnutrennie signali dla soedinenia ----
//     wire        tx_busy;
//     wire        tx_start;    // ot urr k uart_tx
//     wire [7:0]  tx_data;

//     wire        rx_valid;
//     wire [7:0]  rx_data;
//     wire        rx_error;

//     // ---- Instans peredatchika ----
//     uart_tx u_tx (
//         .clk   (clk),
//         .rst_n (rst_n),
//         .start (tx_start),   // ot urr
//         .data  (tx_data),    // ot urr
//         .busy  (tx_busy),    // k urr
//         .tx    (tx)          // na vneshii vivod
//     );

//     // ---- Instans priemnika ----
//     uart_rx u_rx (
//         .clk   (clk),
//         .rst_n (rst_n),
//         .rx    (rx),         // s vneshnego vivoda
//         .data  (rx_data),    // k urr
//         .valid (rx_valid),   // k urr
//         .error (rx_error)    // k urr
//     );

//     // ---- Instans upravlaushego modula ----
//     urr u_urr (
//         .clk      (clk),
//         .rst_n    (rst_n),
//         .start    (start),
//         .cmd      (cmd),
//         .tx_busy  (tx_busy),
//         .tx_start (tx_start),
//         .tx_data  (tx_data),
//         .rx_valid (rx_valid),
//         .rx_data  (rx_data),
//         .rx_error (rx_error),
//         .freq     (freq),
//         .done     (done),
//         .error    (error)
//     );

// endmodule