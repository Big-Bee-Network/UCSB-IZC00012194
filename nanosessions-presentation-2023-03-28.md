%title: How Big is That Bee?
%author: https://jhpoelen.nl
%date: 2023-02-28


-> How Big is That Bee? <-

-> Jorrit Poelen @ Nano Session 2023-03-28 <-

---------------------------------------------------
-> # Open Questions <-

-> How to refer to *original* sources of trait data ? <-

-> How to let biologists speak data in their native language: csv? <-

-> How to translate native data speak into nanopubs? <-


---------------------------------------------------

-> How Big is What Bee? <-

---------------------------------------------------

-> How Big is UCSB-IZC00012194? <-


---------------------------------------------------
-> The world is full of CSV <-

-> The big picture: <-

-> Even well into the 21st century, our world is full of text-formatted data like CSV. <-

-> We need tooling to thrive in this world, nimbly manipulating data which is in CSVs. <-

-> And we need tooling to move beyond CSV, <-

-> to be able to pull data out and into other storage and processing systems. <-

-> -- [Miller](https://miller.readthedocs.io/ accessed at 2023-03-28) <-

---------------------------------------------------

-> The world of *biological trait measurement* is full of CSV <-


-> Like Measurements of [Intertegular Span](Cane, J. H. 1987. Estimation of bee size using intertegular span Apoidea. J. Kansas Entomol. Soc. 60:145-147.) <-

-> like those published by [Seltmann et al.](https://github.com/Big-Bee-Network/trait-intertegular-distance) <-

-> including [UCSB-Microscope.csv](https://raw.githubusercontent.com/Big-Bee-Network/trait-intertegular-distance/main/UCSB-Microscope.csv) <-

---------------------------------------------------

-> What (*not* where) biological trait measurements *exactly* ? <-

-> Like Measurements of [Intertegular Span](Cane, J. H. 1987. Estimation of bee size using intertegular span Apoidea. J. Kansas Entomol. Soc. 60:145-147.) <-

-> like those published by [Seltmann et al.](https://github.com/Big-Bee-Network/trait-intertegular-distance) <-

-> including [UCSB-Microscope.csv](https://raw.githubusercontent.com/Big-Bee-Network/trait-intertegular-distance/main/UCSB-Microscope.csv) <-

-> as identified by [hash://sha256/436ac4ec8a78c1cb86e9616b31b0c63bd76075e0551584a30f3ba73628c00723](https://linker.bio/hash://sha256/436ac4ec8a78c1cb86e9616b31b0c63bd76075e0551584a30f3ba73628c00723) . <-

---------------------------------------------------

[body size of UCSB-IZC00012194](line:hash://sha256/436ac4ec8a78c1cb86e9616b31b0c63bd76075e0551584a30f3ba73628c00723!/L1,L7)

```
subject_id_NfN,catalogNumber,measurementType,measurementValue,measurementUnit,... 
,UCSB-IZC00012194,body size;intertegular distance;ITD,65,mm,...
```

---------------------------------------------------

-> [give it a name: UCSB:IZC:UCSB-IZC00012194-itd.csv](preston alias UCSB:IZC:UCSB-IZC00012194-itd.csv 'line:hash://sha256/436ac4ec8a78c1cb86e9616b31b0c63bd76075e0551584a30f3ba73628c00723!/L1,L7') <-



---------------------------------------------------

-> [body size of UCSB-IZC00012194](preston cat UCSB:IZC:UCSB-IZC00012194-itd.csv) <-

```
subject_id_NfN,catalogNumber,measurementType,measurementValue,measurementUnit,... 
,UCSB-IZC00012194,body size;intertegular distance;ITD,65,mm,...
```
---------------------------------------------------

-> [body size of UCSB-IZC00012194](preston cat UCSB:IZC:UCSB-IZC00012194-itd.csv | mlr --icsv --oxtab cat) <-

```
catalogNumber             UCSB-IZC00012194
measurementType           body size;intertegular distance;ITD
measurementValue          65
measurementUnit           mm
measurementDeterminedBy   Katja Seltmann
measurementDeterminedDate 2023-02-10
measurementMethod         Measured under microscope
measurementRemarks        
```

----------------------------------------------------

-> [body size of UCSB-IZC00012194](preston cat UCSB:IZC:UCSB-IZC00012194-itd.csv | np) <-

```
@prefix this: <http://purl.org/np/RApQV06A9-9U2JHCbGNQRI-3rAMvudrwz7W8pTvFlbUGE> . 
@prefix sub: <http://purl.org/np/RApQV06A9-9U2JHCbGNQRI-3rAMvudrwz7W8pTvFlbUGE#> . 
@prefix np: <http://www.nanopub.org/nschema#> . 
[...]
sub:Head {   
  this: np:hasAssertion sub:Assertion;     
  np:hasProvenance sub:Provenance;     
  np:hasPublicationInfo sub:Pubinfo;     
  a np:Nanopublication . 
}  
sub:Assertion {
[...]
}
```

--------------------------------------------------

-> Which one would *you* choose? <-

<br>
-> [github:big-bee-network/traits-intertegular-span](https://github.com/big-bee-network/traits-intertegular-span) <-
<br>
-> [csv](https://raw.githubusercontent.com/Big-Bee-Network/trait-intertegular-distance/main/UCSB-Microscope.csv) <-
<br>
-> [csv](line:hash://sha256/436ac4ec8a78c1cb86e9616b31b0c63bd76075e0551584a30f3ba73628c00723!/L1,L7) <-
<br>
-> [xtab](preston cat UCSB:IZC:UCSB-IZC00012194-itd.csv | mlr --icsv --xtab cat) <-
<br>
-> [nanopub](preston cat UCSB:IZC:UCSB-IZC00012194-itd.csv | np) <-

--------------------------------------------------

-> [traits of UCSB-IZC00012194](hash://sha256/96bfde1efa599e0e8e61de18b14d61dd308737f684950e4079c04e9bc0f33958) are described by many things: <-

-> github repository, <-
-> csv, <-
-> csv, <-
-> csv, <-
-> xtab, <-
-> nanopubs?, <-
-> etc <-

--------------------------------------------------

-> How did we package for re-use? <-

->  Keep the Originals as Is <-
->  Record Provenance Using [RDF/N-Quads Prov/PAV](https://preston.guoda.bio) <-
->  Treat URLs as URLs <-
->  [Use Content Ids to Reference Content](Elliott, MJ, Poelen, JH, & Fortes, J. 2023 in review. Signed Citations: Making Persistent and Verifiable Citations of Digital Scientific Content. https://doi.org/10.31222/osf.io/wycjn) <-


--------------------------------------------------

-> Tools used: <-

-> bash <-
-> [preston](https://preston.guoda.bio) <-
-> [miller](https://miller.readthedocs.io/) <-

--------------------------------------------------

-> # Open Questions <-

-> How to refer to *original* sources of trait data ? <-

-> How to let biologists speak data in their native language: csv? <-

-> How to translate native data speak into nanopubs? <-

--------------------------------------------------

-> # Acknowledgements <-

This work is partly supported by [Extending Anthophila research through image and trait digitization (Big-Bee)](https://big-bee.net) National Science Foundation Awards: 2102006, 2101929, 2101908, 2101876, 2101875, 2101851, 2101345, 2101913, 2101891 and 2101850.
