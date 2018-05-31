class Product < ApplicationRecord
	#mount_uploaders :photos, PhotosUploader
 	#serialize :photos, JSON
	belongs_to :user
	belongs_to :category
end
