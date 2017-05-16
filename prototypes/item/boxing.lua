require("util")

for i,type in pairs(boxing.types) do
	for j,item in pairs(boxing.items) do
		local icon
		if item.icon then
			icon = item.icon
		elseif item.icons then
			icon = item.icons
		else
			icon = "__boxing-2__/graphics/icons/question-mark-32.png"
		end
		data:extend({
			{
				type = "item",
				name = type.name .. "-box-of-" .. item.name,
				localised_name = {
					"item-name.*-of-*",
					{"item-name." .. type.name .. "-box"},
					{"item-name." .. item.name},
				},
				flags = {"goes-to-main-inventory"},
				icons = flatten_icons_spec({
					{
						icon = "__boxing-2__/graphics/icons/" .. type.name .. "-back.png",
					},
					{
						icon = icon,
						scale = 0.5,
						shift = {5, -3},
					},
					{
						icon = icon,
						scale = 0.5,
						shift = {-3, -5},
					},
					{
						icon = icon,
						scale = 0.5,
						shift = {0, -8},
					},
					{
						icon = "__boxing-2__/graphics/icons/" .. type.name .. "-front.png",
					},
				}),
				subgroup = "boxing-" .. type.name .. "-" .. item.subgroup,
				order = item.order,
				stack_size = type.stack_size,
			},
		})
	end
end
