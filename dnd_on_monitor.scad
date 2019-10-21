// A do-not-disturb sign to put on the monitor

//--- thickness of all parts:
thickness = 4;
//--- the monitor clip
monitor_clip_width_front = 30;
monitor_clip_height_front = 7;
monitor_clip_width_back = 30;
monitor_clip_height_back = 30;
monitor_clip_depth = 15; // monitor thickness
// the stop sign
stop_sign_radius = 50;
stop_sign_back = monitor_clip_depth + thickness; // to the back, to make support obsolete
stop_text = "no";
stop_font = "StHupo";
stop_font_size = 50;
stop_rounded_thickness = monitor_clip_depth + 2*thickness;

// preview resolution:
if($preview)
{
    $fa=1;
    $fs=1.5;
}

//draw
color([255/255, 0/255, 0/255]) 
{
    union()
    {
        // monitor clip, back part
        translate([
            0, 
            0, 
            0]) 
        {
            cube([
                monitor_clip_width_back, 
                monitor_clip_height_back + thickness,
                thickness]);
            //monitor clip: top
            translate([
                0, 
                monitor_clip_height_back, 
                thickness]) 
            {
                hull() 
                {
                    // top back
                    cube([
                        monitor_clip_width_back, 
                        thickness,
                        1]);
                    // top front
                    translate([
                        +monitor_clip_width_back/2 
                            -monitor_clip_width_front/2, 
                        0, 
                        monitor_clip_depth]) 
                    {
                        cube([
                            monitor_clip_width_front, 
                            thickness,
                            1]);
                    }
                }
                translate([
                        +monitor_clip_width_back/2 
                            -monitor_clip_width_front/2, 
                        -monitor_clip_height_front, 
                        monitor_clip_depth]) 
                {
                    // monitor front
                    cube([
                        monitor_clip_width_front, 
                        monitor_clip_height_front + thickness, 
                        thickness]);

                    stop_sign_min_radius = (sqrt(3)/2) * stop_sign_radius;
                    translate([
                        monitor_clip_width_front/2, 
                        monitor_clip_height_front
                            + stop_sign_min_radius, 
                        -stop_sign_back]) 
                    {
                        intersection() 
                        {
                            difference() 
                            {
                                cylinder(
                                    r=stop_sign_radius, 
                                    h=stop_rounded_thickness, 
                                    $fn=6);

                                translate([0, 0, stop_rounded_thickness/2])
                                {
                                    linear_extrude(height=stop_rounded_thickness + 2, center = true) 
                                    {
                                        text(stop_text, 
                                            font = stop_font, 
                                            size = stop_font_size, 
                                            direction = "ltr", 
                                            spacing = 1,
                                            halign = "center",
                                            valign = "center");
                                    };
                                }
                            }
                            if(stop_rounded_thickness > thickness)
                            {
                                translate([0, 0, stop_rounded_thickness/2])
                                {
                                    resize(newsize=[
                                        stop_sign_radius*2,
                                        stop_sign_radius*2,
                                        stop_rounded_thickness
                                        ])
                                        sphere(r=stop_sign_radius);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
