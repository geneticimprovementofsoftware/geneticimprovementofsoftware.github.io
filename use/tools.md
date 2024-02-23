---
active: use
---

## What are some examples of GI Frameworks?

Search by tool name.

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
  Showing <span id="counter">{{ site.data.tools.size }}</span> of {{ site.data.tools.size }} entries.
</div>

<table id="tools" class="table table-responsive tools" style="max-width: 100%">
  <thead>
    <tr>
      <th>Name</th>
      <th>Link</th>
    </tr>
  </thead>
  <tbody>{% for entry in site.data.tools %}
    <tr data-search="key={{ entry.key }}">
      <td title="{{ entry.key }}">{% if entry.key %}{{ entry.key }}{% if entry.subtitle %} &mdash; <i>{{ entry.subtitle }}</i>{% endif %}{% endif %} </td>
      <td>{% if entry.link %}<a class="badge badge-primary" target="_blank" href="{{ entry.link }}">URL</a>{% endif %}</td>
    </tr>{% endfor %}
  </tbody>
</table>


---


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


<!-- 


--------------------------------------------------
<a href="https://github.com/gintool/gin">Gin</a>: GI in No Time - a Simple Microframework for Genetic Improvement

"The goal of <a href="https://github.com/gintool/gin">Gin</a> is to stimulate development in GI tooling, and to lower the barrier to experimenting with GI and related ideas such as program fragility.

**GrammaTech** released extensive tooling for the programmatic modification and evaluation of software; focused on modifying C/C++ source, assembly, and ELF files: <a href="https://github.com/GrammaTech/sel">link</a>; and C/C++ manipulation tooling: <a href="https://github.com/GrammaTech/clang-mutate">link</a>.

Here are a few other examples of existing work:
- <a href="http://diversify-project.eu/papers/Yeboah15.pdf">ECSELR</a>
- <a href="https://github.com/JerrySwan/JerrySwan.github.io/blob/master/publications/genofix-TR.pdf">Gen-O-Fix</a>
- <a href="https://squareslab.github.io/genprog-code/">GenProg Evolutionary Software Repair</a>
- <a href="https://github.com/codykenb/locoGP">locoGP</a>
- <a href="https://sourceforge.net/p/ugp3/wiki/GeneticImprovement/">MicroGP</a>
- <a href="http://www0.cs.ucl.ac.uk/staff/ucacbbl/gismo/">Software from the GISMOE Project via Bill Langdon</a> (see "Free Code")
- <a href="http://www.shinhwei.com/relifix.pdf">Relifix</a>
- Eric Schulte's work:
  - <a href="https://github.com/eschulte/goa">Genetic Optimization Algorithm (GOA)</a>
  - <a href="http://eschulte.github.io/software-evolution/index.html">Software Evolution Library</a>
  - <a href="https://github.com/eschulte/netgear-repair">Netgear Router Repair</a>
- <a href="https://people.cs.umass.edu/~brun/pubs/pubs/Ke15ase.pdf">SearchRepair</a>
- <a href="http://sourceforge.net/projects/trpautorepair/">TrpAutoRepair</a> (formerly known as RS Repair)
- <a href="https://github.com/bloa/magpie">Magpie: Machine Automated General Performance Improvement via Evolution of software</a> (for functional and non-functional properties)
- <a href="https://github.com/SpoonLabs/astor">ASTOR: A Program Repair Library for Java
</a>
- <a href="https://github.com/squaresLab/genprog4java/">JarFly: Java Repair Framework</a>
- <a href="https://github.com/prapr/prapr">PraPR: Practical Program Repair via Bytecode Mutation</a>
- <a href="https://github.com/oliver-krauss/amaru">Amaru - A framework for Genetic Improvement in Graal VM  with support for Mining Patterns from GI Experiments</a>


Other frameworks and libraries identified at the <a href="https://www.dagstuhl.de/en/program/calendar/semhp/?semnr=18052">Dagstuhl Seminar on Genetic Improvement of Software</a> held in January 2018:
- <a href="http://crest.cs.ucl.ac.uk/autotransplantation/downloads/muScalpel.zip">MuScalpel: automated software transplantation</a>
- <a href="https://github.com/STAMP-project/dspot">DSpot: a tool for Genetic Improvement  of test suites</a>
- <a href="https://github.com/coinse/pyggi"> PyGGI: Python General Framework for GI</a>
- <a href="https://github.com/yyxhdy/arja">ARJA: multi-objective automated program repair</a>
- <a href="https://github.com/eclipse/repairnator/">Repairnator</a>
- <a href="https://github.com/kayquesousa/astor4android">Astor4Android: program repair for Android Apps</a>


Other open source tools for the genetic improvement of non-functional software properties (Identified from the <a href="https://www.dagstuhl.de/en/program/calendar/semhp/?semnr=18052">literature review</a> by Zuo et al. at GECCO 2022:

- <a href="https://github.com/fabianishere/shadevolution">Genetic Programming for Shader Simplification</a>
- <a href="https://github.com/BobbyRBruce/DPT-OpenCV">Deep Parameter Optimisation in OpenCV</a>
- <a href="https://github.com/FanWuUCL/HOMI">HOMI</a>
- <a href="http://www0.cs.ucl.ac.uk/staff/ucacbbl/gggp/">GGGP</a>
- <a href="https://github.com/ffarzat/JavaScriptHeuristicOptmizer">Optimizer</a>
- Evolving Better Software Parameters: <a href="http://www.cs.ucl.ac.uk/staff/W.Langdon/ftp/gp-code/gi_cbrt.tar.gz"> download code </a>
- <a href="https://github.com/dornja/powergauge">PowerGAUGE</a>
- <a href="https://github.com/lioujheyu/gevo">GEVO</a>
- <a href="https://github.com/oliver-krauss/EuroGP2020-LookupTables">Automatically Evolving Lookup Tables for Function Approximation</a>
- <a href="https://github.com/michelalorandi/evolution_routing_protocol">Genetic Improvement of Routing Protocols for Delay Tolerant Networks</a>


<div class="alert alert-info" role="alert">
  <b>The data on this page is incomplete.</b> (you can help by <a href="{{ "/community/contribute" | relative_url }}">expanding it</a>)
</div> -->
