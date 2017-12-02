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
      { :ok, strategy, weighting } -> zero_remainder?( as_keyword_list, strategy, weighting )
      { :error, reason }           -> { :error, reason }
    end
  end


  # 1. Pads the supplied bank account with leading zeroes, then
  # 2. Applies the specified weighting, then
  # 3. Uses the specified strategy to sum the weighted values, then
  # 4. Checks whether the remainder is zero.
  @spec zero_remainder?( list( any ), atom, atom ) :: { :ok, term } | { :error, String.t }
  defp zero_remainder?( account_number, strategy, weighting ) do
    weighted  =
      Util.prep_to_apply_weighting( account_number )
      |> Util.apply_weighting( weighting  )

    remainder =
      apply( Util, strategy, [weighted] )
      |> Util.remainder( weighting )

    if remainder == 0 do
      { :ok, true }
    else
      { :error, "Invalid bank account number" }
    end
  end
end
