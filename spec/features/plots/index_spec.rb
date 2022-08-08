require 'rails_helper'

RSpec.describe Plot do
  describe 'User Story 1' do
    it 'shows the plot number & their plants' do
      garden = Garden.create!(name: "Turing Community Garden", organic: true)

      plot1 = Plot.create!(number: 25, size: "Large", direction: "East", garden_id: garden.id)
      plot2 = Plot.create!(number: 35, size: "Small", direction: "South", garden_id: garden.id)
      plot3 = Plot.create!(number: 45, size: "Medium", direction: "South", garden_id: garden.id)

      plant1 = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
      plant2 = Plant.create!(name: "Balloon Flower", description: "Great for the days you just want to float away", days_to_harvest: 45)
      plant3 = Plant.create!(name: "Sunflower", description: "These seeds are the best for baseball games", days_to_harvest: 75)
      plant4 = Plant.create!(name: "Wild asparagus", description: "Your family will love these", days_to_harvest: 90)
      plant5 = Plant.create!(name: "Jerusalem artichoke", description: "Amazing dips have been made from this plant", days_to_harvest: 52)

      pp1 = PlotPlant.create!(plant_id: plant1.id, plot_id: plot1.id)
      pp2 = PlotPlant.create!(plant_id: plant1.id, plot_id: plot2.id)
      pp3 = PlotPlant.create!(plant_id: plant2.id, plot_id: plot3.id)
      pp4 = PlotPlant.create!(plant_id: plant3.id, plot_id: plot3.id)
      pp5 = PlotPlant.create!(plant_id: plant4.id, plot_id: plot2.id)
      pp6 = PlotPlant.create!(plant_id: plant5.id, plot_id: plot1.id)

      visit plots_path

      within(".plot-#{plot1.id}") do
        expect(page).to have_content(plot1.number)
        expect(page).to have_content(plant1.name)
        expect(page).to have_content(plant5.name)

        expect(page).to_not have_content(plot2.number)
        expect(page).to_not have_content(plot3.number)
        expect(page).to_not have_content(plant2.name)
        expect(page).to_not have_content(plant3.name)
        expect(page).to_not have_content(plant4.name)
      end
    end
  end
end