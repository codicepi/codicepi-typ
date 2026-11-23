#import "../../codicepi-template.typ": Rvita, c, nota, tf, th

== Reazione al fuoco <ch_reazione_al_fuoco>

=== Premessa <ch_reazione_al_fuoco_premessa>

#c[La reazione al fuoco è una misura antincendio di protezione passiva che esplica i suoi principali effetti nella fase iniziale dell’incendio, con l’obiettivo di limitare l’innesco dei materiali e la propagazione dell’incendio. Essa si riferisce al comportamento al fuoco dei materiali nelle effettive condizioni d’uso finali, con particolare riguardo al grado di partecipazione all’incendio che essi manifestano in condizioni standardizzate di prova.]

#c[Tali requisiti sono applicati agli ambiti dell’attività ove si intenda limitare la partecipazione dei materiali alla combustione e ridurre la propagazione dell’incendio.]

=== Livelli di prestazione <ch_reazione_al_fuoco_livelli>

#c[La @ta_reazione_livelli riporta i livelli di prestazione attribuibili agli ambiti dell’attività per la presente misura antincendio.]

#figure(
  table(
    columns: (auto, 1fr),
    align: (center + horizon, left + horizon),
    table.header(th[Livello di \ prestazione], th[Descrizione]),
    [I], [Il contributo all’incendio dei materiali non è valutato],
    [II], [I materiali contribuiscono in modo significativo all’incendio],
    [III], [I materiali contribuiscono in modo moderato all’incendio],
    [IV], [I materiali contribuiscono in modo quasi trascurabile all’incendio],
    table.footer(
      tf(
        colspan: 2,
      )[Per contributo all’incendio si intende l’energia rilasciata dai materiali che influenza la crescita e lo sviluppo dell’incendio in condizioni pre e post incendio generalizzato (flashover) secondo EN 13501-1.],
    ),
  ),
  kind: "table",
  caption: [Livelli di prestazione],
) <ta_reazione_livelli> // FIXME macro

=== Criteri di attribuzione dei livelli di prestazione <ch_reazione_al_fuoco_criteri>

#c[@ta_reazione_vie_esodo ed @ta_reazione_altri_locali riportano i criteri generalmente accettati per l’attribuzione dei singoli livelli di prestazione.]

#figure(
  table(
    columns: (auto, 1fr),
    align: (center + horizon, left + horizon),
    table.header(th[Livello di \ prestazione], th[Criteri di attribuzione]),
    [I], [Vie d’esodo [1] non ricomprese negli altri criteri di attribuzione.],
    [II], [Vie d’esodo [1] dei compartimenti con profilo di rischio #Rvita in B1.],
    [III],
    [Vie d’esodo [1] dei compartimenti con profilo di rischio #Rvita in B2, B3, Cii1, Cii2, Cii3, Ciii1, Ciii2, Ciii3, E1, E2, E3.],

    [IV], [Vie d’esodo [1] dei compartimenti con profilo di rischio #Rvita in D1, D2.],
    table.footer(
      tf(
        colspan: 2,
      )[[1] Limitatamente a vie d’esodo verticali, percorsi d’esodo (corridoi, atri, filtri,~…) e spazi calmi.],
    ),
  ),
  kind: "table",
  caption: [Criteri di attribuzione dei livelli di prestazione alle vie d’esodo dell’attività],
) <ta_reazione_vie_esodo> // FIXME macro

#figure(
  table(
    columns: (auto, 1fr),
    align: (center, left),
    table.header(th[Livello di \ prestazione], th[Criteri di attribuzione]),
    [I], [Locali non ricompresi negli altri criteri di attribuzione.],
    [II],
    [Locali di compartimenti con profilo di rischio #Rvita in B2, B3, Cii1, Cii2, Cii3, Ciii1, Ciii2, Ciii3, E1, E2, E3.],

    [III], [Locali di compartimenti con profilo di rischio #Rvita in D1, D2.],
    [IV],
    [Su specifica richiesta del committente, previsti da capitolati tecnici di progetto, richiesti dalla autorità competente per costruzioni destinate ad attività di particolare importanza.],
  ),
  kind: "table",
  caption: [Criteri di attribuzione dei livelli di prestazione ad altri locali dell’attività],
) <ta_reazione_altri_locali> // FIXME macro

=== Soluzioni progettuali <ch_reazione_al_fuoco_soluzioni>

#nota[Il livello di prestazione I della presente misura antincendio non richiede l’applicazione di soluzioni progettuali.]

#c[Di seguito sono riportate, per ciascun livello di prestazione, le soluzioni conformi riferite ai gruppi di materiali GM0, GM1, GM2, GM3, GM4 definiti nel @ch_reazione_al_fuoco_classificazione.]

#c[Sono esclusi da valutazione dei requisiti di reazione al fuoco i materiali indicati nel @ch_reazione_al_fuoco_esclusione.]

#c[Indipendentemente dalle soluzioni conformi adottate per i rivestimenti, sono comunque ammessi materiali, installati a parete o a pavimento, compresi nel gruppo di materiali GM4, per una superficie ≤ 5% della superficie lorda interna delle vie d’esodo o dei locali dell’attività (es. somma delle superfici lorde di soffitto, pareti, pavimento ed aperture del locale).]

==== Soluzioni conformi per il livello di prestazione II <ch_reazione_al_fuoco_livello_ii>
#c[Si considera soluzione conforme l’impiego di materiali compresi nel gruppo GM3.]

==== Soluzioni conformi per il livello di prestazione III <ch_reazione_al_fuoco_livello_iii>
#c[Si considera soluzione conforme l’impiego di materiali compresi nel gruppo GM2.]

==== Soluzioni conformi per il livello di prestazione IV <ch_reazione_al_fuoco_livello_iv>
#c[Si considera soluzione conforme l’impiego di materiali compresi nel gruppo GM1.]

==== Soluzioni alternative <ch_reazione_al_fuoco_soluzioni_alternative>

#c[Sono ammesse soluzioni alternative per tutti i livelli di prestazione.]

#c[Al fine di dimostrare il raggiungimento del livello di prestazione, il progettista deve impiegare uno dei metodi del @ch_progettazione_metodi.]

#c[In @ta_reazione_soluzioni_alternative sono riportate alcune modalità generalmente accettate per la progettazione di soluzioni alternative. Il progettista può comunque impiegare modalità diverse da quelle elencate.]

#figure(
  table(
    columns: (1fr, 2fr),
    align: (left, left),
    table.header(th[Oggetto della soluzione], th[Modalità progettuale]),
    [Partecipazione dei materiali all’incendio (@ch_reazione_al_fuoco_premessa)],
    [Si dimostri che è comunque garantita la salvaguardia della vita degli occupanti (@ch_fse_vita) e, se applicabile, la protezione dei beni, prevedendo scenari d’incendio di progetto ad hoc negli ambiti ove non siano installati i materiali con i requisiti minimi di reazione al fuoco richiesti.],
  ),
  kind: "table",
  caption: [Modalità progettuali per soluzioni alternative],
) <ta_reazione_soluzioni_alternative> // FIXME macro

=== Classificazione dei materiali in gruppi <ch_reazione_al_fuoco_classificazione>

#c[Le classi di reazione al fuoco indicate nel presente paragrafo sono riferite:

  + alle classi di reazione al fuoco italiane di cui al DM 26/6/1984; le classi italiane indicate con [Ita] sono quelle minime previste per ciascun livello di prestazione;
  + alle classi di reazione al fuoco europee attribuibili ai soli prodotti da costruzione, con riferimento al DM 10/3/2005; le classi europee indicate con [EU], esplicitate in classi principali e classi aggiuntive (s, d, a), sono quelle minime previste per ciascun livello di prestazione. Sono ammesse classi di reazione al fuoco caratterizzate da numeri cardinali inferiori a quelli indicati in tabella o da lettere precedenti nell’alfabeto (es. se è consentita la classe C-s2,d1 sono consentite anche le classi B-s2,d1; C-s1,d1; C-s2,d0~…).
]

#c[Il gruppo di materiali GM0 è costituito da tutti i materiali aventi classe 0 di reazione al fuoco italiana o classe A1 di reazione al fuoco europea. Questi materiali sono anche denominati materiali incombustibili.]

#c[@ta_reazione_arredamento, @ta_reazione_rivestimenti, @ta_reazione_isolamento, @ta_reazione_impianti riportano la classe di reazione al fuoco per i materiali compresi nei gruppi di materiali GM1, GM2, GM3.]

#c[Il gruppo di materiali GM4 è costituito da tutti i materiali non compresi nei gruppi di materiali GM0, GM1, GM2, GM3.]


#figure(
  table(
    columns: (1fr, auto, auto, auto, auto, auto, auto),
    align: (
      left + horizon,
      center + horizon,
      center + horizon,
      center + horizon,
      center + horizon,
      center + horizon,
      center + horizon,
    ),
    table.header(
      th(rowspan: 2)[Descrizione materiali],
      th(colspan: 2)[GM1],
      th(colspan: 2)[GM2],
      th(colspan: 2)[GM3],
      th[Ita],
      th[EU],
      th[Ita],

      th[EU], th[Ita], th[EU],
    ),
    [Mobili imbottiti (poltrone, divani, divani letto, materassi, sommier, guanciali, topper, cuscini, sedie imbottite)],
    [1 IM], table.cell(rowspan: 6)[[na]], [1 IM], table.cell(rowspan: 6)[[na]], [2 IM], table.cell(rowspan: 6)[[na]],
    [Bedding \ (coperte, copriletti, coprimaterassi)],
    table.cell(rowspan: 5)[1], table.cell(rowspan: 5)[1], table.cell(rowspan: 5)[2],
    [Mobili fissati e non agli elementi strutturali \ (sedie e sedili non imbottiti)],
    [Tendoni per tensostrutture, \ strutture pressostatiche e tunnel mobili],
    [Sipari, drappeggi, tendaggi],
    [Materiale scenico, scenari fissi e mobili \ (quinte, velari, tendaggi e simili)],
    table.footer(tf(colspan: 7)[[na] Non applicabile]),
  ),
  kind: "table",
  caption: [Classificazione in gruppi per arredamento, scenografie, tendoni per coperture],
) <ta_reazione_arredamento>

#figure(
  table(
    columns: (1fr, auto, auto, auto),
    align: (left + horizon, center + horizon, center + horizon, center + horizon),
    table.header(
      th(rowspan: 2)[Descrizione materiali], th[GM1], th[GM2], th[GM3],
      th[EU], th[EU], th[EU],
    ),
    [Rivestimenti a soffitto [1]],
    table.cell(rowspan: 3)[A2-s1,d0], table.cell(rowspan: 5)[B-s2,d0], table.cell(rowspan: 5)[C-s2,d0],
    [Controsoffitti, materiali di copertura [2], pannelli di copertura [2], lastre di copertura [2]],
    [Pavimentazioni sopraelevate \ (superficie nascosta)],
    [Rivestimenti a parete [1]], table.cell(rowspan: 2)[B-s1,d0],
    [Partizioni interne, pareti, pareti sospese],
    [Rivestimenti a pavimento [1]],
    table.cell(rowspan: 2)[Bfl-s1],
    table.cell(rowspan: 2)[Cfl-s1],
    table.cell(rowspan: 2)[Cfl-s2],
    [Pavimentazioni sopraelevate \ (superficie calpestabile)],
    table.footer(
      tf(colspan: 4)[
        [1] Qualora trattati con prodotti vernicianti ignifughi omologati ai sensi del DM 6/3/1992, questi ultimi devono essere idonei all’impiego previsto e avere la classificazione indicata di seguito (per classi differenti da A2): GM1 e GM2 in classe 1; GM3 in classe 2; per i prodotti vernicianti marcati CE, questi ultimi devono avere indicata la corrispondente classificazione.

        [2] Si intendono tutti i materiali utilizzati nell’intero pacchetto costituente la copertura, non soltanto i materiali esposti che costituiscono l’ultimo strato esterno.
      ],
    ),
  ),
  kind: "table",
  caption: [Classificazione in gruppi di materiali per rivestimento e completamento],
) <ta_reazione_rivestimenti>


#figure(
  table(
    columns: (1fr, auto, auto, auto),
    align: (left + horizon, center + horizon, center + horizon, center + horizon),
    table.header(
      th(rowspan: 2)[Descrizione materiali], th[GM1], th[GM2], th[GM3],
      th[EU], th[EU], th[EU],
    ),
    [Isolanti protetti [1]], [C-s2,d0], [D-s2,d2], [E],
    [Isolanti lineari protetti [1], [3]], [CL-s2,d0], [DL-s2,d2], [EL],
    [Isolanti in vista [2]], [A2-s1,d0], [B-s2,d0], [B-s3,d0],
    [Isolanti lineari in vista [2], [3]], [A2L-s1,d0], [BL-s3,d0], [BL-s3,d0],
    table.footer(
      tf(colspan: 4)[
        [1] Protetti con materiali non metallici del gruppo GM0 oppure prodotti di classe di resistenza al fuoco K 10 e classe minima di reazione al fuoco B-s1,d0.

        [2] Non protetti come indicato nella nota [1] della presente tabella.

        [3] Classificazione riferita a prodotti di forma lineare destinati all’isolamento termico di condutture di diametro massimo comprensivo dell’isolamento di 300~mm.
      ],
    ),
  ),
  kind: "table",
  caption: [Classificazione in gruppi di materiali per l’isolamento],
) <ta_reazione_isolamento>

#figure(
  table(
    columns: (1fr, auto, auto, auto, auto, auto, auto),
    align: (
      left + horizon,
      center + horizon,
      center + horizon,
      center + horizon,
      center + horizon,
      center + horizon,
      center + horizon,
    ),
    table.header(
      th(rowspan: 2)[Descrizione materiali],
      th(colspan: 2)[GM1],
      th(colspan: 2)[GM2],
      th(colspan: 2)[GM3],
      th[Ita],
      th[EU],
      th[Ita],

      th[EU], th[Ita], th[EU],
    ),
    [Condotte di ventilazione e riscaldamento], [na], [A2-s1,d0], [na], [B-s2,d0], [na], [B-s3,d0],
    [Condotte di ventilazione \ e riscaldamento preisolate [1]], [na], [B-s2,d0], [na], [B-s2,d0], [na], [B-s3,d0],
    [Raccordi e giunti per condotte di \ ventilazione e riscaldamento (L < 1,5~m)],
    [1],
    [B-s1,d0],
    [1],
    [B-s2,d0],
    [2],
    [C-s3,d0],

    [Canalizzazioni per cavi per energia, \ controllo e comunicazioni [2] [4] [5]], [0], [na], [1], [na], [1], [na],
    [Cavi per energia, \ controllo e comunicazioni [2] [3] [6]],
    [na],
    [B2ca-s1a,d0,a1],
    [na],
    [Cca-s1b,d0,a2],
    [na],
    [Cca-s3,d1,a3],

    table.footer(
      tf(colspan: 7)[
        [na] Non applicabile.

        [1] La classe europea B-s2,d0 è ammessa solo se il componente isolante non è esposto direttamente alle fiamme per la presenza di uno strato di materiale incombustibile o di classe A1 che lo ricopre su tutte le facce, ivi inclusi i punti di interruzione longitudinali e trasversali della condotta. Utili riferimenti: EN 15423, EN 13403.

        [2] Prestazione di reazione al fuoco richiesta solo quando le canalizzazioni, i cavi elettrici o i cavi di segnale non sono incassati in materiali incombustibili.

        [3] La classificazione aggiuntiva relativa al gocciolamento d0 può essere declassata a d1 in presenza di IRAI di livello di prestazione III oppure qualora la condizione d’uso finale dei cavi sia tale da impedire fisicamente il gocciolamento (es. posa a pavimento, posa in canalizzazioni non forate, posa su controsoffitti non forati,~…).

        [4] La classe 0 può essere declassata a 1 in presenza di IRAI di livello di prestazione III.

        [5] la classe 1 non è richiesta per le canalizzazioni che soddisfano le prove di comportamento al fuoco previste dalle norme di prodotto armonizzate secondo la direttiva Bassa tensione (Direttiva 2014/35/UE).

        [6] In sostituzione dei cavi Cca-s3,d1,a3 possono essere installati cavi Eca in presenza di IRAI di livello di prestazione III oppure in caso di posa singola. // FIXME verifica pedice cavi
      ],
    ),
  ),
  kind: "table",
  caption: [Classificazione in gruppi di materiali per impianti],
) <ta_reazione_impianti>


=== Esclusione dalla verifica dei requisiti di reazione al fuoco <ch_reazione_al_fuoco_esclusione>

#c[Se non diversamente indicato o determinato in esito a specifica valutazione del rischio, non è richiesta la verifica dei requisiti di reazione al fuoco dei seguenti materiali:

  + materiali stoccati od oggetto di processi produttivi (es. beni in deposito, in vendita, in esposizione~…);
  + elementi strutturali portanti per i quali sia già richiesta la verifica dei requisiti di resistenza al fuoco;
  + materiali protetti con separazioni di classe di resistenza al fuoco almeno K 30 o EI 30.
]

#c[Per eventuali rivestimenti ed altri materiali applicati sugli elementi strutturali di cui al comma 1 lettera b rimane comunque obbligatoria la verifica dei requisiti di reazione al fuoco in funzione dei pertinenti livelli di prestazione di reazione al fuoco.]

=== Indicazioni complementari <ch_reazione_al_fuoco_indicazioni>

#c[La verifica dei requisiti minimi di reazione al fuoco dei materiali da costruzione va effettuata rispettando il DM 10/03/2005, mentre per gli altri materiali va effettuata rispettando il DM 26/06/1984.]

#c[Sulle facciate devono essere utilizzati materiali di rivestimento che limitino il rischio di incendio delle facciate stesse nonché la sua propagazione, a causa di un eventuale fuoco avente origine esterna o origine interna, per effetto di fiamme e fumi caldi che fuoriescono da vani, aperture, cavità e interstizi.]

#c[Si richiama la possibilità di prevedere prestazioni di reazione al fuoco anche per altri materiali (es. porte, lucernari, pannelli fotovoltaici,~…) laddove la valutazione del rischio ne evidenzi la necessità (es. percorsi di esodo con presenza rilevante di porte, percorsi di esodo con presenza significativa di lucernari, coperture combustibili sottostanti a pannelli fotovoltaici,~…).]

=== Riferimenti <ch_reazione_al_fuoco_riferimenti>

#c[Si indicano i seguenti riferimenti:

  + Commissione europea, Direzione generale per le Imprese e l’industria, _“Construction - Harmonised European Standards”_, documentazione da http://ec.europa.eu/enterprise/sectors/construction/declaration-of-performance
  + Decreto del Ministero dell’Interno 10 marzo 2005 _“Classi di reazione al fuoco per i prodotti da costruzione da impiegarsi nelle opere per le quali è prescritto il requisito della sicurezza in caso d’incendio”_;
  + Decreto del Ministero dell’Interno 26 giugno 1984 _“Classificazione di reazione al fuoco ed omologazione dei materiali ai fini della prevenzione incendi”_;
  + sezione _“Prodotti antincendio sicuri”_ della pagina web: http://www.vigilfuoco.it
]
