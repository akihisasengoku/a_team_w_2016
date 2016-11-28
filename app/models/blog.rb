class Blog < ApplicationRecord
	has_many :replies, ->{order("created_at desc") }, dependent: :delete_all
	validates :body, presence: true
end
