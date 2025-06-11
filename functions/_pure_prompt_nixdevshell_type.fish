function _pure_prompt_nixdevshell_type \
    --description "Indicates the nix shell type" # Ported from starship project ❤️ https://github.com/starship/starship/blob/9ab8b84ea6cd40f83a34836111c6bda2203dccfe/src/modules/nix_shell.rs#L15-L40

    if set --query IN_NIX_SHELL
        echo $IN_NIX_SHELL
    else if string match --regex --quiet -- "/nix/store" $PATH
        # glob pattern seems to be broken in fish?, therefore using regex
        echo unknown
    end
end
