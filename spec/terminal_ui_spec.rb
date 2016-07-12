require 'terminal_ui'

describe TerminalUI do
  let(:ui) { TerminalUI.new}

  it 'responds to display_board' do
    expect(ui).to respond_to(:display_board)
  end

  it 'responds to get_next_move' do
    expect(ui).to respond_to(:get_next_move)
  end

  context 'after a move is made' do
    after(:example) do

      ui.get_next_move
    end

    it 'clears the screen' do

      expect(ui).to receive(:clear_screen)

    end
  end
end
