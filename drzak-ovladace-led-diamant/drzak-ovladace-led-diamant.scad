presah = 1;  // Pro ořezy

silaSteny = 2; // Tloušťka všech stěn
vnitrniSirka = 39; // Šířka vnitřku, čili šířka ovladače
vyska = 46; // Výška celého modelu (bez podstavy)

vnitrniTloustkaVzadu = 17; // Rozměr pro půlelipsu v zadní části (odvozeno empiricky)
vnitrniTloustkaMezeraMezi = 4.5; // Mezera (rovná část mezi přední a zadní částí), asi by stačilo i 4
vnitrniTloustkaVpredu = 3; // Rozměr pro půlelipsu v přední části

predniRantly = 4; // Šířka přední stěny od okraje po výřez
predniRantlDole = 2; // Výška spodního přesahu od podstavy po výřez

zlabekNaSroubySirka = 8; // Šířka žlábku na šrouby (musí se tam vejít hlavička šroubu)
zlabekNaSroubyHloubka = 1.5; // Hloubka žlábku na šrouby (i se zaoblením ovladače nesmí škrtat o hlavičku)

mezeraMeziPridavnymiRantly = 25; // Jak moc od sebe mají být dva postranní přídavné rantly zajišťující, že to sedne k rovné zdi
tloustkaPridavnychRantlu = silaSteny; // Tloušťka přídavnýách rantlů

sroubR = 4/2; // Poloměr děr pro šrouby šroubu
sroubVzdalenost = 22; // Vzrálenost mezi dírami pro šrouby


// Základní půdorys ovladačev jeho přesných rozměrech (vnitřek)
module Pudorys(plus = 0) {
    hull() 
    {
        // Zadní (ten se škouby)
        translate([0, vnitrniTloustkaMezeraMezi])
        scale([vnitrniSirka+2*plus, vnitrniTloustkaVzadu+2*plus])
        difference() { // Půlka elipsy
            circle(d=1, $fn=128); // Scale z toho udělá elpisu
            translate([0, -(0.5+presah)/2]) square([1+presah, 0.5 + presah], center=true);
        }
        // Přední (ten co se pak vepředu vyřízne a zbydou jen rantly)
        translate([0, -plus])
        scale([vnitrniSirka+2*plus, vnitrniTloustkaVpredu])
        circle(d=1, $fn=128); // Scale z toho udělá elpisu
    }
}

// 2D profil okrajových stěn (původní půdorys se změní o tloušťku stěny a do toho se vyřízne nezměněný rozměr)
module Stena2D() {
    difference() {
        Pudorys(plus=silaSteny);
        Pudorys();        
    }
}

// 3D model okrajové stěny již s přidaným zadním rozšířením pro šrouby
module Stena3D() {
    linear_extrude(height=vyska) {
        Stena2D();    
    }
    // Okraj okolo zadního žlábku na šrouby
    translate([0, vnitrniTloustkaVzadu/2+vnitrniTloustkaMezeraMezi+zlabekNaSroubyHloubka/2+silaSteny/2, (vyska-silaSteny)/2]) 
        cube([zlabekNaSroubySirka+2*silaSteny, zlabekNaSroubyHloubka+silaSteny, vyska+silaSteny], center=true);
}

// 3D model podstavy (extrudovaná větší verze půdorysu)
module Podstava3D() {
    translate([0,0,-silaSteny])
    linear_extrude(height=silaSteny) {
        Pudorys(plus=silaSteny);
    }
}

// Válec pro výřez díry pro šroub (stačí určit její Z posun od středu výšky)
module SroubDira(posunZ = 0)
{
    color("Red")
    translate([0, vnitrniTloustkaVzadu/2+vnitrniTloustkaMezeraMezi+zlabekNaSroubyHloubka/2+zlabekNaSroubyHloubka/2+silaSteny/2, vyska/2+posunZ]) 
    rotate([90, 0, 0])
    cylinder(r=sroubR, h=silaSteny+presah, center=true, $fn=32);
}

// 3D model jednoho vyrovnávacího zadního postranního rantlu
module RantlikyVyrovnavaci() {
    color("Green")
    translate([mezeraMeziPridavnymiRantly/2, vnitrniTloustkaVzadu/2+vnitrniTloustkaMezeraMezi+zlabekNaSroubyHloubka/2+silaSteny/2-presah/2, (vyska-silaSteny)/2]) 
        cube([tloustkaPridavnychRantlu, zlabekNaSroubyHloubka+silaSteny+presah, vyska+silaSteny], center=true);
}

// Kompletní model držáku
module Komplet() {
    difference() {
        union() {
            // Okoní stěna
            Stena3D();
            // Přičíst oba zadní vyrouvnávací rantlíky
            RantlikyVyrovnavaci();
            mirror([1,0,0]) RantlikyVyrovnavaci();
        }
        // Vnitřní zaoblení, aby do toho ovladač při vkládání lépe vklouzl
        color("Red")
        translate([0,0,vyska-1])
        translate([0,5])
        linear_extrude(height = 2, scale=[1,1.3], $fn=64)
        translate([0,-5]) // Posun, který se pak vrátí, aby se to více zaoblilo na obou stranách (kůli originu scale)
            Pudorys();
        // Přední výřez
        translate([0, -(vnitrniTloustkaVpredu+silaSteny+presah)/2, vyska/2+predniRantlDole]) 
            cube([vnitrniSirka-predniRantly*2-silaSteny*2, vnitrniTloustkaVpredu+silaSteny+presah,vyska], center=true);
        // Zadní žlábek na šouby
        translate([0, vnitrniTloustkaVzadu/2+vnitrniTloustkaMezeraMezi+zlabekNaSroubyHloubka/2-presah/2, (vyska+presah)/2]) 
            cube([zlabekNaSroubySirka, zlabekNaSroubyHloubka+presah, vyska+presah], center=true);
        // Díry na šrouby
        SroubDira(posunZ=sroubVzdalenost/2);
        SroubDira(posunZ=-sroubVzdalenost/2);
    }
    // Spodek (dno/podstava)
    color("Brown")
    Podstava3D();
}

// Vykreslení
difference() {
    Komplet();
    // Ořez pro zkušební výtisk jen 3mm proužku, jestli do toho ovladač zapadá
    // translate([0,0,+53]) cube([100,100,100], center=true);
    // translate([0,0,-49]) cube([100,100,100], center=true);
}

