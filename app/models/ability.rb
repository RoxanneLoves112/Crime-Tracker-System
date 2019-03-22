class Ability
  include CanCan::Ability

  def initialize(user)
    # set user to new User if not logged in
    user ||= User.new # i.e., a guest user
    
    # set authorizations for different user roles
    if user.role? :commish
      # they get to do it all
      can :manage, :all
      
      
    elsif user.role? :chief
      # can manage investigations, investigation_notes, crime_investigations, criminals, suspects and assignments
      can :manage, Investigation
      can :manage, InvestigationNote
      can :manage, CrimeInvestigation
      can :manage, Criminal
      can :manage, Suspect
      can :manage, Assignment

      # can read all
      can :read, :all

      # can update his/her own unit
      can :update, Unit do |u|
        u.id == user.officer.unit.id
      end

      # can manage all officers in his/her own unit
      can :manage, Officer do |this_officer|
        my_officers = user.officer.unit.officers.map(&:id)
        my_officers.include? this_officer.id
      end

      # can update his/her own user profile
      can :update, User do |u|
        u.id == user.id
      end

    elsif user.role? :officer
      # can manage investigation_notes, crime_investigations, criminals and suspects
      can :manage, InvestigationNote
      can :manage, CrimeInvestigation
      can :manage, Criminal
      can :manage, Suspect

      # can read investigations, assignments and crimes
      can :read, Investigation
      can :read, Assignment
      can :read, Crime

      # can create investigations
      can :create, Investigation

      # can see lists of units
      can :index, Unit

      # can update the investigations he/she is currently assigned to
      can :update, Investigation do |this_investigation|
        my_investigations = user.officer.assignments.current.map{|a| a.investigation_id}
        my_investigations.include? this_investigation.id 
      end


      # can read his/her own information
      can :read, Officer do |o|
        o.id == user.officer.id
      end

      # can update his/her own information
      can :update, Officer do |o|
        o.id == user.officer.id
      end

      cannot :index, Officer

      # can read his/her own user profile
      can :read, User do |u|
        u.id == user.id
      end

      # can update his/her own user profile
      can :update, User do |u|
        u.id == user.id
      end

      # can read his/her own unit
      can :show, Unit do |u|
        u.id == user.officer.unit.id
      end
      
    else
      # guests can only read crimes
      can :read, Crime
    end
  end
end
