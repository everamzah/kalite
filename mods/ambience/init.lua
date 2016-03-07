
--= Ambience lite by TenPlus1 (30th September 2015)

local max_frequency_all = 1000 -- larger number means more frequent sounds (100-2000)
local SOUNDVOLUME = minetest.setting_get("ambience_volume") or 1
local volume = 0.3
local ambiences
local played_on_start = false
local tempy = {}

-- sound sets
local night = {
	handler = {}, frequency = 40,
	{name="ambience_hornedowl", length = 2},
	{name="ambience_wolves", length = 4},
	{name="ambience_cricket", length = 6},
	{name="ambience_deer", length = 7},
	{name="ambience_frog", length = 1},
}

local day = {
	handler = {}, frequency = 40,
	{name="ambience_cardinal", length = 3},
	{name="ambience_craw", length = 3},
	{name="ambience_bluejay", length = 6},
	{name="ambience_canadianloon2", length = 14},
	{name="ambience_robin", length = 4},
	{name="ambience_bird1", length = 11},
	{name="ambience_bird2", length = 6},
	{name="ambience_crestedlark", length = 6},
	{name="ambience_peacock", length = 2}
}

local high_up = {
	handler = {}, frequency = 40,
	{name="ambience_desertwind", length = 8},
}

local cave = {
	handler = {}, frequency = 60,
	{name="ambience_drippingwater1", length = 1.5},
	{name="ambience_drippingwater2", length = 1.5}
}

local beach = {
	handler = {}, frequency = 40,
	{name="ambience_seagull", length = 4.5},
	{name="ambience_beach", length = 13},
	{name="ambience_gull", length = 1}
}

local desert = {
	handler = {}, frequency = 20,
	{name="ambience_coyote", length = 2.5},
	{name="ambience_desertwind", length = 8}
}

local flowing_water = {
	handler = {}, frequency = 1000,
	{name="ambience_waterfall", length = 6}
}

local underwater = {
	handler = {}, frequency = 1000,
	{name="ambience_scuba", length = 8}
}

local splash = {
	handler = {}, frequency = 1000,
	{name="ambience_swim_splashing", length = 3},
}

local lava = {
	handler = {}, frequency = 1000,
	{name="lava", length = 7}
}

local smallfire = {
	handler = {}, frequency = 1000,
	{name="fire_small", length = 6}
}

local largefire = {
	handler = {}, frequency = 1000,
	{name="fire_large", length = 8}
}

local radius = 6

-- get node but use fallback for nil or unknown
local function node_ok(pos, fallback)

	fallback = fallback or "default:dirt"

	local node = minetest.get_node_or_nil(pos)

	if not node then
		return fallback
	end

	local nodef = minetest.registered_nodes[node.name]

	if nodef then
		return node.name
	end

	return fallback
end

-- check where player is and which sounds are played
local get_ambience = function(player)

	-- who and where am I?
	local player_name = player:get_player_name()
	local pos = player:getpos()

	-- what is around me?
	pos.y = pos.y + 1.4 -- head level
	local nod_head = node_ok(pos, "air")

	pos.y = pos.y - 1.2 -- foot level
	local nod_feet = node_ok(pos, "air")

	pos.y = pos.y - 0.2 -- reset pos

	--= START Ambiance

	if minetest.registered_nodes[nod_head].groups.water then
		return {underwater = underwater}
	end

	if minetest.registered_nodes[nod_feet].groups.water then
		return {splash = splash}
	end

	local ps, cn = minetest.find_nodes_in_area(
		{x = pos.x - radius, y = pos.y - radius, z = pos.z - radius},
		{x = pos.x + radius, y = pos.y + radius, z = pos.z + radius},
		{
			"fire:basic_flame", "fire:permanent_flame",
			"default:lava_flowing", "default:lava_source",
			"default:water_flowing", "default:water_source",
			"default:river_water_flowing", "default:river_water_source",
			"default:desert_sand", "default:desert_stone", "default:snowblock"
		})

	local num_fire = (cn["fire:basic_flame"] or 0) + (cn["fire:permanent_flame"] or 0)
	local num_lava = (cn["default:lava_flowing"] or 0) + (cn["default:lava_source"] or 0)
	local num_water_flowing = (cn["default:water_flowing"] or 0) + (cn["default:river_water_flowing"] or 0)
	local num_water_source = (cn["default:water_source"] or 0) + (cn["default:river_water_flowing"] or 0)
	local num_desert = (cn["default:desert_sand"] or 0) + (cn["default:desert_stone"] or 0)
	local num_snow = (cn["default:snowblock"] or 0)
--[[
print (
	"fr:" .. num_fire,
	"lv:" .. num_lava,
	"wf:" .. num_water_flowing,
	"ws:" .. num_water_source,
	"ds:" .. num_desert,
	"sn:" .. num_snow
)
]]
	-- is fire redo mod active?
	if fire and fire.mod and fire.mod == "redo" then
		if num_fire > 8 then
			return {largefire = largefire}
		elseif num_fire > 0 then
			return {smallfire = smallfire}
		end
	end

	if num_lava > 5 then
		return {lava = lava}
	end

	if num_water_flowing > 30 then
		return {flowing_water = flowing_water}
	end

	if pos.y < 7 and pos.y > 0
	and num_water_source > 100 then
		return {beach = beach}
	end

	if num_desert > 150 then
		return {desert = desert}
	end

	if pos.y > 60
	or num_snow > 150 then
		return {high_up = high_up}
	end

	if pos.y < -10 then
		return {cave = cave}
	end

	local tod = minetest.get_timeofday()

	if tod > 0.2
	and tod < 0.8 then
		return {day = day}
	else
		return {night = night}
	end

	-- END Ambiance

end

-- play sound, set handler then delete handler when sound finished
local play_sound = function(player_name, list, number)

	if list.handler[player_name] == nil then

		local gain = volume * SOUNDVOLUME
		local handler = minetest.sound_play(list[number].name,
			{to_player = player_name, gain = gain})

		if handler then
			list.handler[player_name] = handler

			minetest.after(list[number].length, function(args)
				local list = args[1]
				local player_name = args[2]

				if list.handler[player_name] then
					minetest.sound_stop(list.handler[player_name])
					list.handler[player_name] = nil
				end
			end, {list, player_name})
		end
	end
end

-- stop sound in still_playing
local stop_sound = function (list, player_name)

	if list.handler[player_name] then
		if list.on_stop then
			minetest.sound_play(list.on_stop,
				{to_player = player_name, gain = SOUNDVOLUME})
		end
		minetest.sound_stop(list.handler[player_name])
		list.handler[player_name] = nil
	end
end

-- check sounds that are not in still_playing
local still_playing = function(still_playing, player_name)
	if not still_playing.cave then 	stop_sound(cave, player_name) end
	if not still_playing.high_up then stop_sound(high_up, player_name) end
	if not still_playing.beach then stop_sound(beach, player_name) end
	if not still_playing.desert then stop_sound(desert, player_name) end
	if not still_playing.night then stop_sound(night, player_name) end
	if not still_playing.day then stop_sound(day, player_name) end
	if not still_playing.flowing_water then stop_sound(flowing_water, player_name) end
	if not still_playing.splash then stop_sound(splash, player_name) end
	if not still_playing.underwater then stop_sound(underwater, player_name) end
	if not still_playing.lava then stop_sound(lava, player_name) end
	if not still_playing.smallfire then stop_sound(smallfire, player_name) end
	if not still_playing.largefire then stop_sound(largefire, player_name) end
end

-- player routine
local timer = 0
minetest.register_globalstep(function(dtime)

	-- every 1 second
	timer = timer + dtime
	if timer < 1 then return end
	timer = 0

	for _,player in pairs(minetest.get_connected_players()) do

		local player_name = player:get_player_name()

--local t1 = os.clock()
		ambiences = get_ambience(player)
--print ("[TEST] "..math.ceil((os.clock() - t1) * 1000).." ms")
		still_playing(ambiences, player)

		for _,ambience in pairs(ambiences) do

			if math.random(1, 1000) <= ambience.frequency then

				if ambience.on_start
				and played_on_start == false then

					played_on_start = true

					minetest.sound_play(ambience.on_start, {
						to_player = player_name,
						gain = SOUNDVOLUME
					})
				end

				play_sound(player_name, ambience, math.random(1, #ambience))
			end
		end
	end
end)

-- set volume command
minetest.register_chatcommand("svol", {
	params = "<svol>",
	description = "set sound volume (0.1 to 1.0)",
	privs = {server = true},
	func = function(name, param)
		if not param then
			return true, "Ambience volume is set to " .. tostring(SOUNDVOLUME)
		end
		SOUNDVOLUME = param
		--minetest.chat_send_player(name, "Sound volume set.")
		return true, "Sound volume set to " .. tostring(SOUNDVOLUME)
	end
})
