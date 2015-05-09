FactoryGirl.define do
  sequence :name do |n|
    "Name #{n}"
  end

  sequence :content do |n|
    "Content #{n}"
  end

  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence(:password) { "12345678" }
end
