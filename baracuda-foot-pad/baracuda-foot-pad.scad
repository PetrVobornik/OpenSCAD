include <A2D.scad>;

presah = 1;

polomerVnejsiHornihoRantlu = 10/2;
tloustkaZakladu = 4;
vyskaVnitrku = 25; // Má být 25

sirkaDolnihoRantlu = 17 - tloustkaZakladu;
polomerHlavniDiry = 96/2;
polomerOctagonu = 144/2;
octaStrana = DelkaStranyNuhelniku(8, polomerOctagonu);

octaRantlDiraVyska = 6; // Musí se tam vejít 5
octaRantlDiraSirka = 1.5; // Hloubka žlabu a délka krytu nad ním (2)
octaRantlDiraKrytZa = 4;
octaRantlDiraKrytNad = 2;

octaRantlDiraKrytSirka = octaRantlDiraSirka + octaRantlDiraKrytZa;
octaRantlDiraKrytVyska = tloustkaZakladu + octaRantlDiraVyska + octaRantlDiraKrytNad;
octaRantlDiraKrytRo = 0.7; // Poloměr vnějšího zaoblení
octaRantlDiraKrytRi = 0.2; // Poloměr vnitřního zaoblení
sirkaHornihoRantlu = 20 - polomerVnejsiHornihoRantlu; // Ta ploška před rantlem - vypočítávat jinak


octaStranyBocniDelka = 55.5; // tím to natahuju na délku
octaStranyBocniRoztec = 124;//121
octaStranySikmaKOsekuDelka = 50;
octaStranySikmaKOsekuUhel = 45;
octaStranySikmaNadOsekemDelka = octaStranyBocniRoztec - 2 * (octaStranySikmaKOsekuDelka * sin(octaStranySikmaKOsekuUhel));
octaStranySikmaNadOsekemVzdalenostY = octaStranyBocniDelka/2 + (octaStranySikmaKOsekuDelka * sin(90-octaStranySikmaKOsekuUhel));;
octaStranySikmaKLichoDelka = 28;
octaStranySikmaKLichoUhel = 30;
octaStranySikmaKLichoXRozmer = octaStranySikmaKLichoDelka * sin(octaStranySikmaKLichoUhel);
octaStranySikmaKLichoYRozmer = octaStranySikmaKLichoDelka * sin(90-octaStranySikmaKLichoUhel);
octaStranyRovnaPidiKLichoDelka = 9;
octaStranySikmaPidiPoSikmeLichoDelka = 22;
octaStranySikmaPidiPoSikmeLichoUhel = 60;
octaStranyRovnaPidiPoSikmeLichoXRozmer = octaStranySikmaPidiPoSikmeLichoDelka * sin(90-octaStranySikmaPidiPoSikmeLichoUhel);
octaStranyRovnaPidiPoSikmeLichoYRozmer = octaStranySikmaPidiPoSikmeLichoDelka * sin(octaStranySikmaPidiPoSikmeLichoUhel);
octaStranyRovnaPidiPoSikmeLichoHranaNavicXRozmer = octaRantlDiraKrytZa * sin(octaStranySikmaPidiPoSikmeLichoUhel); // Jak je ta hrana šikmo, tak se je třeba napojit na vrchol vpravo výš, tak potřeba znát toto, o kolik ten rantl posunout po X a Y
octaStranyRovnaPidiPoSikmeLichoHranaNavicYRozmer = octaRantlDiraKrytZa * sin(90-octaStranySikmaPidiPoSikmeLichoUhel);

octaStranyRovnaRantlNaLichoBottomDelka = octaStranyBocniRoztec - 2*(octaStranySikmaKLichoXRozmer+octaStranyRovnaPidiKLichoDelka);

octaStranyRovnaRantlNaLichoTopDelka = octaStranyBocniRoztec - 2*(octaStranySikmaKLichoXRozmer+octaStranyRovnaPidiKLichoDelka+octaStranyRovnaPidiPoSikmeLichoXRozmer)+octaStranyRovnaPidiPoSikmeLichoHranaNavicXRozmer*2;
octaStranyRovnaRantlNaLichoTopPosY = octaStranyBocniDelka/2 + octaStranySikmaKLichoYRozmer+octaStranyRovnaPidiPoSikmeLichoYRozmer+octaStranyRovnaPidiPoSikmeLichoHranaNavicYRozmer;


lichoDelsi = octaStranyRovnaRantlNaLichoBottomDelka;
lichoKratsi = octaStranyRovnaRantlNaLichoTopDelka;
lichoVyska = octaStranyRovnaPidiPoSikmeLichoYRozmer + octaStranyRovnaPidiPoSikmeLichoHranaNavicYRozmer;
lichoTloustka = 2.5;
// echo("lichoKratsi: 60 = ", lichoKratsi);
// echo("lichoVyska: 20.5 = ", lichoVyska);
// echo("octaStranySikmaNadOsekemDelka: 50 = ", octaStranySikmaNadOsekemDelka);

lichoRantlVyska = octaRantlDiraVyska - 0.5;//5.0, pak 5.3;
lichoRantlSirka = 10;
lichoRantlPolomerVnejsihoZaobleni = 1.5;
lichoRantlZaTloustka = tloustkaZakladu;
lichoRantlNadTloustka = 1.5;
lichoRantlNadZaobleniHran = 0.5;

sroubR = 4.1/2;
sroubMatkaR = 9/2;
sroubMatkaH = 1;
sroubPosUhel = atan((octaStranyBocniDelka/2) / (octaStranyBocniRoztec/2));
sroubPosX = (polomerHlavniDiry+tloustkaZakladu+sroubMatkaR)*sin(90-sroubPosUhel);
sroubPosY = (polomerHlavniDiry+tloustkaZakladu+sroubMatkaR)*sin(sroubPosUhel)-3; // To +3 je po pokusném tisku naměřená korekce

douraVyska = 9;
douraSirka = 38;
douraTloustkaPrepazky = 4.5;
douraRantlikTloustka = 3;

kridloVyska = 14;
kridloSirka = 18;
kridloTloustka = tloustkaZakladu;

nohaVyska = 5;
nohaDelkaSikmePlochy = 3;
nohaZaobleni = 1;
nohaSirka = sirkaDolnihoRantlu+tloustkaZakladu;
nohaUhelDelky = 90/(2+2*17/20);
nohaUhelMezery = nohaUhelDelky*17/20;
nohaUhelPlusBonus = 12;
delitelUhluMeziKrivymaNohama = 1.65;

spodniOsekOdVnitrku = 9;

// Z parametrů pravidalného N-úhelníku (který tam nakonec nebyl) vypočte délku jedné jeho strany
function DelkaStranyNuhelniku(n, vnejsiR) = 2 * vnejsiR * sin(360/(n*2)) / sin(90);

// 2D profil jedno pravidelné nohy s možností určení délky jejího sešikmení (vepředu pod ďourami je šikmější, vzadu strmější)
module Noha2D(delkaSikmePlochy = nohaDelkaSikmePlochy) {
    translate([-nohaSirka-polomerHlavniDiry,0,-vyskaVnitrku])
    hull() {
        translate([delkaSikmePlochy, nohaVyska-nohaZaobleni])
            circle(r=nohaZaobleni, $fn=32);
        translate([nohaSirka-nohaZaobleni, nohaVyska-nohaZaobleni])
            circle(r=nohaZaobleni, $fn=32);
        polygon([[0, 0], [nohaSirka, 0], [nohaSirka/2, nohaVyska/2]]);
    }
}

// Noha2D();

// 3D model jedné pravidelné nohy včetně parametrů pro její umístění na spodním kruhu
module Noha3D(posun, uhelDelky=nohaUhelDelky, delkaSikmePlochy = nohaDelkaSikmePlochy, zaoblitBok=true) {
    difference() {
        rotate([0,0,-90+uhelDelky/2+posun])
        translate([0,0,-vyskaVnitrku])
        rotate([180,0,0])
        rotate_extrude(angle=uhelDelky, $fn=128)
        Noha2D(delkaSikmePlochy = delkaSikmePlochy);

        if (zaoblitBok) {
            OrezNohyBocni(zprava=false, uhelPosunu=posun);
            OrezNohyBocni(zprava=true, uhelPosunu=posun+uhelDelky);
        }
    }
}

// Všechny spodní nohy ve 3D a na svých místech
module Nohy() {
    Noha3D(0, delkaSikmePlochy = nohaSirka*0.59); // 10
    Noha3D(nohaUhelDelky+nohaUhelMezery, delkaSikmePlochy = nohaSirka*0.35);  // 6 = 35%
    Noha3D(-nohaUhelDelky-nohaUhelMezery, delkaSikmePlochy = nohaSirka*0.35); // 6
    Noha3D(2*(nohaUhelDelky+nohaUhelMezery), delkaSikmePlochy = nohaSirka*0.176);  // 3
    Noha3D(2*(-nohaUhelDelky-nohaUhelMezery), delkaSikmePlochy = nohaSirka*0.176); // 3
    Nohay3DKriveObe();
}

// Profil pro ořeh hran (invertovaná čtvrtka válce)
module OrezProfil(r=3, h=10, fn=32, presahy=presah/10) {
    difference() {
        cube([r+presahy, h, r+presahy]);
        translate([0,-presahy,0]) rotate([270,0,0]) cylinder(r=r, h=h+presahy*2, $fn=fn);
    }
}

// Ořez vnitřní hrany nohy napozicovaný na své místo
module OrezNohyBocni(zprava=true, uhelPosunu=0) { 
    rotate([0,0,-nohaUhelDelky/2+uhelPosunu])
    translate([(zprava?1:-1)*nohaZaobleni,polomerHlavniDiry-presah,-vyskaVnitrku-nohaVyska+nohaZaobleni])
    rotate([0,zprava?180:90,0])
    OrezProfil(r=nohaZaobleni, h=nohaSirka+presah*2);
}

// Rovná část křivé nohy (jedné z těch dvou u ořezu)
module Noha3DRovna(posun=-3*(nohaUhelDelky+nohaUhelMezery), uhelDelky=nohaUhelDelky) {
    rotate([0,0,-90+uhelDelky/2+posun])
    translate([0,0,-vyskaVnitrku])
    rotate([270,0,0])
    linear_extrude(40)
    Noha2D();
}

// 3D model obou křivých noh (u ořezu)
module Nohay3DKriveObe() {
    // dvojice křivých nožek
    difference() {
        // základ nožek
        union() {
            // Pravá
            Noha3D(3*(-nohaUhelDelky-nohaUhelMezery) - nohaUhelPlusBonus/2, nohaUhelDelky+nohaUhelPlusBonus, zaoblitBok=false);
            Noha3DRovna();
            // Levá
            Noha3D(3*(nohaUhelDelky+nohaUhelMezery) + nohaUhelPlusBonus/2, nohaUhelDelky+nohaUhelPlusBonus, zaoblitBok=false);
            mirror([1,0,0])
            Noha3DRovna();
        }
        // Pro ořez noh - vstupní brána mezi dvojicí křivých noh
        translate([0,0,-vyskaVnitrku-nohaVyska-presah])
        linear_extrude(nohaVyska+2*presah)
            polygon([[0,polomerHlavniDiry*2/3],
                    [octaStrana/delitelUhluMeziKrivymaNohama, -polomerOctagonu],
                    [-octaStrana/delitelUhluMeziKrivymaNohama, -polomerOctagonu]]);
        ZaobleniKrivychNohVstupniBrany();
        mirror([1,0,0]) ZaobleniKrivychNohVstupniBrany();
        // Pro ořez noh na stejné úrovni jako je ořes spodního kruhu
        translate([-polomerOctagonu, -polomerHlavniDiry-spodniOsekOdVnitrku-sirkaDolnihoRantlu, -vyskaVnitrku-nohaVyska-presah])
            cube([polomerOctagonu*2, sirkaDolnihoRantlu, nohaVyska+2*presah]);
        // Zaoblení vnitřních bočních stran
        OrezNohyBocni(uhelPosunu=3*(-nohaUhelDelky-nohaUhelMezery) - nohaUhelPlusBonus + nohaUhelDelky+nohaUhelPlusBonus);
        mirror([1,0,0]) OrezNohyBocni(uhelPosunu=3*(-nohaUhelDelky-nohaUhelMezery) - nohaUhelPlusBonus + nohaUhelDelky+nohaUhelPlusBonus);
        // Zaoblení ze strany ořezu
        translate([-octaStranyBocniRoztec/2,-polomerHlavniDiry-spodniOsekOdVnitrku+nohaZaobleni,-vyskaVnitrku-nohaVyska+nohaZaobleni])
        rotate([90,90,0])
        OrezProfil(r=nohaZaobleni, h=octaStranyBocniRoztec);
    }
}

// Ořez hran dvou křivých noh ve tvaru invertovaného válce (před vynálezem OrezProfil)
module ZaobleniKrivychNohVstupniBrany()
{
    klinUhelOtoceni = atan((octaStrana/delitelUhluMeziKrivymaNohama) / (polomerOctagonu+polomerHlavniDiry*2/3));
    klinDelkaPrepony = sqrt(pow(octaStrana/delitelUhluMeziKrivymaNohama,2)+pow(polomerOctagonu+polomerHlavniDiry*2/3,2));
    translate([-tloustkaZakladu/2,polomerHlavniDiry*2/3,-vyskaVnitrku-nohaVyska+tloustkaZakladu/2])
    rotate([90,0,-klinUhelOtoceni])
    difference()
    {
        translate([0,-tloustkaZakladu/2-presah,0])
            cube([tloustkaZakladu/2,tloustkaZakladu/2+presah,klinDelkaPrepony]);
        cylinder(r=tloustkaZakladu/2, h=klinDelkaPrepony, $fn=32);
    }
}

// Jedno z postranních křidýlek
module Kridylko() {
    // Křidýlko po straně
    translate([octaStranyBocniRoztec/2-(kridloTloustka-octaRantlDiraKrytZa), octaStranyBocniDelka/2-kridloSirka+kridloTloustka/2, -kridloVyska-tloustkaZakladu]){
        cube([kridloTloustka, kridloSirka-+kridloTloustka/2, kridloVyska+octaRantlDiraKrytRo]);
        translate([kridloTloustka/2,kridloSirka-kridloTloustka/2,0])
            cylinder(d=kridloTloustka, h=kridloVyska, $fn=32);
    }
    // Spojení křidýlka s kruhem
    translate([polomerHlavniDiry, octaStranyBocniDelka/2-kridloSirka+kridloTloustka/2, -kridloVyska-tloustkaZakladu])
        cube([octaStranyBocniRoztec/2-(kridloTloustka-octaRantlDiraKrytZa)-polomerHlavniDiry+tloustkaZakladu/2, kridloTloustka, kridloVyska+octaRantlDiraKrytRo]);
}

// Přepážka mezi ďourami
module PrepazkaMeziDourami() {
    translate([-douraTloustkaPrepazky/2, polomerHlavniDiry+tloustkaZakladu, -douraVyska-polomerVnejsiHornihoRantlu])
        cube([douraTloustkaPrepazky, sirkaDolnihoRantlu, douraVyska+polomerVnejsiHornihoRantlu]);
}


// 2D profil horního oktagonu (ten se pak extruduje pro jednotlivé strany)
module HorniOktagon2D(spodniRantl = sirkaHornihoRantlu) {
    // 2D profil na orotování do osmiúhelníku
    union() {
        // Horní zaoblený rantlík (používá knihovnu A2D)
        make_round(ro = octaRantlDiraKrytRo, ri = octaRantlDiraKrytRi, $fn=32)
        translate([-octaRantlDiraSirka,0])
        difference() {
            //circle(polomerVnejsiHornihoRantlu, $fn = 32);
            translate([0,-tloustkaZakladu]) square([octaRantlDiraKrytSirka, octaRantlDiraKrytVyska]);
            //scale([2, 3]) circle(polomerVnitrniHornihoRantlu, $fn = 32);
            translate([0,0]) square([octaRantlDiraSirka,octaRantlDiraVyska]);
            translate([-polomerVnejsiHornihoRantlu, 0])
                square([polomerVnejsiHornihoRantlu, polomerVnejsiHornihoRantlu]);
        }
        translate([-spodniRantl-octaRantlDiraSirka, -tloustkaZakladu])
            square([spodniRantl+octaRantlDiraKrytRo*2, tloustkaZakladu]);
        // translate([0, -polomerVnitrniHornihoRantlu*4])
        //     square([polomerVnitrniHornihoRantlu*2, polomerVnitrniHornihoRantlu*3]);
    }
}

//HorniOktagon2DJenHorniRantlik();
//HorniOktagon2D();

// Verze 2D profilu horního oktagonu bez horního rantlu (pro stěny vedoucí k lichoběžníku)
module HorniOktagon2DJenHrana(spodniRantl = sirkaHornihoRantlu, spodek = true, vyskaHrany = octaRantlDiraKrytVyska, tloustkaRantlu = octaRantlDiraKrytZa) {
    // 2D profil na orotování do osmiúhelníku
    union() {
        // Horní kruhový rantlík
        make_round(ro = octaRantlDiraKrytRo, ri = octaRantlDiraKrytRi, $fn=32)
        translate([0,-tloustkaZakladu])
            square([tloustkaRantlu, vyskaHrany]);
        if (spodek)
        {
            translate([-spodniRantl-octaRantlDiraSirka, -tloustkaZakladu])
                square([spodniRantl+octaRantlDiraSirka+octaRantlDiraKrytRo*2, tloustkaZakladu]);
        }
    }
}

// Verze 2D profilu horního oktagonu jen horní hrana (pro dotažení mezer z úhlů u konců rantlu)
module HorniOktagon2DJenHorniRantlik() {
    make_round(ro = octaRantlDiraKrytRo, ri = octaRantlDiraKrytRi, $fn=32)
    translate([-octaRantlDiraSirka,octaRantlDiraVyska]) square([octaRantlDiraSirka+octaRantlDiraKrytZa/2, octaRantlDiraKrytNad]);
}

// Boční strana
module HorniOktagon3DBocni() {
    translate([octaStranyBocniRoztec/2, octaStranyBocniDelka/2, 0])
    rotate([90, 0, 0])
    linear_extrude(octaStranyBocniDelka)
    HorniOktagon2D();
}

// Šikmá strana k oseku
module HorniOktagon3DSikmaKOseku() {
    translate([octaStranyBocniRoztec/2, -octaStranyBocniDelka/2, 0])
    rotate([90, 0, -octaStranySikmaKOsekuUhel])
    linear_extrude(octaStranySikmaKOsekuDelka)
    HorniOktagon2D();
}

// Strana rovná nad osekem
module HorniOktagon3DNadOsekem() {
    translate([octaStranySikmaNadOsekemDelka/2, -octaStranySikmaNadOsekemVzdalenostY, 0])
    rotate([90, 0, 270])
    linear_extrude(octaStranySikmaNadOsekemDelka)
    HorniOktagon2D();
}

// Šikmá krátká strana k lichoběžníku
module HorniOktagon3DSikmaKLicho() {
    translate([octaStranyBocniRoztec/2, octaStranyBocniDelka/2, 0])
    rotate([90, 0, octaStranySikmaKLichoUhel])
    translate([0, 0, -octaStranySikmaKLichoDelka])
    linear_extrude(octaStranySikmaKLichoDelka)
    HorniOktagon2D();

    // Dál navazuje hrnana bez horního rantlu pod jiným úhlem, tak tímto se to protáhne až k ní
    translate([octaStranyBocniRoztec/2, octaStranyBocniDelka/2, 0])
    rotate([90, 0, octaStranySikmaKLichoUhel])
    translate([0, 0, -octaStranySikmaKLichoDelka-tloustkaZakladu/2])
    linear_extrude(tloustkaZakladu)
    HorniOktagon2DJenHorniRantlik();
}

// Rovná pidi strana (jen hrana) k lichoběžníku
module HorniOktagon3DRovnaPidiKLicho() {
    translate([octaStranyBocniRoztec/2-octaStranySikmaKLichoXRozmer-octaStranyRovnaPidiKLichoDelka, octaStranyBocniDelka/2+octaStranySikmaKLichoYRozmer, 0])
    rotate([90, 0, 90])
    linear_extrude(octaStranyRovnaPidiKLichoDelka)
    HorniOktagon2DJenHrana();
}

// Rovná pidi strana (jen hrana) po šikmé straně lichoběžníku
module HorniOktagon3DRovnaPidiPoSikmeLicho(tloustkaRantlu = octaRantlDiraKrytZa) {
    translate([octaStranyBocniRoztec/2-octaStranySikmaKLichoXRozmer-octaStranyRovnaPidiKLichoDelka, octaStranyBocniDelka/2+octaStranySikmaKLichoYRozmer, 0])
    rotate([90, 0, 180+(90-octaStranySikmaPidiPoSikmeLichoUhel)])
    translate([-octaRantlDiraKrytZa,tloustkaZakladu,0])
    linear_extrude(octaStranySikmaPidiPoSikmeLichoDelka)
    HorniOktagon2DJenHrana(tloustkaRantlu = tloustkaRantlu, spodek = false, vyskaHrany = octaRantlDiraKrytVyska-tloustkaZakladu);
}

// Zadní stěna za rantlem oktagonu pro výplň z vnějšku tam kde se to ohýbá (navazují jednotlivé strany oktagonu)
module HorniOktagon3DOhyb(x, y, angle, rotate) {
    translate([x, y, 0])
    rotate([0, 0, -rotate])
    rotate_extrude(angle = angle, $fn = 32)
    translate([0,-tloustkaZakladu])
    union() {
        make_round(ro = octaRantlDiraKrytRo, ri = octaRantlDiraKrytRi, $fn=32)
        square([octaRantlDiraKrytZa, octaRantlDiraKrytVyska]);
        square([octaRantlDiraKrytZa/2, octaRantlDiraKrytVyska]);
    }
}

// Celý horní oktagon (po ořezu střední dírou se chybně vykresluje a potřebuje renderovat)
module HorniOktagon3D() {
    union() {
        // Boční rovné základní strany
        HorniOktagon3DBocni();
        mirror([1,0,0]) HorniOktagon3DBocni();
        // Šikmá strana k oseku
        HorniOktagon3DSikmaKOseku();
        mirror([1,0,0]) HorniOktagon3DSikmaKOseku();
        // Spojení vnjěších ohybů bočních a šikmých stran
        HorniOktagon3DOhyb(octaStranyBocniRoztec/2, -octaStranyBocniDelka/2, octaStranySikmaKOsekuUhel, octaStranySikmaKOsekuUhel);
        mirror([1,0,0]) HorniOktagon3DOhyb(octaStranyBocniRoztec/2, -octaStranyBocniDelka/2, octaStranySikmaKOsekuUhel, octaStranySikmaKOsekuUhel);
        // Rovná 1 strana nad osekem (kolmá k těm bočním)
        HorniOktagon3DNadOsekem();
        // Spojení vnjěších ohybů rovné strany nad osekem a šikmých k ní vedoucích stran
        HorniOktagon3DOhyb(octaStranySikmaNadOsekemDelka/2, -octaStranySikmaNadOsekemVzdalenostY, 90-octaStranySikmaKOsekuUhel, 90);
        mirror([1,0,0]) HorniOktagon3DOhyb(octaStranySikmaNadOsekemDelka/2, -octaStranySikmaNadOsekemVzdalenostY, 90-octaStranySikmaKOsekuUhel, 90);
        // Šikmé strany k lichoběžníku (s rantlem)
        HorniOktagon3DSikmaKLicho();
        mirror([1,0,0]) HorniOktagon3DSikmaKLicho();
        // Spojení vnjěších ohybů bočních stran a stran k lichoběžníku
        HorniOktagon3DOhyb(octaStranyBocniRoztec/2, octaStranyBocniDelka/2, octaStranySikmaKLichoUhel, 0);
        mirror([1,0,0]) HorniOktagon3DOhyb(octaStranyBocniRoztec/2, octaStranyBocniDelka/2, octaStranySikmaKLichoUhel, 0);
        // Malé k bočním stranám kolmé spojnice ke zúženému lichoběžníku (bez horního rantlu)
        HorniOktagon3DRovnaPidiKLicho();
        mirror([1,0,0]) HorniOktagon3DRovnaPidiKLicho();
        // Spojení vnjěších ohybů šikmých stran k lichoběžníku k pidi kolmým stranám k lichoběžníku
        HorniOktagon3DOhyb(octaStranyBocniRoztec/2-octaStranySikmaKLichoXRozmer, octaStranyBocniDelka/2+octaStranySikmaKLichoYRozmer, 90-octaStranySikmaKLichoUhel, -octaStranySikmaKLichoUhel);
        mirror([1,0,0]) HorniOktagon3DOhyb(octaStranyBocniRoztec/2-octaStranySikmaKLichoXRozmer, octaStranyBocniDelka/2+octaStranySikmaKLichoYRozmer, 90-octaStranySikmaKLichoUhel, -octaStranySikmaKLichoUhel);
        // Strany bez horního rantlu bedoucích po šikmých stranách lichoběžníku
        HorniOktagon3DRovnaPidiPoSikmeLicho();
        mirror([1,0,0]) HorniOktagon3DRovnaPidiPoSikmeLicho();

        // Spojka k lichoběžníku (podlaha před ním)
        translate([-lichoDelsi/2,octaStranyBocniDelka/2,-tloustkaZakladu])
        cube([lichoDelsi, octaStranySikmaKLichoYRozmer, tloustkaZakladu]);
    }
}

// 2D profil spodního kruhu (má vnější zaoblení)
module SpodniPrstenec2D() {
    // 2D profil spodního kruhu se sešikmeným zakončením
    translate([-sirkaHornihoRantlu, -vyskaVnitrku, 0])
        square([sirkaDolnihoRantlu, tloustkaZakladu]); // Spodní hrana
        // Zaoblené zakončení (čtvrtkruhem)
        translate([-sirkaHornihoRantlu+sirkaDolnihoRantlu, -vyskaVnitrku, 0]) {
            difference(){
                circle(r=tloustkaZakladu, $fn=32); // Zaoblení doního rantlu
                translate([-tloustkaZakladu, -tloustkaZakladu, 0])
                    square([2*tloustkaZakladu, tloustkaZakladu]);
            }
    }
}

// 3D spodní kruh/prstenec
module SpodniPrstenec3D() {
    difference() {
        rotate_extrude($fn = 128) // Rotace do kruhu spodní podstavy
        translate([sirkaHornihoRantlu+polomerHlavniDiry, 0, 0])
            SpodniPrstenec2D();
        // Oseknutí spodního rantlu na plocho u jedné strany
        translate([-polomerOctagonu/2, -polomerHlavniDiry-spodniOsekOdVnitrku-sirkaDolnihoRantlu+tloustkaZakladu, -vyskaVnitrku]) {
            difference() {
                translate([0,0,-presah])
                    cube([polomerOctagonu, sirkaDolnihoRantlu, tloustkaZakladu+2*presah]);
                // Výřez zaoblení
                rotate([0,90,0])
                translate([0,sirkaDolnihoRantlu,-presah])
                // scale([1,0.66,1])
                    cylinder(r=tloustkaZakladu, h=polomerOctagonu+2*presah, $fn=32);
            }
        }
    }
}

// Spojení hlavních částí modelu, přidání válce uprostřed (pak bude jen okolo) a jeho oříznutí (i všeho ostatního co tam přečuhovalo) hlavní střední dírou
module HlavniCast() {
    difference() {
        // Základní osmiúhelník
        union() {
            color("#009900")
            HorniOktagon3D();
            // Spodní osmi kruh se sešikmeným zakončením
            color("#990000")
            SpodniPrstenec3D();
            // Přidat hmotný válec do středu (s přesahy)
            color("#99FF00")
            difference() {
                translate([0, 0, -vyskaVnitrku])
                cylinder(r=polomerHlavniDiry+tloustkaZakladu, h = vyskaVnitrku, $fn=256); // Aby to bylo kulaté
                // Dvě díry v tubě (okénka)
                translate([douraTloustkaPrepazky/2, 0, -douraVyska-polomerVnejsiHornihoRantlu])
                    cube([douraSirka, polomerOctagonu, douraVyska]);
                translate([-douraSirka-douraTloustkaPrepazky/2, 0, -douraVyska-polomerVnejsiHornihoRantlu])
                    cube([douraSirka, polomerOctagonu, douraVyska]);
            }
            // Rantlík oválný pod ďourama
            color("#FFFF00")
            intersection() {
                translate([0,0,-douraVyska-polomerVnejsiHornihoRantlu-douraRantlikTloustka])
                    cylinder(r=polomerHlavniDiry+sirkaDolnihoRantlu+tloustkaZakladu, $fn = 128, h = douraRantlikTloustka);
                translate([-douraSirka-douraTloustkaPrepazky/2, 0, -douraVyska-polomerVnejsiHornihoRantlu-douraRantlikTloustka])
                    cube([douraSirka*2+douraTloustkaPrepazky, polomerOctagonu, douraRantlikTloustka]);
            }
        }
        // Vyříznout hlavní válcovou díru do středu dříve vloženého většího válce
        translate([0, 0, -vyskaVnitrku-presah])
            cylinder(r=polomerHlavniDiry, h = vyskaVnitrku+2*presah, $fn=256); // Díra hlavní
        // Výřezy děl pro šrouby, posunuté každý jinak, podle toho, jak se to kdysi navrtalo
        translate([0,-0.5,0]) Sroub();
        translate([-0.1,0,0]) mirror([1,0,0]) Sroub();
    }
}

// 3D model zadnícho lichoběžníku
module Lichobeznik3D() {
    translate([0, octaStranyBocniDelka/2+octaStranySikmaKLichoYRozmer, 0])
    linear_extrude(lichoTloustka)
        polygon([[-lichoDelsi/2,0], [lichoDelsi/2,0],
                [lichoKratsi/2, lichoVyska], [-lichoKratsi/2, lichoVyska],
                [-lichoDelsi/2,0]]);
}

// Horní2D profil horního rantlíku na konci lichoběžníku
module HorniRantlik2D() {
    union() {
        difference() {
            // Základní obdélník
            square([lichoRantlSirka-2*lichoRantlNadZaobleniHran, lichoRantlVyska]);
            // Umazání rohu
            translate([0, lichoRantlVyska-lichoRantlPolomerVnejsihoZaobleni])
                square(lichoRantlPolomerVnejsihoZaobleni);
            // Umazání drážky pod
            translate([lichoRantlZaTloustka, 0])
                square([lichoRantlSirka-lichoRantlZaTloustka, lichoRantlVyska-lichoRantlNadTloustka]);
        }
        // Umazaný roh zase doplnit "čtvrtkou" kruhu
        translate([lichoRantlPolomerVnejsihoZaobleni, lichoRantlVyska-lichoRantlPolomerVnejsihoZaobleni])
            circle(r=lichoRantlPolomerVnejsihoZaobleni, $fn=32);
        HorniRantlik2DJenHorniRantl();
    }
}

// Z horního rantlíku na lichoběžníkem jen ta horní část (pro spojení s octa-hranou kvůli úhlu, který svírají)
module HorniRantlik2DJenHorniRantl() {
    translate([lichoRantlZaTloustka/2,lichoRantlVyska-lichoRantlNadTloustka,0])
    make_round(ro = lichoRantlNadZaobleniHran, $fn=32)
        square([lichoRantlSirka-lichoRantlZaTloustka/2, lichoRantlNadTloustka]);
}

// 3D model horního rantlíku na krátké straně lichoběžníka
module HorniRantlik3DSpojSRantlemOcta() {
    presahDoRantlu = 6;
    presahDoRantluUmazani = 10;
    difference() {
        translate([octaStranyRovnaRantlNaLichoTopDelka/2+presahDoRantlu, octaStranyRovnaRantlNaLichoTopPosY, lichoTloustka])
        rotate([90,0,270])
        linear_extrude(presahDoRantlu)
        HorniRantlik2DJenHorniRantl();
        translate([sin(octaStranySikmaPidiPoSikmeLichoUhel)*(presahDoRantluUmazani-tloustkaZakladu/2),cos(octaStranySikmaPidiPoSikmeLichoUhel)*(presahDoRantluUmazani-tloustkaZakladu/2),presah]) HorniOktagon3DRovnaPidiPoSikmeLicho(presahDoRantluUmazani);
    }
}

// Výplň na obou stranách rantlíkem nad lichoběžníkem s hranou octagonu
module HorniRantlik3D() {
    translate([octaStranyRovnaRantlNaLichoTopDelka/2, octaStranyRovnaRantlNaLichoTopPosY, lichoTloustka])
    rotate([90,0,270])
    linear_extrude(octaStranyRovnaRantlNaLichoTopDelka)
        HorniRantlik2D();
    HorniRantlik3DSpojSRantlemOcta();
    mirror([1,0,0]) HorniRantlik3DSpojSRantlemOcta();
}



// Podpěra lichoběžníka (čtvrtka válce propojující jej ze spoda k octagonu)
module PodperaLichobeznika() {
    translate([-lichoDelsi/2, octaStranyBocniDelka/2+octaStranySikmaKLichoYRozmer, 0])
    rotate([90,90,90])
    linear_extrude(lichoDelsi)
    intersection() {
        square(8);
        circle(d=8, $fn=32);
    }
}

// Válce pro výřez díry šroubu a vložení matky ze spoda (přidáno "uživatelem", aby to vůbec drželo pohromadě)
module Sroub() {
    translate([-sroubPosX,-sroubPosY,0])
    union() {
        translate([0,0,-tloustkaZakladu-presah]) cylinder(r=sroubR, h=tloustkaZakladu+presah*2, $fn=32); // Díra pro šroub
        translate([0,0,-tloustkaZakladu-sroubMatkaH/2]) cylinder(r=sroubMatkaR, h=sroubMatkaH, $fn=32); // Zapuštění pro matku
    }
}

//HorniOktagon2D();
//HorniRantlik2D();

// Kompletní model pro render
module Komplet() {
    //difference() {
        union() {
            Nohy();
            Kridylko();
            mirror([1,0,0]) Kridylko();
            PrepazkaMeziDourami();
            HlavniCast();
            Lichobeznik3D();
            color("#00FFFF") HorniRantlik3D();
            color("#00FFFF") PodperaLichobeznika();
        }
    // Odsud níž jsou jen pomocné ořezy na pokusné kontrolní tisky
        //translate([-100, -100, -51]) cube([200, 200, 50]);
        // difference() { // Výřezy v kostce - test rantlíků
        //     translate([-100, -100, 0.5]) cube([200, 200, 50]); // Kostka ze které se ořezává (sama pak ořízen horní vrstvy)
        //     translate([octaStranyBocniRoztec/2-5,-1,0]) cube([10,2,12]); // Bok vpravo
        //     mirror([1,0,0]) translate([octaStranyBocniRoztec/2-5,-1,0]) cube([10,2,12]); // Bok vlevo
        //     translate([-1,-70,0]) cube([2,20,12]); // Nad výřezem
        //     translate([-1,62,0]) cube([2,20,12]); // Na rantlíku
        // }
    //}
    // difference() {
    //     union() {
    //         translate([0, 0, -lichoTloustka]) color("#00FFFF") HorniRantlik3D();
    //         HorniOktagon3DRovnaPidiPoSikmeLicho();
    //         mirror([1,0,0]) HorniOktagon3DRovnaPidiPoSikmeLicho();
    //     }
    //     translate([-100, -100, 1]) cube([200, 200, 50]);
    // }
}

Komplet();
