require 'rails_helper'
require 'faker'
RSpec.describe Api::V1::Invoice, type: :model do
  let(:invoice_bad){{status: '',emitter: 'francoenrique@live.com',receiver: 'test_user',amount: '',emitted_at: '11/09/2022'}}
  let(:invoice_ok){{status: 'Active',emitter: 'Francoenrique@live.com',receiver: 'Test_user',amount: '59803',emitted_at: '11/09/2022'}}
  let(:invoice_faker){{status: 'Active',emitter: 'Francoenrique@live.com',receiver: Faker::Currency.name,amount: Faker::Bank.account_number,emitted_at: Faker::Date.in_date_period}}
  it 'Not create if we miss a field' do
    invoice = Api::V1::Invoice.new(invoice_bad)
    expect(invoice).to_not be_valid
  end
  it 'Create if we use all fields' do
    invoice = Api::V1::Invoice.new(invoice_ok)
    expect(invoice).to be_valid
  end
  it 'check if downcase fields' do
    invoice = Api::V1::Invoice.new(invoice_ok)
    invoice.save
    expect(invoice_ok).to_not equal(invoice)
    byebug
  end
end
