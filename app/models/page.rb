class Page < ActiveRecord::Base
  belongs_to :site
  has_many :page_snippets
  validates_presence_of :title, :template
  
  validate :check_refs
  
  before_save :slugify!
  
  
  def snippet_by_ref(ref)
    page_snippets.select{ |snippet| snippet.ref == ref.to_s }.first
  end
  
  def slugify!(force=false)
    self.slug = self.title.gsub(/[^A-Z,a-z,0-9,_]/,"-").downcase.squeeze('-') if self.slug.blank? || force == true
  end
  
  def default?
    true if self.site.default_page_id == self.id
  end
  
  
  private
    
    def check_refs
      return if page_snippets.count == 0
      roles = Util.extract_roles(self.template)
      roles.each do |ref|
        self.errors.add(:snippets, "This page is missing snippet.ref=#{ref}") unless self.snippet_by_ref(ref) 
      end
    end
    
end



# == Schema Information
#
# Table name: pages
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  site_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  template   :string(255)
#  slug       :string(255)
#

