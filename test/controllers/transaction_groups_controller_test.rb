require 'test_helper'

class TransactionGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction_group = transaction_groups(:one)
  end

  test 'should get index' do
    get transaction_groups_url
    assert_response :success
  end

  test 'should get new' do
    get new_transaction_group_url
    assert_response :success
  end

  test 'should create transaction_group' do
    assert_difference('TransactionGroup.count') do
      post transaction_groups_url,
           params: { transaction_group: { group_id: @transaction_group.group_id,
                                          transaction_id: @transaction_group.transaction_id } }
    end

    assert_redirected_to transaction_group_url(TransactionGroup.last)
  end

  test 'should show transaction_group' do
    get transaction_group_url(@transaction_group)
    assert_response :success
  end

  test 'should get edit' do
    get edit_transaction_group_url(@transaction_group)
    assert_response :success
  end

  test 'should update transaction_group' do
    patch transaction_group_url(@transaction_group),
          params: { transaction_group: { group_id: @transaction_group.group_id,
                                         transaction_id: @transaction_group.transaction_id } }
    assert_redirected_to transaction_group_url(@transaction_group)
  end

  test 'should destroy transaction_group' do
    assert_difference('TransactionGroup.count', -1) do
      delete transaction_group_url(@transaction_group)
    end

    assert_redirected_to transaction_groups_url
  end
end
