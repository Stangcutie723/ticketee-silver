require 'spec_helper'

  feature "Editing tickets" do
    before do
      sign_in_as!(user)
    let!(:project) { Factory(:project) }
    let!(:ticket) { Factory(:ticket, :project => project) }
  end

  before do
    define_permission!(user, "view", project)
    define_permission!(user, "edit tickets", project)

    visit '/'
    click_link project.name
    click_link ticket.title
    click_link "Edit Ticket"
  end

  scenario "Updating a ticket" do
    fill_in "Title", :with => "Make it really shiny!"
    click_button "Update Ticket"
    page.should have_content "Ticket has been updated."
    within("#ticket h2") do
      page.should have_content("Make it really shiny!")
  end

  page.should_not have_content ticket.title

end
  scenario "Updating a ticket with invalid information" do
    fill_in "Title", :with => ""
    click_button "Update Ticket"
    page.should have_content("Ticket has not been updated.")
  end
end
