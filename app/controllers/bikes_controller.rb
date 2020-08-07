class BikesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    @bike = Bike.all
  end

  def show
  end

  def new
    @bike = Bike.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def my_own
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:name, :sku, :category, :photo)
  end
end
