module Concerns::Findable
	
    def find_by_name(name)
		found_item = nil
	    class_variable_get(:@@all).each do |list_item|
	      	found_item = list_item if list_item.name == name
	    end
	    found_item
  	end

  	def find_or_create_by_name(name)
  		
	    if find_by_name(name)
	    	return find_by_name(name)
	    end
	    create(name)
  	end
end