class Site < ActiveRecord::Base
  has_many :pages
  has_many :images
  has_one :header_snippet
  has_one :footer_snippet
  has_one :sidebar_snippet
  validates_presence_of :title, :domain
  validates_presence_of :default_page_id, :if => Proc.new{ |model| model.pages.count > 0 }
  
  validate :default_page_check
  
  def page_by_slug(slug)
    self.pages.find_by_slug(slug)
  end
  
  def default_page
    self.pages.find_by_id(self.default_page_id)
  end
  
  def css
    "#{domain}.css"
  end
  
  private
  
    def default_page_check
      return if self.pages.count == 0
      errors.add(:default_page_id, "default page must exist") if self.default_page.nil?
    end
  
  
  
end



# == Schema Information
#
# Table name: sites
#
#  id              :integer         not null, primary key
#  title           :string(255)
#  domain          :string(255)
#  notes           :text
#  created_at      :datetime
#  updated_at      :datetime
#  default_page_id :integer
#

