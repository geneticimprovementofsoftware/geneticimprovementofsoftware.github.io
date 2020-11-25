---
active: learn
---

# Living Survey on Genetic Improvement

Search operates within all fields available.
Use quotes for <a href="#" onclick="force('&quot;program repair&quot;')">"multi-words queries"</a>.
Space separated queries are conjunctives.
Magic queries include <a href="#" onclick="force('venue=&quot;IEEE TEVC&quot;')">venues</a>, <a href="#" onclick="force('type=Workshop')">type of venue</a>, <a href="#" onclick="force('year=2020')">publication year</a>, and <a href="#" onclick="force('tag=survey')">tags</a>.
Clicking on data links in the table will query all similar entries.

<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1">Query:</span>
      </div>
  <input type="text" id="search" class="form-control" placeholder="..." onkeyup="search()">
  <div class="input-group-append">
    <input type="reset" class="btn btn-outline-secondary" onclick="force('')">
  </div>
</div>

<div>
  Showing <span id="counter">{{ site.data.survey.size }}</span> of {{ site.data.survey.size }} entries.
</div>

<table id="survey" class="table table-responsive">
  <thead>
    <tr>
      <th style="min-width: 20em">Title</th>
      <th style="max-width: 10em">Authors</th>
      <th style="max-width: 10em">Venue/Issue</th>
      <th>Year</th>
      <th>Tags</th>
      <th>Links</th>
    </tr>
  </thead>
  <tbody>{% for entry in site.data.survey %}
    <tr data-search="{{ entry.title }} {{ entry.subtitle }} {% for author in entry.authors %}{% if author.aka %}{{ author.aka }} {% endif %}{{ author.name }} {% endfor %} venue={{ entry.venue }} year={{ entry.year }} {% for tag in entry.tags %}tag={{ tag }} {% endfor %} {% if entry.type %}type={{ entry.type }}{% endif %}">
      <td>{% if entry.title %}{{ entry.title }}{% if entry.subtitle %} &mdash; <i>{{ entry.subtitle }}</i>{% endif %}{% endif %}</td>
      <td>{% for author in entry.authors %}{% if forloop.first == false %}{% if forloop.last %}{% if forloop.index > 2 %},{% endif %} and {% else %}, {% endif %}{% endif %}<a href="#search" class="text-nowrap" onclick="force('&quot;{% if author.aka %}{{ author.aka }}{% else %}{{ author.name }}{% endif %}&quot;')">{{ author.name }}</a>{% endfor %}</td>
      <td>{% if entry.venue %}<a href="#search" class="" onclick="force('venue=&quot;{{ entry.venue }}&quot;')">{{ entry.venue }}</a>{% endif %} {% if entry.type %}(<a href="#search" class="text-nowrap" onclick="force('type=&quot;{{ entry.type }}&quot;')">{{ entry.type }}</a>){% endif %}</td>
      <td>{% if entry.year %}<a href="#search" class="text-nowrap" onclick="force('year=&quot;{{ entry.year }}&quot;')">{{ entry.year }}</a>{% endif %}</td>
      <td>{% for tag in entry.tags %}<a href="#search" class="text-nowrap" onclick="force('tag=&quot;{{ tag }}&quot;')">#{{ tag }}</a> {% endfor %}</td>
      <td>{% if entry.doi %}<a class="badge badge-primary" href="{{ entry.doi }}">DOI</a>{% endif %} {% if entry.bib %}<a href="{{ entry.bib }}">[bib]</a>{% endif %} {% for url in entry.pdfs %}<a class="badge badge-success" href="{{ url }}">PDF</a> {% endfor %} {% for url in entry.urls %}<a class="badge badge-warning" href="{{ url }}">URL</a> {% endfor %}</td>
    </tr>{% endfor %}
  </tbody>
</table>


---

This page is based on the GP bibliography: [http://gpbib.cs.ucl.ac.uk](http://gpbib.cs.ucl.ac.uk).


<script>
function search() {
  var chunks = $("input#search").val().toUpperCase().match(/(?:[^\s"]+|"[^"]*")+/g)
  if (chunks) {
    chunks = chunks.map(c => c.replace(/\"/g, ""));
  }

  var counter = 0
  $("tbody tr").each(function() {
    var s = $(this).data("search");
    var show = true;
    if (chunks) {
      for (c of chunks) {
        if (s.toUpperCase().indexOf(c) == -1) {
          show = false;
        }
      }
      if (show) {
        $(this).show();
        counter += 1;
      } else {
        $(this).hide();
      }
    } else {
      $(this).show();
      counter += 1;
    }
    $("span#counter").text(counter);
  });
}

function force(s) {
  $("input#search").val(s);
  search();
  return false;
}
</script>
