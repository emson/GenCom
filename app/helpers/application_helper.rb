module ApplicationHelper
  
  def collect_pages(site)
    pages = site.pages.collect do |page|
      [page.title, page.id]
    end
    pages
  end
  
  def mark_default(page, val=' default')
    (page.default?) ? val : "" 
  end
  
end
