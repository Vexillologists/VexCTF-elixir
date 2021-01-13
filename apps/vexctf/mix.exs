defmodule VexCTF.Core.MixProject do
  use Mix.Project

  def project do
    [
      app: :vexctf,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "VexCTF Core",
      source_url: "https://github.com/VexCTF/VexCTF-elixir",
      homepage_url: "https://github.com/VexCTF/VexCTF-elixir"
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {VexCTF.Core.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto_sql, "~> 3.5"},
      {:postgrex, ">= 0.0.0"}
    ]
  end
end
