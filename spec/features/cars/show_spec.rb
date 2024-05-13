require "rails_helper"

describe "Cars show page" do
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

# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

    describe "As a Visitor" do
        describe "When I visit '/cars/1'" do
            it "I see the car with that id including the id's attributes" do
                visit "/cars/#{@a90.id}"


                expect(page).to have_content("Toyota")
                expect(page).to have_content("2021")
                expect(page).to have_content("GR Supra 3.0")
                expect(page).to have_content("55400")
                expect(page).to have_content("Sports Car")
                expect(page).to have_content("Yes")
                expect(page).to_not have_content(@g82.model)
            end
            # When I visit a parent's show page
            # I see a count of the number of children associated with this parent
            it "I see a count of the number of parts associated with that car" do 
                visit "/cars/#{@a90.id}"

                expect(page).to have_content("Parts available: #{@a90.car_parts.count}")
            end

            it "Has a link to the child index" do
                visit "/cars/#{@a90.id}"

                expect(page).to have_link("Car Parts")
            end

            it "Has a link to the parent index" do
                visit "/cars/#{@a90.id}"

                expect(page).to have_link("Cars")
            end
        end
    end
end