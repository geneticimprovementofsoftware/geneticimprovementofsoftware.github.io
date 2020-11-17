---
active: community
maintainers:
  - Aymeric Blot
  - Bobby Bruce
  - Justyna Petke
---

# Who maintains this website?

<div class="row justify-content-around">
{% for name in page.maintainers %}{% for p in site.data.people %}{% if p.name == name %}
<figure style="text-align: center; margin: 0.5em 1em; width: 120px">
<picture style="max-width: 120px; max-height: 120px;">
  <img class="rounded img-thumbnail" style="max-width: 100%; max-height: inherit;" src="{{ p.img | relative_url }}" onerror="this.onerror=null; this.src='{{ "/profile_images/empty.jpg" | relative_url }}'" />
</picture>
<figcaption style="font-size: 90%;">{% if p.url %}<a href="{{ p.url }}">{{ p.name }}</a>{% else %}{{ p.name }}{% endif %}</figcaption>
<figcaption style="font-size: 80%;">{% if p.affil %}{{ p.affil }}{% endif %}</figcaption>
</figure>{% endif %}{% endfor %}{% endfor %}
</div>
