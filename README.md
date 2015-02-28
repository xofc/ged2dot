# ged2dot
Genealogy : Creates a simple Graphviz .dot file from a GEDCOM file.

This simple PERL script generates a simple .dot file from de .ged file.

Usage is :
   $ ./ged2dot.pl < x.ged > x.dot
or
   $ ./ged2dot.pl < x.ged |dot -Tps -o x.ps

'Individual' nodes, I*, are labelled after the NAME records
'Family' nodes, F*, are implicitly created by FAMC & FAMS records
FAMC records create F->I relations
FAMS records create I->F relations

'@' are removed because dot(1) doesn't like them.

This is just a quick&dirty hack...

See also:
 - https://en.wikipedia.org/wiki/GEDCOM (file format)
 - https://en.wikipedia.org/wiki/GeneWeb (genealogy software)
 - https://en.wikipedia.org/wiki/Graphviz (graphing software)
 - https://en.wikipedia.org/wiki/DOT_%28graph_description_language%29


