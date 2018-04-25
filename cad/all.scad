use <linkage.scad>;
use <bent_linkage.scad>;
use <motormount.scad>;

$fn=30;

// floating link (align with motor mount)
translate([0,95,0]){linkage(l=50);}
translate([62,95,0]){linkage(l=65);}
translate([140,95,0]){linkage(l=80);}
translate([130,70,0]){linkage(l=95);}
translate([90,-70,0]){linkage(l=110);}

// output links
translate([130,45,0]){linkage(l=50);}
translate([130,25,0]){linkage(l=60);}
translate([130,5,0]){linkage(l=70);}
translate([130,-15,0]){linkage(l=80);}

// bent linkage (input)
translate([0,-45,0]){bent_linkage(l=40);}
translate([60,-45,0]){bent_linkage(l=50);}
translate([130,-45,0]){bent_linkage(l=60);}
translate([0,-70,0]){bent_linkage(l=70);}

// mount
mount_all();
