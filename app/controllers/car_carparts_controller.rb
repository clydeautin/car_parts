class CarCarpartsController < ApplicationController
    def index
        car = Car.find(params[:car_id])
        @car_parts = car.car_parts
    end
end