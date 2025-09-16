---@class globed
local globed = {}

---@class globed.SpawnInfo
local SpawnInfo = {}

---Creates a new SpawnInfo object for spawning a group of entities.
---@param group_id number The ID of the group to spawn
---@param delay number The base delay before spawning
---@param delay_variance number Random variance added/subtracted from the delay
---@param ordered boolean Whether entities should spawn in order
---@param remaps table<number, number> Optional table mapping original entity IDs to new IDs
---@return globed.SpawnInfo
function SpawnInfo.new(group_id, delay, delay_variance, ordered, remaps) end

globed.SpawnInfo = SpawnInfo

---Sets a callback for an event
---@param id number
---@param func fun()
function globed.set_callback(id, func) end

---Spawns a group for a specific player
---@param account_id number
---@param spawn_info SpawnInfo
function globed.spawn(account_id, spawn_info) end

---Spawns a group for all players
---@param spawn_info SpawnInfo
function globed.spawn_for_all(spawn_info) end

---Sets an item for a specific player
---@param account_id number
---@param item_id number
---@param value number
function globed.set_item(account_id, item_id, value) end

---Sets an item for all players
---@param item_id number
---@param value number
function globed.set_item_for_all(item_id, value) end

---Moves a group relative to its current position for a player
---@param account_id number
---@param group number
---@param dx number
---@param dy number
function globed.move_group(account_id, group, dx, dy) end

---Moves a group relative to its current position for all players
---@param group number
---@param dx number
---@param dy number
function globed.move_group_for_all(group, dx, dy) end

---Moves a group to absolute coordinates for a player
---@param account_id number
---@param group number
---@param center boolean
---@param x number
---@param y number
function globed.move_group_absolute(account_id, group, center, x, y) end

---Moves a group to absolute coordinates for all players
---@param group number
---@param center boolean
---@param x number
---@param y number
function globed.move_group_absolute_for_all(group, center, x, y) end

---Enables or disables a group following the movement of a player
---@param account_id number
---@param group number
---@param enable boolean
function globed.follow_player(account_id, group, enable) end

---Enables or disables a group following the rotation of a player
---@param account_id number
---@param group number
---@param center boolean
---@param enable boolean
function globed.follow_rotation(account_id, group, center, enable) end

---Gets a player's X coordinate
---@param account_id number
---@return number
function globed.get_player_x(account_id) end

---Gets a player's Y coordinate
---@param account_id number
---@return number
function globed.get_player_y(account_id) end

---Gets a player's name
---@param account_id number
---@return string
function globed.get_player_name(account_id) end

---Schedules a repeated function
---@param func fun()
---@param interval number
---@param repeats number
---@return number
function globed.schedule(func, interval, repeats) end

---Schedules a function once after a delay
---@param func fun()
---@param delay number
---@return number
function globed.schedule_once(func, delay) end

---Unschedules a scheduled function
---@param key number
function globed.unschedule(key) end

---Loads another script
---@param script_name string
---@return any
function require(script_name) end

return globed
