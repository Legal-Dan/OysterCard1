require 'Oystercard'

describe Oystercard do
  it 'has a balance of 0 when initialised' do
    expect(subject.balance).to eq 0
  end

  it 'add money to card' do
    subject.top_up(1)
    expect(subject.balance).to eq 1
  end

  it 'prevents adding more than the limit to the balance' do
    expect{ (subject.top_up(100)) }.to raise_error("maximum exceeded: #{Oystercard::MAXIMUM_BALANCE}")
  end

  it 'deducts money from the card' do
    subject.top_up(2)
    subject.deduct(1)
    expect(subject.balance).to eq 1
  end

  it 'can identify if a card is currently in use on a journey' do
    expect(subject).not_to be_in_use
  end

  it 'can touch in and mark the card as in use' do
    subject.top_up(2)
    subject.touch_in
    expect(subject).to be_in_use
  end

  it 'can touch out and mark the card as no longer in use' do
    subject.top_up(2)
    subject.touch_in
    subject.touch_out
    expect(subject).not_to be_in_use
  end

  it 'does not touch in with insufficient balance' do
    expect{ subject.touch_in }.to raise_error "Insufficient balance"
  end

end 