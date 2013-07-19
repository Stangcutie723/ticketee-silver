require 'spec_helper'

  feature "Viewing tickets" do
    before do
      textmate_2 = Factory(:project, :name => "TextMate 2")
      Factory(:ticket,
              :project => textmate_2,
              :title => "Make it shiny!",
              :description => "Gradients! Starbursts! Oh my!")
      internet_explorer = Factory(:project, :name => "Internet Explorer")

      Factory(:ticket,
              :project => internet_explorer,
              :title => "Standards compliance",
              :description => "Isn't a joke.")
    visit '/'
end

    scenario "Viewing tickets for a given project" do
      click_link "TextMate 2"
      page.should have_content("Make it shiny!")
      page.should_not have_content("Standards compliance")
      click_link "Make it shiny!"
      within("#ticket h2") do
      page.should have_content("Make it shiny!")
    end
    page.should have_content("Gradients! Starbursts! Oh my!")
  end
end

require 'spec_helper'
  feature "Viewing projects" do
    let!(:user) { Factory(:confirmed_user) }
    let!(:project) { Factory(:project) }
  before do
    sign_in_as!(user)
    define_permission!(user, :view, project) <co id="ch08_20_1"/>
  end

  scenario "Listing all projects" do
    visit '/'
    click_link project.name
    page.current_url.should == project_url(project)
  end
end

class Permission < ActiveRecord::Base
  attr_accessible :user, :action, :thing
  belongs_to :user
  belongs_to :thing, :polymorphic => true

end
