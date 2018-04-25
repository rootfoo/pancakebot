
module linkage(l=50, d=8.37, h=4){
  /*
     l = length between hole centers, 
     d = hole diameter, 
     h = thickness
  */
  w = 2*d; // curved end diameter
  x = l-w/2; // y coordinate of center of second hole
  
  difference(){
    hull(){
      cylinder(h,d=w);
      translate([x,0,0]){ cylinder(h,d=w); }
    }
    cylinder(h,d=d);
    translate([x,0,0]){ cylinder(h,d=d); }
  }
}
    
linkage();
