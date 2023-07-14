FactoryBot.define do
  factory :post do
    # Define your attributes here
    author { create(:user) }
    created_at { 3.days.ago }
  end
end
