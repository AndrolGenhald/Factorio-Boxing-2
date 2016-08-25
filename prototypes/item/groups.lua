data:extend({
	{
		type = "item-group",
		name = "boxing",
		icon = "__boxing-2__/graphics/icons/box-64.png",
		order = "z[boxing]",
	},
--Separate groups for each type
--[[
	{
		type = "item-group",
		name = "box-wooden",
		icon = "__boxing-2__/graphics/icons/wooden-64.png",
		order = "za[boxing]",
	},
	{
		type = "item-group",
		name = "unbox-wooden",
		icon = "__boxing-2__/graphics/icons/wooden-64.png",
		order = "zb[boxing]",
	},
	{
		type = "item-group",
		name = "box-steel",
		icon = "__boxing-2__/graphics/icons/steel-64.png",
		order = "zc[boxing]",
	},
	{
		type = "item-group",
		name = "unbox-steel",
		icon = "__boxing-2__/graphics/icons/steel-64.png",
		order = "zd[boxing]",
	},
	{
		type = "item-group",
		name = "box-tungsten",
		icon = "__boxing-2__/graphics/icons/tungsten-64.png",
		order = "ze[boxing]",
	},
	{
		type = "item-group",
		name = "unbox-tungsten",
		icon = "__boxing-2__/graphics/icons/tungsten-64.png",
		order = "zf[boxing]",
	},
--]]
	{
		type = "item-subgroup",
		name = "boxing-boxes",
		group = "boxing",
		order = "a[boxes]",
	},
	{
		type = "item-subgroup",
		name = "boxing-wooden",
		--group = "box-wooden",
		group = "boxing",
		order = "b[boxing]-a[wooden]",
	},
	{
		type = "item-subgroup",
		name = "boxing-steel",
		--group = "box-steel",
		group = "boxing",
		order = "b[boxing]-b[steel]",
	},
	{
		type = "item-subgroup",
		name = "boxing-tungsten",
		--group = "box-tungsten",
		group = "boxing",
		order = "b[boxing]-c[tungsten]",
	},
	{
		type = "item-subgroup",
		name = "unboxing-wooden",
		--group = "unbox-wooden",
		group = "boxing",
		order = "c[unboxing]-a[wooden]",
	},
	{
		type = "item-subgroup",
		name = "unboxing-steel",
		--group = "unbox-steel",
		group = "boxing",
		order = "c[unboxing]-b[steel]",
	},
	{
		type = "item-subgroup",
		name = "unboxing-tungsten",
		--group = "unbox-tungsten",
		group = "boxing",
		order = "c[unboxing]-c[tungsten]",
	},
});
