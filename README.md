# Member Listing

![Compile Documents](https://github.com/TC-Fairplay/member-listing/actions/workflows/compile-docs.yml/badge.svg)

[Typst](https://typst.app/) files to generate club member listings (as PDFs) for the protected area of the club website.

## Files

- [members-list.typ](members-list.typ): main library, imported by all others typst files (`.typ`).
- [junioren-a.typ](junioren-a.typ): listing of juniors "A" (expects a file `junioren_a.csv` in `data`)
- [junioren-a.typ](junioren-a.typ): listing of juniors "B"(expects a file `junioren_b.csv` in `data`)
- [aktive.typ](aktive.typ): listing of active members (expects a file `aktive.csv` in `data`)
- [generate.sh](generate.sh): shell script that generates all PDFs in directory `output`
