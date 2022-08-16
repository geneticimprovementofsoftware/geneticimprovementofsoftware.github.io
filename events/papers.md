---
active: events

workshops:
- name: 11th International Workshop
  venue: GI@GECCO
  year: 2022
  anchor: gecco2022
- name: 10th International Workshop
  venue: GI@ICSE
  year: 2021
  anchor: icse2021
- name: 9th International Workshop
  venue: GI@GECCO
  year: 2020
  anchor: gecco2020
- name: 8th International Workshop
  venue: GI@ICSE
  year: 2020
  anchor: icse2020
- name: 7th International Workshop
  venue: GI@GECCO
  year: 2019
  anchor: gecco2019
- name: 6th International Workshop
  venue: GI@ICSE
  year: 2019
  anchor: icse2019
- name: 5th International Workshop
  venue: GI@GECCO
  year: 2018
  anchor: gecco2018
- name: 4th International Workshop
  venue: GI@ICSE
  year: 2018
  anchor: icse2018
- name: 3rd International Workshop
  venue: GI@GECCO
  year: 2017
  anchor: gecco2017
- name: 2nd International Workshop
  venue: GI@GECCO
  year: 2016
  anchor: gecco2016
- name: 1st International Workshop
  venue: GI@GECCO
  year: 2015
  anchor: gecco2015
---

Jump to papers from:{% for event in page.workshops %}
- [{{ event.venue }} {{ event.year }}](#{{ event.anchor }}){% endfor %}

{% for event in page.workshops %}
{% if forloop.first == false %}***{% endif %}

## <a name="{{ event.anchor }}"></a> {{ event.venue }} {{ event.year }}: {{ event.name }}

  {% assign entries = site.data.survey.papers | where: "venue", event.venue | where: "year", event.year %}
  {% for entry in entries %}

  <div>
    <p>
      <strong>{{ entry.title }}</strong><br/>
      by {% for author in entry.authors %}{% assign match = nil %}{% for p in site.data.people %}{% if p.name == author.name %}{% assign match = p %}{% break %}{% else %}{% for aka in p.aka %}{% if aka == author.name %}{% assign match = p %}{% break %}{% endif %}{% endfor %}{% endif %}{% endfor %}{% if forloop.first == false %}{% if forloop.last %}{% if forloop.index > 2 %},{% endif %} and {% else %}, {% endif %}{% endif %}{% if match.homepage or match.scholar or match.dblp %}<a href="{{ match.homepage | default:  match.scholar | default:  match.dblp }}">{{ author.name }}</a>{% else %}<span class="text-nowrap">{{ author.name }}</span>{% endif %}{% endfor %}<br/>
      {% if entry.doi %}<a class="badge badge-primary" href="{{ entry.doi }}">DOI</a>{% endif %} {% if entry.bib %}<a href="{{ entry.bib }}">[bib]</a>{% endif %} {% for url in entry.pdfs %}<a class="badge badge-success" href="{{ url }}">PDF</a> {% endfor %} {% for url in entry.slides %}<a class="badge badge-info" href="{{ url }}">SLIDES</a> {% endfor %} {% for url in entry.video %}<a class="badge badge-danger" href="{{ url }}">VIDEO</a> {% endfor %} {% for url in entry.urls %}<a class="badge badge-warning" href="{{ url }}">URL</a> {% endfor %}
      {% if entry.abstract %}
      <span class="badge badge-secondary" style="cursor: pointer;" onclick="$(this).parent().siblings('.collapse').toggle()">Abstract</span>
      <div class="card collapse"><div class="card-body text-justify">
        {{ entry.abstract }}
      </div></div>{% endif %}
    </p>
  </div>
  {% endfor %}

{% endfor %}

