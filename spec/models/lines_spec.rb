require 'spec_helper'

describe Line do
  it { should have_many :stations }
  it { should validate_presence_of :name }

  it 'should not permit the entry of special characters' do
    line = Line.new(name: 'Blue Line &')
    line.save.should eq false
  end
end

