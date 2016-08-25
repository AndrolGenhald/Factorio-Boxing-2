require("config");

if boxing.generateIconConfig then
	script.on_init(function(data)
		game.write_file("boxing-icons", "", false);
		for i,item in pairs(game.item_prototypes) do
			if (item.subgroup.name == "boxing-icons") then
				--grab item icon from the order string
				game.write_file("boxing-icons", item.name .. "=" .. item.order .. "\n", true);
			end
		end
	end)
end
