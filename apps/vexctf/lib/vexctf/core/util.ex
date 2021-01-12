defmodule VexCTF.Core.Util do
  @moduledoc """
  Various VexCTF utilities
  """

  alias Application, as: App

  @doc """
  Get a config value by key or path, defaulting to `value` if it is not present.
  """
  @spec get_config(App.app(), App.key() | [Keyword.key()], App.value()) :: App.value()
  def get_config(app, key, value \\ nil)

  def get_config(app, key, value) when is_atom(key) do
    App.get_env(app, key, value)
  end

  def get_config(app, [key], value), do: get_config(app, key, value)

  def get_config(app, [head | tail], value) do
    get_config(app, head, [])
    |> get_kw_path(tail, value)
  end

  @doc """
  Get a keyword value by key or path, defaulting to `value` if it is not present.
  """
  @spec get_kw_path(Keyword.t(), [Keyword.key()], App.value()) :: App.value()
  def get_kw_path(keywords, path, value \\ nil)

  def get_kw_path(keywords, [final], value) do
    keywords
    |> Keyword.get(final, value)
  end

  def get_kw_path(keywords, [head | tail], value) do
    keywords
    |> Keyword.get(head, [])
    |> get_kw_path(tail, value)
  end
end
