module angleiron(l=90,s=20,t=4){
// l = length, s=side, t=thickness
  difference(){
    cube([s,l,s]);
    translate([t,0,t]) cube([s-t,l,s-t]);
  }
}


difference(){
  angleiron();
  translate([12,20,0]){
    cylinder(10,r=4);
  }
   translate([12,70,0]){
    cylinder(10,r=4);
  }

}


