//sphere(r = 5);

//cylinder(r=10, h=20, center=true);

// cube(10);

//cylinder(r=10, h=20, $fn=6);

// maxumum angle, maximum size for faucets --> get finer resolution
//cylinder(r=3, h=10); //, $fa=1, $fs=0.5);

// defaults for whole print:
// $fa=0.5; // default minimum facet angle is now 0.5
// $fs=0.5; // default minimum facet size is now 0.5 mm
// cylinder(r=3,h=10);

//Tip: get faster rendering at design phase
// remove this before creating STL
$fa=1;
$fs=1.5;
//cylinder(r=3,h=10);

//cube([20,10,5]);

// translate([-20,-10,0]) cube([20,10,5]);

// translate([0,10,-3])
// {
//     cube([20,20,20], center=true);
//     sphere(14);
// }

// difference()
// {
//     cube([20,20,20], center=true);
//     sphere(14);
// }

// always slice +1 pixel on every side:
// *difference()
// {
//     cube([20,20,20]); // a 20 mm cube
//     translate([10,10,-1]) // start 1 mm below the surface
//         // do debug, you may start with a # here:
//         #cylinder(r=5,h=20+1+1); // and go 1 mm above
// }

// other prefixes:
// #: show as ghost (red/half-transparent)
// *: bypass the element, ignored
// !: show only the given part!
// %: show half-transparent, do not include in export

// use <../MCAD/screw.scad>;
// test_auger();

use <../MCAD/gears.scad>;
test_gears();