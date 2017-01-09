require "pry"
# your code goes here
def begins_with_r(array)
	array.all? do |el|
		el[0] == "r"
	end
end

def contain_a(array)
	array.select do |el|
		el.include?('a')
	end
end

def first_wa(array)
	array.find do |el|
		el.slice(0,2) == 'wa'
	end
end

def remove_non_strings(array)
	array.delete_if do |el|
		el.class != String
	end
end

def count_elements(array)
	uniq = array.uniq
	uniq.each_with_index {|el,index|
		uniq[index][:count] = 0
	}
	
	def check_values_index(uniq,string)
		uniq.each_with_index do |el,ind|
			if el[:name] == string
				return ind
			end
		end
	end

	array.each_with_index do |el,ind|
		uniq_ind = check_values_index(uniq,el[:name])
		uniq[uniq_ind][:count] += 1
	end

	uniq
end

def merge_data(keys,data)
	keys.each_with_index do |el,ind|
		key = el[:first_name]
		new_content = data[0][key]
		keys[ind] = keys[ind].merge(new_content)
	end
	return keys
end

def find_cool(array)
	cool = []
	array.each_with_index do |el,ind|
		if el[:temperature] == "cool"
			cool.push el
		end
	end
	return cool
end

def organize_schools(hash)
	res = {}
	hash.each do |key,cont|
		loc = cont[:location]
		if !res[loc]
			res[loc] = [].push(key)
		else
			res[loc].push(key)
		end
	end
	res
end

schools = {
      "flatiron school bk" => {
        :location => "NYC"
      },
      "flatiron school" => {
        :location => "NYC"
      },
      "dev boot camp" => {
        :location => "SF"
      },
      "dev boot camp chicago" => {
        :location => "Chicago"
      },
      "general assembly" => {
        :location => "NYC"
      },
      "Hack Reactor" => {
        :location => "SF"
      }
    }

organize_schools(schools)