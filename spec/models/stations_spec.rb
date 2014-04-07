require 'spec_helper'

describe Station do
  it { should have_many :lines }
  it { should validate_presence_of :name }

  it 'should not permit the entry of special characters' do
    station = Station.new(name: 'Blue Line &')
    station.save.should eq false
  end

end
