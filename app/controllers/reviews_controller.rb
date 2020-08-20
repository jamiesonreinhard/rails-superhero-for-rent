class ReviewsController < ApplicationController
    def new
      @superhero = Superhero.find(params[:superhero_id])
      @review = Review.new
    end
    def create
      @review = Review.new(review_params)
      @superhero = Superhero.find(params[:superhero_id])
      @review.superhero = @superhero
      if @review.save
        redirect_to superhero_path(@superhero)
      else
        render :new
      end
    end
  
    private
  
    def review_params
      params.require(:review).permit(:rating, :description, :superhero_id)
    end
  end
