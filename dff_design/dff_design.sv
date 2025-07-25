module dff_uvm (
    input clk,
    input rst,
    input din,
    output reg dout
  );
  
  always @(posedge clk)
    begin
      if(rst==1) begin //active high reset
        assign dout =0;
      end
      else begin
        assign dout = din;
      end
    end
endmodule
