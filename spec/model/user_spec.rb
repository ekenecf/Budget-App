require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'new_user', email: 'user@user.com', password: 111111) }

  before { subject.save! }

  it 'if name exist' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'if email exist' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'if password exist' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end
