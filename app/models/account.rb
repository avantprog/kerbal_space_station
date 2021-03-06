class Account < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable, :token_authenticatable

  has_many :downloadables
  has_many :mods
  has_many :crafts

  recommends :downloadables

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  attr_accessible :email
  attr_accessible :username
  attr_accessible :password, :password_confirmation, :remember_me

  def owner?(resource)
    self == resource.account
  end
end
