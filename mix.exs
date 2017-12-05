defmodule NzBankAccountValidator.Mixfile do
  use Mix.Project

  @github_url "https://github.com/fsanggang/nz_bank_account_validator"

  def project do
    [
      app: :nz_bank_account_validator,
      version: "1.0.0",
      elixir: "~> 1.5",
      name: "NzBankAccountValidator",
      description: "Validates NZ bank account numbers",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),

      # Docs
      name: "NzBankAccountValidator",
      source_url: @github_url
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.16", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end

  defp package do
    [
      maintainers: [ "Fiona Sanggang" ],
      licenses: [ "MIT" ],
      links: %{ "GitHub" => @github_url }
    ]
  end
end