require "rails_helper"

describe "Car Parts show page" do
    before(:each) do
        @a90 = Car.create!(manufacturer: "Toyota", 
                                model: "GR Supra 3.0", 
                                base_msrp: 55400, 
                                manual_option: true, 
                                category: "Sports Car",
                                model_year: 2021)

        @ev_intake = CarPart.create!(car_id: "#{@a90.id}",
                        category: "Intake System",
                        manuf_country: "UK",
                        price: 1325,
                        weight_lb: 9.11,
                        manuf: "Eventuri",
                        primary_material: "Carbon Fiber",
                        oem: false)

        @ak_exhaust = CarPart.create!(car_id: "#{@a90.id}",
                category: "Exhaust System",
                manuf_country: "SVN",
                price: 3171,
                weight_lb: 51,
                manuf: "Akrapovic",
                primary_material: "Titanium",
                oem: false)

        @g82 = Car.create!(manufacturer: "BMW", 
                model: "M4", 
                base_msrp: 79100, 
                manual_option: true,
                model_year: "2025",
                category: "Coupe")

        @f82 = Car.create!(manufacturer: "BMW", 
                model: "M4", 
                base_msrp: "65000", 
                manual_option: true,
                model_year: 2015,
                category: "Coupe")

        @m_p_spoiler = CarPart.create!(car_id: "#{@g82.id}",
                        category: "Exterior",
                        manuf_country: "GER",
                        price: 2570,
                        weight_lb: 18,
                        manuf: "M Performance",
                        primary_material: "Carbon Fiber",
                        oem: true)
    end
#     [ ] done

# User Story 4, Child Show 

# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)

    describe "as a visitor" do
        describe "When I visit '/car_parts/:id" do
            it "Shows me the car parts details" do

                
                visit "/car_parts/#{@ev_intake.id}"

                expect(page).to have_content("Eventuri")
                expect(page).to have_content("$1325")
                expect(page).to have_content("Made in: UK")
                expect(page).to have_content("Carbon Fiber")
                expect(page).to have_content("Weight: #{@ev_intake.weight_lb}")
                expect(page).to_not have_content("Akrapovic")
                expect(page).to_not have_content("SVN")
                expect(page).to_not have_content("Exhaust System")
            end

            it "Has a link to the child index" do
                visit "/car_parts/#{@ev_intake.id}"

                expect(page).to have_link("Car Parts")
            end

            it "Has a link to the parent index" do
                visit "/car_parts/#{@ev_intake.id}"

                expect(page).to have_link("Cars")
            end
        end
    end
end