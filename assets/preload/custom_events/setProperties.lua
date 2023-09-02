function onEvent(name, value1, value2)
    if name == 'setProperties' then
        setProperty(value1, value2);
    end
end