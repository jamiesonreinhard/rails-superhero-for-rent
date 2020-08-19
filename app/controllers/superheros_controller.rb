class SuperherosController < ApplicationController
  before_action :set_superhero, only: [:show, :edit, :update, :destroy] 
#   Create the index action
def index
  @superheros = Superhero.geocoded
  @markers = @superheros.map do |superhero|
    {
      lat: superhero.latitude,
      lng: superhero.longitude
    }
  end
end
# 2.Create the show action
def show  
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
  redirect_to superheros_path
end

private

def set_superhero
  @superhero = Superhero.find(params[:id])
end

def superhero_params
  params.require(:superhero).permit(:name, :city, :superpower, :hourly_price)
end

end
