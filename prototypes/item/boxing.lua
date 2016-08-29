for i,item in pairs(boxing.items) do
	local icon = item.icon;
	local mod = icon:sub(0, icon:find("/")-1);
	mod = mod:sub(3, -3);
	icon = icon:sub(icon:find("/")+1);

	local iconPath;
	if boxing.icons[mod] and boxing.icons[mod][icon] then
		iconPath = mod .. "/" .. icon;
	else
		iconPath = "unknown.png";
	end

	data:extend({
		{
			type = "item",
			name = "wooden-box-of-" .. item.name,
			localised_name = {
				"item-name.*-box-of-*",
				{"item-name." .. "wooden-box"},
				{"item-name." .. item.name},
			},
			flags = {"goes-to-main-inventory"},
			icon = "__boxing-2__/graphics/icons/box-of/wooden/" .. iconPath,
			subgroup = "boxing-wooden-" .. item.subgroup,
			order = item.order,
			stack_size = 5,
		},
		{
			type = "item",
			name = "steel-box-of-" .. item.name,
			localised_name = {
				"item-name.*-box-of-*",
				{"item-name." .. "steel-box"},
				{"item-name." .. item.name},
			},
			flags = {"goes-to-main-inventory"},
			icon = "__boxing-2__/graphics/icons/box-of/steel/" .. iconPath,
			subgroup = "boxing-steel-" .. item.subgroup,
			order = item.order,
			stack_size = 10,
		},
	});
	if boxing.tungsten then
		data:extend({
			{
				type = "item",
				name = "tungsten-box-of-"..item.name,
				localised_name = {
					"item-name.*-box-of-*",
					{"item-name." .. "tungsten-box"},
					{"item-name." .. item.name},
				},
				flags = {"goes-to-main-inventory"},
				icon = "__boxing-2__/graphics/icons/box-of/tungsten/" .. iconPath,
				subgroup = "boxing-tungsten-" .. item.subgroup,
				order = item.order,
				stack_size = 20,
			},
		});
	end
end
