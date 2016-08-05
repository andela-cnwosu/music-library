require 'bundler'
Bundler.require

module Concerns
  def self.included(base)
    base.extend ClassMethods
    base.extend Helper
    base.include InstanceMethods
    base.extend Findable
  end
end

require_all 'lib'
