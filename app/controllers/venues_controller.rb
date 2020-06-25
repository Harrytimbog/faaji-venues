class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]
  def index
    @venues = Venue.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.owner = current_user
    if @venue.save
      redirect_to my_own_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @venue.update(venue_params)
      redirect_to venue_path(@venue), notice: 'Venue was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @venue.destroy
    redirect_to venues_path(:search => { query: "" })
  end

  def my_own
    @my_venues = Venue.where(user_id: current_user.id)
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:description, :price, :owner_id, :name, :image, :category, :address)
  end
end
