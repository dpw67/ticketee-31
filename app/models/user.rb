class User < ActiveRecord::Base
  extend OmniauthCallbacks

  # Include default devise modules. Others available are:
  # :encryptable, :lockable, :timeoutable

  devise :database_authenticatable, :registerable, :confirmable,
       :recoverable, :rememberable, :trackable, :validatable,
       :token_authenticatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :permissions

  before_save :ensure_authentication_token

  def self.reset_request_count!
    update_all("request_count = 0", "request_count > 0")
  end

  def display_name
    if twitter_id
      "#{twitter_display_name} (@#{twitter_screen_name})"
    elsif github_id
      "#{github_display_name} (#{github_user_name})"
    else
      email
    end
  end

  def to_s
    "#{display_name} (#{admin? ? "Admin" : "User"})"
  end

end
