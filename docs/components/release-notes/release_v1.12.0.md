title:	v1.12.0: Provide $pure_version variable
tag:	v1.12.0
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2019-01-08T14:41:25Z
published:	2019-01-08T14:43:56Z
url:	https://github.com/pure-fish/pure/releases/tag/v1.12.0
--
### Feature

You can see which version of `pure` you run, to help during debug (see #114):

    echo $pure_version

### Quality 

* test **all** [_conf.d/pure.fish_ configuration](https://github.com/rafaelrinaldi/pure/blob/master/tests/_pure.test.fish).
