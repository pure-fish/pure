## Build

```sh
docker build \
      --file ./nix.Dockerfile \
      --tag=pure-on-nix \
      ./
```

## Run

```sh
docker run \
    --interactive \
    --tty \
    --rm \
    --volume=(pwd):/tmp/.pure/ \
    pure-on-nix
    fish
```

## Tests

A failing test

```sh
docker run \
    --interactive \
    --tty \
    --rm \
    --volume=(pwd):/tmp/.pure/ \
    pure-on-nix \
    "tests/_pure_prefix_root_prompt.test.fish"
```
