require 'rails_helper'

RSpec.describe Garden do
  describe 'User Story 3' do
    it 'shows all the gardens no duplicates' do
      garden = Garden.create!(name: "Turing Community Garden", organic: true)

      plot1 = Plot.create!(number: 25, size: "Large", direction: "East", garden_id: garden.id)
      plot2 = Plot.create!(number: 35, size: "Small", direction: "South", garden_id: garden.id)
      plot3 = Plot.create!(number: 45, size: "Medium", direction: "South", garden_id: garden.id)
      plot4 = Plot.create!(number: 0, size: "Removed", direction: "Removed", garden_id: garden.id)

      plant1 = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
      plant2 = Plant.create!(name: "Balloon Flower", description: "Great for the days you just want to float away", days_to_harvest: 105)
      plant3 = Plant.create!(name: "Sunflower", description: "These seeds are the best for baseball games", days_to_harvest: 75)
      plant4 = Plant.create!(name: "Wild asparagus", description: "Your family will love these", days_to_harvest: 100)
      plant5 = Plant.create!(name: "Jerusalem artichoke", description: "Amazing dips have been made from this plant", days_to_harvest: 52)
      plant6 = Plant.create!(name: "Jerusalem artichoke", description: "Amazing dips have been made from this plant", days_to_harvest: 54)

      pp1 = PlotPlant.create!(plant_id: plant1.id, plot_id: plot1.id)
      pp2 = PlotPlant.create!(plant_id: plant2.id, plot_id: plot2.id)
      pp3 = PlotPlant.create!(plant_id: plant3.id, plot_id: plot3.id)
      pp4 = PlotPlant.create!(plant_id: plant4.id, plot_id: plot3.id)
      pp5 = PlotPlant.create!(plant_id: plant5.id, plot_id: plot2.id)
      pp5 = PlotPlant.create!(plant_id: plant1.id, plot_id: plot2.id)
      pp6 = PlotPlant.create!(plant_id: plant6.id, plot_id: plot2.id)

      visit garden_path(garden)

      expect(page).to have_content(plant3.name)
      expect(page).to have_content(plant1.name)
      expect(page).to have_content(plant5.name)

      expect(page).to_not have_content(plant2.name)
      expect(page).to_not have_content(plant4.name)
    end
  end
end