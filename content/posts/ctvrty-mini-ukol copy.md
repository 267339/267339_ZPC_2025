+++
date = '2025-10-25T13:37:45+02:00'
draft = false
title = 'Mini úkol 4'
+++

##### 3D TISK JEDNODUCHÉHO MECHANISMU

V tomto mini úkolu jsme měli navrhnout jednoduchý mechanismus, zpracovat ho vhodně pro 3D tisk, připravit ve sliceru a nakonec vytisknout.

###### Nápad: Peek-A-Meow

Otočením kolečka vykoukne roztomilá kočka a poté zase zaleze.
<img src="/267339_ZPC_2025/images/cat.png"
     alt="Hrubý schématický návrh systému"
     style="display: block; margin-left: auto; margin-right: auto;"
     width="400">

Z tohoto vyplívá, že mechanismus bude muset převádět rotační pohyb na vratný lineární. Tímto se výběr mechanismu zúžil na vačkový, klikový nebo kulisový.

Po nezdařených pokusech s vačkovým mechanismem, se kterým byl největší kámen úrazu pružina tlačící na vačku. Sice jsem se snažil navrhnout a vytisknout použitelnou pružinu z PLA ale marně, tudíž jsem se spíše rozhodl pro klikový mechanismus.

Asi nejtěžší část tohoto úkolu bylo vytvoření kočičí hlavy na díle, který vylézá z krabičky. Nejdříve jsem si našel vhodný obrázek kočky s černým pozadím, ten jsem v MS paint převedl na 16-ti barevný rastr,
<img src="/267339_ZPC_2025/images/cat 16 barev.bmp"
     alt="Hrubý schématický návrh systému"
     style="display: block; margin-left: auto; margin-right: auto;"
     width="400">
ze kterého jsem následně za pomocí ChatGPT a Matlab sestrojil STL mesh (barvy odpovídají výšce bodů).
<img src="/267339_ZPC_2025/images/STLmesh.png"
     alt="Hrubý schématický návrh systému"
     style="display: block; margin-left: auto; margin-right: auto;"
     width="400">
STL mesh jsem celkem pracně v Solidworks převedl na objemový model dílu mechanismu. Zbytek součástí jsem bez problémů vymodeloval a dal dohromady v sestavě abych otestoval jestli do sebe všechno zapadá.
<img src="/267339_ZPC_2025/images/sestavameow.png"
     alt="Hrubý schématický návrh systému"
     style="display: block; margin-left: auto; margin-right: auto;"
     width="200">
Po převední objemových modelů na STL formát jsem vše vložil do PrusaSliceru a bez problémů vytiskl.
<img src="/267339_ZPC_2025/images/vysledek3dtisk.png" alt="Hrubý schématický návrh systému" style="float">
<figure>
     <video controls width="300" height="400" 
     style="display: block; margin-left: auto; margin-right: auto;"
     poster="/267339_ZPC_2025/images/cat.png">
          <source src="/267339_ZPC_2025/videos/peekameow.mp4" type="video/mp4">
     </video>
</figure>
