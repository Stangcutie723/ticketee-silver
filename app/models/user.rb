class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable

  #<co id="_432_4125_3722_1"/>
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :admin, :as => :admin
                  :password_confirmation, :remember_me
  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
  end

  # attr_accessible :title, :body
end
