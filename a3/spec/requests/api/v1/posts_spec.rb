require 'rails_helper'
RSpec.describe '/api/v1/posts', type: :request do
  let(:valid_attributes) {
    { title: 'this_title', images: [] }
  }

  let(:valid_headers) {
    { 'HTTP_ACCEPT' => 'application/json' }
  }

  let(:api_v1_posts_url) {
    '/api/v1/posts'
  }

  let(:invalid_attributes) {
    { title: '', images: [] }
  }

  let(:new_attributes) {
    { title: 'hello', images: [] }
  }

  describe 'GET /index' do
    before do
      get '/api/v1/posts'
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      post = Api::V1::Post.create! valid_attributes
      get api_v1_post_url(post), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Api::V1::Post' do
        expect {
          post api_v1_posts_url,
               params: { api_v1_post: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Api::V1::Post, :count).by(1)
      end

      it 'renders a JSON response with the new api_v1_post' do
        post api_v1_posts_url,
             params: { api_v1_post: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) {
        skip('Add a hash of attributes valid for your model')
      }

      it 'renders a JSON response with the api_v1_post' do
        post = Api::V1::Post.create! valid_attributes
        patch api_v1_post_url(post),
              params: { api_v1_post: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the api_v1_post' do
        post = Api::V1::Post.create! valid_attributes
        patch api_v1_post_url(post),
              params: { api_v1_post: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
