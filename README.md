# Exploitation Techniques and Mitigations

## Authors

- Alex Hirsch
- Patrick Ober

## Acknowledgement

We used a lot from [RPISEC], a university course about modern exploitation at
Rensselaer Polytechnic Institute. Check out [RPISEC's Github].

[RPISEC]: http://rpis.ec/
[RPISEC's Github]: https://github.com/RPISEC/MBE

## Content

    .
    ├── docs/
    │   ├── gfx/
    │   ├── sty/
    │   ├── Makefile
    │   ├── paper.pdf
    │   ├── paper.tex
    │   ├── references.bib
    │   ├── slides_handout.pdf
    │   ├── slides.pdf
    │   ├── slides.tex
    │   └── uibk.cls
    ├── src/
    │   ├── buffer_overflow/
    │   │   ├── overflow.c
    │   │   ├── overflow_objdump.txt
    │   │   └── run*
    │   ├── canary/
    │   │   ├── run*
    │   │   ├── vuln.c
    │   │   ├── vuln_gdb1.txt
    │   │   └── vuln_gdb2.txt
    │   ├── format_string/
    │   │   ├── format.c
    │   │   └── run*
    │   ├── hijack/
    │   │   ├── hijack.c
    │   │   └── run*
    │   ├── return_oriented_programming/
    │   │   ├── gadgets.txt
    │   │   └── rop.c
    │   └── shell_code/
    │       ├── run*
    │       ├── run_dep*
    │       ├── run_dep.txt
    │       ├── run.txt
    │       ├── shellcode.asm
    │       ├── shellcode_objdump.txt
    │       ├── vuln.c
    │       ├── vuln_gdb.txt
    │       └── vuln_readelf.txt
    └── README.md
