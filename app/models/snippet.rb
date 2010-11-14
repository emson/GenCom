class Snippet < ActiveRecord::Base
  validates_presence_of :ref, :content

end


# == Schema Information
#
# Table name: snippets
#
#  id         :integer         not null, primary key
#  ref        :string(255)
#  content    :text
#  page_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  type       :string(255)
#  site_id    :integer
#
