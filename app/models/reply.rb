class Reply < ApplicationRecord
	belongs_to :blog
	validates :comment, presence: true
end
