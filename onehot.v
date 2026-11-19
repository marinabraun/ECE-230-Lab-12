module onehot(
    input w,
    input clk,
    input reset,
    output z,
    output [4:0] state      // bit 0 = A ... bit 4 = E (for the LEDs)
);
  
  wire Anext, Bnext, Cnext, Dnext, Enext;

  dff Adff(
    .Default(1'b1), 
    .D(Anext), 
    .clk(clk), 
    .reset(reset), 
    .Q(state[0])
  );

  dff Bdff(
    .Default(1'b0), 
    .D(Bnext), 
    .clk(clk), 
    .reset(reset), 
    .Q(state[1])
  );
    
  dff Cdff(
    .Default(1'b0), 
    .D(Cnext), 
    .clk(clk), 
    .reset(reset), 
    .Q(state[2])
  );
  
  dff Ddff(
    .Default(1'b0), 
    .D(Dnext), 
    .clk(clk), 
    .reset(reset), 
    .Q(state[3])
  );
  
  dff Edff(
    .Default(1'b0), 
    .D(Enext), 
    .clk(clk), 
    .reset(reset), 
    .Q(state[4])
  );

  // A = state[0] | B = state[1] | C = state[2] | D = state[3] | E = state[4]
  
  assign Anext = 1'b0;          // A = 0 (no arrows come in)
  assign Bnext = ~w & (state[0] | state[3] | state[4]);
  assign Cnext = ~w & (state[1] | state[2]);
  assign Dnext = w & (state[0] | state[1] | state[2]);
  assign Enext = w & (state[3] | state[4]);
  assign z = state[2] | state[4];
      
endmodule
