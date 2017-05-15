local letters = "abcdefghijklmnopqrstuvwxyz"

for i,type in pairs(boxing.types) do
	data:extend({
		{
			type = "item",
			name = type.name .. "-box",
			flags = {"goes-to-main-inventory"},
			icon = "__boxing-2__/graphics/icons/" .. type.name .. "-32.png",
			subgroup = "boxing-boxes",
			order = letters:sub(i, i) .. "[" .. type.name .. "]",
			stack_size = type.stack_size,
		},
	});
end
