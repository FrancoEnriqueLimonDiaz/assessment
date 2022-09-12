# frozen_string_literal: true

module Api
  module V1
    class Post < ApplicationRecord
      has_many_attached :images
    end
  end
end
