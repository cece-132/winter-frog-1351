class PlotPlantsController < ApplicationController
  

  def update
    pp = PlotPlant.where(plant_id: params[:id]).first
    pp.update(plot_id: params[:plot_id])
    pp.save(validate: false)
    redirect_to plots_path
    flash[:success] = "#{pp.plant.name} has been removed from plot"
  end
end