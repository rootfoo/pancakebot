module arbor_end(d=8, w=16, t=2, l=8){
    /*
    Disk with a hole of 
    diameter d=8, 
    thickness t=2, 
    outer diameter=w
    l = length of bar
    center of hole at origin
    */
      difference(){
        union(){
          cylinder(t,d=w);
          translate([0,-w/2,0]){cube([l,w,t]);}
        }
        cylinder(t,d=d);
      }
     

}


module bent_linkage(l=40, t=4, d=8.37, h=10, dx=1){
  /*
  * t = thickness
  * d = hole diameter
  * w = 2*d = width
  * h = height
  * l = length between hole centers
  * dx = overlap angled bar for extra thickness
  */
    w = 2*d;
    // bl = length of base from angled bit to cender of arbor
    tl = d+2;  // top length
    bl = l-(tl+h); // base length
  
    union(){ 
      arbor_end(d,w,t,bl);
    
      // angle bar, polyhedron approach
      polyhedron(
        points=[
          [bl,-w/2,0],        // 0
          [bl+h+dx,-w/2,h-t], // 1
          [bl+h+dx,w/2,h-t],  // 2
          [bl,w/2,0],         // 3
          [bl-dx,-w/2,t],     // 4
          [bl+h,-w/2,h],     // 5
          [bl+h,w/2,h],       // 6
          [bl-dx,w/2,t]],      // 7
        faces=[
          [0,1,2,3],    // bottom
          [4,5,1,0],    // front
          [7,6,5,4],    // top
          [5,6,2,1],    // right
          [6,7,3,2],    // back
          [7,4,0,3]]);  // left
          
       // angled bar is 45 degree, heigth = h, base = h, starting at d

       translate([l,0,h-t]){
            mirror(0,1,0){arbor_end(d,w,t,tl);}
       }
       
   }
      
}
  

bent_linkage();
 
