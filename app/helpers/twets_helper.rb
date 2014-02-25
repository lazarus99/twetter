module TwetsHelper
  PATTERN = /(@\w+)/
   
  def userLinker(twet, name)
      user = User.where(:username => name[1..-1]).first     
    if user  
      return twet.gsub!(name, (link_to(name, profile_path(user)))).html_safe
    else return twet
    end
  end
  
  def twetReturner(twet)
    if twet.match(/(@\w+)/)
      name = twet.scan(/(@\w+)/)
      name.each do |n|
        #Rails.logger.info(twet)
        twet = userLinker(twet, n[0])
        
      end
    end
    return twet
  end
    
end
