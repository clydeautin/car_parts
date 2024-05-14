require "rails_helper"

describe "Cars Index Page", type: :feature do
    before(:each) do
        @a90 = Car.create!(manufacturer: "Toyota", 
                                model: "GR Supra 3.0", 
                                base_msrp: 55400, 
                                manual_option: true, 
                                category: "Sports Car",
                                model_year: "2021")

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
    # [ ] done

    # User Story 1, Parent Index 
    
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system

    describe "As a Visitor" do
        describe "When I visit cars index" do
            it "I can see all the cars model and manufacturer" do

                visit "/cars"

                expect(page).to have_content("Toyota")
                expect(page).to have_content("GR Supra 3.0")
            end
            # I see that records are ordered by most recently created first
            # And next to each of the records I see when it was created
            
            it "shows records orded by most recently created first and next to each of the records I see when it was created" do
                visit "/cars"

                expect(page).to have_content("created on")
                expect(page.body.index(@a90.model)).to be < page.body.index(@g82.model)
            end

            it "Has a link to the child index" do
                visit "/cars"

                expect(page).to have_link("Car Parts")
            end

            it "Has a link to the parent index" do
                visit "/cars"

                expect(page).to have_link("Cars")
            end
            it "Has a link to create a New Car" do
                visit "/cars"

                expect(page).to have_link("New Car")

                click_link("New Car")

                expect(page).to have_current_path("/cars/new")

                fill_in "manufacturer", with: "Toyota"
                fill_in "model", with: "Camry"
                check "manual_option"
                select "Sedan", from: "category"
                select "2023", from: "model_year"
                fill_in "msrp", with: "24000"
            
                click_button "Submit"
                expect(page).to have_current_path("/cars")
                expect(page).to have_content("Toyota")
                expect(page).to have_content("Camry")
            end
        end



    end
end