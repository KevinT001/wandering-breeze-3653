require 'rails_helper'

RSpec.describe 'projects show page' do 
  it "shows project's name and material" do 

    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)


    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    visit"/projects/#{lit_fit.id}"

    expect(page).to have_content("Litfit")
    expect(page).to have_content("Lamp")


  end

  it 'shows the theme of the challange that the project belongs to' do 
    recycled_material_challenge = Challenge.create(theme: "Recycled Material", project_budget: 1000)
    furniture_challenge = Challenge.create(theme: "Apartment Furnishings", project_budget: 1000)


    news_chic = recycled_material_challenge.projects.create(name: "News Chic", material: "Newspaper")
    lit_fit = furniture_challenge.projects.create(name: "Litfit", material: "Lamp")

    visit"/projects/#{lit_fit.id}"

   expect(page).to have_content("Apartment Furnishings")
   

  end
end
