require 'rails_helper'

RSpec.describe 'plots index' do
  before :each do
    turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)

    @plot_1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    @plot_2 = turing_garden.plots.create!(number: 26, size: "Small", direction: "West")

    @plant_1 = Plant.create!(name: "green plant", description: "Green", days_to_harvest: 99)
    @plant_2 = Plant.create!(name: "red plant", description: "Red", days_to_harvest: 101)

    PlantPlot.create!(plant: @plant_1, plot: @plot_1)
    PlantPlot.create!(plant: @plant_2, plot: @plot_1)

    PlantPlot.create!(plant: @plant_1, plot: @plot_2)
  end

  it 'should list all plot numbers' do
    visit plots_path

    expect(page).to have_content(@plot_1.number)
    expect(page).to have_content(@plot_2.number)
  end

  it 'should list plants under their plot' do
    visit plots_path

    within("#plot-#{@plot_1.number}") do
      expect(page).to have_content(@plant_1.name)
      expect(page).to have_content(@plant_2.name)
    end

    within("#plot-#{@plot_2.number}") do
      expect(page).to have_content(@plant_1.name)
      expect(page).to_not have_content(@plant_2.name)
    end
  end
end