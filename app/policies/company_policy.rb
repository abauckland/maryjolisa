
  class CompanyPolicy < Struct.new(:user, :company)
    def owned
      if user.admin? || user.owner?
        company.id == user.company_id
      end
    end
        
    def index?
      user.admin?
    end
    
    def show?
      index?
    end
    
    def new?
      index?
    end
    
    def create?
      index?
    end    

    def edit?
      owned
    end
    
    def update?
      edit?
    end
    
    def destroy?
      false
    end    
        
  end
