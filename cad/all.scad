use <linkage.scad>;
use <frypan.scad>;
use <angleiron.scad>;


linkage(45, d=4, h=4);
translate([30,0,0]){linkage(50, d=4, h=4);}
translate([45,0,0]){linkage(50, d=4, h=4);}
translate([110,0,0]){frypan(d=100, t=4);}
translate([-30,0,0]) {angleiron();}
