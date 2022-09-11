FactoryBot.define do
  factory :api_v1_invoice, class: 'Api::V1::Invoice' do
    status { "active" }
    emitter { "francoenrique@live.com" }
    receiver { "franco_limon" }
    amount { 3500 }
  end
end
