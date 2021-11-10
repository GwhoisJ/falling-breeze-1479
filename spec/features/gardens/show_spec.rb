require 'rails_helper'

RSpec.describe 'garden show page' do
  before :each do
    @turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)

    @plot_1 = @turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    @plot_2 = @turing_garden.plots.create!(number: 26, size: "Small", direction: "West")

    @plant_1 = Plant.create!(name: "green plant", description: "Green", days_to_harvest: 99)
    @plant_2 = Plant.create!(name: "red plant", description: "Red", days_to_harvest: 101)
    @plant_3 = Plant.create!(name: "purple plant", description: "Purple", days_to_harvest: 1)

    PlantPlot.create!(plant: @plant_1, plot: @plot_1)
    PlantPlot.create!(plant: @plant_2, plot: @plot_1)

    PlantPlot.create!(plant: @plant_1, plot: @plot_2)
  end

  it 'lists all plants associated with the garden' do
    visit garden_path(@turing_garden)

    expect(page).to have_content(@plant_1.name)
    expect(page).to_not have_content(@plant_2.name)
    expect(page).to_not have_content(@plant_3.name)
  end
end