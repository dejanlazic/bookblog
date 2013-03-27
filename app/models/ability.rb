class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.email == "dejan@a.com"
      can :manage, :all
    else
      can [:update, :read], Book
    end
  end
end
