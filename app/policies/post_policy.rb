class PostPolicy < ApplicationPolicy


  def update?
    user.admin? || !post.published?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
end
