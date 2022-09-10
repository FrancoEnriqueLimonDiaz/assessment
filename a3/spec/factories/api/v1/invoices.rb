FactoryBot.define do
  factory :api_v1_invoice, class: 'Api::V1::Invoice' do
    status { "MyString" }
    emitter { "MyText" }
    receiver { "MyText" }
    amount { "" }
  end
end
