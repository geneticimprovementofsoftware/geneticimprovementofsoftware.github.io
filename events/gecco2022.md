---
title: "GI @ ICSE 2021"

chairs:
- name: Bobby R. Bruce
  desc: "%%NAME%% is a Postdoctoral Scholar at UC Davis where he primarily works on the gem5 computer architecture simulator. Prior to UC Davis, Bobby carried out research into the automatic optimization of Java bytecode at UCLA. His research interests are centred around Search-based Software Engineering, and its application to improving software performance."
- name: Vesna Nowack
  desc: "%%NAME%%. Since she gained her PhD in Software Engineering in 2016 from the Universitat Politecnica de Catalunya in Barcelona, she has conducted research in supercomputing (Spain) and taught robotics in Germany. Her recent research has been on APR in the UK, including 12 months with Bloomberg (London) published this summer as “On the Introduction of Automatic Program Repair in Bloomberg” by IEEE Software. She is now a Senior Research Assistant at Lancaster University where she continues her work on using GI to automatically fix bugs."
- name: Aymeric Blot
  desc: "%%NAME%% is a Research Associate conducting research in genetic improvement at the CREST and SOLAR groups in University College London. He received in 2018 a doctorate from the University of Lille following work on automated algorithm design for multi-objective combinatorial optimisation. His research focuses on strengthening GI techniques using knowledge from automated machine learning, algorithm configuration, and evolutionary computation. He maintains and evolves the community website on genetic improvement."
- name: Emily Winter
  desc: "%%NAME%% is a Senior Research Associate at Lancaster University, specialising in the human and socio-technical aspects of software engineering. She works on the Fixie Project: Exploiting Defect Prediction for Automatic Software Repair, investigating developer needs and preferences for how they interact with an Automatic Software Repair tool. As part of her research, she is seconded as a contractor to Bloomberg LP."
- name: Justyna Petke
  desc: "%%NAME%% is a Principal Research Fellow and Proleptic Senior Lecturer (Associate Prof.), conducting research in genetic improvement. She has a doctorate in Computer Science from University of Oxford and is now at the Centre for Research on Evolution, Search and Testing (CREST) in University College London. She has published on applications of genetic improvement. Her work on the subject was awarded a Silver and a Gold ’Humie’ at GECCO 2014 and GECCO 2016 as well as an ACM SIGSOFT Distinguished Paper Award at ISSTA 2015. She was the PC co-Chair for the International Symposium on Search-Based Software Engineering in 2017. She currently serves on the editorial board of the Genetic Programming and Evolvable Machines journal."
- name: Bill Langdon
  desc: "Special thanks to %%NAME%% for helping with advertising the workshop."
---

# The 11th International Workshop on Genetic Improvement @[GECCO 2022](https://gecco-2022.sigevo.org/HomePage)


<figure class="figure">
  <img class="figure-img img-fluid" src="https://gecco-2022.sigevo.org/dl304">
  <figcaption class="figure-caption text-right">Financial District and Harbor, Boston</figcaption>
</figure>


## Proposed Event

We are hoping to hold the 11th instalment of the GI workshop with next year Genetic and Evolutionary Computation Conference, [GECCO 2022](https://gecco-2022.sigevo.org/HomePage), which will take place in Boston on July 9-13.

{% comment %}
## Important Dates

- **Submission Deadline**: 19 January 2021 (Tue)
- **Notification**: 22 February 2021 (Mon)
- **Camera-ready**: 12 March 2021 (Fri)
- **Video presentation**: 10 May 2021 (Mon)
- **Workshop**: 30 May 2021 (Sun)
{% endcomment %}


## <a name="CFP"></a> Call For Submissions

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
- Research papers (eight page limit, including references)
- Position papers (two page limit, including references)

We encourage authors to submit early and in-progress work.
The workshop emphasises interaction and discussion.

{% comment %}
These papers will be reviewed in a double-blind manner.  
All accepted papers must be presented at GI-2022 and will appear in the GECCO companion volume.
{% endcomment %}


## <a name="chairs"></a> Workshop Chairs

{% for chair in page.chairs %}{% assign match = nil %}{% for p in site.data.people %}{% if p.name == chair.name %}{% assign match = p %}{% break %}{% else %}{% for aka in p.aka %}{% if aka == chair.name %}{% assign match = p %}{% break %}{% endif %}{% endfor %}{% endif %}{% endfor %}
<figure class="figure float-right" style="margin: auto 0.5em;">
  <img class="figure-img rounded img-thumbnail" style="max-width: 200px; max-height: 140px" src="{{ match.img | relative_url }}" onerror="this.onerror=null; this.src='{{ "/profile_images/empty.jpg" | relative_url }}'">
  <figcaption class="figure-caption text-right">{{ chair.name }}</figcaption>
</figure>

{% capture chair_name %}<b>{% if match.homepage %}<a href="{{ match.homepage }}">{{ match.name }}</a>{% else %}{{ chair.name }}{% endif %}</b>{% endcapture %}
<p class="clearfix">
  {{ chair.desc | replace: '%%NAME%%', chair_name }}
</p>
{% endfor %}
