module ActionDispatch
  
  class Request
    def slug
      self.fullpath.gsub(/^./, '')
    end
    
    def root?
      self.fullpath == '/'
    end
    
  end
  
end