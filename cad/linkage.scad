
module linkage(l=100, d=8, h=4){
  /*
     l = length between hole centers, 
     d = hole diameter, 
     h = thickness
  */
  w = 2*d; // curved end diameter
  y = l-w/2; // y coordinate of center of second hole
  
  difference(){
    hull(){
      cylinder(h,d=w);
      translate([0,y,0]){ cylinder(h,d=w); }
    }
    cylinder(h,d=d);
    translate([0,y,0]){ cylinder(h,d=d); }
  }
}
    
linkage(200);
