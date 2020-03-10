describe ::Github::Requests::ReposSearch do
  describe '#search' do
    let(:search_string) { 'tetris' }

    context 'by default' do
      subject { described_class.new.search(search_string) }

      it 'returns default query' do
        expect(subject).to eq('q=tetris&sort=stars&order=asc')
      end
    end

    context 'with all params' do
      subject { described_class.new.search(search_string, 'sort_criteria', 'desc') }

      it 'returns default query' do
        expect(subject).to eq('q=tetris&sort=sort_criteria&order=desc')
      end
    end
  end
end
