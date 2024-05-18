require 'rails_helper'

RSpec.describe 'Reviews API', type: :request do
  let!(:user) { create(:user) }
  let!(:story) { create(:story, user: user) }
  let(:story_id) { story.id }
  let(:user_id) { user.id }
  let(:valid_attributes) { { comment: 'Great story', rating: 5, user_id: user_id } }

  def json
    JSON.parse(response.body)
  end

  describe 'POST /stories/:story_id/reviews' do
    context 'when the request is valid' do
      before { post "/stories/#{story_id}/reviews", params: { review: valid_attributes } }

      it 'creates a review' do
        expect(json['comment']).to eq('Great story')
        expect(json['rating']).to eq(5)
        expect(json['user_id']).to eq(user_id)
        expect(json['story_id']).to eq(story_id)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post "/stories/#{story_id}/reviews", params: { review: { comment: '' } } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Comment can't be blank/)
      end
    end
  end
end
