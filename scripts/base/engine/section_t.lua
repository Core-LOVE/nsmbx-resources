local Section = {__type="Section"}

local function tablemap(t)
	local t2 = {};
	for _,v in ipairs(t) do
		t2[v] = true;
	end
	return t2;
end

function Section.get(idFilter, sectionFilter)
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
	
	for i = 1, #SectionCache do
		if not(
		(idFilter ~= nil) or (idLookup ~= nil) or
		(sectionFilter ~= nil) or (sectionLookup ~= nil)
		) then
			table.insert(ret, Section(i))
		end
	end
	
	return ret
end

_G.Section = Section
return Section