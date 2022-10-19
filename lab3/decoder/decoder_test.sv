module testbench_testvectors_mux2_01();
  
  logic clk, reset;
  logic [2:0] a;
  logic [7:0] yexpected;
  logic [7:0] y;
  logic [31:0] vectornum, errors;
  logic [24:0] testvectors[100:0];
  
  decoder3_8 dut(a, y);
  
  always
    begin
      clk = 1; #5; clk = 0; #5;
    end
    
    
    initial
      begin
        $readmemb("C:\\SAVINABZALOVBORISOVA\\trash\\lab2\\lab3\\lab3_2\\testcase.txt", testvectors);
        vectornum = 0; errors = 0;
        reset = 1; #27; reset = 0;
      end
      
      always @(posedge clk)
        begin
          #1; {a, yexpected} = testvectors[vectornum];
        end
        
        always @(negedge clk)
            if (~reset)
              begin
                if (y !== yexpected)
                  begin
                    $display("Error: inputs = %b", a );
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