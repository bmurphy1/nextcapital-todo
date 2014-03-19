for i in 1..5
  user = User.new(:email => "user#{i}@example.org", :password => 'password', :api_token => Devise.friendly_token)
  user.save!(:validate => false)

  for j in 1..3
    user.todos.create(:description => "Description of todo item #{j}.")
  end
end
