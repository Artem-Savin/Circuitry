module module_AND (
output logic OUT,
input logic IN1,
input logic IN2
);
assign OUT = IN1 & IN2;
endmodule

module module_OR (
output logic OUT,
input logic IN1,
input logic IN2
);
assign OUT = IN1 | IN2;
endmodule

module module_example (
output logic out,
input logic x,
input logic y,
input logic z
);
logic yz;

module_AND my_AND1 (.OUT (yz), .IN1 (y), .IN2 (z));
module_OR my_OR1 (.OUT (out), .IN1 (x), .IN2 (yz));

endmodule