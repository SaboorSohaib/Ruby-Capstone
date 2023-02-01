require_relative '../classes/label'
require_relative 'spec_helper'

describe Lable do
  context 'Testing the Label class'
  title = 'Javascript'
  color = 'green'
  label = Lable.new(title, color)

  it 'should validate the title of the label' do
    expect(label.title).to eq title
  end

  it 'should validate the color of the lable' do
    expect(label.color).to eq color
  end

  it 'should add item peoperly' do
    label.add_item(item)
    expect(label.items.length).to eq 1
  end
end
