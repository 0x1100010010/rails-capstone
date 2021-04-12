require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'creates group can be created by user' do
    @user = User.create(name: 'John', username: 'johnny')
    @group = @user.groups.new(name: 'McDonalds', description: 'McDonalds transactions', icon: 'https://upload.wikimedia.org/wikipedia/commons/5/50/McDonald%27s_SVG_logo.svg')
    expect(@group.valid?).to be true
  end

  it 'creates group can be created without name user' do
    @group = Group.new(name: 'McDonalds', description: 'McDonalds transactions', icon: 'https://upload.wikimedia.org/wikipedia/commons/5/50/McDonald%27s_SVG_logo.svg')
    expect(@group.valid?).to be false
  end

  it 'checks if group can be created without name' do
    @group = Group.new(description: 'McDonalds transactions', icon: 'https://upload.wikimedia.org/wikipedia/commons/5/50/McDonald%27s_SVG_logo.svg')
    expect(@group.valid?).to be false
  end

  it 'checks if group can be created without description' do
    @group = Group.new(name: 'McDonalds',  icon: 'https://upload.wikimedia.org/wikipedia/commons/5/50/McDonald%27s_SVG_logo.svg')
    expect(@group.valid?).to be false
  end
end
