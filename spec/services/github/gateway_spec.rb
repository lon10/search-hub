describe ::Github::Gateway do
  let(:serach_string) { 'some param' }

  subject { described_class.new }

  it 'sends request to github' do
    expect(RestClient).to receive(:get).with('https://api.github.com/search/repositories?q=some param&sort=stars&order=asc').once

    subject.search_repos(serach_string)
  end
end
