class User < ApplicationRecord
  validates :first_name, presence: { message: "Please enter your first name." }

  validates :last_name, presence: { message: "Please enter your last name." }

  validates :birthday, presence: { message: "Please enter your birthday." }

  validates :gender, presence: { message: "Please choose your gender." }
  
  validates :email, presence: { message: "Please enter your email." }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email format." }, if: -> { email.present? }
  
  validates :phone, presence: { message: "Please enter your phone number." }
  validates :phone, format: { with: /\A(\+66|0)\d{9}\z/, message: "Invalid phone number format." }, if: -> { phone.present? }
  
  validates :subject, presence: { message: "Please select subject." }
end
