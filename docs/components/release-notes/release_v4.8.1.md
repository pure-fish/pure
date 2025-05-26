title:	v4.8.1: Add color customization to kubernestes symbol
tag:	v4.8.1
draft:	false
prerelease:	false
author:	edouard-lopez
created:	2023-09-26T12:47:29Z
published:	2023-09-26T12:56:59Z
url:	https://github.com/pure-fish/pure/releases/tag/v4.8.1
--

## What's Changed

* refactor k8s support #330 

### :art:  New config in conf.d/pure.fish

```fish
_pure_set_default pure_color_k8s_symbol pure_color_dark
```

### Usage

```fish
set --universal pure_enable_k8s true # enable the featyre
set --universal pure_color_k8s_symbol cyan # customize color
```

### Preview

![image](https://github.com/pure-fish/pure/assets/1212392/6cc3f516-af77-4a63-9d41-60ad13336996)

## :clap: Thanks

* @bobsoppe for spotting the gap and submitting the PR
