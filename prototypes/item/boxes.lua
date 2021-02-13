local letters = "abcdefghijklmnopqrstuvwxyz"

for i,type in pairs(boxing.types) do
	data:extend({
		{
			type = "item",
			name = type.name .. "-box",
			icon = "__boxing-2__/graphics/icons/" .. type.name .. "-64.png",
			icon_size = 64,
			subgroup = "boxing-boxes",
			order = letters:sub(i, i) .. "[" .. type.name .. "]",
			stack_size = type.stack_size * settings.startup["empty-box-multiplier"].value,
		},
	});
end
