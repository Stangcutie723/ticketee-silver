  user = Factory(:user)
  ticket = Factory(:ticket,
                  :project => textmate_2,
                  :title => "Make it shiny!",
                  :description => "Gradients! Starbursts! Oh my!")
  ticket.update_attribute(:user, user)
