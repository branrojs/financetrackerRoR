class StocksController < ApplicationController
  
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        #render json: @stock
        render partial: "users/result"
      else
        flash.now[:danger]  ="You have enter an incorrect symbol"
        render partial: "users/result"
      end
    else
      flash.now[:danger] = "You have entered an empty search string"
      render partial: "users/result"
    end
    
  end
  
end