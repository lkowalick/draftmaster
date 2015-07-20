class Draft < ActiveRecord::Base
  has_many :players
  accepts_nested_attributes_for :players, reject_if: :all_blank
end
