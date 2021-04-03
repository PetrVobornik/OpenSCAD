// Animace
$vpt = [0, 0, 0]; // Kam se hledí
// $vpr = [270, 0, 270]; // Úhel kamery
// $t = 0.0-1.0; // Čas
$vpd = 500; // Vzdálenost od objektu
//$t = 0.0;  => $vpr = [270, 0, 270];
//$t = 0.25; => $vpr = [220, 0, 180];
//$t = 0.5;  => $vpr = [270, 0,  90];
//$t = 0.75; => $vpr = [320, 0,   0];
//$t = 1.0;  => $vpr = [270, 0, -90];
//$t = 0.5;
//$vpr = [270, 0, 360*$t-90];
$vpr = [270-50*sin($t*360), 0, 270-$t*4*90];




include <A2D.scad>;

// Rozměry pro mobil (pro držák, aby se do něj vešel)
mobilTloustka = 16;
mobilSirka = 88;
mobilVyskaPul = 88; // odspoda k prvnímu tlačítku

// Rozměry přesahů u držáku
paclikSirka = 18;
paclikPresahPravy = 10; // Tam co jsou tlačítka
paclikPresahLevy = 17; // Tam co je tužka
paclikPresahDolni = 15; // Tam co je tužka
paclikTloustka = 3;
// Cnější a vnitřní zaoblení držákové části
ro=1.0;
ri=0.0;

// Deska (křížek +) pro přichycení na selfie tyč
deskaVyska = 70;
deskaSirka = 25;
deskaTloustka = 8.5;

// Spojnice mezi deskou (křížkem) a držákem mobilu
spojD = 16;
spojH = 10;

// Držáková část pro uchycení mobilu
module Drzak()
{
    linear_extrude(paclikSirka, center=true) {
        make_round(ro=ro, ri=ri, $fn=16) 
        polygon([
            [0,0], // 1
            [2*paclikTloustka+mobilTloustka, 0], // 2
            [2*paclikTloustka+mobilTloustka, paclikTloustka+paclikPresahPravy], //3
            [paclikTloustka+mobilTloustka, paclikTloustka+paclikPresahPravy], // 4
            [paclikTloustka+mobilTloustka, paclikTloustka], // 5
            [paclikTloustka, paclikTloustka], // 6
            [paclikTloustka, paclikTloustka+mobilSirka], // 7
            [paclikTloustka+mobilTloustka, paclikTloustka+mobilSirka], // 8
            [paclikTloustka+mobilTloustka, paclikTloustka+mobilSirka-paclikPresahLevy], // 9
            [2*paclikTloustka+mobilTloustka, paclikTloustka+mobilSirka-paclikPresahLevy], // 10
            [2*paclikTloustka+mobilTloustka, 2*paclikTloustka+mobilSirka], // 11
            [0, 2*paclikTloustka+mobilSirka], // 12
        ]);
    }
    translate([0,(mobilSirka+2*paclikTloustka)/2,-paclikSirka/2])
    rotate([90,0,0])
    linear_extrude(paclikSirka, center=true) {
        make_round(ro=ro, ri=ri, $fn=16) 
        polygon([
            [0,0], // 1
            [paclikTloustka, 0], // 2
            [paclikTloustka, mobilVyskaPul], // 3
            [paclikTloustka+mobilTloustka, mobilVyskaPul], // 4
            [paclikTloustka+mobilTloustka, mobilVyskaPul-paclikPresahDolni], // 5
            [2*paclikTloustka+mobilTloustka, mobilVyskaPul-paclikPresahDolni], // 6
            [2*paclikTloustka+mobilTloustka, mobilVyskaPul+paclikTloustka], // 7
            [0, mobilVyskaPul+paclikTloustka], // 8
        ]);
    }
}

// Zadní deska (křížek) pro uchycení do selfie tyče
module Deska()
{
    translate([-deskaTloustka/2-spojH,(mobilSirka+2*paclikTloustka)/2,0])
    rotate([0,90,0])
    {
        cube([deskaVyska,deskaSirka,deskaTloustka], center=true);
        rotate([0,0,90])
        cube([deskaVyska,deskaSirka,deskaTloustka], center=true);
    }
}

// Spojnice desky a držáku
module Spoj()
{
    translate([-spojH,(mobilSirka+2*paclikTloustka)/2,0])
    rotate([0,90,0])
    cylinder(spojH, d=spojD, $fn=128);
}

// Výkres
translate([0,-mobilSirka/2-paclikTloustka,0]) {
    Drzak();
    Deska();
    Spoj();
}