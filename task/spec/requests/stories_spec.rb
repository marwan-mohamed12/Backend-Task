require 'rails_helper'

RSpec.describe 'Stories API', type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }
  let!(:stories) { create_list(:story, 10, user: user) }
  let!(:other_user_stories) { create_list(:story, 10, user: other_user) }
  let!(:top_story) { create(:story, title: 'Top Story', body: 'This is the top story', user: user) }
  let!(:reviews) { create_list(:review, 10, story: top_story, user: user, rating: 5) }
  let(:user_id) { user.id }
  let(:story_id) { stories.first.id }
  let(:valid_attributes) { { title: 'Learn Elm', body: 'Lorem ipsum' } }

  def json
    JSON.parse(response.body)
  end

  describe 'GET /users/:user_id/stories' do
    context 'when user_id is provided' do
      before { get "/users/#{user_id}/stories", params: { page: 1 } }

      it 'returns user stories' do
        expect(json.size).to eq(5) # because of per(5) in the controller
        expect(json.first['user_id']).to eq(user.id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'POST /stories' do
    context 'when the request is valid' do
      before { post "/stories", params: { user_id: user_id, story: valid_attributes } }

      it 'creates a story' do
        expect(json['title']).to eq('Learn Elm')
        expect(json['user_id']).to eq(user.id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post "/stories", params: { user_id: user_id, story: { title: 'Foobar' } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Body can't be blank/)
      end
    end
  end

  describe 'GET /stories/top_stories' do
    before { get '/stories/top_stories', params: { page: 1 } }

    it 'returns top stories' do
      expect(json).not_to be_empty
      expect(json.size).to be <= 25
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end
end
