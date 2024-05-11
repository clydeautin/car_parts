require 'rails_helper'

describe "Car Parts Index" do
    before(:each) do
        @supra = Car.create!(manufacturer: "Toyota", 
                            model: "GR Supra 3.0", 
                            base_msrp: "55400", 
                            manual_option: true, 
                            category: "Sports Car",
                            id: 1)

        @m4 = Car.create!(manufacturer: "BMW", 
                        model: "M4", 
                        base_msrp: "79100", 
                        manual_option: true,
                        model_year: "2025",
                        category: "Coupe",
                        id: 2)
        
        @ev_intake = CarPart.create!(car_id: "1",
                                    category: "Intake System",
                                    manuf_country: "UK",
                                    price: 1325,
                                    weight_lb: 9.11,
                                    manuf: "Eventuri",
                                    primary_material: "Carbon Fiber",
                                    oem: false)
        
        @ak_exhaust = CarPart.create!(car_id: "1",
                                    category: "Exhaust System",
                                    manuf_country: "SVN",
                                    price: 3171,
                                    weight_lb: 51,
                                    manuf: "Akrapovic",
                                    primary_material: "Titanium",
                                    oem: false)
        @m_p_spoiler = CarPart.create!(car_id: "2",
                                        category: "Exterior",
                                        manuf_country: "GER",
                                        price: 2570,
                                        weight_lb: 18,
                                        manuf: "M Performance",
                                        primary_material: "Carbon Fiber",
                                        oem: true)
    end
# [ ] done

# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)

    describe "As a visitor" do
        describe "When I visit car_parts index" do
            it "shows all the car parts with attributes" do
                visit "/car_parts"

                expect(page).to have_content("Intake System")
                expect(page).to have_content("UK")
                expect(page).to have_content("$1325")
                expect(page).to have_content("Eventuri")
            end
        end

        describe "When I visit a car's parts index page" do
            it "shows only the car parts for that car" do
                visit "/cars/#{@supra.id}/car_parts"

                expect(page).to have_content(@ev_intake.manuf)
                expect(page).to_not have_content(@m_p_spoiler.manuf)
            end
        end
    end
end