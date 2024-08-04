class CarbonFootprintsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_carbon_footprint, only: [:show, :update, :destroy]

  def index
    @carbon_footprints = current_user.carbon_footprints
    render json: @carbon_footprints
  end

  def show
    render json: @carbon_footprint
  end

  def create
    @carbon_footprint = current_user.carbon_footprints.build(carbon_footprint_params)

    if @carbon_footprint.save
      render json: @carbon_footprint, status: :created
    else
      render json: @carbon_footprint.errors, status: :unprocessable_entity
    end
  end

  def update
    if @carbon_footprint.update(carbon_footprint_params)
      render json: @carbon_footprint
    else
      render json: @carbon_footprint.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @carbon_footprint.destroy
    head :no_content
  end

  private

  def set_carbon_footprint
    @carbon_footprint = current_user.carbon_footprints.find(params[:id])
  end

  def carbon_footprint_params
    params.require(:carbon_footprint).permit(:type_of_public_transport, :type_of_car, :hours_driven_per_week, :monthly_electricity_usage, :diet, :waste_management)
  end
end
