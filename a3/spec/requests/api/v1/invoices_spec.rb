require 'rails_helper'
RSpec.describe "/api/v1/invoices", type: :request do

  let(:valid_attributes) { {status: 'inactive', emitter: 'francoenrique@live.com', receiver: 'user_id', amount: '59803', emitted_at: '11/09/2022'} }

  describe "GET /index" do
    it "renders a successful response" do
      @api = Api::V1::Invoice.new(valid_attributes)
      @api.save
      get '/api/v1/invoices',
      expect(response.status).to eq(200)
    end
  end

end
