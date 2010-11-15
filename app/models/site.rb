class Site < ActiveRecord::Base
  has_many :pages
  has_one :header_snippet
  has_one :footer_snippet
  has_one :sidebar_snippet
  validates_presence_of :title, :domain, :default_page
  
  def page_by_slug(slug)
    self.pages.find_by_slug(slug)
  end
  
end


# == Schema Information
#
# Table name: sites
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  domain       :string(255)
#  notes        :text
#  default_page :integer
#  created_at   :datetime
#  updated_at   :datetime
#

