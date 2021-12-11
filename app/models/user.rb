class User < ApplicationRecord
    has_secure_password

    validates :name, uniqueness: { case_sensitive: false }, presence: true
    validates :email, uniqueness: { case_sensitive: false }, presence: true
    validates :password, presence: true, length: { minimum: 3 }, confirmation: { case_sensitive: true }


end
