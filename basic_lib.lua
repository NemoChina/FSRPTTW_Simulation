function Qsort(index_a, a, low, high)
	--print(low)
	--print(high)
	if low >= high then 
		return
	end 
	local first = low
	local last = high
	local key = a[first]
	local index_key = index_a[first]
	while first < last do 
		while first < last and a[last] >= key do 
			last = last - 1
		end 
		a[first] = a[last]
		index_a[first] = index_a[last]
		while first < last and a[first] <= key do 
			first = first + 1
		end 
		a[last] = a[first]
		index_a[last] = index_a[first]
	end 
	a[first] = key 
	index_a[first] = index_key
	Qsort(index_a, a, low, first - 1)
	Qsort(index_a, a, first + 1, high)
end 


function copy1D(table)
    local new = {}
    for i, v in ipairs(table) do
        table.insert(new, v)
    end
    return new
end


function Csv2Matrix(data, ifhead)
	local inputdata = io.input(data)
	local matrix = {}
	ifhead = ifhead or 0
	local i = 1
	for line in inputdata:lines() do
		if ifhead == 0 then
			matrix[i] = {}
			for element in string.gmatch(line, "[0-9%-%.%a]+") do
				table.insert(matrix[i], tonumber(element))
			end
			i = i+1
		else
			ifhead = 0
		end
	end
	return matrix
end

function table.copy(a)
    local b = {}
    for i, j in pairs(a) do
        if type(j) == "table" then
            local c = table.copy(j)
            b[i] = c
        else
            local c = j
            b[i] = c
        end
    end
    return b
end

function Maximum(table)
--return the index of the biggest element in a 1C table 
    local max = table[1]
    local index = 1
    for i = 2, #table do
        if table[i]>= max then
            max = table[i]
            index = i
        end
    end
    return index
end

function Minimum(table)
--return the index of the smallest element in a 1C table 
    local min = table[1]
    local index = 1
    for i = 2, #table do
        if table[i]<= min then
            min = table[i]
            index = i
        end
    end
    return index
end

function math.sum(tab)
    local ssum = 0
    for i = 1, #tab do ssum = ssum+tab[i] end
    return ssum
end

function printtable(Tab)
    for i,j in pairs(Tab) do
        print(i,',',j)
    end
end
