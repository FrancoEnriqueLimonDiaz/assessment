class Api::V1::Invoice < ApplicationRecord
  validates :status, presence: true
  validates :emitter, presence: true
  validates :receiver, presence: true
  validates :amount, presence: true
  scope :filter_by_status, -> (status) { where status: status }
  scope :filter_by_emitter, -> (emitter) { where emitter: emitter }
  scope :filter_by_receiver, -> (receiver) { where receiver: receiver }
  scope :filter_by_amount, -> (amount) { where amount: amount }
  before_save { self.status.downcase!}
  before_save { self.emitter.downcase!}
  before_save { self.receiver.downcase!}
end
