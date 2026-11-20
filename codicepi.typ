//
// Documento principale del Codice di prevenzione incendi
//

#import "codicepi-template.typ": codicepi-template, comma, c

#show: codicepi-template.with(
  titolo: "Regola Tecnica Orizzontale",
  sottotitolo: "Struttura di esempio per documento normativo",
)

// La sezione generalità è G
#counter(heading).update(6)

= Generalità

#include "capitoli/G01/G01 ch definizioni.typ"
//#include "capitoli/G02/G02 ch progettazione.typ"
//#include "capitoli/G03/G03 ch profili di rischio.typ"

// La sezione strategia è S
#counter(heading).update(18)

= Strategia antincendio

//#include "capitoli/S01/S01 ch reazione al fuoco.typ"

//#include "capitoli/s/s2.typ"
//#include "capitoli/s/s3.typ"
//#include "capitoli/s/s4.typ"
//#include "capitoli/s/s5.typ"
//#include "capitoli/s/s6.typ"
//#include "capitoli/s/s7.typ"
//#include "capitoli/s/s8.typ"
//#include "capitoli/s/s9.typ"
//#include "capitoli/s/s10.typ"

// La sezione RTV è V
#counter(heading).update(21)

= Regole tecniche verticali

//#include "capitoli/v/v1.typ"

// La sezione metodi è M
#counter(heading).update(12)

= Metodi

//#include "capitoli/m/m1.typ"

