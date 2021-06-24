class MapsController < ApplicationController
  # before_action :set_performance, only: [:index]

  def index
    @maps = Map.all.order('created_at DESC')
  end

  def new
    @map = Map.new
  end

def create
   @map = Map.new(performance_params)
  #  binding.pry
   if @map.valid?
     @map.save
     redirect_to maps_path
   else
     render :new
   end
end

private

# def set_performance
#    @map = Map.find(params[:id])
# end

def performance_params
 params.require(:map).permit(:address)
end
end
