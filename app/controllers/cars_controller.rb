class CarsController < ApplicationController
    def index
        @cars = Car.all
    end

    def show
        @car = Car.find(params[:id])
    end

    def new

    end

    def create
        car = Car.new({
            manufacturer: params[:manufacturer],   
            model: params[:model],
            base_msrp: params[:msrp],
            manual_option: params[:manual_option],
            category: params[:category],
            model_year: params[:model_year]
        })
        car.save
        redirect_to '/cars'
    end

    def edit
        @car = Car.find(params[:id])
    end

    def update
        @car = Car.find(params[:id])
        if @car.update(car_params)
            redirect_to car_path(@car)
        else 
            render :edit
        end
    end

    private

    def car_params
        params.require(:car).permit(:manufacturer, :model, :base_msrp, :manual_option, :model_year)
    end

end