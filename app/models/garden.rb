class Garden < ApplicationRecord
  has_many :plots

  def plants
    plots.joins(:plants)
         .where("plants.days_to_harvest < 100")
         .select("plants.name AS name")
         .distinct
  end
end
