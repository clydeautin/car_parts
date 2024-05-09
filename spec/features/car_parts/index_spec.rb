require 'rails_helper'

describe "Car Parts Index"
# [ ] done

# User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)

    describe "As a visitor" do
        describe "When I visit car_parts index" do
            it "shows all the car parts with attributes" do
                ev_intake = CarParts.create!(car_id: "1",
                                            category: "Intake System",
                                            manuf_country: "UK",
                                            price: 1325,
                                            weight_lb: 9.11,
                                            manufacturer: "Eventuri",
                                            primary_material: "Carbon Fiber",
                                            oem: false)
                
                visit "/car_parts"

                expect(page).to have_content("Intake System")
                expect(page).to have_content("UK")
                expect(page).to have_content("$1325")
                expect(page).to have_content("Eventuri")
            end
        end
    end