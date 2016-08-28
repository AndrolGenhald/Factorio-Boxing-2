data:extend({
	{
		type = "item-group",
		name = "boxing",
		icon = "__boxing-2__/graphics/icons/box-64.png",
		order = "z[boxing]",
	},
	{
		type = "item-subgroup",
		name = "boxing-boxes",
		group = "boxing",
		order = "a[boxes]",
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
--]]
});

--[[
if boxing.tungsten then
	data:extend({
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
	});
end
--]]

for subgroupName,t in pairs(boxing.subgroups) do
	if data.raw["item-subgroup"][subgroupName] then
		local groupName = data.raw["item-subgroup"][subgroupName].group;
		local groupOrder = data.raw["item-group"][groupName].order;
		local subgroupOrder = data.raw["item-subgroup"][subgroupName].order;
		data:extend({
			{
				type = "item-subgroup",
				name = "boxing-wooden-" .. subgroupName,
				--group = "box-wooden",
				group = "boxing",
				order = "b[boxing]-a[wooden]" .. groupOrder .. subgroupOrder,
			},
			{
				type = "item-subgroup",
				name = "unboxing-wooden-" .. subgroupName,
				--group = "unbox-wooden",
				group = "boxing",
				order = "c[unboxing]-a[wooden]" .. groupOrder .. subgroupOrder,
			},
			{
				type = "item-subgroup",
				name = "boxing-steel-" .. subgroupName,
				--group = "box-steel",
				group = "boxing",
				order = "b[boxing]-b[steel]" .. groupOrder .. subgroupOrder,
			},
			{
				type = "item-subgroup",
				name = "unboxing-steel-" .. subgroupName,
				--group = "unbox-steel",
				group = "boxing",
				order = "c[unboxing]-b[steel]" .. groupOrder .. subgroupOrder,
			},
		});
		if boxing.tungsten then
			data:extend({
				{
					type = "item-subgroup",
					name = "boxing-tungsten-" .. subgroupName,
					--group = "box-tungsten",
					group = "boxing",
					order = "b[boxing]-c[tungsten]" .. groupOrder .. subgroupOrder,
				},
				{
					type = "item-subgroup",
					name = "unboxing-tungsten-" .. subgroupName,
					--group = "unbox-tungsten",
					group = "boxing",
					order = "c[unboxing]-c[tungsten]" .. groupOrder .. subgroupOrder,
				},
			});
		end
	end
end
