function _pure_uninstall --on-event pure_uninstall
    set --names \
        | string replace --filter --regex '(^_?pure)' 'set --erase $1' \
        | source
end
