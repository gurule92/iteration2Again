RSpec.feature "HomePages", type: :feature do
    scenario "The visitor should see tier lists" do
        visit root_path
        expect(page).to have_text("Public Tier Lists")
    end
end
  