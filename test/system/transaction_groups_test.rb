require 'application_system_test_case'

class TransactionGroupsTest < ApplicationSystemTestCase
  setup do
    @transaction_group = transaction_groups(:one)
  end

  test 'visiting the index' do
    visit transaction_groups_url
    assert_selector 'h1', text: 'Transaction Groups'
  end

  test 'creating a Transaction group' do
    visit transaction_groups_url
    click_on 'New Transaction Group'

    fill_in 'Group', with: @transaction_group.group_id
    fill_in 'Transaction', with: @transaction_group.transaction_id
    click_on 'Create Transaction group'

    assert_text 'Transaction group was successfully created'
    click_on 'Back'
  end

  test 'updating a Transaction group' do
    visit transaction_groups_url
    click_on 'Edit', match: :first

    fill_in 'Group', with: @transaction_group.group_id
    fill_in 'Transaction', with: @transaction_group.transaction_id
    click_on 'Update Transaction group'

    assert_text 'Transaction group was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Transaction group' do
    visit transaction_groups_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Transaction group was successfully destroyed'
  end
end
