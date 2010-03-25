class Nominator < ActiveRecord::Base
  has_many :nominations
  attr_accessible :email, :name
  validates_format_of :email,
    :with => /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i,
    :message => "we need a valid email address"
  validates_presence_of :name,
    :message => "we need to know your name"
end
