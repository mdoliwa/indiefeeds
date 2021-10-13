class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments

  def admin?
    email == 'bot@indiefeeds.com' || email == 'mdoliwa@gmail.com'
  end
end
