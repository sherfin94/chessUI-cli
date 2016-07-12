require 'terminal_ui'

describe TerminalUI do
  let(:ui) { TerminalUI.new }

  it 'responds to display_board' do
    expect(ui).to respond_to(:display_board)
  end

  it 'responds to get_next_move' do
    expect(ui).to respond_to(:get_next_move)
  end
end
