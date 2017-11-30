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

  def account_number_as_keyword_list(account_number, separator) do
    Enum.zip(
      [ :bank_id, :bank_branch, :base, :suffix ],
      account_number_as_integer_list( account_number, separator )
    )
    |> Enum.into([])
  end

  def prep_to_apply_weighting( account_number ) do
    account_number_as_string_list( account_number )
    |> Enum.map( fn(x) -> String.to_integer( x ) end )
  end

  def account_number_as_string_list( account_number ) do
    Enum.reduce(account_number, "", fn({x, y}, acc) -> acc <> pad_with_zeroes(x, Integer.to_string(y)) end)
    |> String.graphemes
  end

  def apply_weighting( account_number, weighting ) do
    Enum.zip( account_number, @weightings[weighting][:weighting] )
    |> Enum.reduce( [], fn(x, acc) -> acc ++ [elem(x, 0) * elem(x, 1)] end )
  end

  def sum( list ) do
    Enum.sum( list )
  end

  def sum_digits( account_number ) do
    Enum.reduce( account_number, [], fn(x, acc) -> acc ++ [ Enum.sum( Integer.digits( x ) ) ] end )
    |> Enum.reduce( [], fn(x, acc) -> acc ++ [ Enum.sum( Integer.digits( x ) ) ] end )
    |> Enum.sum
  end

  def remainder( summed, weighting ) do
    rem( summed, @weightings[weighting][:modulus] )
  end

  defp account_number_as_integer_list( account_number, separator ) do
    String.split( account_number, separator, trim: true )
    |> Enum.map( fn(x) -> String.to_integer(x) end )
  end

  defp pad_with_zeroes( identifier, part ) do
    String.pad_leading( part, @max_lengths[identifier], "0" )
  end
end