class Newsletter < ApplicationRecord

	connects_to database: { writing: :primary, reading: :primary_replica}

	has_rich_text :content

	has_many :comments
end
