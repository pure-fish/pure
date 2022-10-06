# Migrate variable to 4.0.0
# Usage:
#     ❯ tools/migration-to-4.0.0.fish
#     ❯ tools/migration-to-4.0.0.fish /path/to/my/config.fish

set fish_user_config $HOME/.config/fish/config.fish
if set --query argv[1]
    set fish_user_config $argv[1]
end
printf "%sMigrating configuration: $fish_user_config\n"

printf (set_color cyan)"Renaming SSH variables\n"(set_color normal)
sed 's/pure_color_ssh_hostname/pure_color_hostname/g' $fish_user_config > $fish_user_config.new #; grep -c 'pure_color_ssh_host' $fish_user_config
mv $fish_user_config.new $fish_user_config # for portability with MacOS
sed 's/pure_color_ssh_separator/pure_color_at_sign/g' $fish_user_config > $fish_user_config.new #; grep -c 'pure_color_ssh_root' $fish_user_config
mv $fish_user_config.new $fish_user_config # for portability with MacOS
sed 's/pure_color_ssh_user_normal/pure_color_username_normal/g' $fish_user_config > $fish_user_config.new #; grep -c 'pure_color_ssh_separator' $fish_user_config
mv $fish_user_config.new $fish_user_config # for portability with MacOS
sed 's/pure_color_ssh_user_root/pure_color_username_root/g' $fish_user_config > $fish_user_config.new #; grep -c 'pure_color_ssh_username' $fish_user_config
mv $fish_user_config.new $fish_user_config # for portability with MacOS
