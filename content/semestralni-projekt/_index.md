+++
title = "Peristaltický kompresor a testovací platforma"
+++

#### ***Rotační kompresor vyrobitelný pomocí 3D tisku.***

Nutnost konstrukce tohoto zařízení vychází z mého původního návrhu semestrálního projektu tj. Systém regulace tlaku v pneumatikách jízdního kola (bližší popis v záložce miniprojekty). 

Po návrhu základního rozložení systému jsem došel k tomu, že první největší problém by byl zdroj tlakového vzduchu. Ten by měl být lehký, malý a využívat rotační pohyb ze středové osy jízdního kola (pedály). Uvažoval jsem nad různými typy kompresorů (např. scroll, membránový rotační a nebo lineární membránový s převodem),a po jejich rešerších jsem vyhodnotil, že žádný typ není dostupný v provedení, které by mi vyhovovalo. 

Objektivně nejlepším kandidátem je membránový rotační kompresor, který využívá rotace vačky pro mačkání membrány. Tento typ kompresoru je také použit v jediném komerčně dostupném systému pro regulaci tlaku pneumatik jízdního kola (GRAAVA Kinetic Air Pressure System https://gravaa.com/our-technology ), ale nebyl jsem schopen najít žádný za rozumnou cenu a ve vyhovujícím provedení a na výrobu je také velice složitý.

Po posouzení všech dostupných existujících typů kompresorů jsem se rozhodl, že budu muset vymyslet nový typ kompresoru. Požadavky pro tento kompresor jsem si stanovil takto:
- Nízká citlivost na nepřesnost výroby a samotná vyrobitelnost (vůči dostupným technologiím ve StrojLabu)
- Pohon rotačním pohybem
- Co nejlehčí a nejmenší 

Z těchto požadavků vychází peristaltický kompresor.

Princip je obdobný jako u peristaltického čerpadla, které využívá stlačení trubice pro vyvození tlaku a pohánění kapaliny. Toto čerpadlo je schopné vyvodit i tlak přes 10 barů, ale jeho principiálně je založeno na nestlačitelnosti kapaliny (samotné válečky stlačí kapalinu a vyvodí tlak), pokud bychom tedy tímto způsobem pumpovali plyn pouze ho stlačili a po otevření trubice se zase rozepne. 

<img src="/267339_ZPC_2025/images/sp_princippc.png" alt="Princip peristaltického čerpadla" style="float"> (1)

Mým řešením jak na rozpínavost plynu je přidání zpětného ventilu na konec trubice. Ten se otevře přetlakem, který vzniká přibližováním bodu stlačení ke konci trubice (zmenšování objemu trubice → zvýšení tlaku) a stlačený je vtlačen za zpětný ventil kde zvýší celkový tlak uzavřeného prostoru, ze kterého může být odveden například do pneumatiky. Nasávání plynu je realizováno volnou dírou na začátku trubice, která se díky podstatě elastické deformace vrací do původního stavu.

<img src="/267339_ZPC_2025/images/sp_princippk.png" alt="Princip peristaltického kompresoru" style="float">

Tento koncept jsem po konzultaci uznal jako nejvhodnější pro můj soubor požadavků. Avšak s tímto konceptem byl jeden velký problém a to je těsnění stlačené části trubice a její životnost.

<img src="/267339_ZPC_2025/images/sp_zmacknutikruhovetrubice.png" alt="Zmáčknutí mezikruhové trubice" style="float">

Obvykle má peristaltické čerpadlo trubici s mezikruhovým průřezem a při stlačení vznikají velká napětí v okrajových ohybech, což snižuje životnost a navíc při stlačení v okrajích mohou vznikat drobné kanálky (pokud není přítlačný tlak dostatečný), kvůli kterým stlačené místo hůře těsní.

<img src="/267339_ZPC_2025/images/sp_zmacknutitvarovetrubice.png" alt="Zmáčknutí tvarové trubice" style="float">

Pro zmenšení těchto problémů jsem navrhnul tvarovou trubici s plankonvexním a později bikonvexním tvarem dutiny. Tento tvar má za účel vytvořit těsný tlakový spoj ohybem a elastickým prodloužením stlačované stěny a ne zborcením celého průřezu. Nevýhodou je pracný proces výroby tvarové trubice namísto použití koupené trubice s mezikruhovým průřezem.

‎
‎

#### ***Iterační návrh peristaltického kompresoru.***

Při návrhu peristaltického kompresoru jsem prošel třemi výrazně rozlišnými iteracemi. Iterace se hlavně liší tvarem a materiálem trubice a podobou rotoru. Všechny iterace
mají velmi podobné vnější rozměry, základní součásti tj. stator (černě) s kotouči, ve kterých sedí ložiska rotoru, peristaltická trubice (červeně), rotor (modře) s odvalovacími válečky a také všechny mají dvě samostatné peristaltické trubice a nebo celistvou trubici se dvěma dutinami.

<img src="/267339_ZPC_2025/images/sp_zakladnisoucastipk.png" alt="Základní součásti peristaltického kompresoru" style="float">

 Každá iterace měla jiný charakter a každá mi poskytla jiné poznatky:
 - ‎ 1. Iterace - Výstřel do tmy ... určení základních parametrů a určení správného směru pro návrh
 - ‎ 2. Iterace - První fungující prototyp peristaltického kompresoru ... plně určené parametry, zkoumání chování prototypu a hledání lepších řešení
 - ‎ 3. Iterace - Dopilování prototypu a testovací platformy... vyzkoušení celku, ohodnocení

‎
‎

#### ***1. Iterace***

<img src="/267339_ZPC_2025/images/sp_iterace1_0.png" alt="iterace1" style="float">

Celý návrh jsem začal zvolením vhodného materiálu a rozumné velikosti (průměr + průřez) trubice. Pro určení rozměrů jsem na velmi hrubý odhad využil stavovou rovnici ideálního plynu kdy jsem si stanovil konečný objem (mrtvý prostor mezi ventilem a poslední stlačenou oblastí trubice) a výsledný tlak. Tento výpočet mi zprostředkoval objem celé trubice, ze kterého jsem po určení průřezu otvoru trubice získal odhad na její průměr. Dalším kritickým rozměrem je tloušťka stěny trubice, kterou jsem pro další iterace určil velmi orientačně na 2 mm ze vztahu pro napětí ve stěně válcové trubice s vnitřním přetlakem.

V této iteraci jsem tloušťku stěny neurčoval, protože mým plánem bylo slepit trubici z butylkaučuku duše jízdního kola (tloušťka kolem 1 mm). Toto nebyl nejlepší nápad, protože duše už jsou vulkanizované, velmi rády drží svůj tvar a velmi nerady se na něco lepí. I když jsem si pořídil vulkanizační roztok, který je určený přímo na opravu pneumatik, nepodařilo se mi vytvořit žádný pořádný spoj. Ve dvou následujících obrázcích je vidět nařezaná butylkaučuková duše nasendvičovaná do forem vytisknutých na 3D tiskárně. Očekával jsem (možná trochu naivně), že se guma přilepí na stator (rozdělený na dvě poloviny), ale to se nestalo. Tudíž jsem byl nucen hledat jiný materiál a jiný způsob výroby peristaltické trubice.

Ze statoru vyčnívají galuskové ventily přímo vyříznuté z duše jízdního kola, které jsou nevhodné na jakoukoliv konstrukci, jak jsem se dozvěděl později (nestandardní rozměry závitů a nikde jsem nebyl schopen najít adaptéry).

(1)<img src="/267339_ZPC_2025/images/sp_iterace1_1.jpg" alt="iterace1" style="float">

(2)<img src="/267339_ZPC_2025/images/sp_iterace1_2.jpg" alt="iterace1" style="float">

Všechny 3D tisknuté díly peristaltického kompresoru jsou z PETG, který jsem využil, protože jsem ho měl po ruce a má v celku dobré vlastnosti. Pro tuto iteraci jsem zvolil tři stlačující válečky, protože na trubici by byly vždy dva válečky a druhý v řadě by zachycoval případný uniknutý tlak prvního v řadě. Válečky v sobě mají dvě ložiska a jsou usazeny na čepech pevně uložených v rotoru. V tomto provedení jsou válečky dost těžké a rozměrově větší, což je celkem zbytečné.

(3)<img src="/267339_ZPC_2025/images/sp_iterace1_3.jpg" alt="iterace1" style="float">

(4)<img src="/267339_ZPC_2025/images/sp_iterace1_4.jpg" alt="iterace1" style="float">

Dalším prvkem na rotoru jsou jehlice, které mají umírnit nafukování trubice při zvyšování vnitřního tlaku.

(5)<img src="/267339_ZPC_2025/images/sp_iterace1_5.jpg" alt="iterace1" style="float">

V celku byla tato etapa návrhu velmi důležitá kvůli určení rozměrů kompresoru, ale další součásti z CAD sestavy (viz. první obr. této části) jsem nevyráběl, protože se mi nepodařilo vyrobit trubice. Dále jsem se začal zabývat druhou iterací.

‎
‎

#### ***2. Iterace***

<img src="/267339_ZPC_2025/images/sp_iterace2_0.png" alt="iterace2" style="float">

Mezi největší změny v této iteraci patří materiál, tvar dutiny trubice a samotná konstrukce peristaltického kompresoru, která je dovedena do výrobní, montážní a estetické použitelnosti. 
Dutina trubice má plankonvexní na rozdíl od "korytového" tvaru předchozí iterace, tuto volbu jsem provedl hlavně z technologických důvodů, protože na zaobleném 3D výtisku je jednodušší post processing forem na odlévání silikonu. Což mě dostává k nejdůležitější části, tou je materiál trubice, který také diktuje proces její výroby. Po nezdařeném pokusu výroby trubice v minulé iteraci mi zbyly dvě možnosti na způsob výroby: 3D tisk a odlévání. 3D tisk jsem velmi rychle vyřadil, protože materiál trubice musí být pružný, pevný, odolný vůči opotřebení a schopný vytvořit těsný tlakový spoj stlačením, což by možná pružné TPU dokázalo, ale ve spojení s atributy 3D tisku mi to přišlo celkem ošemetné.

Procesem vyřazení vyšlo jako nejlepší volba odlévání trubice. Dalším krokem bylo najít vhodný materiál. Po krátké rešerši jsem zvolil adiční silikon (tvrdne po smíchání s katalizátorem oproti sublimačnímu, který tvrdne odpařováním rozpouštědla), kvůli jednoduchosti práce, nízké ceně a malému smrštění. Alternativou byl latex, který celkem velké smrštění při zasichání (+možná alergie) a pružná polyuretanová pryskyřice (PUR), která má nejlepší mechanické vlastnosti, ale využil jsem ji až ve třetí iteraci, protože jsem ji při rešerši pominul. Protože silikon má celkem nízkou odolnost vůči přetržení (oproti butylkaučuku nebo PUR) jsem se rozhodl do silikonu zalít nylonovou síťku, což spíše způsobilo potíže s kvalitou odlitku (zachycování bublin) než aby pomohlo s mechanickými vlastnostmi.

Dalším krokem ve výrobě trubice byl návrh formy a vyzkoumání správného postupu při odlévání. Následovalo pět pokusů na odlévání trubice se třemi různými formami. Všechny formy byly 3D tištěné, nastříkané tmelem ve spreji a obroušené brusným papírem pro hladší povrch a jednodušší výjmutí. Pro zabránění ulpění silikonu na formě jsem použil vazelínu jako separátor, což fungovalo překvapivě dobře.

První forma (další 3 obr.) by nedopadla špatně kdybych zacpal spáry mezi částmi formy a velká část silikonu nevytekla ven. Na třetím obrázku je vidět, že jsem se snažil zalít galuskový ventil vyříznutý z duše, ale velmi jednoduše šel vyjmout. Jelikož je silikon celkem viskózní a při míchání tvoří hodně bublinek, které pak z formy obtížně se dostávají, což je amplifikováno nedostatkem odvzdušňovacích otvorů ve formě. Navíc se shromažďují na nylonové síťce a vytváří díry v trubici. Silikon jsem do forem vstřikoval velkou injekční stříkačkou, která sice zaručila rychlé naplnění formy, ale vnášela do ní další velké bubliny. Špatná konstrukce první (obr 1-3) a druhé formy (4,5) zaručila pouze jedno použití.

(1)<img src="/267339_ZPC_2025/images/sp_iterace2_1.jpg" alt="iterace2" style="float">

(2)<img src="/267339_ZPC_2025/images/sp_iterace2_2.jpg" alt="iterace2" style="float">

(3)<img src="/267339_ZPC_2025/images/sp_iterace2_3.jpg" alt="iterace2" style="float">

(4)<img src="/267339_ZPC_2025/images/sp_iterace2_4.jpg" alt="iterace2" style="float">

U tohoto odlitku jsem se pokusil ventil upevnit hadicovou sponou, ale kvůli špatnému provedení spoj nefungoval.

(5)<img src="/267339_ZPC_2025/images/sp_iterace2_5.jpg" alt="iterace2" style="float">

Třetí verze formy je opakovatelně použitelná a vyprodukovala tři odlitky trubice. Silikon do této formy jsem vákuoval (celkem slabé vákuum) což trochu napomohlo kvalitě. Při míchání silikonu pro první odlitek v této formě jsem složku A a B dal do špatného poměru a kvůli tomu úplně nevytvrdnul. Za to další dva pokusy byly povedené (až na pár bublinek).

(6)<img src="/267339_ZPC_2025/images/sp_iterace2_6.jpg" alt="iterace2" style="float">

(7)<img src="/267339_ZPC_2025/images/sp_iterace2_7.jpg" alt="iterace2" style="float">

Třetí forma je složená z horní a spodní části, jádra, špuntu (součást nalepená na jádro, udává tvar otvoru pro ventil, viz obr. 9 modrý válec na růžovém jádře) a dvou průhledných bočních panelů (kontrola tečení silikonu)

(8)<img src="/267339_ZPC_2025/images/sp_iterace2_8.jpg" alt="iterace2" style="float">

(9)<img src="/267339_ZPC_2025/images/sp_iterace2_9.jpg" alt="iterace2" style="float">

(10)<img src="/267339_ZPC_2025/images/sp_iterace2_10.jpg" alt="iterace2" style="float">

(11)<img src="/267339_ZPC_2025/images/sp_iterace2_11.jpg" alt="iterace2" style="float">

(12)<img src="/267339_ZPC_2025/images/sp_iterace2_12.jpg" alt="iterace2" style="float">

S dvěma dobrými odlitky jsem složil první prototyp, jehož rotor jsem musel poté třikrát znovu vytisknout aby se trubice stlačovala dostatečně pro vznik těsného spoje, ale ne toliká aby odpor vůči otáčení nebyl moc veliký. Mím zjišťěním bylo, že maximální točivý moment na hřídeli plně osazeného rotoru (3x stlačovací válečky + jehlice) je 1075 Nmm (měřeno primitivně pákou a pružinou). Tento maximální moment nastává mezi jednotlivými trubicemi v "mrtvých místech" kde váleček sjel do propadliny a pak musí znovu zmáčknout trubici. Dalším cílem bylo ověřit, že samotný princip peristaltického kompresoru funguje, tudíž jsem zacpal otvor pro ventil a párkrát protočil rotorem a vždy když se váleček blížil ke konci trubice jsem cítil slabé, ale rozeznatelné roztahování silikonu (také bylo možné pozorovat zevnitř kompresoru na nafukování trubice).

Zde mohlo iterování skončit, ale při blízkém pohledu na trubici jsem si všiml, že je průřez trochu zborcený (viz obr. 13). Při zkoumání tohoto problému jsem přišel na dva hlavní důvody:
- Silikon není dostatečně tvrdý (pouze Shore A30 - měkký) ... větší náchylnost k deformaci opakovaným zatěžováním
- Špatné uchycení na statoru ... stlačující válečky vtahovali silikon do drážky odkud se poté nevrátil
Důsledkem bylo zmenšování dutiny do té doby než úplně splaska a nebyla schopná dál stlačovat vzduch.
Tudíž jsem musel najít alternativní materiál, zároveň poupravit tvar trubice a navrhnout rotor umožňující nastavení přitlaku.

(13)<img src="/267339_ZPC_2025/images/sp_iterace2_13.jpg" alt="iterace2" style="float">

‎
‎

#### ***3. Iterace***

<img src="/267339_ZPC_2025/images/sp_iterace3_0.png" alt="iterace3" style="float">

Velkým vylepšením je rotor s nastavením přítlaku, který využívá klíny pro roztahování. Pro realizaci jsem musel odebrat jeden přítlačný válec, tudíž na rotoru jsou pouze dva, což je spíše výhodné, kvůli snížení maximálního točivého momentu. Momentálně na rotoru nejsou jehlice, které možná do zkoušky ještě přidám.

Jak už jsem dříve nastínil ve třetí iteraci využívám jako materiál trubice pružnou polyuretanovou pryskyřici (Shore E70), která je oproti silikonu ve všem lepší (možná až na dráždivé výpary při tvrdnutí a práce v PPE - respirátor, rukavice). Pouze samotné lepší mechanické vlastnosti by pravděpodobně vyřešili problém s borcením, ale je lepší se pojistit jinými opatřeními.

K relaxaci materiálu po opakovaném zatěžování dojde určitě, proto s ní ve třetí iteraci počítam změněním tvaru dutiny na bikonvexní, což materiálu dá více místa na borcení bez uzavření dutiny.

Další způsob vylepšení proti borcení průřezu je lepší upevnění trubice na statoru. U předchozích iterací bylo realizováno přítlakem na "uši" trubice, což pro udržení velmi pružného materiálu není nejlepší. Proto jsem se rozhodl pro chemický / mechanický (zachycení za nerovnosti) spoj zalitím a tím vytvořit jednolitý stator s trubicí vázanou na povrch. Po krátké rešerši do tohoto tématu jsem našel primery, které tvoří hranici mezi pryskyřicí a zalévanou součástkou, která by se chemicky s pryskyřicí nespojila.
Pro nejlepší výsledky jsem provedl test zabíhavosti PUR a test adheze PUR na PETG s různými povrchovými úpravami (čistý povrch, broušený povrch, drážkovaný, děrovaný, broušený s primerem) a výsledky testu s primerem byly nad moje očekávání (viz video).

<div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden;">
  <iframe
    src="https://www.youtube.com/embed/https:/cuOLCeDBUuk"
    title="Test adheze PU na PETG"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
    allowfullscreen
    style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
  </iframe>
</div>

(1)<img src="/267339_ZPC_2025/images/sp_iterace3_1.jpg" alt="iterace3" style="float">

(2)<img src="/267339_ZPC_2025/images/sp_iterace3_2.jpg" alt="iterace3" style="float">

(3)<img src="/267339_ZPC_2025/images/sp_iterace3_3.jpg" alt="iterace3" style="float">

(4)<img src="/267339_ZPC_2025/images/sp_iterace3_4.jpg" alt="iterace3" style="float">

Příprava formy byla obdobná jako u silikonu tzn. 3D tisk, aplikace tmelu ve spreji, broušení, natření separátorem (speciální přímo na PUR) a součástí formy byl také prstenec statoru, který jsem obrousil na hrubo (zrnitost 150) pro lepší vazbu mezi PETG / primerem / PUR a po odmaštění natřel potřebné plochy primerem, dále jsem složil formu, namíchal PUR, vyvakuoval, odlil.

Toto jsem musel provádět dvakrát, protože na první pokus jsem namíchal málo PUR a nezaplnila se forma. (Aspoň mám pěknou ukázku na zkoušku :))

(5)<img src="/267339_ZPC_2025/images/sp_iterace3_5.jpg" alt="iterace3" style="float">

(6)<img src="/267339_ZPC_2025/images/sp_iterace3_6.jpg" alt="iterace3" style="float">

Separátor fungoval dobře a s trochou síly se vnější díly formy oddělili (většinou se ulomil kus formy, kvůli vrstvám 3D tisku). Horší bylo vyprostit jádra z dutin trubice kvůli nevhodnému tvaru jader. A protože jsem jádra páčil velkou silou ve špatném směru trubici jsem trochu natrhnul (obr. 8). Trhlinu jsem se snažil opravit pružným lepidlem, ale po pár přejetích válečku se lepidlo odtrhlo od polyuretanu (9). Trubice s trhlinou funguje znatelně hůř než bez trhliny tudíž se před zkouškou pokusím opravit trhlinu pomocí primeru a zalitím trhliny novým polyuretanem.


(7)<img src="/267339_ZPC_2025/images/sp_iterace3_7.jpg" alt="iterace3" style="float">

(8)<img src="/267339_ZPC_2025/images/sp_iterace3_8.jpg" alt="iterace3" style="float">

(9)<img src="/267339_ZPC_2025/images/sp_iterace3_9.jpg" alt="iterace3" style="float">

(10)<img src="/267339_ZPC_2025/images/sp_iterace3_10.jpg" alt="iterace3" style="float">

Posledním krokem pro zhotovení trubice bylo instalovat hadicové trny, které slouží k namontování zpětného ventilu.

‎
‎

#### ***Montáž peristaltického kompresoru***

Jako první skládám rotor s nastavitelným přítlakem, zároveň je asi nejtěžší na složení.

<img src="/267339_ZPC_2025/images/sp_skladanipk_1.png" alt="skladanipk" style="float">

<img src="/267339_ZPC_2025/images/sp_skladanipk_2.png" alt="skladanipk" style="float">

Video s funkcí rotoru s nastavitelným přítlakem

<div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden;">
  <iframe
    src="https://www.youtube.com/embed/https:/Dmn2yoVg69M"
    title="Rotor s nastavitelným přítlakem"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
    allowfullscreen
    style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
  </iframe>
</div>

<img src="/267339_ZPC_2025/images/sp_skladanipk_3.png" alt="skladanipk" style="float">

<img src="/267339_ZPC_2025/images/sp_skladanipk_4.png" alt="skladanipk" style="float">

<img src="/267339_ZPC_2025/images/sp_skladanipk_5.png" alt="skladanipk" style="float">

<img src="/267339_ZPC_2025/images/sp_skladanipk_6.png" alt="skladanipk" style="float">

<img src="/267339_ZPC_2025/images/sp_skladanipk_7.png" alt="skladanipk" style="float">

<img src="/267339_ZPC_2025/images/sp_skladanipk_8.png" alt="skladanipk" style="float">

‎
‎

#### ***Montáž testovací platformy***

Celá testovací platforma mohla být trochu lépe promyšlená, esteticky je v pořádku. Upevnění není moc pevné a trochu se kroutí za běhu kompresoru. Celkem složité bylo se vypořádat se spojkou mezi hřídelí motoru a kompresoru, protože na hřídeli kompresoru jsou závity, které se rádi zakusují do PETG spojky a z druhé strany je 3 mm hřídel, která také ráda kouše PETG. Z tohoto důvodu jsem do obou hřídelů vyvrtal díry a vložil tyčku na kompresorovou stranu a malý šroubek na motorovou stranu. Dále jsem namontoval a utěsnil teflonovou páskou zpětné ventily a ostatní šroubení pro rozvod tlakového vzduchu.

<img src="/267339_ZPC_2025/images/sp_skladanitp_1.png" alt="skladanitp" style="float">

<img src="/267339_ZPC_2025/images/sp_skladanitp_2.png" alt="skladanitp" style="float">

<img src="/267339_ZPC_2025/images/sp_skladanitp_3.png" alt="skladanitp" style="float">

<img src="/267339_ZPC_2025/images/sp_skladanitp_4.png" alt="skladanitp" style="float">

<img src="/267339_ZPC_2025/images/sp_skladanitp_5.png" alt="skladanitp" style="float">

<img src="/267339_ZPC_2025/images/sp_skladanitp_6.png" alt="skladanitp" style="float">

<img src="/267339_ZPC_2025/images/sp_skladanitp_7.png" alt="skladanitp" style="float">

‎
‎

#### ***Montáž elektroniky***

Elektroniku se mi podařilo zprovoznit i přes protestování LCD dispeje, ale ještě potřebuji vyladit drobnosti v programu a pár věcí přidat (reset otáček, kalibrace senzoru tlaku). Nedostatkem je poddimenzovaný motor, když nastavím větší přítlak zastavuje se v mrtvých místech. Objednal jsem si stejný s větším převodem ... tzn. větší přítlak, větší dosažitelný tlak atd.

<img src="/267339_ZPC_2025/images/sp_elektrodiagram.png" alt="skladaniel" style="float">

Seznam elektro součástek:
- DC kartáčový motor 12V (60 RPM)
- IR senzor - počítadlo otáček
- Tlakový senzor - max 5,5 bar
- LCD 16x2 displej
- Potenciometr, LED, tlačítko - ovládání
- Arduino UNO R3
- PWM 15A 400W MOSFET - ovládání motoru arduinem
- Měnič napětí 12V - 5V - napájení arduina a periferií
- Napájecí síťový adaptér 12V 1A
- Kondenzátory, rezistory apod.

Arduino kód:
```cpp
// Testovací platforma peristaltického kompresoru

// LCD piny:  RS, E, D4, D5, D6, D7
#include <LiquidCrystal.h>
LiquidCrystal lcd(13, 12, 11, 10, 9, 8);

//funkce pro desetinná čísla
float mapFloat(float x, float in_min, float in_max, float out_min, float out_max) {
  return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
}
// piny
int SENZOR_TLAKU = A0;
int POTENCIOMETR = A2;
int IR_SENZOR_D0 = 2;
int PWM = 3;
int TLACITKO = 4;
int LED = 5;

// systém
unsigned long t;
int POCET_OTACEK = 0;
bool STAV_MOTORU = false; // false = motor vypnutý, true = motor zapnutý

// senzor tlaku
int TLAK;
int TLAK_DESETINY;

// IR senzor
int IR_SENZOR_D0_VAL;
int POSLEDNI_STAV = 1;

// potenciometr
int POT_VAL;

// pmw
int RYCHLOST_PREPINANI;

// tlačítko
int TLACITKO_VAL;
bool POSLEDNI_STAV_TLACITKA = false;

void setup()
{
delay(100);
lcd.begin(16, 2);
  lcd.print("Startuji");
  delay(1000);
  lcd.clear();
//setup pinů a lcd
pinMode (LED, OUTPUT);
pinMode (PWM, OUTPUT);
pinMode (TLACITKO, INPUT);

Serial.begin(9600);
}

void loop()
{
t = millis();
  
// logika přepínacího tlačítka
TLACITKO_VAL = digitalRead(TLACITKO);

  if(TLACITKO_VAL == HIGH && STAV_MOTORU == false && POSLEDNI_STAV_TLACITKA == false){
    STAV_MOTORU = true;
    }
    else if (TLACITKO_VAL == HIGH && STAV_MOTORU == true && POSLEDNI_STAV_TLACITKA == false){
      STAV_MOTORU = false;
      }
  POSLEDNI_STAV_TLACITKA = TLACITKO_VAL;

  // zapnutí LED pokud je zapnutý motor
  if (STAV_MOTORU == true){
    digitalWrite(LED, HIGH);
  }
    else{
    digitalWrite(LED, LOW);
  }

// ovládání rychlosti PWM mosfetu pomocí potenciometru
POT_VAL = analogRead(POTENCIOMETR);
RYCHLOST_PREPINANI = map(POT_VAL,0,1023,0,255);

// vypnutí a zapnutí PWM mosfetu
if (STAV_MOTORU == true){
  analogWrite(PWM, RYCHLOST_PREPINANI);
  }
  else {
  analogWrite(PWM, 0);
}

// přečtení a mapování hodnoty senzoru tlaku na příslušné jednotky (bary)
TLAK = analogRead(SENZOR_TLAKU);
float TLAK_DESETINY = mapFloat(TLAK, 0, 1023, 0.0, 5.51);
    
  // zobrazení řádku s tlakem
  lcd.setCursor(0, 0);
  lcd.print("Tlak:");
  lcd.setCursor(6, 0);
  lcd.print(TLAK_DESETINY, 1);
  lcd.setCursor(13, 0);
  lcd.print("bar");

// přečtení hodnoty IR senzoru
IR_SENZOR_D0_VAL = digitalRead(IR_SENZOR_D0);

// vyhodnocení provedení otáčky
if (IR_SENZOR_D0_VAL == 1){
  if (POSLEDNI_STAV == 0){
    POCET_OTACEK = POCET_OTACEK + 1;
  }
}
POSLEDNI_STAV = IR_SENZOR_D0_VAL;


Serial.println(POCET_OTACEK);

  // zobrazení řádku s otáčkami
  lcd.setCursor(0, 1);
  lcd.print("Otacky:");
  lcd.setCursor(8, 1);
  lcd.print(POCET_OTACEK, 1);
}

```

<img src="/267339_ZPC_2025/images/sp_skladaniel_1.png" alt="skladaniel" style="float">

<img src="/267339_ZPC_2025/images/sp_skladaniel_2.png" alt="skladaniel" style="float">

<img src="/267339_ZPC_2025/images/sp_skladaniel_3.png" alt="skladaniel" style="float">

<img src="/267339_ZPC_2025/images/sp_skladaniel_4.png" alt="skladaniel" style="float">

<img src="/267339_ZPC_2025/images/sp_skladaniel_5.png" alt="skladaniel" style="float">

<img src="/267339_ZPC_2025/images/sp_skladaniel_6.png" alt="skladaniel" style="float">

<img src="/267339_ZPC_2025/images/sp_skladaniel_7.png" alt="skladaniel" style="float">

<img src="/267339_ZPC_2025/images/sp_skladaniel_8.png" alt="skladaniel" style="float">

<img src="/267339_ZPC_2025/images/sp_skladaniel_9.png" alt="skladaniel" style="float">

<img src="/267339_ZPC_2025/images/sp_skladaniel_10.png" alt="skladxaniel" style="float">

<img src="/267339_ZPC_2025/images/sp_skladaniel_11.png" alt="skladaniel" style="float">

<div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden;">
  <iframe
    src="https://www.youtube.com/embed/3oTtaVhdfaM"
    title="Vyzkoušení elektroniky"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
    allowfullscreen
    style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
  </iframe>
</div>

‎
‎

#### ***Finální produkt a zhodnocení***

<img src="/267339_ZPC_2025/images/sp_finalniprodukt.png" alt="finalni produkt" style="float">

Výsledkem je testovací platforma s peristaltickým kompresorem, některé mouchy doladím do zkoušky a některé k tomu prostě patří. Při krátkém testování jsem byl schopen dosáhnout tlaku 1,2 baru (1,7 podle displeje, ale ukazuje automaticky 0,5), nafouknout duši jízdního kola na 0,7 baru. Zařízení je velice limitováno poddimenzovaným motorem a v některých místech uniká tlakový vzduch (pravděpodobně šroubení).

Už jenom z minimálního testování co jsem zatím provedl mě napadá mnoho dalších vylepšení, asi nejvýznamnější odstranění rázů při přejezdu mrtvého místa (mezi koncem dutiny a začátkem nové dutiny).

Nepovedené natlakování tlakových rozvodů (únik)
<div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden;">
  <iframe
    src="https://www.youtube.com/embed/PRIQFfEWpk0"
    title="Netěsnící šroubení"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
    allowfullscreen
    style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
  </iframe>
</div>


Natlakování jedné poloviny tlakových rozvodů
<div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden;">
  <iframe
    src="https://www.youtube.com/embed/Euf2tXIa0-0"
    title="Natlakování části tlakového vedení"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
    allowfullscreen
    style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
  </iframe>
</div>

Natlakování duše jízdního kola
<div style="position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden;">
  <iframe
    src="https://www.youtube.com/embed/k524HkUZlNE"
    title="Natlakování duše jízdního kola"
    frameborder="0"
    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
    allowfullscreen
    style="position: absolute; top: 0; left: 0; width: 100%; height: 100%;">
  </iframe>
</div>

Děkuji za přečtení,

Jakub Dostálek

21.1.2026 09:35  Jdu spát :)