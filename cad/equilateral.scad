/*
  equilateral triangle properties
   height = a*sqrt(3)/2
   height of center (apthom) = h/3
*/


// height of equilateral triangle 
function equilateral_height(s) = s*sqrt(3)/2;


/* returns 3 vertices of an triangle centered at origin
   s = length of side
*/
function equilateral_vertices(s) = 
  let(h = equilateral_height(s))
  [[0, 2*h/3, 0], 
  [s/2, -h/3, 0], 
  [-s/2, -h/3, 0]];
  
  
  
/* x and y coordinates of bounding box 
*/
function equilateral_x_bounds(s) = [-s/2, s/2];
function equilateral_y_bounds(s) = 
  let(h = equilateral_height(s))
  [-h/3, 2*h/3];