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
		local box_icons = flatten_icons_spec({
			{
				icon = "__boxing-2__/graphics/icons/" .. type.name .. "-back.png",
				icon_size = 32,
				scale = 0.75,
				shift = {0, 4},
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
				scale = 0.75,
				shift = {0, 4},
			},
			{
				icon = "__boxing-2__/graphics/icons/arrow-down.png",
				icon_size = 32,
			},
		})
		local unbox_icons = util.table.deepcopy(box_icons)
		table.remove(unbox_icons)
		table.insert(unbox_icons, {icon = "__boxing-2__/graphics/icons/arrow-up.png"})
		data:extend({
			{
				type = "recipe",
				name = type.name .. "-box-" .. item.name,
				localised_name = {"recipe-name.box-*", {"item-name." .. item.name}},
				icons = box_icons,
				icon_size = 32,
				energy_required = 2,
				category = "boxing-" .. type.name,
				subgroup = "boxing-" .. type.name .. "-" .. item.subgroup,
				order = item.order,
				ingredients = {
					{item.name, item.stack_size},
					{type.name .. "-box", 1},
				},
				result = type.name .. "-box-of-" .. item.name,
				enabled = false,
				allow_as_intermediate = false,
			},
			{
				type = "recipe",
				name = type.name .. "-unbox-" .. item.name,
				localised_name = {"recipe-name.unbox-*", {"item-name." .. item.name}},
				icons = unbox_icons,
				icon_size = 32,
				energy_required = 2,
				category = "boxing-" .. type.name,
				subgroup = "unboxing-" .. type.name .. "-" .. item.subgroup,
				order = item.order,
				ingredients = {
					{type.name .. "-box-of-" .. item.name, 1},
				},
				results = {
					{type="item", name=item.name, amount=item.stack_size},
					{type="item", name=type.name .. "-box", amount=1},
				},
				enabled = false,
				allow_as_intermediate = false,
			},
		});
		table.insert(boxing.unlocks[type.name], {
			type = "unlock-recipe",
			recipe = type.name .. "-box-" .. item.name,
		});
		table.insert(boxing.unlocks[type.name], {
			type = "unlock-recipe",
			recipe = type.name .. "-unbox-" .. item.name,
		});
	end
end
