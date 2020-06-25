class BookingsController < ApplicationController
  def index
    @user = current_user
    @booking = Bookings.all
  end

  def show
    @user = current_user
    @booking = Booking.find(params[:id])
  end

  def new
  end

  def create
    @venue = Venue.find(params[:venue_id])
    @bookings = Booking.new(booking_params)
    @booking.user = current_user
    @booking.venue = @venue
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "venues/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on)
  end
end
