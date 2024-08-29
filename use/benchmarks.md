---
active: use
---

## Can you suggest good GI Benchmarks?

GI-improved test subjects with test cases:
- [http://www0.cs.ucl.ac.uk/staff/ucacbbl/gismo/](http://www0.cs.ucl.ac.uk/staff/ucacbbl/gismo/) (see Free Code heading)
- [http://www.cs.ucl.ac.uk/staff/W.Langdon/gggp/#code](http://www.cs.ucl.ac.uk/staff/W.Langdon/gggp/#code) (see Free Code heading)
- [http://crest.cs.ucl.ac.uk/autotransplantation/downloads/artifact.html](http://crest.cs.ucl.ac.uk/autotransplantation/downloads/artifact.html)

(several frameworks also come with benchmarks, please see GI frameworks above)

Automated program repair, bug repositories:
- [http://repairbenchmarks.cs.umass.edu/](http://repairbenchmarks.cs.umass.edu/)
- [http://program-repair.org/benchmarks.html](http://program-repair.org/benchmarks.html)
- [http://groups.csail.mit.edu/pac/patchgen/](http://groups.csail.mit.edu/pac/patchgen/)

Benchmarks identified at the [Dagstuhl Seminar on Genetic Improvement of Software](https://www.dagstuhl.de/en/program/calendar/semhp/?semnr=18052):
- Parsec: [http://parsec.cs.princeton.edu/](http://parsec.cs.princeton.edu/)
- SPEC INT: [https://www.spec.org/benchmarks.html](https://www.spec.org/benchmarks.html)

Additional benchmarks identified from the [survey](https://arxiv.org/abs/2212.08540) by Blot et al. on benchmarks for GI of non-functional properties. A more detailed overview is available at: [benchmarks](https://bloa.github.io/nfunc_survey/).

Search by benchmark name.

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
  Showing <span id="counter">{{ site.data.benchmarks.size }}</span> of {{ site.data.benchmarks.size }} entries.
</div>

<table id="benchmarks" class="table table-responsive benchmarks" style="max-width: 100%">
  <thead>
    <tr>
      <th>Name</th>
      <th>Link</th>
    </tr>
  </thead>
  <tbody>{% for entry in site.data.benchmarks %}
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




<!-- - [ACLib](http://aclib.net/)
- AMD SDK
- [Angha](https://github.com/brenocfg/AnghaBench)
- [benchFFTW](https://github.com/FFTW/benchfft)
- blas
- [cBench](https://github.com/aorogat/CBench)
- CHAOS
- [Chisel](https://github.com/aspire-project/chisel-bench)
- [Coreutils](https://github.com/coreutils/coreutils)
- CUDA SDK
- [DaCapo](https://github.com/dacapobench/dacapobench)
- [DENBench](https://www.eembc.org/denbench/)
- [Dhrystone](https://github.com/sifive/benchmark-dhrystone)
- DSPstone
- eispack
- F-Droid
- [FDTD](https://github.com/Sable/fdtd-benchmark)
- FMM
- Fontana
- [GPGPU-Sim](https://github.com/gpgpu-sim/ispass2009-benchmarks)
- Grinder
- Habanero-Java
- [hompack](https://github.com/jacobwilliams/HOMPACK90)
- Honeywell
- Jade
- JavaBenchmarkEmbedded
- [Java Grande](https://github.com/sparkoo/Java-Grande-JMH)
- JetStream
- JSTAMP
- Livermore Loops
- LoneStar
- Malardalen
- MediaBench
- [MGMRES](https://github.com/NORCE-Energy/mgmres)
- [MiBench](https://github.com/embecosm/mibench)
- MPEG-1
- MySQL
- NAS
- NERSC
- Nginx
- Nvidia SDK
- nwchem
- [Octane](https://github.com/chromium/octane)
- [Olden](https://github.com/compor/olden)
- [Parboil](http://impact.crhc.illinois.edu/parboil/parboil.aspx)
- PARMS
- PeleC
- Perfect Club
- Perl Oasis
- PhysicsBench
- [PolyBench](https://github.com/MatthiasJReisinger/PolyBenchC-4.2.1)
- Polyhedron
- [RAJAPerf](https://github.com/LLNL/RAJAPerf)
- RawBench
- RiCeps
- Rodinia
- Scala DaCapo
- [SHOC](https://github.com/vetter/shoc)
- [SIR](https://github.com/gstonge/SIR-benchmark)
- SNU-RT
- [SparseBench](https://github.com/idharmateja/sparse-bench)
- SPECjbb
- [SPECjvm](https://github.com/connorimes/SPECjvm2008)
- [Spike](https://github.com/lzrvch/spikebench)
- [SPLASH](https://github.com/SakalisC/Splash-3)
- SunSpider
- [UTDSP](https://www.eecg.toronto.edu/~corinna/DSP/infrastructure/UTDSP.html)
- Wetstone

<div class="alert alert-info" role="alert">
  <b>The data on this page is incomplete.</b> (you can help by <a href="{{ "/community/contribute" | relative_url }}">expanding it</a>)
</div> -->
