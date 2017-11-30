defmodule NzBankAccountValidatorTest do
  use ExUnit.Case
  doctest NzBankAccountValidator

  import ExUnit.CaptureIO

  test "identifies valid bank account number (:sum, :a)" do
    assert NzBankAccountValidator.is_valid?("01-902-0068389-00") == { :ok, true }
  end

  test "identifies valid bank account number (:sum, :b)" do
    assert NzBankAccountValidator.is_valid?("01-902-910100-00") == { :ok, true }
  end

  test "identifies valid bank account number (:sum, :d)" do
    assert NzBankAccountValidator.is_valid?("08-6523-1954512-01") == { :ok, true }
  end

  test "identifies valid bank account number (:sum_digits, :e)" do
    assert NzBankAccountValidator.is_valid?("09-0000-1954510-01") == { :ok, true }
  end

  test "identifies valid bank account number (:sum, :f)" do
    assert NzBankAccountValidator.is_valid?("25-2500-110000-01") == { :ok, true }
  end

  test "identifies valid bank account number (:sum_digits, :g)" do
    assert NzBankAccountValidator.is_valid?("26-2600-0320871-032") == { :ok, true }
  end

  test "identifies valid bank account number (:sum_digits, :x)" do
    assert NzBankAccountValidator.is_valid?("31-2800-0320871-032") == { :ok, true }
  end

  test "identifies invalid bank id" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("07-902-0068389-00") end) =~ "Invalid bank_id: 7"
  end

  test "identifies invalid bank_branch for bank_id 1" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("1-3333-0068389-00") end) =~ "Invalid bank_branch: 3333"
  end

  test "identifies invalid base for bank_id 1, bank_branch 902" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("01-902-999999999-00") end) =~ "Invalid base: 999999999"
  end

  test "identifies invalid bank_branch for bank_id 2" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("2-3333-899999-00") end) =~ "Invalid bank_branch: 3333"
  end

  test "identifies invalid base for bank_id 2, bank_branch 902" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("2-902-999999999-00") end) =~ "Invalid base: 999999999"
  end

  test "identifies invalid bank_branch for bank_id 3" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("3-3333-899999-00") end) =~ "Invalid bank_branch: 3333"
  end

  test "identifies invalid base for bank_id 3, bank_branch 902" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("3-902-999999999-00") end) =~ "Invalid base: 999999999"
  end

  test "identifies invalid bank_branch for bank_id 6" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("6-3333-899999-00") end) =~ "Invalid bank_branch: 3333"
  end

  test "identifies invalid base for bank_id 6, bank_branch 902" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("6-902-999999999-00") end) =~ "Invalid base: 999999999"
  end

  test "identifies invalid bank_branch for bank_id 9" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("9-3333-899999-00") end) =~ "Invalid bank_branch: 3333"
  end

  test "identifies invalid bank_branch for bank_id 11" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("11-3333-899999-00") end) =~ "Invalid bank_branch: 3333"
  end

  test "identifies invalid base for bank_id 11, bank_branch 5555" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("11-5555-999999999-00") end) =~ "Invalid base: 999999999"
  end

  test "identifies invalid bank_branch for bank_id 12" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("12-3333-899999-00") end) =~ "Invalid bank_branch: 3333"
  end

  test "identifies invalid base for bank_id 12, bank_branch 3444" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("12-3444-999999999-00") end) =~ "Invalid base: 999999999"
  end

  test "identifies invalid bank_branch for bank_id 26" do
    assert capture_io(:stderr, fn -> NzBankAccountValidator.is_valid?("26-3333-0320871-032") end) =~ "Invalid bank_branch: 3333"
  end
end
