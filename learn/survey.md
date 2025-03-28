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
  Showing <span id="counter">{{ site.data.survey.papers.size }}</span> of {{ site.data.survey.papers.size }} entries.
</div>

<table id="survey" class="table table-responsive survey" style="max-width: 100%">
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
  <tbody>{% for entry in site.data.survey.papers %}
    <tr data-search="key={{ entry.key }} {{ entry.title | xml_escape }} {{ entry.subtitle }} {% for author in entry.authors %}{% if author.aka %}{{ author.aka }} {% endif %}{{ author.name }} {% endfor %} venue={{ entry.venue }} year={{ entry.year }} {% for tag in entry.tags %}tag={{ tag }} {% endfor %} {% if entry.type %}type={{ entry.type }}{% endif %} {% if entry.doi %}has_doi{% else %} no_doi{% endif %} {% if entry.pdfs %}has_pdf{% else %}no_pdf{% endif %} {% if entry.video %}has_video{% endif %}">
      <td title="{{ entry.key }}">{% if entry.title %}{{ entry.title }}{% if entry.subtitle %} &mdash; <i>{{ entry.subtitle }}</i>{% endif %}{% endif %} <a target="_blank" href="{{ site.baseurl }}/learn/survey?q={{ entry.key }}" class="perma"><i class="fa-solid fa-link" style="font-size: 0.75rem" aria-hidden="true"></i></a></td>
      <td>{% for author in entry.authors %}{% if forloop.first == false %}{% if forloop.last %}{% if forloop.index > 2 %},{% endif %} and {% else %}, {% endif %}{% endif %}<a href="#search" class="slink text-nowrap" onclick="force('&quot;{% if author.aka %}{{ author.aka }}{% else %}{{ author.name }}{% endif %}&quot;')">{{ author.name }}</a>{% endfor %}</td>
      <td>{% if entry.venue %}<a href="#search" class="slink" onclick="force('venue=&quot;{{ entry.venue }}&quot;')">{{ entry.venue }}</a>{% endif %} {% if entry.type %}(<a href="#search" class="slink text-nowrap" onclick="force('type=&quot;{{ entry.type }}&quot;')">{{ entry.type }}</a>){% endif %}</td>
      <td>{% if entry.year %}<a href="#search" class="slink text-nowrap" onclick="force('year=&quot;{{ entry.year }}&quot;')">{{ entry.year }}</a>{% endif %}</td>
      <td>{% for tag in entry.tags %}<a href="#search" class="slink text-nowrap" onclick="force('tag=&quot;{{ tag }}&quot;')">#{{ tag }}</a> {% endfor %}</td>
      <td>{% if entry.doi %}<a class="badge badge-primary" target="_blank" href="{{ entry.doi }}">DOI</a>{% endif %} {% if entry.bib %}<a target="_blank" href="{{ entry.bib }}">[bib]</a>{% endif %} {% for url in entry.pdfs %}<a class="badge badge-success" target="_blank" href="{{ url }}">PDF</a> {% endfor %} {% for url in entry.slides %}<a class="badge badge-info" target="_blank" href="{{ url }}">SLIDES</a> {% endfor %} {% for url in entry.video %}<a class="badge badge-danger" target="_blank" href="{{ url }}">VIDEO</a> {% endfor %} {% for url in entry.urls %}<a class="badge badge-warning" target="_blank" href="{{ url }}">URL</a> {% endfor %}</td>
    </tr>{% endfor %}
  </tbody>
</table>


---

This page is based on the GP bibliography: [http://gpbib.cs.ucl.ac.uk](http://gpbib.cs.ucl.ac.uk).


<script>
// https://stackoverflow.com/questions/3160277/jquery-table-sort
$('th').each(function (col) {
  $(this).hover(
    function () {$(this).addClass('focus');},
    function () {$(this).removeClass('focus');}
  );
  $(this).click(function () {
    if ($(this).is('.asc')) {
      $(this).removeClass('asc');
      $(this).addClass('desc selected');
      sortOrder = -1;
    } else {
      $(this).addClass('asc selected');
      $(this).removeClass('desc');
      sortOrder = 1;
    }
    $(this).siblings().removeClass('asc selected');
    $(this).siblings().removeClass('desc selected');
    var arrData = $('table').find('tbody >tr:has(td)').get();
    $.each(arrData, function (index, row) {
      $(row).data('sort', $(row).children('td').eq(col).text().toUpperCase());
    });
    arrData.sort(function (a, b) {
      var val1 = $(a).data('sort');
      var val2 = $(b).data('sort');
      if ($.isNumeric(val1) && $.isNumeric(val2))
        return sortOrder == 1 ? val1 - val2 : val2 - val1;
      else
        return (val1 < val2) ? -sortOrder : (val1 > val2) ? sortOrder : 0;
    });
    $.each(arrData, function (index, row) {
      $('tbody').append(row);
    });
  });
});

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

var query = (new URLSearchParams(window.location.search)).get("q");
if (query) {
  force(query)
}
</script>
