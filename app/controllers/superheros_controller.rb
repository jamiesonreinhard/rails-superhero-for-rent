class SuperherosController < ApplicationController
  before_action :set_superhero, only: [:show, :edit, :update, :destroy]
#   Create the index action
def index
    if params[:query].present?
      sql_query = "city ILIKE :query OR name ILIKE :query"
      @superheros = Superhero.geocoded.where(sql_query, query: "%#{params[:query].downcase}%")
      @markers = @superheros.map do |superhero|
        {
          lat: superhero.latitude,
          lng: superhero.longitude
        }
      end
    else
      @superheros = Superhero.geocoded
      @markers = @superheros.map do |superhero|
        {
          lat: superhero.latitude,
          lng: superhero.longitude
        }
      end
    end
end
# 2.Create the show action
def show
  @booking = Booking.new
end
# 3.Create the new action
def new
  @superhero = Superhero.new
end
# 4.Create the create action
def create
  @superhero = Superhero.new(superhero_params)
  @superhero.user = current_user
  if @superhero.save!
    redirect_to superhero_path(@superhero)
  else
    render :new
  end
end
# 5.Create the edit action
def edit
end
# 6.Create the update action

def update
  @superhero.update(superhero_params)
  if @superhero.save
    redirect_to superhero_path(@superhero)
  else
    render :edit
  end
end

def destroy
  @superhero.destroy
  redirect_to me_path
end

private

def set_superhero
  @superhero = Superhero.find(params[:id])
end

def superhero_params
  params.require(:superhero).permit(:name, :city, :superpower, :hourly_price, :img_url, :description)
end

end
