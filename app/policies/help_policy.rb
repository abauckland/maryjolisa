
class HelpPolicy < Struct.new(:user, :help)
        
    def edit?
      user.admin?
    end
    
    def update?
      user.admin?
    end  
        
end
