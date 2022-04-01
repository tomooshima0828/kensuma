# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.general?
      can %i[read update], User, id: user.id
      cannot %i[create destroy], User
      cannot :manage, :general_user
    else
      cannot :read, :all
    end
  end
end
