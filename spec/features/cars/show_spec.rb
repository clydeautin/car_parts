require "rails_helper"

describe "Cars show page" do

# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

    describe "As a Visitor" do
        describe "When I visit '/cars/1'" do
            it "I see the car with that id including the id's attributes" do
                supra = Car.create!(manufacturer: "Toyota", 
                                    model: "GR Supra 3.0", 
                                    base_msrp: "55400", 
                                    manual_option: true,
                                    model_year: "2021",
                                    category: "Sports Car")
                m4 = Car.create!(manufacturer: "BMW", 
                                    model: "M4", 
                                    base_msrp: "79100", 
                                    manual_option: true,
                                    model_year: "2025",
                                    category: "Coupe")

                visit "/cars/#{supra.id}"

                expect(page).to have_content("Toyota")
                expect(page).to have_content("2021")
                expect(page).to have_content("GR Supra 3.0")
                expect(page).to have_content("55400")
                expect(page).to have_content("Sports Car")
                expect(page).to have_content("Yes")
                expect(page).to_not have_content(m4.model)
            end
        end
    end
end