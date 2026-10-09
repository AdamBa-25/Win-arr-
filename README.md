# Win-arr-

Programme de compression de fichiers écrit en C.

## Compilation

    make          # compile l'exécutable ./winarr
    make test     # lance les tests
    make clean    # supprime build/ et l'exécutable

## Structure du projet

    include/    les headers (.h) : ce que chaque module propose
    src/        le code (.c)
    tests/      les tests (test_*.c)
    samples/    fichiers d'essai (texte, images...)

`include/` et `src/` ont les mêmes sous-dossiers :

- **common/** : les outils partagés par tous les algorithmes
  (lecture/écriture de fichiers, lecture/écriture de bits, ...)
- **lossless/** : compression **sans perte**. Le fichier décompressé est
  identique à l'original (RLE, Huffman, LZ77, LZW...)
- **lossy/** : compression **avec perte**. On perd un peu d'information pour
  gagner beaucoup de place. Il devra aussi contenir le module
  `Matrice` utilisé par ces algorithmes.

## Algorithmes

Sans perte :

- [ ] RLE
- [ ] Huffman
- [ ] LZ77 / LZSS
- [ ] LZW
- [ ] Deflate
- [ ] BWT + MTF
- [ ] Delta / codage arithmétique

Avec perte (matrices) :

- [ ] Haar
- [ ] DCT
- [ ] SVD
