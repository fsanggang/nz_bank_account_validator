defmodule Util do
  @moduledoc """
  Utility functions.
  """

  # Max lengths of the parts of a bank account number
  @max_lengths [
    bank_id:     2,
    bank_branch: 4,
    base:        8,
    suffix:      4
  ]

  # Weightings and expected moduli
  @weightings [
    a: %{ weighting: [ 0,0,6,3,7,9,0,0,10,5,8,4,2,1,0,0,0,0 ], modulus: 11 },
    b: %{ weighting: [ 0,0,0,0,0,0,0,0,10,5,8,4,2,1,0,0,0,0 ], modulus: 11 },
    c: %{ weighting: [ 3,7,0,0,0,0,9,1,10,5,3,4,2,1,0,0,0,0 ], modulus: 11 }, # currently unused
    d: %{ weighting: [ 0,0,0,0,0,0,0,7,6,5,4,3,2,1,0,0,0,0 ],  modulus: 11 },
    e: %{ weighting: [ 0,0,0,0,0,0,0,0,0,0,5,4,3,2,0,0,0,1 ],  modulus: 11 },
    f: %{ weighting: [ 0,0,0,0,0,0,0,1,7,3,1,7,3,1,0,0,0,0 ],  modulus: 10 },
    g: %{ weighting: [ 0,0,0,0,0,0,0,1,3,7,1,3,7,1,0,3,7,1 ],  modulus: 10 },
    x: %{ weighting: [ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 ],  modulus: 1 }   # always valid
  ]

  @doc """
  Converts a bank account number provided as a string into a keyword list.

  ## Examples

      iex> Util.account_number_as_keyword_list("01-902-0068389-00", "-")
      [ bank_id: 1, bank_branch: 902, base: 68389, suffix: 0 ]

  """
  @spec account_number_as_keyword_list( String.t, String.t ) :: [ bank_id: integer, bank_branch: integer, base: integer, suffix: integer ]
  def account_number_as_keyword_list( account_number, separator ) do
    Enum.zip(
      [ :bank_id, :bank_branch, :base, :suffix ],
      account_number_as_integer_list( account_number, separator )
    )
    |> Enum.into([])
  end

  @doc """
  Converts a bank account number keyword list into a padded list of integers.

  Each component of a bank account number must be left-padded with zeroes
  before the weighting can be applied.

  ## Examples

      iex> Util.prep_to_apply_weighting( [bank_id: 1, bank_branch: 902, base: 68389, suffix: 0] )
      [0, 1, 0, 9, 0, 2, 0, 0, 0, 6, 8, 3, 8, 9, 0, 0, 0, 0]

  """
  @spec prep_to_apply_weighting( list( any ) ) :: list( integer )
  def prep_to_apply_weighting( account_number ) do
    Enum.reduce(
      account_number,
      "",
      fn( {x, y}, acc ) -> acc <> pad_with_zeroes( x, Integer.to_string(y) ) end
    )
    |> String.graphemes
    |> Enum.map( fn(x) -> String.to_integer( x ) end )
  end

  @doc """
  Multiply each integer in the list with its corresponding weighting.

  The weighting used in this operation is specified in @weightings.

  ## Examples

      iex> Util.apply_weighting( [0, 1, 0, 9, 0, 2, 0, 0, 0, 6, 8, 3, 8, 9, 0, 0, 0, 0], :a )
      [0, 0, 0, 27, 0, 18, 0, 0, 0, 30, 64, 12, 16, 9, 0, 0, 0, 0]

  """
  @spec apply_weighting( list( integer ), atom ) :: list( integer )
  def apply_weighting( account_number, weighting ) do
    Enum.zip( account_number, @weightings[weighting][:weighting] )
    |> Enum.reduce( [], fn(x, acc) -> acc ++ [elem(x, 0) * elem(x, 1)] end )
  end

  @doc """
  Sums all numbers in a list.

  iex> Util.sum( [0, 0, 0, 27, 0, 18, 0, 0, 0, 30, 64, 12, 16, 9, 0, 0, 0, 0] )
  176

  """
  @spec sum( list( integer ) ) :: integer
  def sum( list ) do
    Enum.sum( list )
  end

  @doc """
  Sums the digits of the numbers in a list twice, and then sum the numbers.

  iex> Util.sum( [0, 0, 0, 0, 0, 0, 0, 0, 9, 14, 0, 24, 49, 1, 0, 0, 21, 2] )
  30

  """
  @spec sum_digits( list( integer ) ) :: integer
  def sum_digits( list ) do
    Enum.reduce( list, [], fn(x, acc) -> acc ++ [ Enum.sum( Integer.digits( x ) ) ] end )
    |> Enum.reduce( [], fn(x, acc) -> acc ++ [ Enum.sum( Integer.digits( x ) ) ] end )
    |> Enum.sum
  end

  @doc """
  Calculates the remainder of a given number.

  The modulo used in this operation is specified in @weightings

  iex> Util.remainder( 30, :f )
  0

  """
  def remainder( summed, weighting ) do
    rem( summed, @weightings[weighting][:modulus] )
  end


  # Converts a bank account number from a String into an integer list.
  defp account_number_as_integer_list( account_number, separator ) do
    String.split( account_number, separator, trim: true )
    |> Enum.map( fn(x) -> String.to_integer(x) end )
  end

  # Pads a bank account number component with leading zeroes.
  # The maximum number of digits for each component is specified by @max_lengths
  defp pad_with_zeroes( identifier, part ) do
    String.pad_leading( part, @max_lengths[identifier], "0" )
  end
end