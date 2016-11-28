class Blog < ApplicationRecord
	has_many :replies
	validates :body, presence: true
end
