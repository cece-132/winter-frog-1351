class Garden < ApplicationRecord
  has_many :plots

  validates_presence_of :name
  validates_presence_of :organic
end
