module Concerns::Findable

    def find_by_name(name)
	    class_variable_get(:@@all).each do |list_item|
	      	return list_item if list_item.name == name
	    end
	    nil
  	end

  	def find_or_create_by_name(name)
	    return find_by_name(name) if find_by_name(name)
	    create(name)
  	end
end