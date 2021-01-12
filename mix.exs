defmodule VexCTF.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      name: "VexCTF",
      source_url: "https://github.com/VexCTF/VexCTF-elixir",
      homepage_url: "https://github.com/VexCTF/VexCTF-elixir",
      docs: [main: "VexCTF.Core", extras: ["README.md"]]
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.23", only: :dev, runtime: false},
      {:credo, "~> 1.5", only: [:dev, :test], runtime: false}
    ]
  end

  defp aliases do
    []
  end
end
