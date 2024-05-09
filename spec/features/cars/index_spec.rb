require "rails_helper"

describe "Cars Index Page", type: :feature do
    # [ ] done

    # User Story 1, Parent Index 
    
    # For each parent table
    # As a visitor
    # When I visit '/parents'
    # Then I see the name of each parent record in the system

    describe "As a Visitor" do
        describe "When I visit cars index" do
            it "I can see all the cars model and manufacturer" do
                supra = Car.create!(manufacturer: "Toyota", 
                                    model: "GR Supra 3.0", 
                                    base_msrp: "55400", 
                                    manual_option: true, 
                                    category: "Sports Car")
                visit "/cars"

                expect(page).to have_content("Toyota")
                expect(page).to have_content("GR Supra 3.0")
            end
        end



    end
end