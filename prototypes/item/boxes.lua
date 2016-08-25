data:extend({
	{
		type = "item",
		name = "wooden-box",
		flags = {"goes-to-main-inventory"},
		icon = "__boxing-2__/graphics/icons/wooden-32.png",
		subgroup = "boxing-boxes",
		order = "a[wooden]",
		stack_size = 5,
	},
	{
		type = "item",
		name = "steel-box",
		flags = {"goes-to-main-inventory"},
		icon = "__boxing-2__/graphics/icons/steel-32.png",
		subgroup = "boxing-boxes",
		order = "b[steel]",
		stack_size = 10,
	},
});

if boxing.tungsten then
	data:extend({
		{
			type = "item",
			name = "tungsten-box",
			flags = {"goes-to-main-inventory"},
			icon = "__boxing-2__/graphics/icons/tungsten-32.png",
			subgroup = "boxing-boxes",
			order = "c[tungsten]",
			stack_size = 20,
		},
	});
end
