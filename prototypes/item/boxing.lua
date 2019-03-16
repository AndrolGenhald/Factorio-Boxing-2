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
				icons = flatten_icons_spec({
					{
						icon = "__boxing-2__/graphics/icons/" .. type.name .. "-back.png",
						icon_size = 32
					},
					{
						icon = icon,
						icon_size = 32,
						scale = 0.5,
						shift = {5, -3},
					},
					{
						icon = icon,
						icon_size = 32,
						scale = 0.5,
						shift = {-3, -5},
					},
					{
						icon = icon,
						icon_size = 32,
						scale = 0.5,
						shift = {0, -8},
					},
					{
						icon = "__boxing-2__/graphics/icons/" .. type.name .. "-front.png",
						icon_size = 32,
					},
				}),
				icon_size = 32,
				subgroup = "boxing-" .. type.name .. "-" .. item.subgroup,
				order = item.order,
				stack_size = type.stack_size,
			},
		})
	end
end
