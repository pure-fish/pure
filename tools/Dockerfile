# Description
#   Used to test the installer script

FROM ohmyfish/fish

USER root
RUN apk add --no-cache \
    coreutils \
    curl 

COPY . /pure/

USER nemo
WORKDIR /pure/

RUN curl \
    --location \
    --output $HOME/.config/fish/functions/fisher.fish \
    --create-dirs \
    git.io/fisherman \
    && fish -c 'fisher install fishtape'

CMD ["fish", "-c", "fishtape tests/installer.test.fish"]