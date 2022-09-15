module testbench; 
logic x, y, z; 
lab1 lab1_obj (result, x, y, z); 
initial 
begin 
    x = 0; 
    y = 0; 
    z = 0; 
    #10 z = 1; 
    #10 y = 1; 
    z = 0; 
    #10 z = 1; 
    #10 x = 1; 
    y = 0; 
    z = 0; 
    #10 z = 1; 
    #10 y = 1; 
    z = 0; 
    #10 z = 1; 
    #10; 
end 
endmodule