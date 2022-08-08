class Plant < ApplicationRecord
  # has_many :plots

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :days_to_harvest
end