class Station < ActiveRecord::Base
  has_many :lines, through: :stops
  validates_presence_of :name
  validates_format_of :name, :with => /\A[a-z0-9\s]+\z/i

end


