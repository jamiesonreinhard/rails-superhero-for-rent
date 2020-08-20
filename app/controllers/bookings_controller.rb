class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  def index
    @bookings = Booking.where(user: current_user)
  end
  # 2.Create the show action

  def show
  end

  # 3.Create the new action
  def new
    @booking = Booking.new
  end

  # 4.Create the create action
  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.superhero = Superhero.find(params[:superhero_id])
    if @booking.save!
      redirect_to booking_confirmation_path
    else
      render :new
    end
  end

  # 5.Create the edit action
  def edit
    @superhero = @booking.superhero
  end
  # 6.Create the update action

  def update
    @booking.update(booking_params)
    if @booking.save
      redirect_to superhero_bookings_path
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to superhero_bookings_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :number_of_hours, :event, :location)
  end
end
