class BikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true # Anyone can view a post
  end

  def show?
    true # Anyone can view a post
  end

  def create?
    true
  end

  def edit?
    user_is_owner_or_admin?
  end

  def my_posts?
    true
  end

  def update?
    user_is_owner_or_admin?
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.owner == user || user.admin
  end
end
