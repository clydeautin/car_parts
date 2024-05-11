# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Car.create!(manufacturer: "Toyota", 
            model: "GR Supra 3.0", 
            base_msrp: "55400", 
            manual_option: true, 
            category: "Sports Car")

CarPart.create!(car_id: "1",
        category: "Intake System",
        manuf_country: "UK",
        price: 1325,
        weight_lb: 9.11,
        manuf: "Eventuri",
        primary_material: "Carbon Fiber",
        oem: false)

        ak_exhaust = CarPart.create!(car_id: "1",
                                    category: "Exhaust System",
                                    manuf_country: "SVN",
                                    price: 3171,
                                    weight_lb: 51,
                                    manuf: "Akrapovic",
                                    primary_material: "Titanium",
                                    oem: false)

Car.create!(manufacturer: "BMW", 
            model: "M4", 
            base_msrp: "79100", 
            manual_option: true,
            model_year: "2025",
            category: "Coupe")