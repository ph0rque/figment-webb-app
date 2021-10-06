require "application_system_test_case"

class TokenTransactionsTest < ApplicationSystemTestCase
  setup do
    @token_transaction = token_transactions(:one)
  end

  test "visiting the index" do
    visit token_transactions_url
    assert_selector "h1", text: "Token Transactions"
  end

  test "creating a Token transaction" do
    visit token_transactions_url
    click_on "New Token Transaction"

    fill_in "Deposit", with: @token_transaction.deposit
    fill_in "Gas burnt", with: @token_transaction.gas_burnt
    fill_in "Height", with: @token_transaction.height
    fill_in "Raw content", with: @token_transaction.raw_content
    fill_in "Receiver", with: @token_transaction.receiver
    fill_in "Sender", with: @token_transaction.sender
    click_on "Create Token transaction"

    assert_text "Token transaction was successfully created"
    click_on "Back"
  end

  test "updating a Token transaction" do
    visit token_transactions_url
    click_on "Edit", match: :first

    fill_in "Deposit", with: @token_transaction.deposit
    fill_in "Gas burnt", with: @token_transaction.gas_burnt
    fill_in "Height", with: @token_transaction.height
    fill_in "Raw content", with: @token_transaction.raw_content
    fill_in "Receiver", with: @token_transaction.receiver
    fill_in "Sender", with: @token_transaction.sender
    click_on "Update Token transaction"

    assert_text "Token transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Token transaction" do
    visit token_transactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Token transaction was successfully destroyed"
  end
end
