Velmi nerad vyndávám mobil z jeho pouzdra, kde je těsně napasován, aby nevypadl. Přitom jej mám ale rád kompletně chráněný ze všech stran, a zároveň ho rád umísťuji do nejrůznějších držáků (v autě, na stativ, selfie tyč apod.), a současně na něj odmítám cokoli lepit. 
Minule jsem to řešil speciálním obalem, který se jednak nasadil pevně na záda mobilu, a jeho druhá část se kolem toho pak obepínala. Uvnitř jej držel silný magnet umístněný v&nbsp;tom těsném obalu. Takže to bylo klasické otevírací pouzdro, ale kdykoli jsem potřeboval, stačilo z něj mobil s ochranou zad vyndat a mohl jsem pohodlně fotit či jej umístit do libovolného držáku. Na těch magnetických dokonce rovnou i držel. To bylo geniální, pokud by tedy ještě vyřešili to, že díky magnetu na zádech nefungovalo bezdrátové nabíjení.
Tentokrát jsem sáhl po originálním obalu, který ač stojí mnohem více, žádné vyndávání neumožňuje. Ale má zase jiné výhody, např. úchytku na pero, kterým lze na displej psát či kreslit. Díky tomu však mobil v&nbsp;obalu nabyl takových rozměrů, že se již do žádného držáku nevejde a i kdybych ho narval do nějakých těch roztahovacích, tak by otevírací část krytu nejspíš pěkně zdeformoval.

Napadlo mě tedy vytvořit redukci, která na jedné straně půjde upnout do držáku a na druhé straně do něj půjde přesně nasunout mobil i s&nbsp;obalem. Akutně jsem to potřeboval řešit pro umístění mobilu mezi monitory jakožto webkamery pro online konferenční hovory. Microsoft Teams totiž umožňuje připojit se ke schůzce z více zařízení současně, takže mobilem se připojím tak, aby pouze snímal a odesílal svůj obraz a z&nbsp;počítače si připojím vše ostatní (pohled na další účastníky, reproduktor, mikrofon, chat...). 
Měl jsem selfie tyč s nožičkami, která tedy může sloužit jako stativ (kdyby ne, dal by se pro ni vytisknout stojánek jako na vánoční stromeček). Takže jsem si naměřil, jaký kvádr v držáku dobře sedí (na základě starého mobilu), ten jsem dal do kříže, aby jej bylo možné otočit i na výšku, kdyby to náhodou bylo někdy potřeba, pak jsem si naměřil mobil v otevřeném obalu a v OpenSCADu k tomu namodeloval parametrizovaný držák. Jeho milimetrový průřez jsem si na zkoušku vytiskl a vyzkoušel jestli sedí, přidal mu 0.5mm na tloušťku, no a pak to vytiskl celé (PLA, 37 gramů filamentu, doba tisku 3:18). 

![7-drzak-model.gif](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/images/00-model.gif?raw=true)

A funguje to perfektně. Na jiné držáky si kdyžtak ještě upravím ta záda, popř. je oboustrannou samolepkou připevním někde v autě, když se takováto velikost normálně sehnat nedá. A až někdy v budoucnu bude zase mobil jiných rozměrů, upravím pár proměnných a vytisknu si držák nový.

* [3D model](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/drzak-mobilu-v-obalu.stl)
* [OpenSCAD kód](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/drzak-mobilu-v-obalu.scad)

V kódu modelu jsem použil knihovnu [A2D](https://github.com/ridercz/A2D).


## Obrázky

Model v Siliceru s podpěrami

![01-silicer.jpg](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/images/01-silicer.jpg?raw=true)


Po tisku s podpěrami

![02-podpery.jpg](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/images/02-podpery.jpg?raw=true)


Výsledný model

![03-zezadu.jpg](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/images/03-zezadu.jpg?raw=true)


![04-zepredu.jpg](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/images/04-zepredu.jpg?raw=true)


![05-zepredu-shora.jpg](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/images/05-zepredu-shora.jpg)


![06-zespoda.jpg](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/images/06-zespoda.jpg)


Držák uchycený v selfie tyči

![07-zboku-v-tyci.jpg](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/images/07-zboku-v-tyci.jpg)


Mobil ve "stativu" našířku

![10-na-tyci-zepredu.jpg](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/images/10-na-tyci-zepredu.jpg)


![11-na-tyci-zeshora.jpg](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/images/11-na-tyci-zeshora.jpg)


![12-na-tyci-zboku.jpg](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/images/12-na-tyci-zboku.jpg)


Mobil ve "stativu" navýšku

![15-na-tyci-na-vyku-zezadu.jpg](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/images/15-na-tyci-na-vyku-zezadu.jpg)


![16-na-tyci-na-vyku-zboku.jpg](https://github.com/PetrVobornik/OpenSCAD/blob/master/drzak-mobilu-v-obalu/images/16-na-tyci-na-vyku-zboku.jpg)
