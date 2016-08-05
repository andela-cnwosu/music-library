module Concerns::Findable
	
    def find_by_name(name)
	    class_variable_get(:@@all).each do |caller|
	      	return caller if caller.name == name
	    end
  	end

  	def find_or_create_by_name(name)
	    class_variable_get(:@@all).each do |caller|
	      	return caller if caller.name == name
	    end
	    create(name) 
  	end
end