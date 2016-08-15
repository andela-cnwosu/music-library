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
end