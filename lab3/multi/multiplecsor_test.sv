module testbench_testvectors_mux2_01();
  
  logic clk, reset;
  logic [7:0]operand0, operand1, yexpected, y;
  logic sel;
  logic [31:0] vectornum, errors;
  logic [24:0] testvectors[100:0];
  
  multiplecsor #(8) dut(operand0, operand1, sel, y);
  
  always
    begin
      clk = 1; #5; clk = 0; #5;
    end
    
    
    initial
      begin
        $readmemb("C:\\SAVINABZALOVBORISOVA\\trash\\lab2\\lab3\\lab3\\testcase_mux2_02.txt", testvectors);
        vectornum = 0; errors = 0;
        reset = 1; #27; reset = 0;
      end
      
      always @(posedge clk)
        begin
          #1; {operand0, operand1, sel, yexpected} = testvectors[vectornum];
        end
        
        always @(negedge clk)
            if (~reset)
              begin
                if (y !== yexpected)
                  begin
                    $display("Error: inputs = %b %b%b", operand0, operand1, sel);
                    $display(" outputs = %b (%bexpected)", y, yexpected);
                    errors = errors + 1;
                  end
                  
                  vectornum = vectornum + 1;
                  if (testvectors[vectornum] === 25'bx)
                    begin
                      $display("%d tests completed with%d errors", vectornum, errors);
                      $stop;
                    end
              end
 endmodule       
                      
                      
                      