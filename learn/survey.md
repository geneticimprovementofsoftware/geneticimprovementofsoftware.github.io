---
active: learn
---

<div class="alert alert-danger" role="alert">
  <b>TODO:</b> Populate with papers and discuss tags
</div>

# Living Survey on Genetic Improvement

Search operates within all fields available.
Use quotes for <a href="#" onclick="force('&quot;program repair&quot;')">"multi-words queries"</a>.
Space separated queries are conjunctives.
Magic queries include <a href="#" onclick="force('venue=&quot;IEEE TEVC&quot;')">venues</a>, <a href="#" onclick="force('type=Workshop')">type of venue</a>, <a href="#" onclick="force('year=2020')">publication year</a>, and <a href="#" onclick="force('tag=survey')">tags</a>.


<div class="input-group mb-3">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1">Query:</span>
      </div>
  <input type="text" id="search" class="form-control" placeholder="...">
  <div class="input-group-append">
    <input type="reset" class="btn btn-outline-secondary" onclick="force('')">
  </div>
</div>

<table id="survey" class="table table-responsive">
  <thead>
    <tr>
      <th>Title</th>
      <th>Authors</th>
      <th>Venue/Issue</th>
      <th>Year</th>
      <th>Tags</th>
      <th>Links</th>
    </tr>
  </thead>
  <tbody>{% for entry in site.data.survey %}
    <tr data-search="{{ entry.title }} {{ entry.subtitle }} {% for author in entry.authors %}{{ author }} {% endfor %} venue={{ entry.venue }} year={{ entry.year }} {% for tag in entry.tags %}tag={{ tag }} {% endfor %} {% if entry.type %}type={{ entry.type }}{% endif %}">
      <td>{% if entry.title %}{{ entry.title }}{% if entry.subtitle %} &mdash; <i>{{ entry.subtitle }}</i>{% endif %}{% endif %}</td>
      <td>{% for author in entry.authors %}{% if forloop.first == false %}{% if forloop.last %}{% if forloop.index > 2 %},{% endif %} and {% else %}, {% endif %}{% endif %}<u class="text-nowrap" onclick="force('&quot;{{ author }}&quot;')">{{ author }}</u>{% endfor %}</td>
      <td>{% if entry.venue %}<u class="text-nowrap" onclick="force('venue=&quot;{{ entry.venue }}&quot;')">{{ entry.venue }}</u>{% endif %} {% if entry.type %}(<u class="text-nowrap" onclick="force('type=&quot;{{ entry.type }}&quot;')">{{ entry.type }}</u>){% endif %}</td>
      <td>{% if entry.year %}<u class="text-nowrap" onclick="force('year=&quot;{{ entry.year }}&quot;')">{{ entry.year }}</u>{% endif %}</td>
      <td>{% for tag in entry.tags %}<u class="text-nowrap" onclick="force('tag=&quot;{{ tag }}&quot;')">#{{ tag }}</u>{% endfor %}</td>
      <td>{% if entry.doi %}<a href="{{ entry.doi }}">[doi]</a>{% endif %} {% if entry.bib %}<a href="{{ entry.bib }}">[bib]</a>{% endif %} {% if entry.url %}<a href="{{ entry.url }}">[url]</a>{% endif %}</td>
    </tr>{% endfor %}
  </tbody>
</table>


<script>
function search() {
  var chunks = $("input#search").val().toUpperCase().match(/(?:[^\s"]+|"[^"]*")+/g)
  if (chunks) {
    chunks = chunks.map(c => c.replace(/\"/g, ""));
  }

  $("tbody tr").each(function() {
    var s = $(this).data("search");
    var show = true;
    if (chunks) {
      for (c of chunks) {
        if (s.toUpperCase().indexOf(c) == -1) {
          show = false;
        }
        console.log(c)
        console.log(s.toUpperCase())
        console.log(s.toUpperCase().indexOf(c))
      }
      if (show) {
        $(this).show();
      } else {
        $(this).hide();
      }
    } else {
      $(this).show();
    }
  });
}

function force(s) {
  $("input#search").val(s);
  search();
  return false;
}
</script>
