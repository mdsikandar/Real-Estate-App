class Project < ApplicationRecord
	has_attached_file :image, styles: {large: "600x600>",medium: "300x300>",thumb: "150x150#"} ,default_url: "/assets/:style/no_image.jpg"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	validates_presence_of :location
	validates :price, presence: true,numericality: { only_integer: true }
	validates :area, presence: true,numericality: { only_integer: true }
	validates_presence_of :developer_name ,length: {minimum: 3}
	validates :developer_name, format: { with: /\A[a-zA-Z]\D/,
		message: "Only letters is allowed" }
	before_validation { image.clear if @delete_image }
	belongs_to :user
	belongs_to :property
	def delete_image
    	@delete_image ||= false
  	end

  	def delete_image=(value)
    	@delete_image  = !value.to_i.zero?
  	end
	def self.search(search)	
  		joins(:property).where("location LIKE ? OR developer_name LIKE ? OR properties.name LIKE ? OR price LIKE ? OR area LIKE ?", "%#{search}%","%#{search}%","%#{search}%","%#{search}%","%#{search}%")
	end
	
end
