local letters = "abcdefghijklmnopqrstuvwxyz"

for i,type in pairs(boxing.types) do
	data:extend({
		{
			type = "item",
			name = type.name .. "-box",
			icon = "__boxing-2__/graphics/icons/" .. type.name .. "-32.png",
			icon_size = 32,
			subgroup = "boxing-boxes",
			order = letters:sub(i, i) .. "[" .. type.name .. "]",
			stack_size = type.stack_size,
		},
	});
end
