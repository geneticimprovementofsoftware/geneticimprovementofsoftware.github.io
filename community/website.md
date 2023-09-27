---
active: community
maintainers:
  - Aymeric Blot
  - Bobby Bruce
  - Justyna Petke
---

# Who maintains this website?

<div class="row justify-content-around">
{% for name in page.maintainers %}{% assign match = nil %}{% for p in site.data.people %}{% if p.name == name %}{% assign match = p %}{% break %}{% endif %}{% endfor %}
<figure style="text-align: center; margin: 0.5em 0.25em;">
<picture style="max-width: 140px; max-height: 140px;">
  {% if match.homepage %}<a href="{{ match.homepage }}" style="max-width: 100%; max-height: inherit;">{% endif %}<img class="rounded img-thumbnail" style="max-width: 100%; max-height: inherit;" src="{{ match.img | relative_url }}" onerror="this.onerror=null; this.src='{{ "/profile_images/blank.jpg" | relative_url }}'" />{% if match.homepage %}</a>{% endif %}
</picture>
<figcaption>{{ match.name }}</figcaption>
<figcaption style="font-size: 80%;">{% if match.affil %}{{ match.affil }}{% endif %}</figcaption>
<figcaption>{% if match.homepage %}<a href="{{ match.homepage }}"><i class="fa-solid fa-home"></i></a>{% endif %} {% if match.dblp %}<a href="{{ match.dblp }}"><i class="ai ai-dblp"></i></a>{% endif %} {% if match.scholar %}<a href="{{ match.scholar }}"><i class="ai ai-google-scholar"></i></a>{% endif %}</figcaption>
</figure>{% endfor %}
</div>

