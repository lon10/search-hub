describe ::Github::Repositories::Repos do
  context 'with suitable params' do
    it 'parse returns github response' do
      expect_any_instance_of(::Github::Responses::ReposList).to receive(:parse_list).once
      expect_any_instance_of(::Github::Gateway).to receive(:search_repos).once

      described_class.new.search('some search')
    end
  end

  context 'with not suitable params' do
    it 'parse returns github response' do
      allow_any_instance_of(::Github::Responses::ReposList).to receive(:parse_list)
      allow_any_instance_of(::Github::Gateway).to receive(:search_repos).and_raise(RestClient::UnprocessableEntity.new)

      expect(described_class.new.search('some search')).to be_nil
    end
  end
end
