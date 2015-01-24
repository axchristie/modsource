
# A Simple Prototype to Build a PDF Anthology from MarkDown Source

This repository includes scripts and a basic structure to build custom PDF anthologies from a directory of markdown documents. 

It has two scripts:

- `generate-latex.sh` reads the markdown files contained in the `markdown` directory (and any subdirectories), and uses pandoc and a custom template to generate incomplete latex files, deposited in the `latex-partials` directory. **Warning**: This script recursively searches for markdown in all subdirectories but does not preserve this structure in `latex-partials` which is a single directory. This means that files could potentially overwrite each other if not unique. For instance, `markdown/moby-dick/ishmael.md` and `markdown/bible/ishmael.md` would both be written to `latex-partials/ishmael.tex`. Structure and name accordingly.
- `build-script.sh` accepts one or more text names from the latex-partials directory (*just the name* without extension or directory---eg, from the example above, `ishmael`) and then does some gnarly appending to create a single `.tex` file. It then runs `xelatex` on that file (twice---in order to get the table of contents to work). If all goes according to plan, both the generated `.tex` file and the PDF should be in the `output` directory (along with all the pesky files LaTeX generates along the way).

To use this process, therefore, you need to first put some MarkDown files in the `markdown` folder (see below for details about metadata formatting). Then run `./generate-latex`; you only need to run this script again if you change the markdown files.

Then, to build an anthology, use `build-script.sh`, with which ever files you wanted included (in the order you like). E.g.

    /.build-script.sh 

It depends on:

- pandoc 
- Python 2.7
- LaTeX/XeLaTeX 

And the following additional LaTeX packages:

- babel
- csquotes
- fancyhdr
- fontenc
- fontspec
- geometry
- inputenc
- sectsty
- titling
- tocloft
- verse

As currently written, it also assumes that you have the [Linux Libertine](http://www.linuxlibertine.org/) fonts installed.

As you may have noticed, this is a rather brittle system with a number of moving parts.

## Markdown Source

The process relies on a directory full of pandoc-flavored MarkDown files. Additionally, it relies on some minimum standard metadata included in a YAML metadata block. The accepted fields are:

TK

## Filters and Templates

TK

## What are these files and what do they do?

TK
