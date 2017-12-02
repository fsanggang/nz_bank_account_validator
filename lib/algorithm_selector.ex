defmodule AlgorithmSelector do
  @moduledoc """
  Determines which weighting and summing strategy to use to validate a
  bank account number.
  """

  @doc """
  Checks that a given bank_id, bank_branch, and base falls has the expected
  value or falls within the expected range.

  Returns {:ok, <summing strategy>, <weighting>} or {:error, <message>} if
  the bank_id, bank_branch, and base are invalid.

  ## Examples

      iex> AlgorithmSelector.which_algo?(1, 902, 68389)
      {:ok, :sum, :a}

      iex> AlgorithmSelector.which_algo?(1, 3333, 68389)
      {:error, "Invalid bank_branch: 3333"}

  """
  @spec which_algo?( number, number, number ) :: { :ok, atom, atom } | { :error, String.t }
  def which_algo?( bank_id, bank_branch, base )

  def which_algo?( 1, bank_branch, base )
    when bank_branch in 1..999
    when bank_branch in 1100..1199
    when bank_branch in 1800..1899 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 1, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 2, bank_branch, base )
    when bank_branch in 1..999
    when bank_branch in 1200..1299 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 2, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 3, bank_branch, base )
    when bank_branch in 1..999
    when bank_branch in 1300..1399
    when bank_branch in 1500..1599
    when bank_branch in 1700..1799
    when bank_branch in 1900..1999 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 3, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 6, bank_branch, base )
    when bank_branch in 1..999
    when bank_branch in 1400..1499 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 6, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 8, bank_branch, _ )
    when bank_branch in 6500..6599 do

    { :ok, :sum, :d }
  end

  def which_algo?( 8, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 9, 0, _ ) do
    { :ok, :sum, :e }
  end

  def which_algo?( 9, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}"}
  end

  def which_algo?( 11, bank_branch, base )
    when bank_branch in 5000..6499
    when bank_branch in 6600..8999 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 11, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end


  def which_algo?( 12, bank_branch, base )
    when bank_branch in 3000..3299
    when bank_branch in 3400..3499
    when bank_branch in 3600..3699 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 12, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 13, bank_branch, base )
    when bank_branch in 4900..4999 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 13, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 14, bank_branch, base )
    when bank_branch in 4700..4799 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 14, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 15, bank_branch, base )
    when bank_branch in 3900..3999 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 15, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 16, bank_branch, base )
    when bank_branch in 4400..4499 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 16, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 17, bank_branch, base )
    when bank_branch in 3300..3399 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 17, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 18, bank_branch, base )
    when bank_branch in 3500..3599 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 18, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 19, bank_branch, base )
    when bank_branch in 4600..4649 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 19, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 20, bank_branch, base )
    when bank_branch in 4100..4199 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 20, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end


  def which_algo?( 21, bank_branch, base )
    when bank_branch in 4800..4899 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 21, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 22, bank_branch, base )
    when bank_branch in 4000..4049 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 22, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 23, bank_branch, base )
    when bank_branch in 3700..3799 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 23, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 24, bank_branch, base )
    when bank_branch in 4300..4349 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 24, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 25, bank_branch, _ )
    when bank_branch in 2500..2599 do

    { :ok, :sum, :f }
  end

  def which_algo?( 25, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 26, bank_branch, _ )
    when bank_branch in 2600..2699 do
    { :ok, :sum_digits, :g }
  end

  def which_algo?( 26, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 27, bank_branch, base )
    when bank_branch in 3800..3849 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 27, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 28, bank_branch, _ )
    when bank_branch in 2100..2149 do

    { :ok, :sum_digits, :g }
  end

  def which_algo?( 28, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 29, bank_branch, _ )
    when bank_branch in 2150..2299 do

    { :ok, :sum_digits, :g }
  end

  def which_algo?( 29, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 30, bank_branch, base )
    when bank_branch in 2900..2949 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 30, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 31, bank_branch, _ )
    when bank_branch in 2800..2849 do

    { :ok, :sum, :x }
  end

  def which_algo?( 33, bank_branch, _ )
    when bank_branch in 6700..6799 do

    { :ok, :sum, :f }
  end

  def which_algo?( 33, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 35, bank_branch, base )
    when bank_branch in 2400..2499 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 35, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( 38, bank_branch, base )
    when bank_branch in 9000..9499 do

    case base do
      x when x in 0..899999        -> { :ok, :sum, :a }
      x when x in 900000..99999999 -> { :ok, :sum, :b }
      _                            -> { :error, "Invalid base: #{base}" }
    end
  end

  def which_algo?( 38, bank_branch, _ ) do
    { :error, "Invalid bank_branch: #{bank_branch}" }
  end

  def which_algo?( bank_id, _, _) do
    { :error, "Invalid bank_id: #{bank_id}" }
  end

end