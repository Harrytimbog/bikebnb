class BikesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  skip_after_action :verify_policy_scoped, only: [:index, :show]
  before_action :set_bike, only: [:show, :edit, :update, :destroy]

  def index
    @bikes = Bike.geocoded # returns flats with coordinates

    @markers = @bikes.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bike: bike })
      }
    end

    @bikes = Bike.all
    authorize @bikes
  end

  def show
    @markers = [
      {
        lat: @bike.latitude,
        lng: @bike.longitude
      }
    ]
    @review = Review.new
  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.owner = current_user
    if @bike.save
      redirect_to bikes_path, notice: 'Bike was successfully created'
    else
      render :new, notice: 'something went wrong'
    end
    authorize @bike
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
    redirect_to bikes_path, notice: 'post was successfully destroyed.'
    authorize @bike
  end

  def my_own
  end

  private

  def set_bike
    @bike = Bike.find(params[:id])
    authorize @bike
  end

  def bike_params
    params.require(:bike).permit(:name, :sku, :category, :photo, :price_cents, :address)
  end
end
