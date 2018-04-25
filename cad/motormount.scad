include <equilateral.scad>;

/* wiper motor mount
   mount holes at verticies of equilateral triangle
   length of side a = 43mm
   height = a*sqrt(3)/2
   height of center (apthom) = h/3
*/

module motor_mount_holes(d=6.37, da=22, s=43, t=4){
  /* 
   d = mounting bolt hole diameter (6mm + PLA shrinkage)
   da = arbor hole diameter
   s = length of side of equilateral triangle
   t = thickness
  */
  h = equilateral_height(s); // height of equilateral triangle   
  verts = equilateral_vertices(s);
  // arbor
  translate([0,0,0]){cylinder(t+1, d=da);}
  // mounting holes
  translate(verts[0]){cylinder(t+1, d=d);}
  translate(verts[1]){cylinder(t+1, d=d);}
  translate(verts[2]){cylinder(t+1, d=d);}
}

module bearing_block(t=4, d=8.4, w=30, h=40) {
  difference(){
    translate([-w/2,-h]) { cube([w,h+d/2+t,t]);}
    translate([0,0,0]){cylinder(t, d=d);} 
  }
}


module motor_mount(){
  
  // motor mount
  p = 20; // padding of hull
  
  difference(){
    hull(){
      motor_mount_holes(d=p);
    }
    motor_mount_holes();
  }
  
  
}



module bracket(){
  
  // assembly
  t = 4;   // thickness
  l = 50; // length between arbor and other axis
  s = 43;
  d = 6.37; // mount holes 
  p = 20; // padding of hull
  
  

  xb = equilateral_x_bounds(s);
  yb = equilateral_y_bounds(s);
  x = xb[0];
  y = yb[0] - p/2 -t;
  
  // base
  translate([x,y]) { cube([140,t,30]);}
  
  // bracket
  w = 15;
  h = abs(y);
  dm = 8.4; 
  translate([l,0,0]){bearing_block(t=t, d=dm, w=w, h=h);}
  translate([l+w,0,0]){bearing_block(t=t, d=dm, w=w, h=h);}
  translate([l+2*w,0,0]){bearing_block(t=t, d=dm, w=w, h=h);}
  translate([l+3*w,0,0]){bearing_block(t=t, d=dm, w=w, h=h);}
  translate([l+4*w,0,0]){bearing_block(t=t, d=dm, w=w, h=h);}
  
}


module mount_all(){
motor_mount();
bracket();
translate([0,50,0]){
  
  mirror([0,1,0]){
    bearing_block(h=26);
    bracket();
  }
}

}

mount_all();