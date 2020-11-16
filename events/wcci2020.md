---
layout: page
title: "GI @ WCCI 2020"
description: "Special Session on Genetic Improvement"
perma: /wcci2020ss/
---

[Papers](#papers)
[CFP](#call-for-papers)
[Organisers](#organisers)

## **Special Session on Genetic Improvement @[WCCI 2020](https://wcci2020.org)**

{: style="text-align:center"}
![](./misc_images/wcci2020glasgow.jpeg)

The Special Session on Genetic Improvement will be held at the IEEE Congress on Evolutionary Computation (CEC), part of the IEEE World Congress on Computational Intelligence [WCCI](https://wcci2020.org), 2020, on **19-24 July 2020**. The conference will be fully virtual. Details can be found [here](https://wcci2020.org).

## Overview
In the past ten years there has been a dramatic increase in work on Search-Based Software Engineering (SBSE), an approach to software engineering in which search-based optimisation algorithms are used to address problems. The approach is attractive because it offers a suite of adaptive automated and semi-automated solutions in situations typified by large complex problem spaces with multiple competing and conflicting objectives. 

An increasingly popular area similar to SBSE, called  [Genetic Improvement of Software](./faq.html), arised in the last few years. With this special session, we are providing an opportunity to showcase recent breakthroughs in this field.


## Papers

<strong><a href="paper_pdfs/E-24061.pdf">Genetic Improvement of Genetic Programming</a></strong>
by <a href="http://www0.cs.ucl.ac.uk/staff/W.Langdon/">William B Langdon</a>

GISMOE BNF grammar based GI is applied to optimise run time of the tree interpreter in the fastest single computer floating point genetic programming system, GPavx. Up to two fold speed up is obtained. Performance varies with tree size. The GI version of Singleton’s C++ GPquick is demonstrated on random trees of up to 79 million opcodes on Intel AVX512 SIMD parallel compute servers.

<strong><a href="paper_pdfs/E-24527.pdf">Empirical Analysis of 1-edit Degree Patches in Syntax-Based Automatic Program Repair</a></strong>
by <a href="https://www.cs.york.ac.uk/people/pd">Piotr Dziurzanski</a>, Simos Gerasimou, Dimitris Kolovos and Nicholas Matragkas     

In this paper, software patches modifying a single line (aka 1-edit degree patches) of buggy Java open-source projects have been generated automatically using computational search and experimentally evaluated. We carried out the presumably largest to date experiment related to 1-edit degree patches, consisting of almost 27,000 computational jobs upper bounded with 107,000 computational hours. Our experiments show the benefits and drawbacks of such kind of patches. In particular, the search space size has been shown to be reduced by several orders of magnitude. The volume of tests that can be filtered out without any negative impact while generating 1-edit degree patches has been increased by about 97%. Finally, the effectiveness of finding 1-edit plausible patches is compared with multi-line plausible patches found with state-of-the-art syntax-based Automatic Program Repair tools. It is shown that despite patching fewer bugs in total, 1-edit degree patches have potential to patch some extra bugs.


<strong><a href="paper_pdfs/E-24667.pdf">Injecting Shortcuts for Faster Running Java Code</a></strong>
by <a href="http://www.cs.stir.ac.uk/~sbr/">Alexander E.I. Brownlee</a>, Justyna Petke and Anna F. Rasburn

Genetic Improvement of software applies search methods to existing software to improve the target program in some way. Impressive results have been achieved, including substantial speedups, using simple operations that replace, swap and delete lines or statements within the code. Often this is achieved by specialising code, removing parts that are unnecessary for particular use-cases. Previous work has shown that there is a great deal of potential in targeting more specialised operations that modify the code to achieve the same functionality in a different way.

We propose six new edit types for Genetic Improvement of Java software, based on the insertion of break, continue and return statements. The idea is to add shortcuts that allow parts of the program to be skipped in order to speed it up. 10 000 randomly-generated instances of each edit were applied to three open-source applications taken from GitHub. The key findings are: (1) compilation rates for inserted statements without surrounding “if” statements are 1.3–18.3%; (2) edits where the inserted statement is embedded within an “if” have compilation rates of 3.2–55.8%; (3) of those that compiled, all 6 edits have a high rate of passing tests (Neutral Variant Rate), >60% in all but one case, and so have the potential to be performance improving edits. Finally, a preliminary experiment based on local search shows how these edits might be used in practice.


## Call For Papers


We invite submissions on any aspect of Genetic Improvement of Software, including, but not limited to, theoretical results and interesting new applications. The suggested topics cover the entire range of optimisation of functional and non-functional properties:
- bandwidth minimisation
- latency minimisation
- fitness optimisation
- energy optimisation
- software specialisation
- memory optimisation
- software transplantation
- software testing
- bug fixing
- multi-objective code optimisation

In the context of WCCI, we also welcome ANN and Fuzzy based approaches to support GI, e.g. in performance prediction, identifying buggy code, estimating run times, etc.

## Important Dates

 - Paper Submission Deadline: <strike>15 Jan 2020</strike> 30 Jan 2020
 - Notification of Acceptance: <strike>15 Mar 2020</strike> 20 Mar 2020
 - Final Paper Submission Deadline: <strike>15 Apr 2020</strike> 15 May 2020

## Paper Submission

Papers for IEEE CEC 2020 should be submitted electronically through the [Congress website](https://wcci2020.org/calls/#call-for-papers), and will be refereed by experts in the fields and ranked based on the criteria of originality, significance, quality and clarity. To submit your papers to the special session, please select the Special Session name in the Main Research topic.

For more submission information please visit: (https://wcci2020.org). All accepted papers will be published in the IEEE CEC 2020 electronic proceedings, included in the IEEE Xplore digital library, and indexed by EI Compendex.

## Organisers

<img align="right"  alt="drawing" width="120px" src="./profile_images/sandy.jpg">
[Alexander (Sandy) Brownlee](http://www.cs.stir.ac.uk/~sbr/) is a Lecturer in the Division of Computing Science and Mathematics at the University of Stirling. His main topics of interest are in search-based optimisation methods and machine learning, with applications in civil engineering, transportation and SBSE. Within SBSE, he is interested in automated bug-fixing and improvement of non-functional properties such as run-time and energy consumption; how these different objectives interact with each other; and novel approaches to mutating code. He is also one of the developers of Gin, an open-source toolkit for experimentation with Genetic Improvement on real-world software projects.

<img align="right"  alt="drawing" width="120px" src="./profile_images/sami.jpg">
[Saemundur O. Haraldsson](http://www.cs.stir.ac.uk/~soh/ ) is a Lecturer in the Division of Computing Science and Mathematics at the University of Stirling. His area of interest are Automatic Software Optimisation and Machine Learning. He has already established himself as a world leading person in automatic software optimisation with an impressive track record, which includes introducing the world’s first solution for automatic overnight software repair that is currently in active use in industry setting, and co-authoring the first complete survey on Genetic Improvement of Software.


<img align="right"  alt="drawing" width="120px" src="./profile_images/justyna.jpg">
[Justyna Petke](http://www0.cs.ucl.ac.uk/staff/j.petke) is a Principal Research Fellow and Proleptic Senior Lecturer (Associate Professor) in the Centre for Research on Evolution, Search and Testing (CREST), at University College London. She is interested in Genetic Improvement Search-Based Software Engineering, and Constraint Satisfaction. She holds an EPSRC Fellowship on Genetic Improvement.

<br>

<img align="right"  alt="drawing" width="120px" src="./profile_images/john.jpg">
[John R. Woodward](http://www.eecs.qmul.ac.uk/~jwoodward/ ) is a Senior Lecturer at QMUL and head of the Operational Research Group http://or.qmul.ac.uk/. He has organized workshops at GECCO including Metaheuristic Design Patterns and ECADA, Evolutionary Computation for the Automated Design of Algorithms which has run for 8 years. He has also given tutorials on the same topic at PPSN, CEC, and GECCO. He currently holds a grant examining how Genetic Improvement techniques can be used to adapt scheduling software for airport runways. He is currently ranked 36th out of over 10,000 researchers on The Genetic Programming Bibliography.
