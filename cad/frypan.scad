module frypan(d=180, t=8){ 
  
  // t = thickness of handle, pan, bar
  d_top = d; // diameter of pan (top)
  d_base = .75*d_top;
  hlen = d*1.5; // handle length
  
  difference(){
    union(){
    // outer surface and handle
      cylinder(h=2*t, d1=d_base, d2=d_top);
      translate([-2*t,0,0]){ cube([4*t,hlen,t]); }
    }
    // hollow center
    translate([0,0,t]){ cylinder(h=t, d1=d_base-2*t, d2=d_top-2*t); }
  }
  
  // pivot bar
  translate([-1*(1.3*d)/2,d,t/2]){
    rotate(a=[0,90,0]){
      cylinder(h=1.3*d, d=t);
    }
  }
}

frypan();