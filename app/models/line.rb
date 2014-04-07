class Line < ActiveRecord::Base

  has_many :stations, through: :stops
  validates_presence_of :name
  validates_format_of :name, :with => /\A[a-z0-9\s]+\z/i
  include FriendlyId
  friendly_id :line, :use => [:slugged, :simple_i18n]
end
