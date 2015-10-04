class GistAuthorizer < ApplicationAuthorizer
  def readable_by?(user)
    resource.public? || resource.owner == user
  end

  def updatable_by?(user)
    resource.owner == user
  end

  def deletable_by?(user)
    resource.owner == user
  end
end
