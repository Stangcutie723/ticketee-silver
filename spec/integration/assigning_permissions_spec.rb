  scenario "Creating tickets for a project" do
    check_permission_box "view", project
    check_permission_box "create_tickets", project
    click_button "Update"
    click_link "Sign out"

    sign_in_as!(user)
    click_link project.name
    click_link "New Ticket"
    fill_in "Title", :with => "Shiny!"
    fill_in "Description", :with => "Make it so!"
    click_button "Create"
    page.should have_content("Ticket has been created.")
  end

  scenario "Updating a ticket for a project" do
    check_permission_box "view", project
    check_permission_box "edit_tickets", project
    click_button "Update"
    click_link "Sign out"

    sign_in_as!(user)
    click_link project.name
    click_link ticket.title
    click_link "Edit Ticket"
    fill_in "Title", :with => "Really shiny!"
    click_button "Update Ticket"
    page.should have_content("Ticket has been updated")
  end

  scenario "Deleting a ticket for a project" do
    check_permission_box "view", project
    check_permission_box "delete_tickets", project
    click_button "Update"
    click_link "Sign out"

    sign_in_as!(user)
    click_link project.name
    click_link ticket.title
    click_link "Delete Ticket"
    page.should have_content("Ticket has been deleted.")
  end
