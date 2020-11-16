---
active: events
---

<div class="alert alert-danger" role="alert">
  <b>This page lacks data.</b> (see <a href="{{ "/community/contribute" | relative_url }}">how to contribute</a>)
</div>

Jump to papers from:{% for event in site.data.papers %}
- [{{ event.abbrv }}](#{{ event.anchor }}){% endfor %}

{% for event in site.data.papers %}
{% if forloop.first == false %}***{% endif %}

## <a name="{{ event.anchor }}"></a> {{ event.name }} ({{ event.abbrv }})

  {% for paper in event.papers %}
  {% if forloop.first == false %}***{% endif %}

  **{{ paper.title }}**  
  by {% for author in paper.authors %}{% if forloop.first == false %}{% if forloop.last %}{% if forloop.index > 2 %},{% endif %} and {% else %}, {% endif %}{% endif %}{% if author.url %}<a href="{{ author.url }}">{{ author.name }}</a>{% else %}<span class="text-nowrap">{{ author.name }}</span>{% endif %}{% endfor %}  
  {% if paper.doi %}<a href="{{ paper.doi }}">[DOI]</a>{% endif %}
  {% if paper.pdf %}<a href="{{ paper.pdf | relative_url }}">[PAPER]</a>{% endif %}
  {% if paper.slides %}<a href="{{ paper.slides | relative_url }}">[SLIDES]</a>{% endif %}

  {% if paper.abstract %}{{ paper.abstract }}{% endif %}
  {% endfor %}

{% endfor %}
