FactoryBot.define do
  factory(:user) do
    email("test@test.com")
    password("Test123")
    password_confirmation("Test123")
  end
end
