title:	v1.10.0: Alt ←/→, Refactor
tag:	v1.10.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2018-12-12T22:44:30Z
published:	2018-12-14T14:44:13Z
url:	https://github.com/pure-fish/pure/releases/tag/v1.10.0
--
* [x] Refactor prompt code #68 
  * [ ] tests are on their way #96
* [x] First line isn't rendered on Terminal.app open in macOS #67 
* [x] Working Directory not printed on first run #62 
* [x] Update first line on "Alt + ←" and "Alt + →" #66 
* [x] skip defining hostname on fish `3.x` #98 
* [x] new code convention described in [CONTRIBUTING.md](https://github.com/rafaelrinaldi/pure/blob/master/CONTRIBUTING.md): 
  * private entities are prefix with `_pure_`
  * public entities are prefix with `pure_`

Code refactoring help us introduce a [lots of tests](https://github.com/rafaelrinaldi/pure/tree/master/tests) and better project structure for upcoming `2.0.0`.

Thanks to: @comfortablynick and @schrodincat for his multiple PRs :+1: 
