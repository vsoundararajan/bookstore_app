class Address < ActiveRecord::Base
  belongs_to :user
  validates :address_line1, :city, :zip_code, presence: true
end
