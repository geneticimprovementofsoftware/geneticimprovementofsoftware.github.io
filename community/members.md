---
active: community
---

<div class="alert alert-danger" role="alert">
  <b>TODO:</b> Populate with initial members
</div>

# Members

To (dis)appear from or update data on this page either [contact us](website) or open a pull request on [GitHub](contribute).

<div class="row justify-content-around">
{% for p in site.data.members %}
<figure style="text-align: center; margin: 0.5em 1em; width: 120px">
<picture style="max-width: 120px; max-height: 120px;">
  <img class="rounded img-thumbnail" style="max-width: 100%; max-height: inherit;" src="{{ p.img }}" onerror="this.onerror=null; this.src='{{ "/profile_images/empty.png" | relative_url }}'" />
</picture>
<figcaption>{% if p.url %}<a href="{{ p.url }}">{{ p.name }}</a>{% else %}{{ p.name }}{% endif %}</figcaption>
<figcaption>{% if p.affil %}{{ p.affil }}{% endif %}</figcaption>
<figcaption>{% for tag in p.tags %}#{{ tag }} {% endfor %}</figcaption>
</figure>{% endfor %}
</div>
