class CarPartsController < ApplicationController

    def index
        @car_parts = CarPart.all
    end
end