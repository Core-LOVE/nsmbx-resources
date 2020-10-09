local NPC = {__type="NPC"}

local NPCFields = {}

NPCFields.attachedLayerName = ""
NPCFields.layerName = ""

NPCFields.activateEventName = ""
NPCFields.deathEventName = ""
NPCFields.talkEventName = ""
NPCFields.noMoreObjInLayer = ""

NPCFields.spawnId = 0
NPCFields.spawnDirection = 0
NPCFields.spawnAi1 = 0
NPCFields.spawnAi2 = 0
NPCFields.spawnX = 0
NPCFields.spawnY = 0
NPCFields.spawnHeight = 0
NPCFields.spawnWidth  = 0
NPCFields.spawnSpeedX = 0
NPCFields.spawnSpeedY = 0

NPCFields.x = 0
NPCFields.y = 0
NPCFields.speedX = 0
NPCFields.speedY = 0
NPCFields.width = 0
NPCFields.height = 0

NPCFields.id = 0
NPCFields.direction = 0
NPCFields.animationFrame = 0
NPCFields.animationTimer = 0
NPCFields.killFlag = 0
NPCFields.despawnTimer = 0
NPCFields.section = 0

for k = 1, 10 do
	NPCFields['ai'..tostring(k)] = 0
end

local function tablemap(t)
	local t2 = {};
	for _,v in ipairs(t) do
		t2[v] = true;
	end
	return t2;
end

function NPC.spawn(id, x, y, section)
	local npc = NPCFields
	
	npc.id = id
	npc.x = x
	npc.y = y
	npc.section = section
	
	table.insert(NPCCache, npc)
	
	return npc
end

function NPC.count()
	return #NPCCache
end

setmetatable(NPC, {__call = function(NPC, idx)
	if idx == 0 or idx > npcGetCount() then return end
	
	if NPCCache[idx] then
		return NPCCache[idx]
	else
		return nil
	end
end
})

function NPC.get(idfilter, sectionfilter)
	local ret = {}
	
	local idLookup = nil
	if (type(idFilter) == "table") then
		idLookup = tablemap(idFilter)
		idFilter = nil
	elseif (idFilter ~= nil) and (type(idFilter) ~= "number") then
		error("Invalid parameters to get")
	end
	
	local sectionLookup = nil
	if (type(sectionFilter) == "table") then
		sectionLookup = tablemap(sectionFilter)
		sectionFilter = nil
	elseif (sectionFilter ~= nil) and (type(sectionFilter) ~= "number") then
		error("Invalid parameters to get")
	end
	
	for i = 1, #NPCCache do
		if not(
		(idFilter ~= nil) or (idLookup ~= nil) or
		(sectionFilter ~= nil) or (sectionLookup ~= nil)
		) then
			table.insert(ret, NPC(i))
		end
	end
	
	return ret
end

_G.NPC = NPC
return NPC