
#import "@preview/fontawesome:0.5.0": fa-icon

#let name = "Yooseok Jeong"
#let locale-catalog-page-numbering-style = context { "Yooseok Jeong - Page " + str(here().page()) + " of " + str(counter(page).final().first()) + "" }
#let locale-catalog-last-updated-date-style = "Last updated in Aug 2025"
#let locale-catalog-language = "en"
#let design-page-size = "a4"
#let design-section-titles-font-size = 1.2em
#let design-colors-text = rgb(0, 0, 0)
#let design-colors-section-titles = rgb(0, 0, 0)
#let design-colors-last-updated-date-and-page-numbering = rgb(128, 128, 128)
#let design-colors-name = rgb(0, 0, 0)
#let design-colors-connections = rgb(0, 0, 0)
#let design-colors-links = rgb(0, 0, 0)
#let design-section-titles-font-family = "XCharter"
#let design-section-titles-bold = true
#let design-section-titles-line-thickness = 0.5pt
#let design-section-titles-font-size = 1.2em
#let design-section-titles-type = "with-full-line"
#let design-section-titles-vertical-space-above = 0.55cm
#let design-section-titles-vertical-space-below = 0.3cm
#let design-section-titles-small-caps = false
#let design-links-use-external-link-icon = false
#let design-text-font-size = 10pt
#let design-text-leading = 0.6em
#let design-text-font-family = "XCharter"
#let design-text-alignment = "justified"
#let design-text-date-and-location-column-alignment = right
#let design-header-photo-width = 3.5cm
#let design-header-use-icons-for-connections = false
#let design-header-name-font-family = "XCharter"
#let design-header-name-font-size = 25pt
#let design-header-name-bold = false
#let design-header-connections-font-family = "XCharter"
#let design-header-vertical-space-between-name-and-connections = 0.7cm
#let design-header-vertical-space-between-connections-and-first-section = 0.7cm
#let design-header-use-icons-for-connections = false
#let design-header-horizontal-space-between-connections = 0.5cm
#let design-header-separator-between-connections = "|"
#let design-header-alignment = center
#let design-highlights-summary-left-margin = 0cm
#let design-highlights-bullet = "•"
#let design-highlights-top-margin = 0.25cm
#let design-highlights-left-margin = 0cm
#let design-highlights-vertical-space-between-highlights = 0.19cm
#let design-highlights-horizontal-space-between-bullet-and-highlights = 0.3em
#let design-entries-vertical-space-between-entries = 0.4cm
#let design-entries-date-and-location-width = 4.15cm
#let design-entries-allow-page-break-in-entries = true
#let design-entries-horizontal-space-between-columns = 0.1cm
#let design-entries-left-and-right-margin = 0cm
#let design-page-top-margin = 2cm
#let design-page-bottom-margin = 2cm
#let design-page-left-margin = 2cm
#let design-page-right-margin = 2cm
#let design-page-show-last-updated-date = false
#let design-page-show-page-numbering = false
#let design-links-underline = true
#let design-entry-types-education-entry-degree-column-width = 1cm
#let date = datetime.today()

// Metadata:
#set document(author: name, title: name + "'s CV", date: date)

// Page settings:
#set page(
  margin: (
    top: design-page-top-margin,
    bottom: design-page-bottom-margin,
    left: design-page-left-margin,
    right: design-page-right-margin,
  ),
  paper: design-page-size,
  footer: if design-page-show-page-numbering {
    text(
      fill: design-colors-last-updated-date-and-page-numbering,
      align(center, [_#locale-catalog-page-numbering-style _]),
      size: 0.9em,
    )
  } else {
    none
  },
  footer-descent: 0% - 0.3em + design-page-bottom-margin / 2,
)
// Text settings:
#let justify
#let hyphenate
#if design-text-alignment == "justified" {
  justify = true
  hyphenate = true
} else if design-text-alignment == "left" {
  justify = false
  hyphenate = false
} else if design-text-alignment == "justified-with-no-hyphenation" {
  justify = true
  hyphenate = false
}
#set text(
  font: design-text-font-family,
  size: design-text-font-size,
  lang: locale-catalog-language,
  hyphenate: hyphenate,
  fill: design-colors-text,
  // Disable ligatures for better ATS compatibility:
  ligatures: true,
)
#set par(
  spacing: 0pt,
  leading: design-text-leading,
  justify: justify,
)
#set enum(
  spacing: design-entries-vertical-space-between-entries,
)

// Highlights settings:
#let highlights(..content) = {
  list(
    ..content,
    marker: design-highlights-bullet,
    spacing: design-highlights-vertical-space-between-highlights,
    indent: design-highlights-left-margin,
    body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
  )
}
#show list: set list(
  marker: design-highlights-bullet,
  spacing: 0pt,
  indent: 0pt,
  body-indent: design-highlights-horizontal-space-between-bullet-and-highlights,
)

// Entry utilities:
#let three-col(
  left-column-width: 1fr,
  middle-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (auto, auto, auto),
) = [
  #block(
    grid(
      columns: (left-column-width, middle-column-width, right-column-width),
      column-gutter: design-entries-horizontal-space-between-columns,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #middle-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

#let two-col(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, auto),
  column-gutter: design-entries-horizontal-space-between-columns,
) = [
  #block(
    grid(
      columns: (left-column-width, right-column-width),
      column-gutter: column-gutter,
      align: alignments,
      ([#set par(spacing: design-text-leading); #left-content]),
      ([#set par(spacing: design-text-leading); #right-content]),
    ),
    breakable: true,
    width: 100%,
  )
]

// Main heading settings:
#let header-font-weight
#if design-header-name-bold {
  header-font-weight = 700
} else {
  header-font-weight = 400
}
#show heading.where(level: 1): it => [
  #set par(spacing: 0pt)
  #set align(design-header-alignment)
  #set text(
    font: design-header-name-font-family,
    weight: header-font-weight,
    size: design-header-name-font-size,
    fill: design-colors-name,
  )
  #it.body
  // Vertical space after the name
  #v(design-header-vertical-space-between-name-and-connections)
]

#let section-title-font-weight
#if design-section-titles-bold {
  section-title-font-weight = 700
} else {
  section-title-font-weight = 400
}

#show heading.where(level: 2): it => [
  #set align(left)
  #set text(size: (1em / 1.2)) // reset
  #set text(
    font: design-section-titles-font-family,
    size: (design-section-titles-font-size),
    weight: section-title-font-weight,
    fill: design-colors-section-titles,
  )
  #let section-title = (
    if design-section-titles-small-caps [
      #smallcaps(it.body)
    ] else [
      #it.body
    ]
  )
  // Vertical space above the section title
  #v(design-section-titles-vertical-space-above, weak: true)
  #block(
    breakable: false,
    width: 100%,
    [
      #if design-section-titles-type == "moderncv" [
        #two-col(
          alignments: (right, left),
          left-column-width: design-entries-date-and-location-width,
          right-column-width: 1fr,
          left-content: [
            #align(horizon, box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles))
          ],
          right-content: [
            #section-title
          ]
        )

      ] else [
        #box(
          [
            #section-title
            #if design-section-titles-type == "with-parial-line" [
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ] else if design-section-titles-type == "with-full-line" [

              #v(design-text-font-size * 0.4)
              #box(width: 1fr, height: design-section-titles-line-thickness, fill: design-colors-section-titles)
            ]
          ]
        )
      ]
     ] + v(1em),
  )
  #v(-1em)
  // Vertical space after the section title
  #v(design-section-titles-vertical-space-below - 0.5em)
]

// Links:
#let original-link = link
#let link(url, body) = {
  body = [#if design-links-underline [#underline(body)] else [#body]]
  body = [#if design-links-use-external-link-icon [#body#h(design-text-font-size/4)#box(
        fa-icon("external-link", size: 0.7em),
        baseline: -10%,
      )] else [#body]]
  body = [#set text(fill: design-colors-links);#body]
  original-link(url, body)
}

// Last updated date text:
#if design-page-show-last-updated-date {
  let dx
  if design-section-titles-type == "moderncv" {
    dx = 0cm
  } else {
    dx = -design-entries-left-and-right-margin
  }
  place(
    top + right,
    dy: -design-page-top-margin / 2,
    dx: dx,
    text(
      [_#locale-catalog-last-updated-date-style _],
      fill: design-colors-last-updated-date-and-page-numbering,
      size: 0.9em,
    ),
  )
}

#let connections(connections-list) = context {
  set text(fill: design-colors-connections, font: design-header-connections-font-family)
  set par(leading: design-text-leading*1.7, justify: false)
  let list-of-connections = ()
  let separator = (
    h(design-header-horizontal-space-between-connections / 2, weak: true)
      + design-header-separator-between-connections
      + h(design-header-horizontal-space-between-connections / 2, weak: true)
  )
  let starting-index = 0
  while (starting-index < connections-list.len()) {
    let left-sum-right-margin
    if type(page.margin) == "dictionary" {
      left-sum-right-margin = page.margin.left + page.margin.right
    } else {
      left-sum-right-margin = page.margin * 4
    }

    let ending-index = starting-index + 1
    while (
      measure(connections-list.slice(starting-index, ending-index).join(separator)).width
        < page.width - left-sum-right-margin
    ) {
      ending-index = ending-index + 1
      if ending-index > connections-list.len() {
        break
      }
    }
    if ending-index > connections-list.len() {
      ending-index = connections-list.len()
    }
    list-of-connections.push(connections-list.slice(starting-index, ending-index).join(separator))
    starting-index = ending-index
  }
  align(list-of-connections.join(linebreak()), design-header-alignment)
  v(design-header-vertical-space-between-connections-and-first-section - design-section-titles-vertical-space-above)
}

#let three-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  middle-content: "",
  right-content: "",
  alignments: (left, auto, right),
) = (
  if design-section-titles-type == "moderncv" [
    #three-col(
      left-column-width: right-column-width,
      middle-column-width: left-column-width,
      right-column-width: 1fr,
      left-content: right-content,
      middle-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      right-content: middle-content,
      alignments: (design-text-date-and-location-column-alignment, left, auto),
    )
  ] else [
    #block(
      [
        #three-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          middle-content: middle-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let two-col-entry(
  left-column-width: 1fr,
  right-column-width: design-entries-date-and-location-width,
  left-content: "",
  right-content: "",
  alignments: (auto, design-text-date-and-location-column-alignment),
  column-gutter: design-entries-horizontal-space-between-columns,
) = (
  if design-section-titles-type == "moderncv" [
    #two-col(
      left-column-width: right-column-width,
      right-column-width: left-column-width,
      left-content: right-content,
      right-content: [
        #block(
          [
            #left-content
          ],
          inset: (
            left: design-entries-left-and-right-margin,
            right: design-entries-left-and-right-margin,
          ),
          breakable: design-entries-allow-page-break-in-entries,
          width: 100%,
        )
      ],
      alignments: (design-text-date-and-location-column-alignment, auto),
    )
  ] else [
    #block(
      [
        #two-col(
          left-column-width: left-column-width,
          right-column-width: right-column-width,
          left-content: left-content,
          right-content: right-content,
          alignments: alignments,
        )
      ],
      inset: (
        left: design-entries-left-and-right-margin,
        right: design-entries-left-and-right-margin,
      ),
      breakable: design-entries-allow-page-break-in-entries,
      width: 100%,
    )
  ]
)

#let one-col-entry(content: "") = [
  #let left-space = design-entries-left-and-right-margin
  #if design-section-titles-type == "moderncv" [
    #(left-space = left-space + design-entries-date-and-location-width + design-entries-horizontal-space-between-columns)
  ]
  #block(
    [#set par(spacing: design-text-leading); #content],
    breakable: design-entries-allow-page-break-in-entries,
    inset: (
      left: left-space,
      right: design-entries-left-and-right-margin,
    ),
    width: 100%,
  )
]

= Yooseok Jeong

// Print connections:
#let connections-list = (
  [Seoul, South Korea],
  [#box(original-link("mailto:jeongyoos@gmail.com")[jeongyoos\@gmail.com])],
  [#box(original-link("https://linkedin.com/in/yooseokjeong")[linkedin.com\/in\/yooseokjeong])],
  [#box(original-link("https://github.com/y123ob")[github.com\/y123ob])],
)
#connections(connections-list)



== Summary


#one-col-entry(
  content: [Software Engineer who enjoys creating visible results. Aim to create meaningful user experiences through technology and deliver social value.]
)


== Experience


#two-col-entry(
  left-content: [
    #strong[HR Manager], Hyperithm -- Seoul, South Korea
  ],
  right-content: [
    June 2025 – Aug 2025
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Organized cultural events, built feedback systems, and streamlined communication channels to enhance engagement.],[Formalized culture guidelines and workplace policies to improve operational efficiency.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Lead Engineer \(KEX Cell\)], Hyperithm -- Seoul, South Korea
  ],
  right-content: [
    Sept 2020 – May 2025
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed a high-frequency trading \(#strong[HFT]\) system in #strong[Rust] and created market data and order execution services integrating over 20 #strong[CEX]\/#strong[DEX] venues \(unified schemas, rate limiting, automatic retries\), for real-time trading strategies.],[Built a #strong[Python]-based trading framework that enabled strategy developers to focus solely on business logic; normalized market data schemas and a unified order execution API, implemented robust error handling and logging, and added graceful shutdown, improving reliability and reducing operational overhead.],[Developed a Slack-integrated trading system management service.],[Developed and deployed multiple trading algorithms \(details confidential\).],[Developed a deep learning-based trading system and strategy.],[Maintained and improved the internal accounting system.],[Tech: #strong[Rust], #strong[Python], TypeScript, TensorFlow, PyTorch],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Research Intern], Morpheus3D -- Seoul, South Korea
  ],
  right-content: [
    Mar 2020 – Aug 2020
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Designed and built a light-stage 3D scanning system, covering hardware \(lighting\/camera rig\) and reconstruction algorithms.],[Improved a multi-view diffusion-based 3D generation pipeline by correcting brightness inconsistencies in overlapping regions, yielding more accurate reconstruction.],[Focused on 3D reconstruction for medical simulation workflows; simulation components were out of scope.],[Tech: #strong[Python], C++, OpenCV],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Undergraduate Intern], Seoul National University, Quantum Information and Quantum Computing Research Lab \(Prof. Tae-Hyeon Kim\) -- Seoul, South Korea
  ],
  right-content: [
    Feb 2019 – Aug 2019
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Researched quantum algorithms.],[Researched the Qiskit quantum computing library.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Research Intern], Morpheus3D -- Seoul, South Korea
  ],
  right-content: [
    June 2018 – Aug 2018
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed a face landmark detection model.],[Tech: #strong[Python], TensorFlow, PyTorch],)
  ],
)



== Projects


#two-col-entry(
  left-content: [
    #strong[CultureInfra] 
  ],
  right-content: [
    Mar 2023 – July 2025
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Designed and developed interactive systems for live performances and exhibitions.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Developed an interactive art program for G-DRAGON MEDIA EXHIBITION: Übermensch.],[Developed an RFID interactive lighting system for festivals.],[Developed an interactive art program for IU MEDIA ART EXHIBITION: Moment.],[Tech: #strong[Python], TypeScript, Unity],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[CoDevMap] 
  ],
  right-content: [
    Sept 2024 – Feb 2025
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed a project-based coding education platform.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[KAIST Science Hub] 
  ],
  right-content: [
    Mar 2024 – Sept 2024
  ],
)
#one-col-entry(
  content: [
    #two-col(left-column-width: design-highlights-summary-left-margin, right-column-width: 1fr, left-content: [], right-content: [#v(design-highlights-top-margin);#align(left, [Developed a collaborative science exhibition at Lotte Department Store.])], column-gutter: 0cm)

#v(-design-text-leading)  #v(design-highlights-top-margin);#highlights([Built a robotic arm system that draws human faces.],[Implemented motion control and an image processing pipeline.],[Tech: #strong[Python], C++, OpenCV, Arduino],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[EthSeoul 2023 Hackathon - ChainFeed] 
  ],
  right-content: [
    June 2023 – June 2023
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed a social network based on #strong[DEX] activities using GraphQL.],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Seoul National University, LG Employee-sponsored AI Class TA] 
  ],
  right-content: [
    Jan 2019 – Feb 2019
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Designed assignments and projects; performed TA activities],)
  ],
)

#v(design-entries-vertical-space-between-entries)
#two-col-entry(
  left-content: [
    #strong[Privatenote] 
  ],
  right-content: [
    Jan 2017 – Apr 2017
  ],
)
#one-col-entry(
  content: [
    #v(design-highlights-top-margin);#highlights([Developed math and computer science education content, recorded video lectures],)
  ],
)



== Skills


#one-col-entry(
  content: [#strong[Programming:] #strong[Python], #strong[Rust], TypeScript, C]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[AI\/ML:] TensorFlow, PyTorch]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Web\/Backend:] Node.js, Next.js, FastAPI]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Computer Vision:] OpenCV]
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [#strong[Other:] Competitive Programming]
)


== Education


// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Seoul National University], BS in Computer Science -- Seoul, South Korea
  ],
  right-content: [
    Mar 2017 – Feb 2025
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    #v(design-highlights-top-margin);#highlights([GPA: 3.65\/4.30],)
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)

#v(design-entries-vertical-space-between-entries)
// YES DATE, NO DEGREE
#two-col-entry(
  left-content: [
    #strong[Seoul Science High School], Specialized in Mathematics, Computer Science -- Seoul, South Korea
  ],
  right-content: [
    Mar 2014 – Feb 2017
  ],
)
#block(
  [
    #set par(spacing: 0pt)
    
  ],
  inset: (
    left: design-entries-left-and-right-margin,
    right: design-entries-left-and-right-margin,
  ),
)



== Awards


#one-col-entry(
  content: [- EthSeoul 2023 Hackathon - TheGraph 2nd Prize],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- SCPC \(Samsung Collegiate Programming Cup\) 2021 - 5th Prize],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- SNUPC \(Seoul National University Programming Contest\) 2018 - Division 2 - 1st Prize],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- FKMO \(Korean Mathematical Olympiad Final Round\) 2015 - Honorable Mention],
)
#v(design-entries-vertical-space-between-entries)
#one-col-entry(
  content: [- KMO \(Korean Mathematical Olympiad\) 2014 - Silver Medal],
)


