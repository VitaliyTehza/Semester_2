class Product < ApplicationRecord
	mount_uploaders :photos, PhotosUploader
 	serialize :photos, JSON

	belongs_to :user
	has_and_belongs_to_many :categories
end
