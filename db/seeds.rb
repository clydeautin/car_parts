# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
CarPart.destroy_all
Car.destroy_all


a90 = Car.create!(manufacturer: "Toyota", 
                        model: "GR Supra 3.0", 
                        base_msrp: 55400, 
                        manual_option: true, 
                        category: "Sports Car",
                        model_year: "2021")

ev_intake = CarPart.create!(car_id: "#{a90.id}",
                                category: "Intake System",
                                manuf_country: "UK",
                                price: 1325,
                                weight_lb: 9.11,
                                manuf: "Eventuri",
                                primary_material: "Carbon Fiber",
                                oem: false)

ak_exhaust = CarPart.create!(car_id: "#{a90.id}",
                        category: "Exhaust System",
                        manuf_country: "SVN",
                        price: 3171,
                        weight_lb: 51,
                        manuf: "Akrapovic",
                        primary_material: "Titanium",
                        oem: false)

g82 = Car.create!(manufacturer: "BMW", 
                        model: "M4", 
                        base_msrp: 79100, 
                        manual_option: true,
                        model_year: "2025",
                        category: "Coupe")

f82 = Car.create!(manufacturer: "BMW", 
                        model: "M4", 
                        base_msrp: "65000", 
                        manual_option: true,
                        model_year: 2015,
                        category: "Coupe")

@m_p_spoiler = CarPart.create!(car_id: "#{g82.id}",
                                category: "Exterior",
                                manuf_country: "GER",
                                price: 2570,
                                weight_lb: 18,
                                manuf: "M Performance",
                                primary_material: "Carbon Fiber",
                                oem: true)