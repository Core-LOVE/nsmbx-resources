local co = {}

function co:add(type)
	local o = {}
	
	o.type = type
	
	table.insert(self, o)
end

function co:update()
	for k,v in ipairs(self) do
		
	end
end

return co