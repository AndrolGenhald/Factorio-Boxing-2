require("util")

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
						icon_size = 64
					},
					{
						icon = icon,
						icon_size = size,
						scale = scale,
						shift = {10, -6},
					},
					{
						icon = icon,
						icon_size = size,
						scale = scale,
						shift = {-6, -10},
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
					},
				}),
				subgroup = "boxing-" .. type.name .. "-" .. item.subgroup,
				order = item.order,
				stack_size = type.stack_size,
			},
		})
	end
end
