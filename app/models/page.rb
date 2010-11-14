class Page < ActiveRecord::Base
  belongs_to :site
  has_many :snippets
  validates_presence_of :title, :page_type
  
  validate :check_refs
  
  
  def snippet_by_ref(ref)
    snippets.select{ |snippet| snippet.ref == ref }.first
  end
  
  private
    
    def check_refs
      return if snippets.count == 0
      roles = Util.extract_roles(page_type)
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
#  page_type  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

