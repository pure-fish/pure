source $DIRNAME/../functions/_pure_set_default.fish

test "_pure_set_default: set my_var default value"
  'default_value' = (
    _pure_set_default my_var 'default_value'
    echo $my_var
  )
end

test "_pure_set_default: skip setting value if default already exists"
  'default_value' = (
    _pure_set_default my_var 'default_value'
    _pure_set_default my_var 'another_value'
    echo $my_var
  )
end
