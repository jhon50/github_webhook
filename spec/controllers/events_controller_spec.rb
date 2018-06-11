require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe '#index' do
    context 'request events with issue_id' do
      let!(:event) { create(:event) }
      before do
        get :index, params: { issue_id: 2 }
      end
      it 'returns status 200' do
        expect(response).to be_success
      end
    end
  end
end