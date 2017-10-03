require 'oystercard'
describe Oystercard do
  subject(:oystercard) { described_class.new }

  it "#balance should return 0 as a default when Oystercard is initialised" do
    expect(oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
  end

  it "#top_up should change the balance on the Oystercard" do
    expect{ oystercard.top_up(10)}.to change{oystercard.balance}.by(10)
  end

  it '#balance should not exceed £90' do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up(maximum_balance)
    expect { oystercard.top_up(90)}.to raise_error('You have exceeded card limit')
  end

  it 'deducts money from balance' do
    expect{ oystercard.deduct(10)}.to change{oystercard.balance}.by(-10)
  end

end
