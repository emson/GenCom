require 'paperclip'

class Image < ActiveRecord::Base
  belongs_to :site
  has_attached_file :picture, :styles => {:thumb=>"130x130>", :feature=>"290x210>", :zoom=>"400x400>"}
  validates_presence_of :name
  
end
