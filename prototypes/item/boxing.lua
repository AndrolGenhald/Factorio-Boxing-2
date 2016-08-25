for i,item in pairs(boxing.items) do
	local icon = item.icon;
	local mod = icon:sub(0, icon:find("/")-1);
	mod = mod:sub(3, -3);
	local i = 0;
	while true do
		i = icon:find("/");
		if i == nil then
			break;
		end
		icon = icon:sub(i+1);
	end
	data:extend({
		{
			type = "item",
			name = "wooden-box-of-"..item.name,
			localised_name = {
				"item-name.*-box-of-*",
				{"item-name." .. "wooden-box"},
				{"item-name." .. item.name},
			},
			flags = {"goes-to-main-inventory"},
			icon = "__boxing-2__/graphics/icons/box-of/wooden/" .. mod .. "/" .. icon,
			subgroup = "boxing-wooden",
			order = item.order,
			stack_size = 5,
		},
		{
			type = "item",
			name = "steel-box-of-"..item.name,
			localised_name = {
				"item-name.*-box-of-*",
				{"item-name." .. "steel-box"},
				{"item-name." .. item.name},
			},
			flags = {"goes-to-main-inventory"},
			icon = "__boxing-2__/graphics/icons/box-of/steel/" .. mod .. "/" .. icon,
			subgroup = "boxing-steel",
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
				icon = "__boxing-2__/graphics/icons/box-of/tungsten/" .. mod .. "/" .. icon,
				subgroup = "boxing-tungsten",
				order = item.order,
				stack_size = 20,
			},
		});
	end
end
