gpbib = File.read('gp-bibliography.bib')
data = gpbib.split(/^\s*@(?=\S+{)/)
data.reject! {|chunk|  }

out = []

for chunk in data
  next unless chunk =~ /((?:genetic|software)\s*improvement|gismo|program\s*repair)/mi
  # next unless chunk =~ /(genetic\s*improvement|gismo)/mi
  # if chunk =~ /^\s*Misc/
  #   warn chunk
  #   gets
  # end
  # next if chunk =~ /^\s*Misc/
  # next unless chunk =~ /author\s*=/

  venue = nil

  case chunk[/^(.*?){/, 1]
  when 'Article'
    type = 'Journal'
  when 'Book'
    type = 'Book'
  when 'InCollection'
    type = 'Collection'
  when 'InProceedings'
    if chunk[/^\s*note.*=.*invited keynote/i]
      type = 'Keynote'
    else
      type = 'Conference'
    end
  when 'PhdThesis'
    type = 'PhdThesis'
  when 'Proceedings'
    next
  when 'TechReport'
    type = 'TechReport'
  when 'Misc'
    case chunk
    when /^\s*howpublished\s*=\s*"(.*?blog.*?)",\s*$/i
      type = 'Web'
      venue = $1
    when /^\s*url\s*=\s*"(.*?code.fb.com.*?)",\s*$/i
      type = 'Web'
      venue = 'Facebook'
    when /^\s*howpublished.*arxiv/i
      type = 'Archive'
      venue = 'ArXiV'
    when /^\s*note.*invited keynote/i
      type = 'Keynote'
      venue = chunk[/^\s*howpublished\s*=\s*"(.*?)"\s*,\s*$/m, 1]&.gsub(/[\n\s]+/m, ' ')
    when /^\s*url.*arxiv\.org/i
      type = 'Archive'
      venue = 'ArXiV'
    else
      warn chunk
      next
    end
  else
    # warn chunk[/^(.*?){/, 1]
    # exit
    type = nil
  end
  key = chunk[/{([^,]+),/, 1]

  # chunk.gsub!(/^\s*(?:address|pages|month|publisher|publisher_address|size|isbn13)\s*=.*?,\s*$/, '')
  # chunk.gsub!(/^\s*(?:abstract|editor|keywords|notes)\s*=\s*".*?",\s*$/m, '')
  chunk.gsub!("\n\n", "\n")
  chunk.gsub!(/\\cite\{(.*?)\}/, '[\1]')
  chunk.gsub!(/[{}]/, '')
  chunk.gsub!('\\&', '&')
  # warn("="*80)
  # warn chunk

  chunk.gsub!(/{?\\"{?[aeiouyAEIOUY]}?}?/) {|s| s.scan(/\w/)[0].tr('aeiouyAEIOUY', 'äëïöüÿÄËÏÖÜŸ')}

  title = chunk[/^\s*title\s*=\s*"(.*?)"\s*,\s*$/m, 1]&.gsub(/[\n\s]+/m, ' ')&.gsub('"', '\\"')
  authors = chunk[/^\s*author\s*=\s*"(.*?)"\s*,\s*$/m, 1].gsub(/[\n\s]+/m, ' ').split(' and ')
  venue ||= chunk[/^\s*booktitle\s*=\s*"(.*?)"\s*,\s*$/m, 1]&.gsub(/[\n\s]+/m, ' ')
  venue ||= chunk[/^\s*journal\s*=\s*"(.*?)"\s*,\s*$/m, 1]&.gsub(/[\n\s]+/m, ' ')
  venue ||= ''
  year = chunk[/^\s*year\s*=\s*"(.*?)"\s*,\s*$/, 1]&.gsub(/[\n\s]+/m, ' ')
  year ||= ''
  abstract = chunk[/^\s*abstract\s*=\s*"(.*?)"\s*,\s*$/m, 1]&.gsub(/[\n\s]+/m, ' ')&.gsub('"', '\\"')&.gsub(/([^\\])(\\)([^\\])/, '\1\2\2\3')
  doi = chunk[/^\s*doi\s*=\s*"(.*?)"\s*,\s*$/im, 1]&.gsub(/[\n\s]+/m, ' ')
  keywords = chunk[/^\s*keywords\s*=\s*"(.*?)"\s*,\s*$/m, 1]&.gsub(/[\n\s]+/m, ' ')
  # warn keywords.split(',').sort
  tags = []
  tags << 'AI' if keywords =~ /artificial intelligence/i
  tags << 'APR' if keywords =~ /program repair/i or keywords =~ /APR/
  tags << 'GISMO' if keywords =~ /gismo/i
  tags << 'LLM' if title =~ /language model/i or title =~ /LLM/ or keywords =~ /language model/i or keywords =~ /LLM/
  tags << 'ML' if keywords =~ /machine learning/i
  tags << 'SBSE' if keywords =~ /(search.based software|sbse)/i
  tags << 'testing' if keywords =~ /(testing| test )/i or title =~ /testing/i
  tags << 'survey' if chunk =~ /survey/i
  tags << 'PyGGI' if title =~ /PyGGI/i or abstract =~ /PyGGI/i or keywords =~ /PyGGI/i or chunk =~ /coinse\/pyggi/
  tags << 'Magpie' if title =~ /magpie/i or abstract =~ /magpie/i or keywords =~ /magpie/i
  urls = chunk.scan(/^\s*(?:|code_)url\s*=\s*"(.*?)"\s*,\s*$/i).map(&:first)
  video_urls = chunk.scan(/^\s*video_url\s*=\s*"(.*?)"\s*,\s*$/i).map(&:first)
  slides_urls = chunk.scan(/^\s*slides_url\s*=\s*"(.*?)"\s*,\s*$/i).map(&:first)
  slides_urls += chunk.scan(/slides:?\s*(http\S*?\.pdf)/i)

  out << {key: key, title: title, authors: authors, venue: venue, type: type, year: year, abstract: abstract, doi: doi, tags: tags.uniq, urls: urls, pdfs: [], video: video_urls, slides: slides_urls}
end

out.each do |h|
  case h[:venue]
  when 'Wired.co.uk',
       'The Conversation',
       'ars technica UK'
    h[:type] = 'Web'

  when /APR@ICSE/, /APR @ ICSE/, /\(APR'22\)/, /International Workshop on Automated Program Repair/
    h[:venue] = 'APR@ICSE'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /Workshop on Binary Analysis Research/i
    h[:venue] = 'BAR'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /Workshop on Software Development Lifecycle for Mobile/i
    h[:venue] = 'DeMobile'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /Dependable Systems and Networks Workshops?/i
    h[:venue] = 'DSN-W'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /Evolutionary Computation in Computational Biology/i
    h[:venue] = 'ECCSB'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /GECCO.* Workshop on Evolutionary Computation Software Systems/i
    h[:venue] = 'EvoSoft@GECCO'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /Semantic Methods in Genetic Programming/i
    h[:venue] = 'SMGP'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /workshop on evolutionary computation for the automated design of algorithms/i
    h[:venue] = 'ECADA@GECCO'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /Workshops on Foundations and Applications of Self\* Systems/i
    h[:venue] = 'FAS*W'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /workshop on Future of software engineering research/i
    h[:venue] = 'FoSER'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when 'Genetic Improvement 2015 Workshop',
       'Genetic Improvement 2016 Workshop',
       'GI-2017', /GI @ GECCO/
    h[:venue] = 'GI@GECCO'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when 'GI-2018, ICSE workshops proceedings',
       'GI-2019, ICSE workshops proceedings',
       /2021 .* Workshop on Genetic Improvement/,
       /Genetic Improvement @ICSE/,
       /GI @ ICSE/
    h[:venue] = 'GI@ICSE'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /workshop on Graph-based Genetic Programming/i
    h[:venue] = 'GGP@GECCO'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /Workshop on General Purpose Process(or|ing) Using (Graphics Processing Units|GPU)/i
    h[:venue] = 'GPGPU'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /Workshop on Intelligent Bug Fixing/i
    h[:venue] = 'IBF'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /International Workshop on Empirical Software Engineering in Practice/i
    h[:venue] = 'IWESEP'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /International Workshop, NSV 2020/i
    h[:venue] = 'NSV'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /Large Language Models for and with Evolutionary Computation Workshop/
    h[:venue] = 'LLMfwEC@GECCO'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'
  when /Workshop On Approximate Computing/i
    h[:venue] = 'WAPCO'
    h[:type] = 'Workshop' if h[:type] != 'Keynote'

  when /Autonomic Computing and Self-Organizing Systems Compagnion/i
    h[:venue] = 'ACSOS-C'
  when /Autonomic Computing and Self-Organizing Systems/i
    h[:venue] = 'ACSOS'
  when /Conference on Adaptive Hardware and Systems/i
    h[:venue] = 'AHS'
  when /Conference on Artificial Life/i, /Artificial Life Conference/i
    h[:venue] = 'ALIFE'
  when /Asia-Pacific Software Engineering Conference/i
    h[:venue] = 'APSEC'
  when /Architectural Support for Programming Languages and Operating Systems/i
    h[:venue] = 'ASPLOS'
  when /International Conference on Automated Software Engineering/i
    h[:venue] = 'ASE'
  when /Conference on Computer and Communications Security/i
    h[:venue] = 'CCS'
  when /Congress on Evolutionary Computation/i
    h[:venue] = 'CEC'
  when 'GI @ CEC 2020 Special Session'
    h[:venue] = 'CEC'
    h[:type] = 'Session'
  when /Complex Systems Digital Campus/i
    h[:venue] = 'CS-DC'
  when /International Conference on Dependable Systems and Networks/i
    h[:venue] = 'DSN'
  when /Evaluation and Assessment in Software Engineering/i
    h[:venue] = 'EASE'
  when /International Conference on Embodied Intelligence/i
    h[:venue] = 'EI'
  when /EuroGP/, /European Conference on Genetic Programming/i
    h[:venue] = 'EuroGP'
  when /(Joint Meeting|European Software Engineering Conference).* Foundations of Software Engineering/i
    h[:venue] = 'ESEC/FSE'
  when /ESEC\/FSE/
    h[:venue] = 'ESEC/FSE'
  when /European Conference on the Applications of Evolutionary Computation/i, /EvoApplications/
    h[:venue] = 'EvoAPPS'
  when /International Conference on the Applications of Evolutionary Computation/i
    h[:venue] = 'EvoSET'
  when /Evostar 2025 Late breaking abstracts/i
    h[:venue] = 'EvoStar-LBA'
  when /FoSE post conference proceedings/
    h[:venue] = 'FoSE'
  when /(International Symposium on( the)? )?Foundations of Software Engineering/i
    h[:venue] = 'FSE'
  when /Global Conference on Consumer Electronics/
    h[:venue] = 'GCCE'
  when /Companion.*Genetic and Evolutionary Computation Conference/i,
       /Companion.*Conference on Genetic and Evolutionary Computation/i,
       /Genetic and Evolutionary Computation Conference.*Companion/i,
       /Conference on Genetic and Evolutionary Computation.*Companion/i,
       /GECCO.*companion/
    h[:venue] = 'GECCO-comp'
  when /Genetic and Evolutionary Computation Conference/i,
       /Conference on Genetic and Evolutionary Computation/i
    h[:venue] = 'GECCO'
  when /Genetic Programming 1996/
    h[:venue] = 'GP'
  when /Genetic Programming Theory and Practice/i
    h[:venue] = 'GPTP'
  when /Symposium on High Performance Computer Architecture/i
    h[:venue] = 'HPCA'
  when /Artificial Intelligence and Smart (Systems|Energy)/i # yes really
    h[:venue] = 'ICAIS'
  when /Artificial Intelligence and Soft Computing/i
    h[:venue] = 'ICAISC'
  when /International Conference on Computational and Information Sciences/i
    h[:venue] = 'ICCIS'
  when /Companion.*International Conference on Software Engineering/i,
       /International Conference on Software Engineering.*Companion/i
    h[:venue] = 'ICSE-comp'
  when /International Conference on Software Engineering/i
    h[:venue] = 'ICSE'
  when /International Conference on Software Maintenance/i
    h[:venue] = 'ICSM'
  when /(International|IEEE) Conference on Software Testing/i
    h[:venue] = 'ICST'
  when /International Symposium on Workload Characterization/i
    h[:venue] = 'IISWC'
  when /International Symposium on System and Software Reliability/i
    h[:venue] = 'ISSSR'
  when /International Symposium on Software Testing and Analysis/i
    h[:venue] = 'ISSTA'
  when /International Instrumentation and Measurement Technology Conference/i
    h[:venue] = 'I2MTC'
  when /Conference on Knowledge Management in Organizations/i
    h[:venue] = 'KMO'
  when /Korea Software Congress/i
    h[:venue] = 'KSC'
  when /International Conference on Managed Languages and Runtimes/i
    h[:venue] = 'ManLang'
  when /International Conference on Soft Computing/i
    h[:venue] = 'MENDEL'
  when /Conference on Mobile and Ubiquitous Systems/i
    h[:venue] = 'MobiQuitous'
  when /National Aerospace and Electronics Conference/i
    h[:venue] = 'NAECON'
  when /Network and Distributed System Security Symposium/i
    h[:venue] = 'NDSS'
  when /Conference on Parallel Architectures and Compilation/i
    h[:venue] = 'PACT'
  when /Conference on Programming Language Design and Implementation/
    h[:venue] = 'PLDI'
  when /Parallel Problem Solving from Nature/i
    h[:venue] = 'PPSN'
  when /International Conference on Software Quality, Reliability and Security Companion/i
    h[:venue] = 'QRS-C'
  when /Soci.* Fran.*aise de Recherche Op.*rationnelle et d'Aide .* la D.*cision/
    h[:venue] = 'ROADEF'
  when 'Search-Based Software Testing'
    h[:venue] = 'SBST'
  when /Conference on Source Code Analysis and Manipulation/i
    h[:venue] = 'SCAM'
  when /Symposium on Software Engineering for Adaptive and Self-Managing Systems/i
    h[:venue] = 'SEAMS'
  when /International Conference on Signal Processing and Integrated Networks/i
    h[:venue] = 'SPIN'
  when /Systems, Programming, Languages, and Applications: Software for Humanity/i
    h[:venue] = 'SPLASH'
  when /International Software Product Line/i
    h[:venue] = 'SPLC'
  when /International Conference on Software Analysis, Evolution,? and Reengineering/i
    h[:venue] = 'SANER'
  when /Symposium.* on Search[- ]Based Software Engineering/i,
       /SSBSE/
    h[:venue] = 'SSBSE'
  when /International Symposium on Symbolic and Numeric Algorithms for Scientific Computing/i
    h[:venue] = 'SYNASC'
  when /Working Conference on Reverse Engineering/i
    h[:venue] = 'WCRE'

  when 'Applied Sciences'
    h[:venue] = 'AS'
  when 'ACM Transactions on Architecture and Code Optimization'
    h[:venue] = 'ACM TACO'
  when 'ACM Transactions on Evolutionary Learning and Optimization'
    h[:venue] = 'ACM TELO'
  when /ACM Transactions on Software Engineering and Methodolog/
    h[:venue] = 'ACM TOSEM'
  when 'Expert Systems with Applications'
    h[:venue] = 'ESA'
  when 'Empirical Software Engineering'
    h[:venue] = 'ESE'
  when 'Genetic Programming and Evolvable Machines'
    h[:venue] = 'GPEM'
  when 'IEEE Transactions on Emerging Topics in Computational Intelligence'
    h[:venue] = 'IEEE TETCI'
  when 'IEEE Transactions on Evolutionary Computation'
    h[:venue] = 'IEEE TEVC'
  when 'IEEE Transactions on Software Engineering'
    h[:venue] = 'IEEE TSE'
  when /International Journal of Recent Trends in Engineering/
    h[:venue] = 'IJRTE'
  when 'Journal of Software Engineering Research and Development'
    h[:venue] = 'JSERD'
  when /SIGEVOlution/
    h[:venue] = 'SIGEVOlution'
  when 'SIGSOFT Software Engineering Notes'
    h[:venue] = 'SEN'
  end

  h[:authors_aka] = h[:authors].map do |author|
    case author
    when /Brad Alexander/
      'Bradley Alexander'
    when /Alexander (?:Edward Ian )?Brownlee/
      'Alexander E. I. Brownlee'
    when 'Bobby Bruce'
      'Bobby R. Bruce'
    when 'W. B. Langdon',
         'Bill Langdon'
      'William B. Langdon'
    when /Sae?mundur (?:O.|Oskar)? ?Haraldsson/
      'Saemundur O. Haraldsson'
    when /Penny? (Faulkner )?Rainford/
      'Penn Faulkner Rainford'
    when 'Christopher Steven Timperley'
      'Christopher Timperley'
    when 'Kenneth Peter Williams'
      'Kenneth P. Williams'
    when 'John Woodward'
      'John R. Woodward'
    when 'Yuan Yuan2'
      'Yuan Yuan'
    else
      author
    end
  end

  tmp = h[:urls]
  h[:urls] = []
  tmp.each do |url|
    url.sub!(/d[lx].doi.org\/doi:/, 'doi.org/')
    url.sub!(/d[lx].doi.org/, 'doi.org')
    url.sub!(/doi.acm.org/, 'doi.org')
    case url
    when /arxiv\.org\/pdf/
      h[:pdfs] << (url[/\.pdf$/] ? url : url + '.pdf')
      url2 = url.sub(/.pdf$/, '').sub('.org/pdf', '.org/abs')
      h[:urls] << url2
    when /arxiv\.org\/abs/
      h[:urls] << url
      url2 = url.sub('.org/abs', '.org/pdf') + '.pdf'
      h[:pdfs] << url2
    when /\.pdf$/i
      h[:pdfs] << url
    when /doi\.org/
      h[:doi] = url
    when /acm\.org\/doi\//
      h[:doi] ||= url
    when /youtu\.be|youtube\.com/
      h[:video] << url
    when /\/videos\//
      h[:videos] << url
    when /slides[.\/]/
      h[:slides] << url
    else
      h[:urls] << url
    end
  end
  h[:urls].uniq!
  h[:pdfs].uniq!
  h[:video].uniq!
  h[:slides].uniq!

  case h[:doi]
  when /^http:(.*)/
    h[:doi] = 'https:%s'%$1
  when /^doi:(.*)/
    h[:doi] = 'https://doi.org/%s'%$1
  end

  h[:title].gsub!('\$', '$')
  if h[:abstract]
    if h[:venue] != 'GI@GECCO' and h[:venue] != 'GI@ICSE'
      h[:abstract] = nil
    else
      h[:abstract].gsub!('\\ldots', '...')
    end
  end
end


out = out.sort_by {|h| h[:title]}
out = out.sort_by {|h| h[:venue]}.reverse
out = out.sort_by {|h| h[:year].empty? ? '9999' : h[:year]}.reverse

for k in [
        # 'langdon:RN2001'
      ]
  out.delete_if {|h| h[:key] == key}
end

out.each do |h|
  puts '- key: "%s"'%h[:key]
  puts '  title: "%s"'%h[:title]
  puts '  authors:'
  h[:authors].zip(h[:authors_aka]).each do |(author, aka)|
    puts '    - name: %s'%author
    puts '      aka: %s'%aka if author != aka
  end
  puts '  venue: "%s"'%h[:venue] if h[:venue]
  puts '  year: %s'%h[:year] if h[:year]
  puts '  abstract: "%s"'%h[:abstract] if h[:abstract]
  puts '  type: %s'%h[:type] if h[:type]
  puts '  doi: %s'%h[:doi] if h[:doi] and h[:doi][0] == 'h'
  if h[:tags].size > 0
    puts '  tags:'
    h[:tags].each do |tag|
      puts '    - %s'%tag
    end
  end
  if h[:urls].size > 0
    puts '  urls:'
    h[:urls].uniq.each do |url|
      puts '    - %s'%url
    end
  end
  if h[:pdfs].size > 0
    puts '  pdfs:'
    h[:pdfs].uniq.each do |url|
      puts '    - %s'%url
    end
  end
  if h[:video].size > 0
    puts '  video:'
    h[:video].uniq.each do |url|
      puts '    - %s'%url
    end
  end
  if h[:slides].size > 0
    puts '  slides:'
    h[:slides].uniq.each do |url|
      puts '    - %s'%url
    end
  end
  puts
end
warn out.size

# p *out.select {|h| h[:type].nil? }.map {|h| h[:venue]}.sort.uniq
# p out.select {|h| h[:type].nil? }.map {|h| h[:venue]}.sort.uniq.size
