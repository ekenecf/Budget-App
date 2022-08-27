require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    user1 = User.new(name: 'new_user', email: 'user@user.com', password: 111_111)
    Group.create(user: user1, name: 'Group1', icon: 'Icon1')
  end

  before { subject.save! }

  it 'if user exist' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'if group name exist' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'should check for invalid if icon"s column is empty' do
    subject.icon = 'Icon1'
    expect(subject).to be_valid
  end
end
