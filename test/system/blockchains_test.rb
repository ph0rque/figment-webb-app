require "application_system_test_case"

class BlockchainsTest < ApplicationSystemTestCase
  setup do
    @blockchain = blockchains(:one)
  end

  test "visiting the index" do
    visit blockchains_url
    assert_selector "h1", text: "Blockchains"
  end

  test "creating a Blockchain" do
    visit blockchains_url
    click_on "New Blockchain"

    fill_in "Deposit", with: @blockchain.deposit
    fill_in "Gas burnt", with: @blockchain.gas_burnt
    fill_in "Height", with: @blockchain.height
    fill_in "Raw content", with: @blockchain.raw_content
    fill_in "Receiver", with: @blockchain.receiver
    fill_in "Sender", with: @blockchain.sender
    click_on "Create Blockchain"

    assert_text "Blockchain was successfully created"
    click_on "Back"
  end

  test "updating a Blockchain" do
    visit blockchains_url
    click_on "Edit", match: :first

    fill_in "Deposit", with: @blockchain.deposit
    fill_in "Gas burnt", with: @blockchain.gas_burnt
    fill_in "Height", with: @blockchain.height
    fill_in "Raw content", with: @blockchain.raw_content
    fill_in "Receiver", with: @blockchain.receiver
    fill_in "Sender", with: @blockchain.sender
    click_on "Update Blockchain"

    assert_text "Blockchain was successfully updated"
    click_on "Back"
  end

  test "destroying a Blockchain" do
    visit blockchains_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Blockchain was successfully destroyed"
  end
end
