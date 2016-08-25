module InstanceMethods
  def save
    self.class.all << self unless self.class.all.include? self
    self
  end
end