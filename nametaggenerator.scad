fontsize=20;
caseheight=20;
border=10;
wall=1.5;
wirehole=10;
ledwidth=13;
ledheight=15;
$fn=30;
overlap=0.01;
username="YourName";
model="assembled";
module makeName(name) {
    if (name == "JvPeek") {
        resize([0,170,0], auto=true) import("jotlogo.svg", center=true);
    } else {
        resize([130,0,0], auto=true) text(name, font = "raustila", size=fontsize, halign = "center", valign = "center");
    }
}
module makeOutline(name, size) {
    offset(size) makeName(name);
}
module innerNamePlate(name) {
    linear_extrude(wall) makeOutline(name,1.5);
    translate([0,0,wall]) linear_extrude(wall*2) makeName(name);
    
}
module LEDholder(name) {
    module screwholder() {
        hull() {
            translate([0,ledwidth/2+wirehole/2+wall,0]) cylinder(wall,wirehole/2+wall*2,wirehole/2+wall*2);
            translate([-wall*2-wirehole/2,ledwidth/2+wall,0]) cube([wirehole+wall*4,overlap,wall]);
        }
    }
        
    difference() {
        intersection() {
            union() {
                linear_extrude(wall) makeOutline(name,border-0.3-wall);
                translate([0,0,wall]) linear_extrude(ledheight-wall) difference() {
                    makeOutline(name,border-0.3-wall);
                    makeOutline(name,border-0.3-wall*2);
                }
            }
            if (name != "JvPeek") {
                translate([-100,-ledwidth/2-wall,0]) cube([200,ledwidth+wall*2,ledheight+overlap]);
                translate([-55,0,0]) screwholder();
                translate([40,0,0]) screwholder();
            } 
        }
       translate([-55,ledwidth/2+wirehole/2+wall,-overlap]) cylinder(wall+overlap*2,wirehole/2,wirehole/2);
       translate([40,ledwidth/2+wirehole/2+wall,-overlap]) cylinder(wall+overlap*2,wirehole/2,wirehole/2);
    }
}
module nameCase(name) {
    
    linear_extrude(caseheight-wall) difference() {
        makeOutline(name, border);
        makeOutline(name, border-wall);
    }
    translate([0,0,caseheight-wall]) linear_extrude(wall*2) difference() {
        makeOutline(name, border);
        makeOutline(name,.5);
    }
}

if (model=="assembled") {
    translate([0,0,caseheight-wall*2]) color([1,1,1]) innerNamePlate(username);
    color([.2, .2, .2]) nameCase(username);
    translate([0,0,0]) color([.5, .2, .5]) LEDholder(username);
 }
 
 if (model=="i") {
    color([1,1,1]) innerNamePlate(username);
 }
 if (model=="o") {
    rotate([180,0,0]) color([.2, .2, .2]) nameCase(username);
 }
 if (model=="b") {
    color([.5, .2, .5]) LEDholder(username);
 }
 
 if (model=="simple") {
    linear_extrude(wall) makeName(username);
 }
