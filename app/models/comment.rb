class Comment < ApplicationRecord

	connects_to database: { writing: :primary2, reading: :primary2}

	belongs_to :newsletter
	belongs_to :subcriber
end
