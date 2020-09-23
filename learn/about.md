---
active: learn
---

## What is Genetic Improvement?

Genetic Improvement is the application of evolutionary and search-based optimisation methods to the improvement of existing software. For example, it may be used to automate the process of bug-fixing or execution time optimisation.


## What is a GI  Workshop?

As academics in the field, we run the workshop to offer an opportunity for researchers to disseminate work, but most importantly to meet and discuss with other GI researchers. So far we had 7 editions of the workshop, five co-located with GECCO (in 2015, 2016, 2017, 2018, and 2019) and two with ICSE (in 2018 and 2019).

Since 2009 there have been four human competitive awards for work in GI (two Gold, one Silver and one Bronze) presented at GECCO and three best papers, including at the International Conference on Software Engineering and International Symposium on Software Testing and Analysis.


## How can I find out more?

Check out this <a href="http://blog.ieeesoftware.org/2016/02/genetic-improvement.html?platform=hootsuite">blog article</a> about GI on the IEEE Software Blog, see recent <a href="http://ieeexplore.ieee.org/document/7911210/?reload=true">survey</a>, GI <a href="https://link.springer.com/journal/10710/18/1/">special issue, </a>  and an Open PhD<a href="http://phdopen.mimuw.edu.pl/index.php?page=z15w1"> tutorial</a>.

In June 2016 there was a talk on GI at the International Summer School on Software Engineering, given by Professor Mark Harman (UCL), one of the foremost experts on GI and an international leader in search-based software engineering.

In January 2016 there was a CREST Open Workshop at UCL on Genetic Improvement. <a href="http://crest.cs.ucl.ac.uk/cow/45/">Full details of the talks and speakers are available</a>. A <a href="http://crest.cs.ucl.ac.uk/cow/50/">second workshop</a> took place in January 2017.

There was be a <a href="https://www.dagstuhl.de/en/program/calendar/semhp/?semnr=18052">Dagstuhl Seminar on GI</a> at the end of January 2018.

Proceedings of GI 2015 can be found in <a href="https://dl.acm.org/citation.cfm?id=2739482">GECCO'15 Companion</a>. Proceedings of GI 2016 can be found in <a href="http://dl.acm.org/citation.cfm?doid=2908961.2931686">GECCO'16 Companion</a>. Proceedings of GI 2017 can be found in <a href="http://dblp.org/db/conf/gecco/gecco2017c">GECCO'17 Companion</a>.

Also, try <a href="https://en.wikipedia.org/wiki/Genetic_improvement_%28computer_science%29">Wikipedia</a>.


## What are some examples of GI Frameworks?

<a href="https://github.com/gintool/gin">Gin</a>: GI in No Time - a Simple Microframework for Genetic Improvement

"The goal of <a href="https://github.com/gintool/gin">Gin</a> is to stimulate development in GI tooling, and to lower the barrier to experimenting with GI and related ideas such as program fragility.

**GrammaTech** released extensive tooling for the programmatic modification and evaluation of software; focused on modifying C/C++ source, assembly, and ELF files: <a href="https://github.com/GrammaTech/sel">link</a>; and C/C++ manipulation tooling: <a href="https://github.com/GrammaTech/clang-mutate">link</a>.

Here are a few other examples of existing work:
- <a href="http://diversify-project.eu/papers/Yeboah15.pdf">ECSELR</a>
- <a href="https://github.com/JerrySwan/JerrySwan.github.io/blob/master/publications/genofix-TR.pdf">Gen-O-Fix</a>
- <a href="https://squareslab.github.io/genprog-code/">GenProg Evolutionary Software Repair</a>
- <a href="https://github.com/codykenb/locoGP">locoGP</a>
- <a href="https://sourceforge.net/p/ugp3/wiki/GeneticImprovement/">MicroGP</a>
- <a href="http://www0.cs.ucl.ac.uk/staff/ucacbbl/gismo/">Software from the GISMOE Project via Bill Langdon</a> (see "Free Code")
- <a href="http://www.shinhwei.com/relifix.pdf">Relifix</a>
- Eric Schulte's work:
  - <a href="https://github.com/eschulte/goa">Genetic Optimization Algorithm (GOA)</a>
  - <a href="http://eschulte.github.io/software-evolution/index.html">Software Evolution Library</a>
  - <a href="https://github.com/eschulte/netgear-repair">Netgear Router Repair</a>
- <a href="https://people.cs.umass.edu/~brun/pubs/pubs/Ke15ase.pdf">SearchRepair</a>
- <a href="http://sourceforge.net/projects/trpautorepair/">TrpAutoRepair</a> (formerly known as RS Repair)

Other frameworks and libraries identified at the <a href="https://www.dagstuhl.de/en/program/calendar/semhp/?semnr=18052">Dagstuhl Seminar on Genetic Improvement of Software</a> held in January 2018:
- <a href="http://crest.cs.ucl.ac.uk/autotransplantation/downloads/muScalpel.zip">MuScalpel: automated software transplantation</a>
- <a href="https://github.com/STAMP-project/dspot">DSpot: a tool for Genetic Improvement  of test suites</a>
- <a href="https://github.com/coinse/pyggi"> PyGGI: Python General Framework for GI</a>
- <a href="https://github.com/yyxhdy/arja">ARJA: multi-objective automated program repair</a>
- <a href="https://github.com/Spirals-Team/librepair/tree/master/repairnator">Repairnator</a>
- <a href="https://github.com/kayquesousa/astor4android">Astor4Android: program repair for Android Apps</a>


## Can you suggest good GI Benchmarks?

GI-improved test subjects with test cases:
- [http://www0.cs.ucl.ac.uk/staff/ucacbbl/gismo/](http://www0.cs.ucl.ac.uk/staff/ucacbbl/gismo/) (see Free Code heading)
- [http://www.cs.ucl.ac.uk/staff/W.Langdon/gggp/#code](http://www.cs.ucl.ac.uk/staff/W.Langdon/gggp/#code) (see Free Code heading)
- [http://crest.cs.ucl.ac.uk/autotransplantation/downloads/artifact.html](http://crest.cs.ucl.ac.uk/autotransplantation/downloads/artifact.html)

(several frameworks also come with benchmarks, please see GI frameworks above)

Automated program repair, bug repositories:
- [http://repairbenchmarks.cs.umass.edu/](http://repairbenchmarks.cs.umass.edu/)
- [http://program-repair.org/benchmarks.html](http://program-repair.org/benchmarks.html)
- [http://groups.csail.mit.edu/pac/patchgen/](http://groups.csail.mit.edu/pac/patchgen/)

Benchmarks identified at the [Dagstuhl Seminar on Genetic Improvement of Software](https://www.dagstuhl.de/en/program/calendar/semhp/?semnr=18052):
- Parsec: [http://parsec.cs.princeton.edu/](http://parsec.cs.princeton.edu/)
- SPEC INT: [https://www.spec.org/benchmarks.html](https://www.spec.org/benchmarks.html)
