# frozen_string_literal: true

module Api
  module V1
    class Invoice < ApplicationRecord
      validates :status, presence: true
      validates :emitter, presence: true
      validates :receiver, presence: true
      validates :amount, presence: true
      scope :filter_by_status, ->(status) { where status: }
      scope :filter_by_emitter, ->(emitter) { where emitter: }
      scope :filter_by_receiver, ->(receiver) { where receiver: }
      scope :filter_by_amount, ->(amount) { where amount: }
      scope :filter_by_emitted_at, ->(emitted_at) { where emitted_at: }
      before_save { status.downcase! }
      before_save { emitter.downcase! }
      before_save { receiver.downcase! }
      before_save :assign_date
      private
      def assign_date
        self.emitted_at = Date.today.to_s
      end
    end
  end
end
