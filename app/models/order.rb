class Order < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product
	belongs_to :package
end
