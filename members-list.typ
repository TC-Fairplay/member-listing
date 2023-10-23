#let members-list(csv-file, juniors-letter, doc) = {
  let member-type = if juniors-letter == "" { "Aktive" } else { "JuniorInnen " + juniors-letter }
  let get-header() = {
    locate(loc => if loc.page() > 1 { [TC Fairplay #h(1fr) Mitgliederliste #member-type] })
  };

  set page(
    paper: "a4",
    margin: (x: 1.5cm, y: 2cm),
    header: get-header(),
    footer: [Stand: 23. Mai 2023 #h(1fr) #counter(page).display()],
  )
  
  set text(font: "Liberation Sans")
  
  grid(
    columns: (1fr, auto),
    [
        #text(size: 14pt, [TC Fairplay])\
        #text(size: 12pt, [Mitgliederliste #member-type])
    ],
    image("fairplay_logo.svg", height: 1cm)
)

  block(
    width: 100%,
    fill: luma(90%),
    inset: 8pt)[
  *Bitte unbedingt beachten:*

  #show "TC Fairplay": it => [#emph([#it])]
  #if juniors-letter != "" {[
  Bei den JuniorInnen #juniors-letter (jünger als 18 Jahre) wird nur der Name und der Vorname publiziert.
  Die Kontaktdaten müssen über die JuniorInnen und/oder über die Eltern eingeholt werden.
  ]}
  
  Die nachstehend publizierte Mitgliederliste des TC Fairplay ist ausschliesslich zur Nutzung durch die Clubmitglieder bestimmt. Es ist den Clubmitgliedern untersagt, die Mitgliederliste oder Teile davon an Drittpersonen weiterzugeben.
  
  Die Mitgliederliste darf nur für persönliche Kontakte im Zusammenhang mit dem
  TC Fairplay verwendet werden. Die Nutzung der Mitgliederliste zur Verbreitung von persönlichen Interessen im Sinne von politischen Äusserungen, Spendenaufrufen, Meinungsbildungen, Umfragen etc. ist verboten.
  ]

  let results = csv("data/" + csv-file)
  results.insert(0, [*Name, Vorname*])
  if juniors-letter == "" {
    results.insert(1, ([*Mobile*]))
  }

  columns(2,
    table(
      columns: if juniors-letter == "" { (1fr, auto) } else { (100%) },
      stroke: luma(75%),
      fill: (_, row) => if calc.even(row) { luma(95%) } else { white },
      align: (col, _) => if (col == 1) { right } else { left },
      // right-align column "Mobile"
      ..results.flatten(),
    )
  )
}

