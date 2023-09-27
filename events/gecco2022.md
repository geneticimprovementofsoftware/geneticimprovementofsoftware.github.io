---
title: "GI @ GECCO 2022"
disable_alerts: true

chairs:
- name: Bobby R. Bruce
  desc: "%%NAME%% is a Project Scientist at UC Davis where he primarily works on the gem5 computer architecture simulator. Prior to UC Davis, Bobby carried out research into the automatic optimization of Java bytecode at UCLA. His research interests are centred around Search-based Software Engineering, and its application to improving software performance."
- name: Vesna Nowack
  desc: "%%NAME%%. Since she gained her PhD in Software Engineering in 2016 from the Universitat Politecnica de Catalunya in Barcelona, she has conducted research in supercomputing (Spain) and taught robotics in Germany. Her recent research has been on APR in the UK, including 12 months with Bloomberg (London) published this summer as “On the Introduction of Automatic Program Repair in Bloomberg” by IEEE Software. She is now a Senior Research Assistant at Lancaster University where she continues her work on using GI to automatically fix bugs."
- name: Aymeric Blot
  desc: "%%NAME%% is a Research Associate conducting research in genetic improvement at the CREST and SOLAR groups in University College London. He received in 2018 a doctorate from the University of Lille following work on automated algorithm design for multi-objective combinatorial optimisation. His research focuses on strengthening GI techniques using knowledge from automated machine learning, algorithm configuration, and evolutionary computation. He maintains and evolves the community website on genetic improvement."
- name: Emily Winter
  desc: "%%NAME%% is a Senior Research Associate at Lancaster University, specialising in the human and socio-technical aspects of software engineering. She works on the Fixie Project: Exploiting Defect Prediction for Automatic Software Repair, investigating developer needs and preferences for how they interact with an Automatic Software Repair tool. As part of her research, she is seconded as a contractor to Bloomberg LP."
- name: Bill Langdon
  desc: "%%NAME%% has been working on GP since 1993. His PhD was the first book to be published in John Koza and Dave Goldberg's book series. He has previously run the GP track for GECCO&nbsp;2001 and 2014 and was programme chair for GECCO&nbsp;2002 having previously chaired EuroGP for 3 years. More recently he edited FOGA&nbsp;2011 and run the computational intelligence on GPUs (CIGPU 2008&mdash;2012) and EvoPAR workshops. His books include A Field Guide to Genetic Programming, Foundations of Genetic Programming and Advances in Genetic Programming&nbsp;III. He also maintains the genetic programming bibliography. His current research uses GP to genetically improve existing software, CUDA, search based software engineering and Bioinformatics. He co-organised GI&nbsp;2015, GI&nbsp;2017, GI&nbsp;2018, GI&nbsp;2019, GI&nbsp;2021 and the 2018 Genetic Improvement of Software Seminar at Dagstuhl."
- name: Justyna Petke
  desc: "%%NAME%% is a Principal Research Fellow and Proleptic Senior Lecturer (Associate Prof.), conducting research in genetic improvement. She has a doctorate in Computer Science from University of Oxford and is now at the Centre for Research on Evolution, Search and Testing (CREST) in University College London. She has published on applications of genetic improvement. Her work on the subject was awarded a Silver and a Gold ’Humie’ at GECCO&nbsp;2014 and GECCO&nbsp;2016 as well as an ACM SIGSOFT Distinguished Paper Award at ISSTA&nbsp;2015. She was the PC co-Chair for the International Symposium on Search-Based Software Engineering in 2017. She currently serves on the editorial board of the Genetic Programming and Evolvable Machines journal."

reviewers:
- Brad Alexander
- Nadia Alshahwan
- Afnan AlSubaihin
- Gabin An
- James Callan
- Jonathan Dorn
- Erik Fredericks
- Yu Huang
- Serkan Kirbas
- Nelishia Pillay
- Eric Schulte
- Jeongju Sohn
- Christopher Timperley
- Jie Marina Zhang
---

# The 11th International Workshop on Genetic Improvement @[GECCO 2022](https://gecco-2022.sigevo.org/HomePage)


<figure class="figure">
  <img class="figure-img img-fluid" src="https://gecco-2022.sigevo.org/dl304">
  <figcaption class="figure-caption text-right">Financial District and Harbor, Boston</figcaption>
</figure>

Navigation: [Keynote](#keynote), [Accepted Papers](#accepted-papers), [Schedule](#schedule), [CFP](#CFP), [Workshops Chairs](#chairs), [PC](#pc)

## Event

The 11th instalment of the GI workshop took place in Boston on 9 July 2022, collocated with the Genetic and Evolutionary Computation Conference, [GECCO 2022](https://gecco-2022.sigevo.org/HomePage).

- **<span style="color:#C9B037"><i class="fa-solid fa-award"></i> best paper award</span>: Evaluation of Genetic Improvement Tools for Improvement of Non-functional Properties of Software** &mdash; Shengjie Zuo, Aymeric Blot, and Justyna Petke
- **<span style="color:#C9B037"><i class="fa-solid fa-award"></i> best presentation award</span>: Genetic Improvement in the Shackleton Framework for Optimizing LLVM Pass Sequences** &mdash; Shuyue Stella Li, Hannah Peeler, Andrew N. Sloss, Kenneth N. Reid, and Wolfgang Banzhaf

{% comment %}
<div class="alert alert-primary" role="alert">
  There will also be a tutorial on GI at GECCO 2022 (<a href="https://gecco-2022.sigevo.org/Tutorials#id_Genetic%20improvement:%20Taking%20real-world%20source%20code%20and%20improving%20it%20using%20computational%20search%20methods.">see details</a>)
</div>
{% endcomment %}

Group photo:
<figure class="figure">
  <img class="figure-img img-fluid" src="{{ "/workshop_photos/gi2022gecco/group_photo.png" | relative_url }}">
</figure>

## Presentation Recordings

A YouTube Playlist has been created containing recordings of all the 11th GI Workshop presentations:

<iframe width="720" height="405" src="https://www.youtube.com/embed/?listType=playlist&list=PLI8fiFpB7BoIHgl5CsdtjfWvHlE5N6pje" frameborder="0" allowfullscreen></iframe>

## Important Dates

- **Submission Deadline**: 11 April 2022 (Mon)
- **Notification**: 25 April 2022 (Mon)
- **Camera-ready**: 2 May 2022 (Mon)
- **Workshop**: 9 July 2022 (Sat)

Keep up to date with the latest event news via our Twitter: <https://twitter.com/gi_of_software>.


## Keynote

<figure class="figure float-right" style="margin: auto 0.5em;">
  <img class="figure-img rounded img-thumbnail" style="max-width: 200px; max-height: 160px;" src="{{ "/profile_images/westley_weimer.jpg" | relative_url }}" onerror="this.onerror=null; this.src='{{ "/profile_images/blank.jpg" | relative_url }}'" />
  <figcaption class="figure-caption text-right">Westley Weimer</figcaption>
</figure>


We are happy to announce that [Westley Weimer](https://web.eecs.umich.edu/~weimerw/) (University of Michigan, USA) will give the keynote speech in GI@GECCO 2022: **From Deep Learning to Human Judgments: Lessons for Genetic Improvement**.  
_Many new techniques and evaluation approaches are being considered in subfields like automated program repair or manual program improvement, but they have not yet translated to popular success in the subfield of Genetic Improvement. For example, automated program repair researchers are increasingly considering deep neural network or neural machine translation approaches to fix defects -- approaches which may seem, at first glance, to be incompatible with genetic methods. Similarly, there has been an increasing use of advanced measurements, such as eye tracking or medical imaging, or experimental designs, such as the use of deception, in the evaluation of bug-fixing patches -- but those evaluations are not as common for genetic improvement. This keynote address summarizes some recent techniques, placing them in a GI context and arguing that many of these techniques are compatible with a continuous notion of genetic improvement (as opposed to a discrete notion of program repair). This keynote also summarizes recent evaluations and their use in the field, as well as lessons that can be learned from industrial deployments (e.g., from Facebook to Fujitsu to Bloomberg) about human trust and acceptability. It concludes with a call to arms about the potential impact of Genetic Improvement._

Prof. Westley Weimer received his PhD from the University of California at Berkeley.
His research interests include reducing the costs associated with software development at scale (particularly through automated program repair) as well as program analysis, formal verification, and human linguistic and visual interaction with software.
He is a senior member of the Association for Computing Machinery and his work has led to over fifteen thousand citations and several awards, including three ‘Humies’ and ICSE 2019 Most Influential paper for his work on using Genetic Improvement for bug fixing.

An archive of the keynote slides are available [here](/slides/gi2022gecco/weimer-keynote-gi-gecco-22.pdf).


## Accepted Papers

{% assign entries = site.data.survey.papers | where: "venue", "GI@GECCO" | where: "year", 2022 %}
{% for entry in entries %}

<div>
  <p>
    <strong>{{ entry.title }}</strong><br/>
    by {% for author in entry.authors %}{% assign match = nil %}{% for p in site.data.people %}{% if p.name == author.name %}{% assign match = p %}{% break %}{% else %}{% for aka in p.aka %}{% if aka == author.name %}{% assign match = p %}{% break %}{% endif %}{% endfor %}{% endif %}{% endfor %}{% if forloop.first == false %}{% if forloop.last %}{% if forloop.index > 2 %},{% endif %} and {% else %}, {% endif %}{% endif %}{% if match.homepage or match.scholar or match.dblp %}<a href="{{ match.homepage | default:  match.scholar | default:  match.dblp }}">{{ author.name }}</a>{% else %}<span class="text-nowrap">{{ author.name }}</span>{% endif %}{% endfor %}<br/>
    {% if entry.doi %}<a class="badge badge-primary" href="{{ entry.doi }}">DOI</a>{% endif %} {% if entry.bib %}<a href="{{ entry.bib }}">[bib]</a>{% endif %} {% for url in entry.pdfs %}<a class="badge badge-success" href="{{ url }}">PDF</a> {% endfor %} {% for url in entry.slides %}<a class="badge badge-info" target="_blank" href="{{ url }}">SLIDES</a> {% endfor %} {% for url in entry.video %}<a class="badge badge-danger" target="_blank" href="{{ url }}">VIDEO</a> {% endfor %} {% for url in entry.urls %}<a class="badge badge-warning" href="{{ url }}">URL</a> {% endfor %}
    {% if entry.abstract %}
    <span class="badge badge-secondary" style="cursor: pointer;" onclick="$(this).parent().siblings('.collapse').toggle()">Abstract</span>
    <div class="card collapse"><div class="card-body text-justify">
      {{ entry.abstract }}
    </div></div>{% endif %}
  </p>
</div>
{% endfor %}


## Schedule

This schedule appears in Boston's time zone (UTC/GMT-4, Eastern Daylight Time); compare to your timezone [here](https://time.is/compare/Boston).  
Presentations for full papers are 20 minutes long, followed by 5 minutes for questions.  
Presentations for short papers consist of a 10 minute talk, followed by 5 minutes for questions.

- Saturday, July 09, 10:50--12:40 (110 mins; chair: Bobby R. Bruce, Justyna Petke)
    - [10:50](https://time.is/1050_09_Jul_2022_in_Boston): **Welcome** &mdash; Bobby R. Bruce (5 mins)
    - [10:55](https://time.is/1055_09_Jul_2022_in_Boston): **Keynote speech** &mdash; *From Deep Learning to Human Judgments: Lessons for Genetic Improvement* &mdash; **Westley Weimer** (5+45+15 mins Q&A)
    - [12:00](https://time.is/1200_09_Jul_2022_in_Boston): *Amaru: A Framework for Combining Genetic Improvement with Pattern Mining* &mdash; **Oliver Krauss** (20+5 mins)
    - [12:25](https://time.is/1225_09_Jul_2022_in_Boston): *Genetic Improvement in the Shackleton Framework for Optimizing LLVM Pass Sequences* &mdash; **Shuyue Stella Li**, Hannah Peeler, Andrew N. Sloss, Kenneth N. Reid, and Wolfgang Banzhaf (10+5 mins)
- Saturday, July 09, 13:40--15:30 (110 mins; chair: Bobby R. Bruce, Vesna Nowack)
    - [13:40](https://time.is/1340_09_Jul_2022_in_Boston): *Evaluation of Genetic Improvement Tools for Improvement of Non-functional Properties of Software* &mdash; Shengjie Zuo, **Aymeric Blot**, and Justyna Petke (20+5 mins)
    - [14:05](https://time.is/1405_09_Jul_2022_in_Boston): *Opportunities for Genetic Improvement of Cryptographic Code* &mdash; Chitchanok Chuengsatiansup, Markus Wagner, and **Yuval Yarom** (10+5 mins)
    - [14:20](https://time.is/1420_09_Jul_2022_in_Boston): *Towards evolution-based autonomy in large-scale systems* &mdash; **Damien Anderson**, Paul Harvey, **Yusaku Kaneta**, Petros Papadopoulos, **Philip Rodgers**, and Marc Roper (10+5 mins)
    - [14:35](https://time.is/1435_09_Jul_2022_in_Boston): *Genetic Improvement of Shoreline Evolution Forecasting Models* &mdash; **Mahmoud Al Najar**, Rafael Almar, Erwin W. J. Bergsma, Jean-Marc Delvit, and Dennis G. Wilson (20+5 mins)
    - [15:00](https://time.is/1500_09_Jul_2022_in_Boston): *The case for Grammatical Evolution in test generation* &mdash; **Aidan Murphy**, Thomas Laurent, and Anthony Ventresque (10+5 mins)
    - [15:15](https://time.is/1515_09_Jul_2022_in_Boston): *Leveraging Fuzzy System to Reduce Uncertainty of Decision Making in Software Engineering Automation* &mdash; **Yueke Zhang** and Yu Huang (10+5 mins)
- Saturday, July 09, 16:00--17:50 (110 mins; chair: Aymeric Blot, Vesna Nowack)
    - [16:00](https://time.is/1600_09_Jul_2022_in_Boston): *Dissecting Copy/Delete/Replace/Swap mutations: Insights from a GIN Case Study* &mdash; Sherlock A. Licorish and **Markus Wagner** (20+5 mins)
    - [16:25](https://time.is/1625_09_Jul_2022_in_Boston): *Py2Cy: A Genetic Improvement Tool To Speed Up Python* &mdash; **James Zhong**, **Max Hort**, and Federica Sarro (20+5 mins)
    - [16:50](https://time.is/1650_09_Jul_2022_in_Boston): *Automatically Exploring Computer System Design Spaces* &mdash; **Bobby R. Bruce** (10+5 mins)
    - [17:05](https://time.is/1705_09_Jul_2022_in_Boston): **Industry+Student+Faculty Open Discussion** &mdash;  Aymeric Blot (40 mins)
    - [17:45](https://time.is/1745_09_Jul_2022_in_Boston): **Prizes &amp; Closing** &mdash; Vesna Nowack (5 mins)


## <a name="CFP"></a> Call For Submissions [[pdf]({{ "/paper_pdfs/gi2022gecco/call_for_papers.pdf" | relative_url }})]

We invite submissions that discuss recent developments in all areas of research on, and applications of, Genetic Improvement.
The International Workshop on Genetic Improvement is the premier workshop in the field and provides an opportunity for researchers interested in automated program repair and software optimisation to disseminate their work, exchange ideas, and discover new research directions.
Topics of interest include both the theory and practice of Genetic Improvement. Applications of GI include, but are not limited to:

- Improve efficiency
- Decrease memory consumption
- Decrease energy consumption
- Transplant new functionality
- Specialise software
- Translate between programming languages
- Generate multiple versions of software
- Repair bugs

We invite submissions of two paper types:
- Research papers (eight page limit, *excluding* references)
- Position papers (two page limit, including references)

The **<i class="fa-solid fa-award"></i> best paper** and **<i class="fa-solid fa-award"></i> best presentation** will be awarded during the workshop.

Detailed formatting instructions for authors are listed [here](https://gecco-2022.sigevo.org/Paper-Submission-Instructions).  
We encourage authors to submit early and in-progress work.
The workshop emphasises interaction and discussion.

Papers must be submitted through the paper submission website: [https://ssl.linklings.net/conferences/gecco/](https://ssl.linklings.net/conferences/gecco/)  
These papers will be reviewed in a double-blind manner.  
All accepted papers must be presented at GI-2022 and will appear in the GECCO companion volume.

As a published ACM author, you and your co-authors are subject to all ACM Publications Policies ([https://www.acm.org/publications/policies/toc](https://www.acm.org/publications/policies/toc)), including ACM's new Publications Policy on Research Involving Human Participants and Subjects ([https://www.acm.org/publications/policies/research-involving-human-participants-and-subjects](https://www.acm.org/publications/policies/research-involving-human-participants-and-subjects)).


## <a name="bursaries"></a> Funding Opportunity For Students

We will support up to 5 students by offering to partially reimburse (up to $250 each) registration and travel costs for GECCO and all associated workshops for students whose work is accepted to the GI workshop.
Priority will be given based on the student’s need and submission quality.

Students applying for a scholarship should submit a first-author regular paper to the workshop (up to 8 pages long) and plan to present their work in Boston in person.
Moreover, their supervisor should send a one-paragraph note of recommendation to [bbruce@ucdavis.edu](mailto:bbruce@ucdavis.edu) listing:
- the student’s area of work.
- the supervisor’s support of the student’s application.



## <a name="chairs"></a> Workshop Chairs

{% for chair in page.chairs %}{% assign match = nil %}{% for p in site.data.people %}{% if p.name == chair.name %}{% assign match = p %}{% break %}{% else %}{% for aka in p.aka %}{% if aka == chair.name %}{% assign match = p %}{% break %}{% endif %}{% endfor %}{% endif %}{% endfor %}
<figure class="figure float-right" style="margin: auto 0.5em;">
  <img class="figure-img rounded img-thumbnail" style="max-width: 200px; max-height: 140px" src="{{ match.img | relative_url }}" onerror="this.onerror=null; this.src='{{ "/profile_images/blank.jpg" | relative_url }}'">
  <figcaption class="figure-caption text-right">{{ chair.name }}</figcaption>
</figure>

{% capture chair_name %}<b>{% if match.homepage %}<a href="{{ match.homepage }}">{{ match.name }}</a>{% else %}{{ chair.name }}{% endif %}</b>{% endcapture %}
<p class="clearfix">
  {{ chair.desc | replace: '%%NAME%%', chair_name }}
</p>
{% endfor %}


## <a name="PC"></a> PC

<div class="row justify-content-around">
{% for name in page.reviewers %}{% assign match = nil %}{% for p in site.data.people %}{% if p.name == name %}{% assign match = p %}{% break %}{% else %}{% for aka in p.aka %}{% if aka == name %}{% assign match = p %}{% break %}{% endif %}{% endfor %}{% endif %}{% endfor %}
<figure class="figure" style="text-align: center; margin: 0.5em 1em; width: 140px;">
  <img class="figure-img" style="max-width: 140px; max-height: 140px;" src="{{ match.img | relative_url }}" onerror="this.onerror=null; this.src='{{ "/profile_images/blank.jpg" | relative_url }}'" />
  <figcaption class="figure-caption">{% if match.homepage or match.scholar or match.dblp %}<a href="{{ match.homepage | default:  match.scholar | default:  match.dblp }}">{{ match.name }}</a>{% else %}{{ name }}{% endif %}</figcaption>
</figure>{% endfor %}
</div>
