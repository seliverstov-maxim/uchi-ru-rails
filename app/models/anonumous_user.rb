class AnonumousUser
  include Authority::UserAbilities

  def guest?
    true
  end
end
