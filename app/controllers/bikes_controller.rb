class BikesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    @bikes = Bike.all
  end

  def show
    @review = Review.new
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.owner = current_user
    if @bike.save
      redirect_to bikes_path, notice: 'Bike was successfully created'
    else
      render :new, notice: 'something went wrong'
    end
  end

  def edit
  end

  def update
    if @bike.update(bike_params)
      redirect_to @bike, notice: 'bike was successfully update.'
    else
      render :edit
    end
  end

  def destroy
    @bike.destroy
    redirect_to root_path, notice: 'post was successfully destroyed.'
  end

  def my_own
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
  end

  def bike_params
    params.require(:bike).permit(:name, :sku, :category, :photo, :price_cents)
  end
end
