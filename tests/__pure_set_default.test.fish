source $DIRNAME/../functions/__pure_set_default.fish

test "set my_var default value"
  'default_value' = (
    __pure_set_default my_var 'default_value'
    echo $my_var
  )
end

test "skip setting value if default already exists"
  'default_value' = (
    __pure_set_default my_var 'default_value'
    __pure_set_default my_var 'another_value'
    echo $my_var
  )
end
