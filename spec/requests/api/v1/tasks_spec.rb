require 'rails_helper'

RSpec.describe 'Api V1 Tasks', type: :request do
  describe 'GET /api/v1/tasks' do
    context 'when tasks exist' do
      let!(:task) { create(:task) }

      before { get api_v1_tasks_path }

      it 'returns a list of tasks with image_url' do
        expect(response).to have_http_status(:ok)
        expect(json_response).to be_an(Array)
        expect(json_response.first['id']).to eq(task.id)
        expect(json_response.first).to have_key('image_url')
      end
    end

    context 'when no tasks exist' do
      before { get api_v1_tasks_path }

      it 'returns not_found error' do
        expect(response).to have_http_status(:not_found)
        expect(json_response['error']).to eq('No Task Found')
      end
    end
  end

  def json_response
    JSON.parse(response.body)
  end
end
