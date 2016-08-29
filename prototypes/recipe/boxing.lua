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
			type = "recipe",
			name = "wooden-box-" .. item.name,
			localised_name = {"recipe-name.box-*", {"item-name." .. item.name}},
			icon = "__boxing-2__/graphics/icons/box/wooden/" .. iconPath,
			energy_required = 2,
			category = "boxing-wooden",
			subgroup = "boxing-wooden-" .. item.subgroup,
			order = item.order,
			ingredients = {
				{item.name, item.stack_size},
				{"wooden-box", 1},
			},
			result = "wooden-box-of-" .. item.name,
			enabled = "false",
		},
		{
			type = "recipe",
			name = "wooden-unbox-" .. item.name,
			localised_name = {"recipe-name.unbox-*", {"item-name." .. item.name}},
			icon = "__boxing-2__/graphics/icons/unbox/wooden/" .. iconPath,
			energy_required = 2,
			category = "boxing-wooden",
			subgroup = "unboxing-wooden-" .. item.subgroup,
			order = item.order,
			ingredients = {
				{"wooden-box-of-" .. item.name, 1},
			},
			results = {
				{type="item", name=item.name, amount=item.stack_size},
				{type="item", name="wooden-box", amount=1},
			},
			enabled = "false",
		},
		{
			type = "recipe",
			name = "steel-box-" .. item.name,
			localised_name = {"recipe-name.box-*", {"item-name." .. item.name}},
			icon = "__boxing-2__/graphics/icons/box/steel/" .. iconPath,
			energy_required = 5,
			category = "boxing-steel",
			subgroup = "boxing-steel-" .. item.subgroup,
			order = item.order,
			ingredients = {
				{item.name, item.stack_size},
				{"steel-box", 1},
			},
			result = "steel-box-of-" .. item.name,
			enabled = "false",
		},
		{
			type = "recipe",
			name = "steel-unbox-" .. item.name,
			localised_name = {"recipe-name.unbox-*", {"item-name." .. item.name}},
			icon = "__boxing-2__/graphics/icons/unbox/steel/" .. iconPath,
			energy_required = 5,
			category = "boxing-steel",
			subgroup = "unboxing-steel-" .. item.subgroup,
			order = item.order,
			ingredients = {
				{"steel-box-of-" .. item.name, 1},
			},
			results = {
				{type="item", name=item.name, amount=item.stack_size},
				{type="item", name="steel-box", amount=1},
			},
			enabled = "false",
		},
	});
	table.insert(boxing.woodenUnlocks, {
		type = "unlock-recipe",
		recipe = "wooden-box-" .. item.name,
	});
	table.insert(boxing.woodenUnlocks, {
		type = "unlock-recipe",
		recipe = "wooden-unbox-" .. item.name,
	});
	table.insert(boxing.steelUnlocks, {
		type = "unlock-recipe",
		recipe = "steel-box-" .. item.name,
	});
	table.insert(boxing.steelUnlocks, {
		type = "unlock-recipe",
		recipe = "steel-unbox-" .. item.name,
	});
	if boxing.tungsten then
		data:extend({
			{
				type = "recipe",
				name = "tungsten-box-" .. item.name,
				localised_name = {"recipe-name.box-*", {"item-name." .. item.name}},
				icon = "__boxing-2__/graphics/icons/box/tungsten/" .. iconPath,
				energy_required = 10,
				category = "boxing-tungsten",
				subgroup = "boxing-tungsten-" .. item.subgroup,
				order = item.order,
				ingredients = {
					{item.name, item.stack_size},
					{"tungsten-box", 1},
				},
				result = "tungsten-box-of-" .. item.name,
				enabled = "false",
			},
			{
				type = "recipe",
				name = "tungsten-unbox-" .. item.name,
				localised_name = {"recipe-name.unbox-*", {"item-name." .. item.name}},
				icon = "__boxing-2__/graphics/icons/unbox/tungsten/" .. iconPath,
				energy_required = 10,
				category = "boxing-tungsten",
				subgroup = "unboxing-tungsten-" .. item.subgroup,
				order = item.order,
				ingredients = {
					{"tungsten-box-of-" .. item.name, 1},
				},
				results = {
					{type="item", name=item.name, amount=item.stack_size},
					{type="item", name="tungsten-box", amount=1},
				},
				enabled = "false",
			},
		});
		table.insert(boxing.tungstenUnlocks, {
			type = "unlock-recipe",
			recipe = "tungsten-box-" .. item.name,
		});
		table.insert(boxing.tungstenUnlocks, {
			type = "unlock-recipe",
			recipe = "tungsten-unbox-" .. item.name,
		});
	end
end
