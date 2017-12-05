defmodule NzBankAccountValidator do
  @moduledoc """
  Documentation for NzBankAccountValidator.
  """

  @doc """
  Validate the provided bank account.

  ## Options

  * `separator` – Specify the separator between components of a bank account
  number. Default is a hyphen '-'

  ## Examples

      iex> NzBankAccountValidator.is_valid?("01-902-0068389-00")
      {:ok, true}

      iex> NzBankAccountValidator.is_valid?("01-3333-0068389-00")
      {:error, "Invalid bank_branch: 3333"}

  """
  @spec is_valid?( String.t, String.t) :: { :ok, term } | { :error, String.t }
  def is_valid?( account_number, separator \\ "-" ) do
    as_keyword_list = Util.account_number_as_keyword_list( account_number, separator )

    case AlgorithmSelector.which_algo?( as_keyword_list[:bank_id], as_keyword_list[:bank_branch], as_keyword_list[:base] ) do
      { :ok, strategy, weighting } -> Util.zero_remainder?( as_keyword_list, strategy, weighting )
      { :error, reason }           -> { :error, reason }
    end
  end
end
