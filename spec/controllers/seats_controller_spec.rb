RSpec.describe SeatsController, type: :controller do
  describe '#index' do
    subject(:response) { get :index }

    it 'responds successfully' do
      expect(response).to be_successful
    end

    it 'returns an OK status code' do
      expect(response).to have_http_status(:ok)
    end
  end

  # describe '#select' do
  # end

  # describe '#deselect' do
  # end

  # describe '#update' do
  # end

  # describe '#destroy' do
  # end
end
