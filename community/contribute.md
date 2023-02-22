---
active: community
---

## Contributing

This is a _community_ website on Genetic Improvement.  
In practice this means two things:
first, that no single person is really responsible for maintaining it, especially regarding pages that are by nature incomplete (e.g., the [list of GI tools]({{ "/use/tools" | relative_url }}) or the [living survey]({{ "/learn/survey" | relative_url }})) or potentially subjective (e.g., the [GI success stories]({{ "/learn/success" | relative_url }})).
And second, that anyone, from student to professor, from researcher to practitioner, is _very_ welcome to contribute improving it.

This website is hosted on GitHub on a [public repository][public].
It uses [GitHub Pages][pages] for hosting, which in turns uses [Jekyll][] for page generation, [markdown][] for formatting, and finally [liquid][] for content automatisation.
Feel free to use GitHub to open [issue tickets][issues], fork the repository, and submit [pull requests][pulls].
Alternatively, you can also directly [contact us][contact].

[public]: https://github.com/geneticimprovementofsoftware/geneticimprovementofsoftware.github.io
[issues]: https://github.com/geneticimprovementofsoftware/geneticimprovementofsoftware.github.io/issues
[pulls]: https://github.com/geneticimprovementofsoftware/geneticimprovementofsoftware.github.io/pulls
[contact]: {{ "/community/website" | relative_url }}

[pages]: https://pages.github.com/
[jekyll]: https://jekyllrb.com/
[markdown]: https://daringfireball.net/projects/markdown/
[liquid]: https://github.com/Shopify/liquid/wiki


## Examples of welcomed contributions

Even the smallest of contribution will help the website and through it help the GI field altogether.  
While not limited to the following, do not hesitate to:
- fix typos or small visual bugs,
- report dead links or missing images,
- rephrase, rewrite, or update content,
- improve or fix the general design (especially for mobile devices).


## How to contribute

This section provides a short step-by-step on how to clone the repository and run Jekyll locally.
This can be particularly helpful when updating or contributing new content without having to wait for GitHub processing or alter the website live version with temporary incomplete modifications.

### Hosting the website locally

Before anything, make sure you have [Ruby][] installed, which should come (since Ruby version 1.9) by default with [RubyGem][], the Ruby third-party packaging tool.
You will need to install Jekyll and the `jekyll-seo-tag` gem and clone the repository before you can finally host the website locally.

[ruby]: https://www.ruby-lang.org/en/
[rubygem]: https://rubygems.org/

```bash
# setup
gem install jekyll
gem install jekyll-seo-tag
git clone https://github.com/geneticimprovementofsoftware/geneticimprovementofsoftware.github.io.git
# host
cd geneticimprovementofsoftware
jekyll serve
```

Jekyll should tell you which exact address to use, presumably [http://127.0.0.1:4000/]().  
Note that while hosting any page you are modifying will automatically regenerated.

You can now commit and push your modifications.
If you enable GitHub Pages on your own fork, you should be able to check the result live at the address [`https://{YOUR_USERNAME}.github.io/geneticimprovementofsoftware/`](https://bloa.github.io/geneticimprovementofsoftware/).
However for it to properly work you will also need to: **(on your own fork ONLY)**

1. delete the `CNAME` file (otherwise GitHub will email you a warning every push)
2. modify the `baseurl` attribute in `_config.yml` to `/geneticimprovementofsoftware` to make absolute links work (this will also change the local host address to [http://127.0.0.1:4000/geneticimprovementofsoftware/]()).

We recommend you to put these in a [separate commit](https://github.com/bloa/geneticimprovementofsoftware/commit/5195c1f3852913596cc8c026ecf92e7367dd4266), that you will need to rebase away before any pull request or push upstream.
Better even, configure GitHub Pages to target a branch different from `master`, and ensure that these two modifications are **NEVER** merged.
See ["Reordering Commits"](https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History) knowing that rewriting history, as long as it is done locally, or forcibly _to a branch not meant to be cloned_, is perfectly acceptable and even good practice.

Recommended process:

```bash
# first go to your GitHub Pages branch
git checkout serve
# run jekyll
jekyll serve
# modify the website, and check the local version in your browser
# when you're happy, add the modified files
git add YOUR_MODIFIED_FILES
# and commit
git commit -m "COMMIT_MESSAGE"
# rebase the aforementioned commit on top of the history (just reorder the lines)
git rebase -i master
# check that the order is correct (and note the id of the commit up to which to merge)
git log --graph --oneline --all
# you can now force-push the GitHub Pages branch
git push origin serve --force
# after waiting for GitHub to update, double-check in your browser
# go back to the master branch
git checkout master
# merge your modifications (BUT NOT THAT ONE COMMIT)
git merge THE_ID_FROM_BEFORE
# and push
git push origin master
# your fork is now ready for a pull request or an upstream merge
```


#### Useful resources

- Original markdown documentation: [https://daringfireball.net/projects/markdown/syntax]()
- GitHub markdown documentation: [https://guides.github.com/features/mastering-markdown/]()
- Liquid documentation: [https://shopify.github.io/liquid/]()
- Jekyll documentation: [https://jekyllrb.com/docs/]()
- Git documentation: [https://git-scm.com/]()
