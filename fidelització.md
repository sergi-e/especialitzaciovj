# Fidelització i el comportament dels jugadors

A l'hora de desenvolupar un videojoc és vital comprendre de quina manera facilitem que els jugadors vulguin jugar i dedicar el seu temps al nostre joc. Certes fites poden ser evidents; per exemple sabem que tenir males reviews és mala senyal (més d'un 15% és mala senyal) o que si fem cas als jugadors, afegim les features que suggereixen, creem nou contingut, etc. podem afavorir el cicle de vida del nostre projecte. 
No obstant, si volem aconseguir un coneixement profund i específic de la manera en que els jugadors fan ús del nostre videojoc, necessitem fer servir el que anomenem **mètriques**. Les mètriques són analítiques concretes i mesurables que es tenen en compte des del mateix moment del desenvolupament per poder planificar un análisi contorlat i amb els mecanismes i recursos necessaris per obtenir resultats que s'ajusten a la realitat.

En grans empreses, l'anàlisi de mètriques sol ser responsabilitat de càrrecs relacionats amb el màrketing o la UX; per exemple, un UX researcher que condueix diversos procesos de testeig). En aquest article no ens centrarem molt en profunditat en les mètriques, però cal utilitzar-les per poder parlar més en profunditat sobre els habits de jocs. Per això, com aquest article està sobre tot enfocat a developers, farem una breu introducció a mètriques relevants per al desenvolupament de videojocs mòbils, un bon mercat per experimentar com a desenvolupador novel. 

> :pushpin: Pàgines i servicis com [data.ai](https://www.data.ai/es/), [similarweb](https://www.similarweb.com/) o [Google Analytics](https://analytics.google.com/analytics/web/) que ens permeten consultar analítiques mètriques de diferents apps, jocs o pàgines. Açò pot ser important per tenir dades de referència pel nostre desenvolupament. 


## Mètriques clau a videojocs mòbil

- **Retenció:** percentatge d'usuaris que instalen el joc i tornen a jugar-lo, calculat en un dia específic des de la descàrrega. Cal tenir en compte que, moltes vegades, aquesta mètrica determina si cal matar/redissenyar o no un projecte, com bé remarca Hugo Peyron (publisher en Voodoo). Els publishers poden demanar dades específiques, per exemple una D1 del 40% (atenent sempre al context i gènere específics del videojoc). Per als jocs amb una retenció destacada normalment cal esperar unes xifres similars a aquestes:
- Day 1: 40%
- Day 7: 15%
- Day 28: 6.5%

Les categories de videojocs mòbils amb una retenció mitjana més alta són _Words_ i _Kids_, amb una D28 de 15% i 1.8%

- **Stickiness:** Quants usuaris juguen al joc tots els dies. Una stickiness inferior a 7% és mala, mentre que la dels jocs amb millor rendiment sol estar al voltant del 20%.
- **Sessió:** el temps que passa jugant un usuari abans d'abandonar la partida. En aquesta mètrica, els jocs amb sessions més llargues solen ser els de cartes/casino, amb una mitjana de 35 minuts. 

![image](https://user-images.githubusercontent.com/59253112/226655743-39c57be6-35f9-4cca-b6d9-a1f327c05cef.png)

Hi ha moltes altres mètriques relevants, però per no allargar aquesta introducció, mencionarem altres que són molt relevants per qualsevol desenvolupament : _Daily Active Users_, _Installs_, _First Payment Conversion_ (temps fins primer pagament) i la _Churn rate_ (% desinstal·lacions després de jugar, el contrari a la retenció).

L'anàlisi de mètriques és un procés complicat i que requereix una comprensió holística del jugador. Per exemple: una retenció de D28 és més fàcil de millorar que una D7, ja que per aquest punt sabem que a l'usuari li agrada el joc en sí i el que cal millorar és l'endgame. També cal tenir en compte factors que poden afectar els resultats de moltes maneres. Altre exemple, la _stickiness_ acostuma a milorar en començar el Q4, però empitjora abans de Nadal, on sol haver molta nova oferta de videojocs. 

En tenir els resultats de les nostres mètriques podem prendre decisions per tal de millorar aquestos resultats. Si per exemple volem augmentar la mitjana de duració de sessió, podem oferir recompenses en jugar X partides o descomptes, fites... Però més enllà de mesures específiques, una manera fonamental de millorar els resultats generals del nostre videojoc és atendre amb cura al **game loop**, a la manera en que dissenyem el propi joc. 

## Creació d'hàbits i fidelització

Una de les millors maneres de crear usuaris fidels és crear un hàbit de joc. Aquest tarda en crear-se entre 18 i 254 dies, de mitjana 66, però açò no és una regla. Hàbits senzills poden acomodar-se en qüestió de dies.  
![imatge](https://user-images.githubusercontent.com/59253112/226701820-9f53b5b7-1439-4dc4-a4c4-84df574493fc.png)

Cada hàbit té un catalitzador que provoca l'acció, especialment si hi ha una recompensa. Obrir el feed de Twitter o Instagram és molt fàcil i gratificant, de s'automatitza fàcilment. Les millors maneres d'acostumar un hàbit són recompenses (intrínseques o extrínseques) i construir-los sobre hàbits ja instaurats.
De manera molt senzilla:

> El mòbil vibra (catalitzador) i l'engegem per veure les nostres notificacions (acció). -> Llegim les notificacions (catalitzador) i premem la del nostre lloc per recollir una recompensa (acció). 

Aquests són dos hàbits encadenats. Açò pot aplicar-se a dintre del propi joc amb el que anomenem **Feedback loop**, on cada acció del jugador li report aun feedback que provoca una nova acció. 

> Monstre apareix (catalitzador) -> jugador ataca (acció> -> Monstre mor i dóna recompensa (catalitzador) -> Creem nou equipament amb el botí (acció) -> ...

Els feedback loops que tracten de crear nous hàbits són especialment eficients quan són curts, no requereixen la presa de decisions i retornen feedback positiu o mostren progrés. Aquests bucles es repetiran moltíssimes vegades en un joc, de manera que han de ser gratificants i divertits per als jugadors. Açò és especialment evident en jocs tipus arcade, però inclús en un MMO, les quests ofereixen petits loops que s'entremesclen amb loops més llargs. 

Per tal de millorar el Feedback loop cal identificar primer el loop a millorar. Llista els patrons d'accions que es repeteixen (poden implicar moments, espais, mitjans o inclús diferents persones) i fixa't en els catalitzadors i les accions associades. Els loops poden millorar-se en quatre aspectes:

- **Velocitat:** quan més tarde el feedback, pitjor. Açò té a veure amb el _Descompte hiperbòlic_, un biaix que du a les persones a escollir recompenses petites però immediates front al llarg termini. Aquest feedback pot ser real o simulat, per exemple, les pàgines de bancs utilitzen simulen els efectes de les decisions per estimular la presa d'aquestes en base al que impliquen a llarg termini. D'altra banda, targetes de crèdit han reforçat un hàbit negatiu de manera contrària, dilatant un feedback negatiu (extraure els diners del compte) a final de mes. 
- **Mesurabilitat:** facilitar la comprensió de quina opció és millor o que es puguin ordenar intuitivament les alternatives. Per açò ens podem fer servir dels biaixos d'ancoratge (la primera informació proporcionada rep molta més atenció) i _framing_ (la formulació d'un problema afecta a la decisió presa). 
- **Context:** la informació sense context i/o un objectiu major, no és efectiva. No és el mateix dir que hem gastat 500€ aquesta setmana, que dir que hem gastat 500€ d'un pressupost semanal de 300€. Els rellotges intel·ligents creen molts feedback loops a partir de crear un context de metes diàries en passes, hores de son, etc. fent servir barres, diagrames, etc. 
- **Motivació:** fins i tot tenint context, si aquest no connecta mb motivacions de l'usuari, no crea un vincle sostenible. Punts i medalles que no signifiquen res significatiu no duraran. Pot ser complicat comprendre les motivacions darrere de les persones. Per ajudar-nos tenim conceptes com la piràmide de Maslow o la teoria de l'autodeterminació a psicologia. 


En la creació d'hàbits cal tenir en compte la diferència entre hàbit i adicció. Una retenció a llarg termini es basa en la creació d'hàbits saludables que proporcionen una experiència positiva. Encara que explotem mecanismes psicològics (com el [reward system](https://www.wikiwand.com/en/Reward_system)). Podem recurrir a tècniques com les caixes de Skinner o mecàniques de grindeig que forcen els límits ètics del desenvolupament, però és millor utilitzar recursos que no exploten als usuaris en sí, sinò les seues ganes d'aprendre, descobrir, aconseguir, millorar...


## Caixes de Skinner i la psicologia de la recompensa

El condicionament operand (també anomenat caixa de Skinner) és un mètode d'aprenentatge que reforça la repetició d'un comportament recompensat i evita un castigat (aquesta és la llei d'efecte-reforç). No tracta de comprendre els mecanismes més interns i profunds de la ment que determinen el comportament, sinò afectar aquest directament. Per aconseguir açò, trobem tres maneres d'actuar: 
- **Reforç positiu:** tracta d'aconseguir la repetició d'un comportament per repetició d'un estat desitjat. Per açò tenim reforços primaris, que satisfan una necessitat com la set o la fam, i secundaris, que no són una necessitat vital però poden ser igual de poderosos. Un exemple és rebre 5€ cada vegada que completem una tasca. 
- **Reforç negatiu:** similar al reforç positiu, tracta de reforçar un comportament mitjançant la supresió d'un estat negatiu. Per exemple, menjar és un comportament reforçat negativament per la sensació de gana. 
- **Càstic:** és el contrari al reforç. Tracta d'evitar un comportament mitjançant un estat negatiu. Cal fixar-se que reforç negatiu i càstic no són el mateix. Ambdós reforços, positiu i negatiu, tracten d'afavorir un comportament, però el càstic tracta d'evitar-lo. L'ús de càstic té més complicacions de les que pareix, ja que no fa oblidar un comportament, sinò que el suprimeix fins que el càstic desapareix. També incrementa l'agressió i la por, i pot dirigir cap a comportaments no desitjats en lloc de reforçar. El càstic no diu quin és el compotament desitjat, simplement marca un comportament coma  no desitjat. 

> Cal comprendre que reforços i càstics poden ser efectes directes o indirectes. És a dir, aplicar un shock és un càstic, però arrebatar un objecte desitjat també. 

El condicionament operant implica la repetició d'un comportament, però: quant de temps tarda aquest en desaparèixer? Doncs depèn del patró de reforç que seguim. Cal fixar-nos en dos aspectes: la ràtio d'extinció (quant tarda el comportament en desaparèixer quan no hi ha reforç), i la ràtio de repetició (quantes vegades es repeteix el comportament per minut/hora/...).
- **A) Reforç continu:** es recompensa el comportament sempre que es produeix. &#10132; **Resposta:** lenta | **Extinció:** ràpida &#10132; _Una màquina expendedora_
- **B) Reforç per ràtio fixa:** recompensa cada X vegades que es produeix el comportament. &#10132; **Resposta:** ràpida | **Extinció:** mitja &#10132; _Un gofre gratuït cada deu compres._
- **C) Reforç per interval fixe:** recompensa cada Y temps. &#10132; **Resposta:** mitja | **Extinció:** mitja &#10132; _Estudiar per una prova setmanal._ 
- **D) Reforç per ràtio variable:** recompensa quan el comportament es produeix un nombre indeterminat de vegades. &#10132; **Resposta:** ràpida | **Extinció:** lenta &#10132; _La loteria._
- **E) Reforç per interval variable:** recompensa cada nombre indeterminat de temps. &#10132; **Resposta:** ràpida | **Extinció:** lenta &#10132; _guanyar un nivell en un joc arcade._

![imatge](https://user-images.githubusercontent.com/59253112/227146191-ec41d3b6-c3ea-49a6-a7c2-c08566782f74.png)

Els millors resultats s'obtenen amb el reforç per ràtio variable, on el comportament es repeteix molt ràpidament i l'extinció és molt lenta, ja que el caràcter arbitrari fa difícil de predir la resposta. Lo impredecible del reforç produeix respostes més consistents. Ací entren a debat mecanismes que exploten aquesta arbitrarietat per crear sistemes que tracten de reforçar un comportament adictiu. Cal tenir en compte que el condicionament és diferent de l'adicció: l'ús de caixes de Skinner no implica necessàriament ludopatia, però es tracta d'un mecanisme que, utilitzat a la força i sense altres reforços, resulta en una experiència buida. Com a desenvolupadors, hem de ser conscients de les tècniques que apliquem i tenim una responsabilitat sobre la manera en que utilitzem mecanismes de joc i de venda. 

## Els perills de les mecàniques explotatives

En els últims deu anys, l'ús de mecàniques d'ètica qüestionable s'han anat expandint per la indústria del videojoc fins plagar per complet les mecàniques de jocs referents del seu gènere com FIFA. L'ús d'aquestos mecanismes ha sigut l'objecte de casos d'estudi legal, com [EA i les loot boxes](https://www.eurogamer.net/ea-loot-box-lawsuit-fails-in-bid-to-brand-games-as-gambling) o [Epic i Fornite](https://www.vox.com/recode/2022/12/19/23516925/epic-games-ftc-settlement-520-million) perdent el cas més gran contra el consumidor registrat en la indústria. Quan parlem de mecàniques explotatives, podriem parlar no sols de mecanismes d'addició sinò també de vies i tècniques per alterar l'experiència d'usuari i joc per tal d'afavorir acccions de venda en menors o d'invasió de la privacitat. 

No obstant, per la pròpia l'abast d'aquest article sobre la creació d'hàbits i la fidelització d'usuaris, ens anem a centrar sobre tot en comprendre els conceptes de _loot box_ i _gacha_, que avuí en dia son molt vigents: 

- **Què és una loot box?** Les loot boxes són mecanismes de pagament (sigui directe o indirecte) a un videojoc que ofereixen una recompensa aleatòria, siguin cosmètics o amb conseqüències de joc. Cal tenir en compte que aquestes mecàniques resulten especialment problemàtiques quan les recompenses intefereixen amb les mecàniques de joc i poden convertir-lo en un **pay-to-win** ja que aquestes ofereixen possibilitats d'èxit molt superior. Tenim l'exemple dels sobres amb jugadors en _FIFA/FUT_ o els personatges principals en _Battlefront II_. És important diferenciar les _loot boxes_ dels micropagaments, on el jugador sap exactament què està comprant. Tenint açò clar, un joc amb micropagaments pot ser _pay-to-win_ sense necessitat de tenir _loot boxes_, i un joc pot tenir _loot boxes_ sense que aquestes interfereixen amb el joc en sí. 
- **I què és un _gacha_?** Els gacha tenen un origen un poc diferent de les _loot boxes_, però es tracta essencialment de jocs de pagament amb recompenses aleatoris. Podriem dir que són dos mecanismes molt similars que es van desenvolupar a diferents zones geogràfiques, però que avuí en dia estan tan vinculats que no hi ha gaire manera de diferenciar-los. Algunes persones comenten que la relació entre gacha i loot box és como la dels polzes amb els dits: tots els polzes són dits, però no tots els dits són polzes. De la mateixa manera, tots els gacha són loot boxes, però no totes les loot boxes són un gacha. Les dos principals diferències que es comenten són:
- Un gacha té transparència pel que fa a la probabilitat d'obtenir qualsevol tipus de recompensa. 
- Si un videojoc tan sols utilitza aquest mecanisme aleatori per la seua financiació, és un gacha (per lo tant un joc F2P amb loot boxes seria un gacha). D'altra banda, si el mecanisme aleatori està construit a sobre d'un joc de pagament, es tracta senzillament d'un joc amb loot boxes. No obstant, aquesta no es tracta diferenciació no és clara i establerta. 

El que sí podem aclarir és que el gacha té una història més complerta als seus paísos d'origen, on, abans dels videojocs, ja existia certa cultura de màquines de joguets que funcionaven amb aquesta mecànica. 

> :pushpin: Ací tenim un article que diferencia entre els [cinc tipus principals de gacha](https://renatus.com/gacha-types-of-gotcha).

## Altres vies per reforçar comportaments

Tots aquests principis s'utilitzen per definir diferents tècniques de modificació de comportament. Dos de les més conegudes serien: 
- **Economia de tokens:** uns tokens actuen com a reforços secundaris (no són un reforç en sí mateix, sinò que duen a aquest reforç). Aquests tokens després s'intercanvien o donen accés a la recompensa o el reforç dessitjat. 
- **Behaviour shaping:** es condicionen comportaments complexos fent una iteració gradual de comportaments més senzills que, cada vegada que l'individu s'aproxima un pas més a l'objectiu dessitjat, s'activen i actualitzen. 


---

## Recursos utilitzats

- https://gameanalytics.com/blog/key-lessons-boost-game-retention/
- https://www.indeed.com/career-advice/career-development/what-are-game-metrics
- https://gameanalytics.com/blog/habit-formation-key-long-term-retention/
- https://gameanalytics.com/blog/strategies-gamers-loyalty-retention/
- https://www.smashingmagazine.com/2013/02/designing-great-feedback-loops/
- https://www.wikiwand.com/en/Reward_system
- https://simplypsychology.org/operant-conditioning.html
- https://simplypsychology.org/schedules-of-reinforcement.html
- https://renatus.com/gacha-types-of-gotcha
- https://www.xataka.com/videojuegos/que-loot-boxes-videojuegos-explicado-para-que-todavia-piensan-que-como-cromos-panini
- https://www.xfire.com/gacha-vs-lootboxes-whats-the-difference/

<h2>Recursos per comprovar</h2>

- https://cultureofgaming.com/operant-conditioning-how-games-condition-players/
- https://gameanalytics.com/blog/strategies-gamers-loyalty-retention/
- https://gameanalytics.com/blog/key-lessons-boost-game-retention/
- https://www.indeed.com/career-advice/career-development/what-are-game-metrics
- https://gameanalytics.com/blog/habit-formation-key-long-term-retention/
- https://simplypsychology.org/operant-conditioning.html
- Ad strategies for user acquisition: https://gameanalytics.com/blog/mobile-ad-creative-strategies/
- Extra Credits Skinner box: https://www.youtube.com/watch?v=tWtvrPTbQ_c
- Exra Credits (How good games avoid Skinner box): https://www.youtube.com/watch?v=S5camMoNw-o
- Extra Credits (game feeling generic): https://www.youtube.com/watch?v=NxX9sGhsbks
- Extra Credits (good game rewards extrinsic/intrinsic): https://www.youtube.com/watch?v=h86g-XgUCA8
- Extra Credits (Illusion of choice - Balance Freedom and scope): https://www.youtube.com/watch?v=45PdtGDGhac
- - https://yukaichou.com/gamification-study/behavior-principles-and-good-game-design/
- https://levelskip.com/how-to/Skinners-Box-and-Video-Games
- Game design resources: https://www.gdquest.com/tutorial/game-design/general/game-design-tutorial/chapter/8_my_8_best_game_design_resources/ 
- https://gecon.es/psychology-and-game-design-players-skills-data-driven-game-design/
- https://medium.com/@sachinrekhi/understanding-user-psychology-thinking-like-a-game-designer-3aafde81ae2d
- https://medium.com/@sachinrekhi/the-hierarchy-of-user-friction-e99113b77d78
- https://medium.com/@sachinrekhi/designing-your-products-continuous-feedback-loop-4a7bb31141fe
- http://gamedesigndojo.com/gdd-025/


--- Monetization strategies ---

- https://spilgames.com/11-monetization-strategies-for-game-developers/
- https://beamable.com/blog/the-many-ways-to-monetize-your-game
- https://www.gamedeveloper.com/press-release/its-time-to-re-examine-your-revenue-models
- https://www.youtube.com/watch?v=F8J45we3KMU
- Nature vs. Nurture: Unpacking Player Spending in F2P Games: https://www.youtube.com/watch?v=HvUn1XOURk4
- Idle Games: The Mechanics and Monetization of Self-Playing Games: https://www.youtube.com/watch?v=Lu-RjxeDpU8
- Monetization Design: The Dark Side of Gacha: https://www.youtube.com/watch?v=LnCOkQ-f8AQ
- Monetization Madness - How Games Make Money - Extra Credits: https://www.youtube.com/watch?v=qX3xW6nO4zw
- Doing Free to Play Wrong - How Bad Monetization Harms F2P Games - Extra Credits: https://www.youtube.com/watch?v=Mhz9OXy86a0
