class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable



#********************************************Associations***************************************************************#



  has_and_belongs_to_many :todo_lists, dependent: :destroy 

  has_many :notifications, dependent: :destroy

  has_many :accesses
  has_many :members, :class_name => 'users', through: :accesses



#********************************************Authenticity***************************************************************#



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login



#********************************************Various Validations*********************************************************#



  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validate :validate_username
  validates_format_of :password, with: /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$&*]).{8,}$/, :multiline => true, on: :create


    
  def validate_username
    if User.where(email: username).exists?
     errors.add(:username, :invalid)
    end
  end

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
  end

end
