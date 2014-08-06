class UserPolicy < Struct.new(:user, :record)

  class Scope < Struct.new(:user, :scope)
    def resolve
        scope.where(:company_id => user.company_id)
    end
  end


    def index?
      user.admin? || user.owner?
    end
    
    def show?
      if user.admin? || user.owner?
        record.company_id == user.company_id
      end
    end
    
    
    def update?
      true
    end

    def edit?
      user.admin? || user.owner?
    end
    
    def create_acccount?
      user.admin? || user.owner?
    end    
end