module ClassMethods
  def all
    class_variable_get :@@all
  end

  def destroy_all
    all.clear
  end

  def create(name)
    new(name).save
  end

  def list_names
    name_list = all.map &:name
    show_results name_list
  end
end