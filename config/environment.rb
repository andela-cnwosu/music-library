require 'bundler'
Bundler.require

module Concerns
  def self.included(base)
    base.extend ClassMethods
    base.extend Helper
    base.include InstanceMethods
    base.extend Findable
    base.extend Formatter
  end
end

require_all 'lib'
