module Concerns::Findable
  def find_by_name(name)
    class_variable_get(:@@all).detect do |list_item| 
      list_item.name.casecmp(name) == 0
    end
  end

  def find_or_create_by_name(name)
    return find_by_name(name) if find_by_name(name)
	  create(name)
  end
end