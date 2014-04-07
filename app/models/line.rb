class Line < ActiveRecord::Base

  has_and_belongs_to_many :stations
  validates_presence_of :name
  validates_format_of :name, :with => /\A[a-z0-9\s]+\z/i
  extend FriendlyId
  friendly_id :name, :use => :slugged

  def should_generate_new_friendly_id?
    new_record?
  end
end
