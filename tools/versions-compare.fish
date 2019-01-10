set --global fail 1
set --global success 0

function fish_version_below \
    --description "Compare versions.  By default this tests \$FISH_VERSION, but if a second argument is provided it tests against that version." \
    --argument-names expected actual

	if test -z "$actual"
		set actual $FISH_VERSION
	end

    if test $expected = $actual
        return $fail
    end

	printf '%s\n' $actual $expected | sort --check=silent --version-sort
    and printf "%sonly fish <%s: %s" (set_color blue) $expected (set_color normal)

	return $status
end

function fish_version_at_least \
    --description "Compare versions.  By default this tests \$FISH_VERSION, but if a second argument is provided it tests against that version." \
    --argument-names expected actual

    not fish_version_below $argv >/dev/null
    and printf "%sonly fish ≥%s: %s" (set_color blue) $expected (set_color normal)

    return $status
end