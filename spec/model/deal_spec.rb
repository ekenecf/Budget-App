require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    user1 = User.new(name: 'new_user', email: 'user@user.com', password: 111_111)
    Deal.create(user: user1, name: 'Deal1', amount: 40)
  end

  before { subject.save! }

  it 'if user exist' do
    subject.user = nil
    expect(subject).to_not be_valid
  end

  it 'if name exist' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
