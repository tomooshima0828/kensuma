# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.general?
      can [:read, :update], User, id: user.id
      cannot [:create, :destroy], User
      cannot :manage, :general_user
    else
      cannot :read, :all
    end
  end
end
