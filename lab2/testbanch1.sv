module testbench_alu();
  logic [3:0] operandA, operandB;
  logic [2:0] funcsel;
  logic [3:0] alu_result;
  logic zero;
  
  alu dut(operandA, operandB, funcsel, alu_result, zero);
  initial begin
    operandA = 4'b0011;
    operandB = 4'b0101;
    

  funcsel = 3'b000;
  #10
  assert (alu_result === 4'b0001) else $error("A & Bfailed.");
  
 //assert (zero === 0) else $error("A & B zero failed.");
  funcsel = 3'b001;
  #10
  assert (alu_result === (operandA | operandB)) else
  $error("A | B failed.");
  
  //assert (zero === 0) else $error("A | B zero failed.");
  funcsel = 3'b100;
  #10
  assert (alu_result === (operandA & ~operandB)) else
  $error("A & ~B failed.");
  
  funcsel = 3'b101;
  #10
  assert (alu_result === (operandA | ~operandB)) else
  $error("A | B failed.");
  
  
  operandA = 9;
  operandB = 2;
  funcsel = 3'b010;
  #10
  assert (alu_result === (9+2)) else $error("9 + 2failed.");
  operandB = 11;
  #10
  assert (alu_result === (9+11-16)) else $error("9 + 11failed.");
  operandB = 2;
  funcsel = 3'b110;
  #10
  assert (alu_result === (9-2)) else $error("9 - 2failed.");
  
  operandB = 9;
  #10
  assert (alu_result === (9-9)) else $error("9 -9failed");
 
  operandB = 11;
  funcsel = 3'b111;
  #10
  assert (alu_result === 1) else $error("9 < 11failed");
  
  
  operandB = 2;
  #10
  assert (alu_result === 0) else $error("9 < 2 failed");
  
  operandB = 9;
  #10
  assert (alu_result === 0) else $error("9 < 9 failed");
  
  $stop;
    end
endmodule