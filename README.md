# Exploitation Techniques and Mitigations

> When a buffer overwrites a pointer...  The story of a restless mind.

Exploiting binaries is an extremely broad topic with many specialized
techniques for even the most exotic scenarios. In this write-up we will take a
narrow look at exploiting `printf` with crafted format strings first and follow
up with an introduction about buffer overflows. Mitigation mechanisms will be
disabled at first and enabled one by one --- discussing them when they are put
into place. The buffer overflow will be augmented to inject and execute shell
code which is then prevented by the Data Execution Prevention (DEP) mechanism.

Return Oriented Programming (ROP) is introduced together with ret2libc to
circumvent DEP. Address Space Layout Randomization (ASLR) is presented next as
counter to ROP but gets quickly broken with an information leak. StackGuard is
a more sophisticated mechanism against ROP but not a silver bullet and can be
easily brute forced in certain scenarios. Control-Flow Integrity (CFI) together
with a word about Stack Integrity is provided as an outlook for the reader.

Although x86 has been chosen as target platform a quick glance at other
architectures (x86_64 and ARM) is taken prior concluding this write-up. Some
basics about the target platform will be communicated before running the first
exploit.

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
    │   ├── paper.pdf
    │   ├── slides_handout.pdf
    │   ├── slides.pdf
    ├── src/
    │   ├── buffer_overflow/
    │   ├── canary/
    │   ├── format_string/
    │   ├── hijack/
    │   ├── return_oriented_programming/
    │   └── shell_code/
    └── README.md
