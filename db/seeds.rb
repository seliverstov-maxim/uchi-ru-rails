User.destroy_all
Gist.destroy_all

user1 = Web::RegistrationUserType.create!(email: 'first@email.home', password: '123', password_confirmation: '123')
user2 = Web::RegistrationUserType.create!(email: 'second@email.home', password: '123', password_confirmation: '123')

(1..50).each do |i|
  Gist.create!(description: "Gist №#{i} by #{user1.email}", owner_id: user1.id)
  Gist.create!(description: "Gist №#{i} by #{user2.email}", owner_id: user2.id)
end


content = <<-eos
class Foo
  def bar
    puts 'some string'
  end
end
eos
gist = Gist.create!(description: "Very long name for gist. It should be very long. Ololo additional text.Very long name for gist. It should be very long. Ololo additional text.", owner: user1, content: content, language: :ruby, public: true)
