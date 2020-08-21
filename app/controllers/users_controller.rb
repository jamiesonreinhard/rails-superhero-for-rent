class UsersController < ApplicationController
  def index
    @superheros = Superhero.where(user: current_user)
  end
end
