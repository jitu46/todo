class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable


  has_and_belongs_to_many :todo_lists, dependent: :destroy 
  has_many :notifications, dependent: :destroy


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login

  def self.find_for_database_authentication warden_conditions
  	conditions = warden_conditions.dup
  	login = conditions.delete(:login)
  	where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  end

end
