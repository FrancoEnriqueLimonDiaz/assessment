# frozen_string_literal: true

FactoryBot.define do
  factory :api_v1_post, class: 'Api::V1::Post' do
    title { 'MyString' }
  end
end
