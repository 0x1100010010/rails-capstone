require 'rails_helper'

RSpec.describe Transaction, type: :model do
  it 'creates transaction can be created by user' do
    @user = User.create(name: 'John', username: 'johnny')
    @transaction = @user.transactions.new(name: 'McDonalds', amount: 15)
    expect(@transaction.valid?).to be true
  end

  it 'creates transaction can be created without name user' do
    @transaction = Transaction.create(name: 'McDonalds transaction', amount: 15)
    expect(@transaction.valid?).to be false
  end

  it 'checks if transaction can be created without name' do
    @transaction = Transaction.create(amount: 15)
    expect(@transaction.valid?).to be false
  end

  it 'checks if transaction can be created without amount' do
    @transaction = Transaction.create(name: 'McDonalds transaction')
    expect(@transaction.valid?).to be false
  end

  it 'checks if transaction can be created with wrong value' do
    @transaction = Transaction.create(name: 'McDonalds transaction', amount: '15')
    expect(@transaction.valid?).to be false
  end

end
