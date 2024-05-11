require 'rails_helper'

describe "Car Parts Index"
# [ ] done

# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)

    describe "As a visitor" do
        describe "When I visit car_parts index" do
            it "shows all the car parts with attributes" do
                supra = Car.create!(manufacturer: "Toyota", 
                                    model: "GR Supra 3.0", 
                                    base_msrp: "55400", 
                                    manual_option: true, 
                                    category: "Sports Car",
                                    id: 1)
                                    
                ev_intake = CarPart.create!(car_id: "1",
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
                visit "/car_parts"

                expect(page).to have_content("Intake System")
                expect(page).to have_content("UK")
                expect(page).to have_content("$1325")
                expect(page).to have_content("Eventuri")
            end
        end
    end