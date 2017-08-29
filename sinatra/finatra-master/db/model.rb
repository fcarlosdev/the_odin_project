require_relative "connection"

class Fish < ActiveRecord::Base
  validates :name, uniqueness: true
  before_validation do
    self.name.downcase!
  end
end
