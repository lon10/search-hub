describe ::Github::Responses::ReposList do
  describe '#parse_list' do
    let(:response_stub) do
      File.read(File.join(Rails.root, 'spec', 'fixtures', 'github_response.json'))
    end

    let(:parsed_repo) { subject.repos.first }

    subject { described_class.new(response_stub).parse_list }

    it 'parse total_count correctly' do
      expect(subject.total_count).to eq(1)
    end

    it 'parse repositories correctly' do
      expect(parsed_repo.id).to eq(246268243)
      expect(parsed_repo.name).to eq('search-hub')
      expect(parsed_repo.full_name).to eq('lon10/search-hub')
      expect(parsed_repo.description).to eq('Some description')
    end
  end
end
