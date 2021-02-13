for i,type in pairs(boxing.types) do
	for j,item in pairs(boxing.items) do
		local icon, size, scale
		scale = 1
		if item.icon then
			icon = item.icon
			size = item.icon_size
		elseif item.icons then
			-- This is a bit confusing due to https://forums.factorio.com/viewtopic.php?p=434010#p434010
			-- The item's icon is scaled from whatever the first icon spec has to 1, so if the first icon has icon_size
			-- 64 and scale .25, it'll actually scale the icon x.25, do the rest of the icons, the at the end scale the
			-- whole thing up so the first icon has scale 1. This makes the rest of the icons scale up x4. When we're
			-- then using it not as the first icon, it'll actually be scaled at .25 already, so we need to scale it back
			-- up ourselves, which means multiplying by 1/scale.
			icon = item.icons
			size = item.icon_size
			if size == nil then
				if item.icons[1].icon_size == nil then
					size = 32
				else
					size = item.icons[1].icon_size
					if item.icons[1].scale ~= nil then
						scale = 1 / item.icons[1].scale
					end
				end
			end
		else
			icon = "__boxing-2__/graphics/icons/question-mark-32.png"
			size = 32
		end
		scale = 64 / size * 0.5 * scale
		local box_icons = flatten_icons_spec({
			-- Fix scaling issue: https://forums.factorio.com/viewtopic.php?p=434010#p434010
			{
				icon = "__boxing-2__/graphics/icons/transparent-64.png",
				icon_size = 64,
				scale = 1,
			},
			{
				icon = "__boxing-2__/graphics/icons/" .. type.name .. "-back.png",
				icon_size = 64,
				scale = 0.75,
				shift = {0, 8},
			},
			{
				icon = icon,
				icon_size = size,
				scale = scale,
				shift = {0, -16},
			},
			{
				icon = "__boxing-2__/graphics/icons/" .. type.name .. "-front.png",
				icon_size = 64,
				scale = 0.75,
				shift = {0, 8},
			},
			{
				icon = "__boxing-2__/graphics/icons/arrow-down.png",
				icon_size = 64,
			},
		})
		local unbox_icons = util.table.deepcopy(box_icons)
		unbox_icons[#unbox_icons].icon = "__boxing-2__/graphics/icons/arrow-up.png"
		data:extend({
			{
				type = "recipe",
				name = type.name .. "-box-" .. item.name,
				localised_name = {"recipe-name.box-*", {"item-name." .. item.name}},
				icons = box_icons,
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
