require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #import' do
    context 'with a valid file' do
      let(:file) { fixture_file_upload('SampleSheet.xlsx', 'application/SampleSheet.xlsx') }

      it 'imports data and redirects to display_users' do
        import_results = { total: 4, success: 4, failed: 0, reasons: [] }
        allow(User).to receive(:import_from_excel).and_return(import_results)
        post :import, params: { file: file }
        expect(response).to redirect_to(display_users_users_path(import_results: import_results))
      end
    end
  end
end
