class Plot < ApplicationRecord
  belongs_to :garden

  validates_presence_of :number
  validates_presence_of :size
  validates_presence_of :direction
end
