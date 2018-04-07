/* wiper motor mount
   mount holes at verticies of equilateral triangle
   length of side a = 43mm
   height = a*sqrt(3)/2
   height of center (apthom) = h/3
*/

module motor_mount(d=6, da=22, s=43, t=4, pad=12){
  /* 
   d = mounting bolt hole diameter
   da = arbor hole diameter
   s = length of side of equilateral triangle
   t = height or thickness
  */
  h = s*sqrt(3)/2; // height of equilateral triangle   
  echo(h);
  
  // bounding box dimensions + padding
  box_h = h + d + pad;
  box_w = s + d + pad;
  box_x = -box_w/2;
  box_y = (-h/3)-(d+pad)/2;

  difference(){
    // plate
    translate([box_x, box_y, 0]){cube([box_w, box_h, t]);} 
    union(){
      // arbor
      translate([0,0,0]){cylinder(t, d=da);}
      // mounting holes
      translate([0, 2*h/3, 0]){cylinder(t, d=d);}
      translate([s/2, -h/3, 0]){cylinder(t, d=d);}
      translate([-s/2, -h/3, 0]){cylinder(t, d=d);}
    }
  }
}

motor_mount();
