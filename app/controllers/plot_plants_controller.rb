class PlotPlantsController < ApplicationController
  

  def update
    pp = PlotPlant.where(plant_id: params[:id]).first
    plot = Plot.where(number: params[:number]).first
    pp.update(plot_id: plot.id)
    redirect_to plots_path
    flash[:success] = "#{pp.plant.name} has been removed from plot"
  end
end