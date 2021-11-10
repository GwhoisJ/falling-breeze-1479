class Plant < ApplicationRecord
  has_many :plant_plots
  has_many :plots, through: :plant_plots

  def plant_plot(plot)
    PlantPlot.find_by(plant_id: self.id, plot_id: plot.id)
  end
end