module binary(
    input w,
    input clk,
    input reset,
    output z,
    output [2:0] state      // state = {y2, y1, y0}; A = 000 ... E = 100
);

  // next state (uppercase)
  wire Y2, Y1, Y0;
  
  // current state (lowercase)
  wire y2 = state[2], y1 = state[1], y0 = state[0];
  
  dff dff0(
    .Default(1'b0), 
    .D(Y0), 
    .clk(clk), 
    .reset(reset), 
    .Q(state[0])
  );

  dff dff1(
    .Default(1'b0), 
    .D(Y1), 
    .clk(clk), 
    .reset(reset), 
    .Q(state[1])
  );

  dff dff2(
    .Default(1'b0), 
    .D(Y2), 
    .clk(clk), 
    .reset(reset), 
    .Q(state[2])
  );

  assign Y2 = w & (y2 | (y1 & y0));
  assign Y1 = (~y1 & y0) | (y1 & ~y0) | (w & ~y2 & ~y1);
  assign Y0 = (~w & ~y1 & ~y0) | (~w & y1 & y0) | (w & ~y2 & ~y1) | (w & y1 & ~y0);
  assign z = y2 | (y1 & ~y0);
    
endmodule
