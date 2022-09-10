class Api::V1::Invoice < ApplicationRecord
  scope :filter_by_status, -> (status) { where status: status }
  scope :filter_by_emitter, -> (emitter) { where emitter: emitter }
  scope :filter_by_receiver, -> (receiver) { where receiver: receiver }
  scope :filter_by_amount, -> (amount) { where amount: amount }
end
