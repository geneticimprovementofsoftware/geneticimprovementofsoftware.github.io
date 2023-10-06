---
active: community
---

# Members

To (dis)appear from or update data on this page either [contact us](website) or open a pull request on [GitHub](contribute).

<div class="row justify-content-around">
{% for p in site.data.people %}{% if p.show %}
<figure style="text-align: center; margin: 0.5em 0.25em; width: 130px">
<picture style="max-width: 120px; max-height: 120px;">
  {% if p.homepage %}<a href="{{ p.homepage }}" style="max-width: 100%; max-height: inherit;">{% endif %}<img class="rounded img-thumbnail" style="max-width: 100%; max-height: inherit;" src="{{ p.img | relative_url }}" onerror="this.onerror=null; this.src='{{ "/profile_images/blank.jpg" | relative_url }}'" />{% if p.homepage %}</a>{% endif %}
</picture>
<figcaption>{{ p.name }}</figcaption>
<figcaption style="font-size: 80%;">{% if p.affil %}{{ p.affil }}{% endif %}</figcaption>
<figcaption>{% if p.homepage %}<a href="{{ p.homepage }}"><i class="fa-solid fa-home"></i></a> {% endif %}{% if p.dblp %}<a href="{{ p.dblp }}"><i class="ai ai-dblp"></i></a> {% endif %}{% if p.scholar %}<a href="{{ p.scholar }}"><i class="ai ai-google-scholar"></i></a> {% endif %}{% if p.twitter %}<a href="{{ p.twitter }}"><i class="fa-brands fa-x-twitter"></i></a>{% endif %}</figcaption>
</figure>{% endif %}{% endfor %}
</div>
