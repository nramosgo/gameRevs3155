class Account < ApplicationRecord
    validates :userName, presence: true, length: {minimum: 3}
    validates :password, presence: true, length: {minimum: 3}
    has_many :articles, dependent: :destroy
    has_many :reviews, dependent: :destroy
end
