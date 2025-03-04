export type Properties = {
    [string]: any
}

export type Child = {
    className: string,
    properties: Properties?,
    children: {Child}?
}

local function make(className: string, properties: Properties): Instance
    local instance = Instance.new(className)

    for property, value in pairs(properties) do
        if instance:IsA("Instance") and instance[property] ~= nil then
            local expected = typeof(instance[property])
            if expected == typeof(value) then
                instance[property] = value
            else
                warn(string.format("Type mismatch for property %s: Expected %s but got %s", property, expected, typeof(value)))
            end
        end
    end

    if properties["Parent"] then
        instance.Parent = properties["Parent"]
    end

    return instance
end

function process(className: string, properties: Properties, children: {Child}?): Instance
    local instance = make(className, properties)

    if children then
        for _, child in ipairs(children) do
            if typeof(child) == "Instance" then
                child.Parent = instance
            elseif typeof(child) == "table" then
                local childInstance = process(child.className, child.properties, child.children)
                childInstance.Parent = instance
            else
                warn("Invalid child type: expected 'Instance' or 'table', got " .. typeof(child))
            end
        end
    end

    return instance
end

return process