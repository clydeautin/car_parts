require "rails_helper"

describe "Car Parts show page" do
#     [ ] done

# User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)

    describe "as a visitor" do
        describe "When I visit '/car_parts/:id"
            it "Shows me the car parts details" do
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
                
                visit "/car_parts/#{ev_intake.id}"

                expect(page).to have_content("Eventuri")
                expect(page).to have_content("1325")
                expect(page).to have_content("UK")
                expect(page).to have_content("Carbon Fiber")
                expect(page).to have_content("9.11")
                expect(page).to_not have_content("Akrapovic")
                expect(page).to_not have_content("SVN")
                expect(page).to_not have_content("Exhaust System")
            end
    end
end