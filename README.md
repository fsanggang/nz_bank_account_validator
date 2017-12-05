# NzBankAccountValidator

[![Build Status](https://travis-ci.org/fsanggang/uk_account_validator.svg?branch=master)](https://github.com/fsanggang/nz_bank_account_validator)
[![Hex.pm](https://img.shields.io/hexpm/v/slugify.svg)](https://hex.pm/packages/nz_bank_account_validator)


Validator for NZ bank accounts.

## Examples

```elixir
$ iex -S mix
> NzBankAccountValidator.is_valid?("31-2800-0320871-032")
{:ok, true}

iex> NzBankAccountValidator.is_valid?("01-3333-0068389-00")
{:error, "Invalid bank_branch: 3333"}
```

## Options

There is a separator between each component of a bank account number (defaults to -).

```elixir
$ iex -S mix
> NzBankAccountValidator.is_valid?("31-2800-0320871-032")
{:ok, true}

> NzBankAccountValidator.is_valid?("31 2800 0320871 032", " ")
{:ok, true}
```


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `nz_bank_account_validator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:nz_bank_account_validator, "~> 1.0.0"}
  ]
end
```

## Links

Implementation is based off https://www.ird.govt.nz/resources/d/8/d8e49dce-1bda-4875-8acf-9ebf908c6e17/rwt-nrwt-spec-2014.pdf.