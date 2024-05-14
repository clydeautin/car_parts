class CarCarpartsController < ApplicationController
    def index
      @car = Car.find(params[:car_id])
      @car_parts = @car.car_parts
    end
    def new
      @car = Car.find(params[:car_id])
    end
  
    def create
      @car = Car.find(params[:car_id])
      # require 'pry'; binding.pry
      @car_part = @car.car_parts.new(car_part_params)
      if @car_part.save
        redirect_to car_car_parts_path(@car)
      else
        render :new
      end
    end
  
    private
  
    def car_part_params
      params.permit(:category, :manuf_country, :price, :weight_lb, :manuf, :primary_material, :oem)
    end
  end
  