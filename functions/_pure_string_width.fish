function _pure_string_width
    echo (string length (string replace -ra '\e\[[^m]*m' '' $argv[1]))
end
