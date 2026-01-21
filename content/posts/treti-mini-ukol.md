+++
date = '2025-11-04T16:27:45+02:00'
draft = false
title = 'Mini úkol 3'
+++

##### 3D SKENOVÁNÍ A ÚPRAVA SÍTĚ BODŮ

Cílem mini úkolu bylo naskenovat zadaný objekt a poté ho vhodně upravit a oměřit v softwaru GOM inspect.

Jako objekt pro skenování jsem si vybral sádrový odlitek obličeje. Při přípravě na skenování jsem postupoval podle návodu, tudíž jsem odlitek obličeje polepil zepředu malými body, aby byl povrch mesh sítě po zaplátování děr co nejblíže reálnéhu objektu. Zadní část odliku jsem polepil většími body, protože je laser lépe snímá a není tak důležité aby zadní povrch odpovídal realitě.
(Na vyfocení olepeného modelu jsem ve spěchu zapomněl, dodělám pokud bude potřeba)

Odlitek jsem skenoval na dvakrát. Nejdříve samotný obličej, kde jsem odlitek položil na desku, tak že obličej "ležel" na otočné desce. Při druhém skenu byl odlitek pložen "na tvář". Tyto dva skeny jsem poté spojil do jednoho pomocí značek, které byli na obou skenech. Co se týče nastavení skenu jsem použil základní nastavení pro malý neprůhledný objekt a povrchová úprava nebyla potřebná.

<img src="/267339_ZPC_2025/images/oblicejpredupravou3x.png" alt="Hrubý schématický návrh systému" style="float">

Dále následovala úprava STL sítě v GOM inspect. Díry po značkách jsem záplatoval ručně a automaticky díry vzniklé v místech kam se laser nedostal.

<img src="/267339_ZPC_2025/images/dirykamlasernedosahnulpredapo.png"
     alt="Hrubý schématický návrh systému"
     style="display: block; margin-left: auto; margin-right: auto;"
     width="500">

Poté jsem zredukoval počet bodů z 1179446 na 237818 a vyhladil síť.

<img src="/267339_ZPC_2025/images/oblicejpouprave2x.png" alt="Hrubý schématický návrh systému" style="float">

Následovalo změření požadovaných rozměrů. Povrch objektu vyšel 186725 mm², což je pravděpodobně neodpovídá realitě kvůli dírám v zadní části sítě, které jsem musel vyplnit. Maximální rozměr objektu je 289,91 mm a jako další rozměr jsem si zvolil šířku úst, která vyšla na 53,97 mm.

<img src="/267339_ZPC_2025/images/oblicejrozmery.png" alt="Hrubý schématický návrh systému" style="float">