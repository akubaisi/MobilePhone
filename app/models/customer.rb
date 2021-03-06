class Customer < ActiveRecord::Base
	validates :firstName, :presence => true
  validates :lastName, :presence => true
  validates :phone, :presence => true
  validates :email, :presence => true
  validates_format_of :email, :with => /^[\w]([^@\s,:]+)@(([\w_]+\.)(com|edu|org|net|gov|mil|biz|info))$/i, :message => "is not a valid email adress"
  validates_format_of :phone, :with => /^(\+?\{11}|\+?\d{3}?[-.]?\d{4}[-.]?\d{4})$/, :message => "should be 11 digits"
  before_save :formate_phone
  has_many :orders

  private
  def formate_phone
  	phone = self.phone.to_s
  	#to avoid having nil phone field
  	phone.gsub!(/[^0-9]/, "")
  	#\ refers to regular expression
  	self.phone = phone
  end


end
