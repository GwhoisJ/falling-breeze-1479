require 'rails_helper'

RSpec.describe Plant do
  describe 'relationships' do
    it {should have_many :plant_plots}
    it {should have_many(:plots).through(:plant_plots)}
  end

  describe 'instance methods' do
    before :each do
      turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)

      @plot = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")

      @plant = Plant.create!(name: "green plant", description: "Green", days_to_harvest: 99)

      @plant_plot = PlantPlot.create!(plant: @plant, plot: @plot)
    end

    describe '.plant_plot' do
      it 'should give back the plant_plot' do
        expect(@plant.plant_plot(@plot)).to eq(@plant_plot)
      end
    end
  end

  describe 'class methods' do
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

    describe '#'
  end
end