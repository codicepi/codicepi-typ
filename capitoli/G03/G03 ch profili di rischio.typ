#import "../../codicepi-template.typ": Rambiente, Rbeni, Rvita, nota, qf, tf, th

#let delta-occ = $"δ"_"occ"$
#let delta-alpha = $"δ"_"α"$
#let t-alpha = $"t"_"α"$
#let h = $"h"$
#let metri-quadrati = $"m"^2$


== Determinazione dei profili di rischio delle attività <ch_profili_di_rischio>

=== Definizione dei profili di rischio <ch_profili_di_rischio_definizione>

+ Al fine di descrivere sinteticamente la tipologia di rischio di incendio dell’attività si definiscono le seguenti tipologie di _profilo di rischio_:

  #Rvita: profilo di rischio relativo alla salvaguardia della _vita umana_; \
  #Rbeni: profilo di rischio relativo alla salvaguardia dei _beni economici_; \
  #Rambiente: profilo di rischio relativo alla tutela dell’_ambiente_.


+ Il profilo di rischio #Rvita è attribuito per ciascun _compartimento_ e, ove necessario, per ciascuno _spazio a cielo libero_ dell’attività, come indicato nel @ch_profili_di_rischio_vita.

  #nota[Ad esempio, l’attribuzione del profilo di rischio #Rvita negli _spazi a cielo libero_ è necessaria per la progettazione dell’esodo delle _attività all’aperto_.]

+ Il profilo di rischio #Rbeni è attribuito all’_intera attività_ o ad _ambiti_ di essa, come indicato nel @ch_profili_di_rischio_beni.

+ Il profilo di rischio #Rambiente è attribuito all’_intera attività_ o ad _ambiti_ di essa, come indicato nel @ch_profili_di_rischio_ambiente.

=== Profilo di rischio #Rvita <ch_profili_di_rischio_vita>

==== Determinazione <ch_profili_di_rischio_vita_determinazione>

+ Il profilo di rischio #Rvita è attribuito in relazione ai seguenti fattori:

  #delta-occ: caratteristiche _prevalenti_ degli occupanti;


  #nota[Per “_prevalenti_” si intendono le caratteristiche degli occupanti che per numerosità e tipologia sono più rappresentativi dell’attività svolta nell’ambito considerato in qualsiasi condizione d’esercizio. Ad esempio, un ufficio in cui vi sia modesta presenza solo occasionale e di breve durata di pubblico può essere classificato #delta-occ = A.]

  #delta-alpha: velocità caratteristica prevalente di crescita dell’incendio, riferita al tempo #t-alpha in secondi, impiegato dalla potenza termica per raggiungere il valore di 1000~kW.

  #nota[Per “_prevalente_” si intende la caratteristica rappresentativa del rischio di incendio in qualsiasi condizione d’esercizio. Ad esempio, la presenza nelle attività civili di limitate quantità di prodotti infiammabili per la pulizia adeguatamente stoccati non è considerata significativa e dunque neanche prevalente.]

  @ta_profili_occupanti e @ta_velocita_crescita guidano il progettista nella selezione dei fattori #delta-occ e #delta-alpha.

+ Il progettista può selezionare il valore di #t-alpha anche ricorrendo ad una delle seguenti opzioni:


  + dati pubblicati da fonti autorevoli e condivise,
  + determinazione diretta della curva RHR (_rate of heat release_) relativa ai combustibili effettivamente presenti e nella configurazione in cui si trovano, secondo le indicazioni del @ch_fse_scenari o tramite misure presso _laboratorio di prova_, secondo protocolli sperimentali consolidati.


    #nota[Le definizioni di _RHR_ e di _laboratorio di prova_ sono riportate nel @ch_definizioni. Ad esempio, utili riferimenti per la determinazione sperimentale della curva RHR sono le norme della serie ISO 9705, la norma ISO 24473, la norma ISO 16405,~…]

+ Il valore di #delta-alpha, valutato in assenza di sistemi di controllo dell’incendio, può essere ridotto di un livello se l’attività è servita da misure di controllo dell’incendio di livello di prestazione V (@ch_controllo_incendio).

+ Il valore di #Rvita è determinato come combinazione di #delta-occ e #delta-alpha, come da @ta_determinazione_rvita.

==== Profili di rischio #Rvita per alcune tipologie di destinazione d’uso <ch_profili_di_rischio_vita_destinazioni_uso>

+ In @ta_rvita_destinazioni_uso si riporta un’indicazione, non esaustiva, sul profilo di rischio #Rvita per le tipologie di destinazione d’uso (_occupancy_) più comuni. Qualora il progettista scelga valori diversi da quelli proposti, è tenuto a indicare le motivazioni della scelta nei documenti progettuali.

+ Ove non previsto nel presente documento, per i compartimenti aventi #Rvita compreso in Ci1, Ci2, Ci3, possono assumersi a riferimento i livelli di prestazione e le soluzioni progettuali rispettivamente per Cii1, Cii2, Cii3, tenendo conto della maggiore familiarità degli occupanti con l’attività e dello specifico rischio di incendio.

  #figure(
    table(
      columns: (auto, auto, 1fr),
      align: (center + horizon, left + horizon, left + horizon),
      table.header(th(colspan: 2)[Caratteristiche prevalenti \ degli occupanti #delta-occ], th[Esempi]),
      [A],
      [Gli occupanti sono in stato di veglia ed \ hanno familiarità con l’edificio],
      [Ufficio non aperto al pubblico, scuola, autorimessa privata, centro sportivo privato, attività produttive in genere, depositi, capannoni industriali],

      [B],
      [Gli occupanti sono in stato di veglia e \ non hanno familiarità con l’edificio],
      [Attività commerciale, autorimessa pubblica, attività espositiva e di pubblico spettacolo, centro congressi, ufficio aperto al pubblico, ristorante, studio medico, ambulatorio medico, centro sportivo pubblico],

      [C], [Gli occupanti possono essere addormentati: [1]], [],
      [Ci], [● in attività individuale di lunga durata], [Civile abitazione],
      [Cii],
      [● in attività gestita di lunga durata],
      [Dormitorio, residence, studentato, residenza per persone autosufficienti],

      [Ciii], [● in attività gestita di breve durata], [Albergo, rifugio alpino],
      [D],
      [Gli occupanti ricevono cure mediche],
      [Degenza ospedaliera, terapia intensiva, sala operatoria, residenza per persone non autosufficienti e con assistenza sanitaria],

      [E], [Occupanti in transito], [Stazione ferroviaria, aeroporto, stazione metropolitana],
      table.footer(
        tf(colspan: 3)[[1] Quando nel presente documento si usa C la relativa indicazione è valida per Ci, Cii, Ciii]
      ),
    ),
    caption: [Caratteristiche prevalenti degli occupanti],
  ) <ta_profili_occupanti>

  #figure(
    table(
      columns: (auto, auto, 1fr),
      align: (center + horizon, center + horizon, left + horizon),
      table.header(th[#delta-alpha], th[#t-alpha [1]], th[Criteri]),
      [1],
      [600~s \ lenta],
      [Ambiti di attività con carico di incendio specifico #qf ≤ 200~MJ/#metri-quadrati, oppure ove siano presenti prevalentemente materiali o altri combustibili che contribuiscono in modo trascurabile all’incendio.],

      [2],
      [300~s \ media],
      [Ambiti di attività ove siano presenti prevalentemente materiali o altri combustibili che contribuiscono in modo moderato all’incendio.],

      [3],
      [150~s \ rapida],
      [
        Ambiti con presenza di significative quantità di materiali plastici impilati, prodotti tessili sintetici, apparecchiature elettriche e elettroniche, materiali combustibili non classificati per reazione al fuoco (@ch_reazione_al_fuoco).

        Ambiti ove avvenga impilamento verticale di significative quantità di materiali combustibili con 3,0~m < #h ≤ 5,0~m [2].

        Stoccaggi classificati HHS3 oppure attività classificate HHP1, secondo la norma UNI EN 12845.

        Ambiti con impianti tecnologici o di processo che impiegano significative quantità di materiali combustibili.

        Ambiti con contemporanea presenza di materiali combustibili e lavorazioni pericolose ai fini dell’incendio.
      ],

      [4],
      [75~s \ ultra-rapida],
      [
        Ambiti ove avvenga impilamento verticale di significative quantità di materiali combustibili con #h > 5,0~m [2].

        Stoccaggi classificati HHS4 oppure attività classificate HHP2, HHP3 o HHP4, secondo la norma UNI EN 12845.

        Ambiti ove siano presenti o in lavorazione significative quantità di sostanze o miscele pericolose ai fini dell’incendio, oppure materiali plastici cellulari/espansi o schiume combustibili non classificati per la reazione al fuoco.
      ],

      table.footer(
        tf(colspan: 3)[
          A meno di valutazioni più approfondite da parte del progettista (es. dati di letteratura, misure dirette,~…), si ritengono non significative ai fini della presente classificazione almeno le quantità di materiali nei compartimenti con carico di incendio specifico #qf ≤ 200~MJ/#metri-quadrati. // FIXME

          [1] Velocità caratteristica prevalente di crescita dell’incendio.

          [2] Con #h altezza d’impilamento.
        ],
      ),
    ),
    caption: [Velocità caratteristica prevalente di crescita dell’incendio],
  ) <ta_velocita_crescita>

  #figure(
    table(
      columns: (auto, 1fr, auto, auto, auto, auto),
      align: (center + horizon, left + horizon, center + horizon, center + horizon, center + horizon, center + horizon),
      table.header(
        th(colspan: 2, rowspan: 2)[Caratteristiche prevalenti \ degli occupanti #delta-occ],
        th(colspan: 4)[Velocità caratteristica prevalente dell’incendio #delta-alpha],
        th[1 \ lenta],
        th[2 \ media],
        th[3 \ rapida],
        th[4 \ ultra-rapida],
      ),
      [A], [Gli occupanti sono in stato di veglia ed \ hanno familiarità con l’edificio], [A1], [A2], [A3], [A4],
      [B],
      [Gli occupanti sono in stato di veglia e \ non hanno familiarità con l’edificio],
      [B1],
      [B2],
      [B3],
      [Non ammesso \ [1]],

      [C], [Gli occupanti possono essere addormentati: [2]], [C1], [C2], [C3], [Non ammesso \ [1]],
      [Ci], [● in attività individuale di lunga durata], [Ci1], [Ci2], [Ci3], [Non ammesso \ [1]],
      [Cii], [● in attività gestita di lunga durata], [Cii1], [Cii2], [Cii3], [Non ammesso \ [1]],
      [Ciii], [● in attività gestita di breve durata], [Ciii1], [Ciii2], [Ciii3], [Non ammesso \ [1]],
      [D], [Gli occupanti ricevono cure mediche], [D1], [D2], [Non ammesso \ [1]], [Non ammesso],
      [E], [Occupanti in transito], [E1], [E2], [E3], [Non ammesso \ [1]],
      table.footer(
        tf(colspan: 6)[
          [1] Per raggiungere un valore ammesso, #delta-alpha può essere ridotto di un livello come specificato nel comma 3 del @ch_profili_di_rischio_vita_determinazione.

          [2] Quando nel presente documento si usa il valore C1 la relativa indicazione è valida per Ci1, Cii1 e Ciii1. Se si usa C2 l’indicazione è valida per Ci2, Cii2 e Ciii2. Se si usa C3 l’indicazione è valida per Ci3, Cii3 e Ciii3.
        ],
        // FIXME
      ),
    ),
    caption: [Determinazione di #Rvita],
  ) <ta_determinazione_rvita>

  #figure(
    table(
      columns: (1fr, auto),
      align: (left + horizon, center + horizon),
      table.header(th[Tipologie di destinazione d’uso], th[#Rvita]),
      [Palestra scolastica], [A1],
      [Autorimessa privata], [A2],
      [Ufficio non aperto al pubblico, sala mensa, aula scolastica, sala riunioni aziendale, archivio, deposito librario, centro sportivo privato],
      [A2-A3],

      [Attività commerciale non aperta al pubblico (es. all’ingrosso,~…)], [A2-A4],
      [Laboratorio scolastico, sala server], [A3],
      [Attività produttive, attività artigianali, impianti di processo, laboratorio di ricerca, magazzino, officina meccanica],
      [A1-A4],

      [Depositi sostanze o miscele pericolose], [A4],
      [Galleria d’arte, sala d’attesa, ristorante, studio medico, ambulatorio medico], [B1-B2],
      [Autorimessa pubblica], [B2],
      [Ufficio aperto al pubblico, centro sportivo pubblico, sala conferenze aperta al pubblico, discoteca, museo, teatro, cinema, locale di trattenimento, area lettura di biblioteca, attività espositiva, autosalone],
      [B2-B3],

      [Attività commerciale aperta al pubblico (es. al dettaglio,~…)], [B2-B4 [1]],
      [Civile abitazione], [Ci2-Ci3],
      [Dormitorio, residence, studentato, residenza per persone autosufficienti], [Cii2-Cii3],
      [Camera d’albergo], [Ciii2-Ciii3],
      [Degenza ospedaliera, terapia intensiva, sala operatoria, residenza per persone non autosufficienti e con assistenza sanitaria],
      [D2],

      [Stazione ferroviaria, aeroporto, stazione metropolitana], [E2],
      table.footer(
        tf(colspan: 2)[
          [1] Per raggiungere un valore ammesso fra quelli indicati alla @ta_determinazione_rvita, #delta-alpha può essere ridotto di un livello come specificato nel comma 3 del @ch_profili_di_rischio_vita_determinazione.
        ],
      ),
    ),
    caption: [Profilo di rischio #Rvita per alcune tipologie di destinazione d’uso],
  ) <ta_rvita_destinazioni_uso>

=== Profilo di rischio #Rbeni <ch_profili_di_rischio_beni>

+ L’attribuzione del profilo di rischio #Rbeni è effettuata in funzione del carattere strategico dell’intera attività o degli ambiti che costituiscono l’attività, e dell’eventuale valore storico, culturale, architettonico o artistico delle stesse e dei beni in esse contenuti.

+ Ai fini dell’applicazione del presente documento:


  + una attività o un ambito si considerano vincolati per arte o storia se essi stessi o i beni in essi contenuti sono tali a norma di legge;
  + una attività o un ambito risultano strategici se sono tali a norma di legge o in considerazione di pianificazioni di soccorso pubblico e difesa civile o su indicazione del responsabile dell’attività.


    #nota[Su richiesta del responsabile dell’attività, in aggiunta agli obblighi normativi, il progettista può incrementare il valore del profilo di rischio #Rbeni al fine di garantire obiettivi di sicurezza antincendio come la _continuità d’esercizio_ a seguito d’incendio.]

+ La @ta_determinazione_rbeni guida il progettista nella determinazione del profilo di rischio #Rbeni.

  #figure(
    table(
      columns: (5.5cm, 2cm, 4.25cm, 4.25cm),
      align: (center + horizon, center + horizon, center + horizon, center + horizon),
      table.header(
        table.cell(colspan: 2, fill: rgb("#dddddd"))[],
        th(colspan: 2)[Attività o ambito vincolato],
        table.cell(colspan: 2, fill: rgb("#dddddd"))[],
        th[No],
        th[Sì],
      ),
      th(rowspan: 2)[Attività o ambito \ strategico], [No], [$"R"_"beni" = 1$], [$"R"_"beni" = 2$],
      [Sì], [$"R"_"beni" = 3$], [$"R"_"beni" = 4$],
    ), // FIXME No/Sì in grigio
    caption: [Determinazione di #Rbeni],
  ) <ta_determinazione_rbeni>

=== Profilo di rischio #Rambiente <ch_profili_di_rischio_ambiente>

+ Il progettista valuta il profilo di rischio #Rambiente in caso di incendio, distinguendo gli ambiti dell’attività nei quali tale profilo di rischio è _significativo_, da quelli ove è _non significativo_.

+ La valutazione del profilo di rischio #Rambiente deve tenere conto dell’ubicazione dell’attività, ivi compresa la presenza di ricettori sensibili nelle aree esterne, della tipologia e dei quantitativi di materiali combustibili presenti e dei prodotti della combustione da questi sviluppati in caso di incendio, delle misure di prevenzione e protezione antincendio adottate.

  #nota[La presenza di materiali stoccati in attività ricadenti nel campo di applicazione del decreto legislativo 3 aprile 2006, n. 152 “_Norme in materia ambientale_” può dare luogo ad #Rambiente significativo.]

  #nota[Nel @ch_aree_a_rischio_specifico sono indicate possibili misure di mitigazione del rischio di danno ambientale derivante da incendio.]

  #nota[Negli stabilimenti per i quali si applica il decreto legislativo 26 giugno 2015, n. 105 “_Attuazione della direttiva 2012/18/UE relativa al controllo del pericolo di incidenti rilevanti connessi con sostanze pericolose_”, il rischio ambientale è mitigato dalle misure adottate nell’ambito dei procedimenti autorizzativi previsti dal suddetto decreto.]

+ Se non diversamente indicato nel presente documento o determinato in esito a specifica valutazione del rischio, il profilo di rischio #Rambiente è ritenuto _non significativo_:


  + negli ambiti protetti da impianti o sistemi automatici di completa estinzione dell’incendio (@ch_controllo_incendio) a _disponibilità superiore_;
  + nelle attività civili (es. strutture sanitarie, scolastiche, alberghiere,~…).


+ Le operazioni di soccorso condotte dal Corpo nazionale dei Vigili del fuoco sono escluse dalla valutazione di cui al comma 1.

=== Riferimenti <ch_profili_di_rischio_riferimenti>

+ Si indicano i seguenti riferimenti:


  + ISO/TR 16738,
  + BS 9999 _“Section 2 - Risk profiles and assessing risk”_.
