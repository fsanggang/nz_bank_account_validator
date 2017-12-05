# NzBankAccountValidator

Validator for NZ bank accounts.

Example usage:

```elixir
$ iex -S mix
> NzBankAccountValidator.is_valid?("31-2800-0320871-032")
{:ok, true}
```

Implementation is based off https://www.ird.govt.nz/resources/d/8/d8e49dce-1bda-4875-8acf-9ebf908c6e17/rwt-nrwt-spec-2014.pdf.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `nz_bank_account_validator` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:nz_bank_account_validator, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/nz_bank_account_validator](https://hexdocs.pm/nz_bank_account_validator).

