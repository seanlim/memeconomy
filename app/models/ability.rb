class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new
    can :manage, :all if user.role == 'admin' 
    can %i[destroy update], Post, :user_id => user.id
  end
  
  end