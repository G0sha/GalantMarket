namespace :db do
  desc "Create admin user"
  task create_admin: :environment do
    User.create!(name: "admin",
                 password: "12345678",
                 password_confirmation: "12345678")
  end
end
