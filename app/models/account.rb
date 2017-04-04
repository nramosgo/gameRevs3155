class Account < ApplicationRecord
    validates :username, presence: true, length: {minimum: 3}
    validates :password, presence: true, length: {minimum: 3}
    has_many :articles
    has_many :reviews
end
