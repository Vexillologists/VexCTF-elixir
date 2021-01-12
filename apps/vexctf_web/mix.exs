defmodule VexCTF.Web.MixProject do
  use Mix.Project

  def project do
    [
      app: :vexctf_web,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "VexCTF Web",
      source_url: "https://github.com/VexCTF/VexCTF-elixir",
      homepage_url: "https://github.com/VexCTF/VexCTF-elixir"
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {VexCTF.Web.Application, []}
    ]
  end

  defp deps do
    [
      {:absinthe_plug, "~> 1.5"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.4"},
      {:vexctf, in_umbrella: true}
    ]
  end
end
