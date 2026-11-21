//
// Documento principale del Codice di prevenzione incendi
//

#import "codicepi-template.typ": c, codicepi-template, comma

#show: codicepi-template.with(
  titolo: "Regola Tecnica Orizzontale",
  sottotitolo: "Struttura di esempio per documento normativo",
)

// La sezione generalità è G
#counter(heading).update(6)
= Generalità <sez_generalità>

#include "capitoli/G01/G01 ch definizioni.typ"
#include "capitoli/G02/G02 ch progettazione.typ"
#include "capitoli/G03/G03 ch profili di rischio.typ"

// La sezione strategia è S
#counter(heading).update(18)

= Strategia antincendio <sez_strategia>

#include "capitoli/S01/S01 ch reazione al fuoco.typ"
#include "capitoli/S02/S02 ch resistenza al fuoco.typ"
#include "capitoli/S03/S03 ch compartimentazione.typ"
#include "capitoli/S04/S04 ch esodo.typ"
#include "capitoli/S05/S05 ch gestione sicurezza.typ"
#include "capitoli/S06/S06 ch controllo incendio.typ"
#include "capitoli/S07/S07 ch IRAI.typ"
#include "capitoli/S08/S08 ch SEFC.typ"
#include "capitoli/S09/S09 ch operatività.typ"
#include "capitoli/S10/S10 ch sicurezza impianti.typ"

// La sezione RTV è V
#counter(heading).update(21)

= Regole tecniche verticali <sez_rtv>

#include "capitoli/V01/V01 ch aree a rischio specifico.typ"
#include "capitoli/V02/V02 ch aree atmosfere esplosive.typ"
#include "capitoli/V03/V02 ch ascensori.typ"

// La sezione metodi è M
#counter(heading).update(12)

= Metodi <sez_metodi>

#include "capitoli/M01/M01 ch fse.typ"
#include "capitoli/M02/M02 ch fse scenari.typ"
#include "capitoli/M03/M03 ch fse vita.typ"
