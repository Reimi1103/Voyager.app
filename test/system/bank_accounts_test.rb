require "application_system_test_case"

class BankAccountsTest < ApplicationSystemTestCase
  setup do
    @bank_account = bank_accounts(:one)
  end

  test "visiting the index" do
    visit bank_accounts_url
    assert_selector "h1", text: "Bank Accounts"
  end

  test "creating a Bank account" do
    visit bank_accounts_url
    click_on "New Bank Account"

    fill_in "Bank code", with: @bank_account.bank_code
    fill_in "Bank holder", with: @bank_account.bank_holder
    fill_in "Bank name", with: @bank_account.bank_name
    fill_in "Bank number", with: @bank_account.bank_number
    fill_in "Bank type", with: @bank_account.bank_type
    fill_in "Branch code", with: @bank_account.branch_code
    fill_in "Branch name", with: @bank_account.branch_name
    fill_in "User", with: @bank_account.user_id
    click_on "Create Bank account"

    assert_text "Bank account was successfully created"
    click_on "Back"
  end

  test "updating a Bank account" do
    visit bank_accounts_url
    click_on "Edit", match: :first

    fill_in "Bank code", with: @bank_account.bank_code
    fill_in "Bank holder", with: @bank_account.bank_holder
    fill_in "Bank name", with: @bank_account.bank_name
    fill_in "Bank number", with: @bank_account.bank_number
    fill_in "Bank type", with: @bank_account.bank_type
    fill_in "Branch code", with: @bank_account.branch_code
    fill_in "Branch name", with: @bank_account.branch_name
    fill_in "User", with: @bank_account.user_id
    click_on "Update Bank account"

    assert_text "Bank account was successfully updated"
    click_on "Back"
  end

  test "destroying a Bank account" do
    visit bank_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Bank account was successfully destroyed"
  end
end
