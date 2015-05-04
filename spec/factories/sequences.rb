FactoryGirl.define do
  sequence :name do |n|
    "Name #{n}"
  end

  sequence :content do |n|
    "Content #{n}"
  end
end
