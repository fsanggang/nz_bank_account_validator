defmodule NzBankAccountValidator do
  @moduledoc """
  Documentation for NzBankAccountValidator.
  """

  @doc """
  Validate the provided bank account.

  ## Examples

      iex> NzBankAccountValidator.is_valid?("01-902-0068389-00")
      {:ok, true}

      iex> NzBankAccountValidator.is_valid?("01-3333-0068389-00")
      {:error, "Invalid bank_branch: 3333"}

  """
  def is_valid?( account_number, separator \\ "-" ) do
    as_keyword_list = Util.account_number_as_keyword_list( account_number, separator )

    case AlgorithmSelector.which_algo?( as_keyword_list[:bank_id], as_keyword_list[:bank_branch], as_keyword_list[:base] ) do
      { :ok, strategy, weighting } -> zero_remainder?( as_keyword_list, strategy, weighting )
      { :error, reason }           -> { :error, reason }
    end
  end

  defp zero_remainder?( account_number, strategy, weighting ) do
    padded    = Util.prep_to_apply_weighting( account_number )
    weighted  = Util.apply_weighting( padded, weighting  )
    summed    = apply( Util, strategy, [weighted] )
    remainder = Util.remainder( summed, weighting )

    if remainder == 0 do
      { :ok, true }
    else
      { :error, "Invalid bank account number" }
    end
  end
end
