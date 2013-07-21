class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #<co id="_432_4125_3722_1"/>
  # Setup accessible (or protected) attributes for your model
  has_many :permissions

  def to_s
    "#{email} (#{admin? ? "Admin" : "User"})"
    devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable
    attr_accessible :email, :password, :admin, :as => :admin
                  :password_confirmation
                  :remember_me
    attr_accessible :title, :body
  end
end
