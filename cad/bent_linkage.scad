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


module bent_linkage(t=2, d=8, h=15, l=80, dx=1){
  /*
  * t = thickness
  * d = hole diameter
  * w = 2*d = width
  * h = height
  * l = length between hole centers
  * dx = overlap angled bar for extra thickness
  */
    w = 2*d;
  
    union(){ 
      arbor_end(d,w,t);
    
      // angle bar, polyhedron approach
      polyhedron(
        points=[
          [d,-w/2,0], // 0
          [d,w/2,0],  // 1
          [d-dx,w/2,t], // 2
          [d-dx,-w/2,t],  //3 // skew by -1 to add thinkness
          [d+h+dx,-w/2,h-t],
          [d+h+dx,w/2,h-t],
          [d+h,w/2,h],
          [d+h,-w/2,h]],
        faces=[
          [0,1,2,3],
          [4,5,6,7],
          [0,3,7,4],
          [1,2,6,5],
          [3,2,6,7],
          [0,1,5,4]]);
          
       // angled bar is 45 degree, heigth = h, base = h, starting at d
       // length of top bar from angled bit to cender of arbor
       top_len = l-(d+h);
       translate([l,0,h-t]){
            mirror(0,1,0){arbor_end(d,w,t,top_len);}
       }
       
   }
      
}
  

bent_linkage();
 
