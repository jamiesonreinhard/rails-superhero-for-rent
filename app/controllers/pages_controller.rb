class PagesController < ApplicationController
  # dont forget to add :index
  skip_before_action :authenticate_user!, only: :home
  def home
  end
end
