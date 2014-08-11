class City < ActiveRecord::Base
  has_one :mayor
  accepts_nested_attributes_for :mayor
end
