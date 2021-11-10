require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  describe 'instance methods' do
    before :each do
      @turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)

      @plot_1 = @turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
      @plot_2 = @turing_garden.plots.create!(number: 26, size: "Small", direction: "West")

      @plant_1 = Plant.create!(name: "green plant", description: "Green", days_to_harvest: 99)
      @plant_2 = Plant.create!(name: "red plant", description: "Red", days_to_harvest: 101)

      PlantPlot.create!(plant: @plant_1, plot: @plot_1)
      PlantPlot.create!(plant: @plant_2, plot: @plot_1)

      PlantPlot.create!(plant: @plant_1, plot: @plot_2)
    end

    describe '.plants' do
      it 'returns unique plants less than 100 days to harvest' do
        expect(@turing_garden.plants.map {|p| p.name}).to eq([@plant_1.name])
      end
    end
  end
end
