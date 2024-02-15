class User < ApplicationRecord
    has_secure_password

    normalizes :email, with: -> email {email.strip.downcase}
    validates :email, presence: true, uniqueness: true
    validates :first_name, presence: true, length: {minimum: 2}
    validates :last_name, presence: true, length: {minimum: 2}

end
