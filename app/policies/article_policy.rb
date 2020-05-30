class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    # anyone can show
    true
  end

  def create?
    # anyone can create
    true
  end

  def update?
    # you can only update if you are the owner of the article
    @record.user == user
  end

  def destroy?
    # Same logic here
    update?
  end

end
