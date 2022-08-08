class Plant < ApplicationRecord
  has_many :plot_plants
  has_many :plots, through: :plot_plants

  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :days_to_harvest
end