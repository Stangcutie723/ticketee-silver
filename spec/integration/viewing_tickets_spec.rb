 user = Factory(:confirmed_user)
  ticket = Factory(:ticket,
                  :project => textmate_2,
                  :title => "Make it shiny!",
                  :description => "Gradients! Starbursts! Oh my!")
  ticket.update_attribute(:user, user)
  define_permission!(user, "view", textmate_2)
  define_permission!(user, "view", internet_explorer)
  sign_in_as!(user)
