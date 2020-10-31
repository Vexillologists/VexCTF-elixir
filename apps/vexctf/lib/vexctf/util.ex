defmodule VexCTF.Util do
  @doc """
  Convert a numerical ID to an opaque ID.
  """
  @spec to_opaque_id(module, integer) :: binary
  def to_opaque_id(type, id) do
    Fast64.encode64("#{inspect(type)}:#{inspect(id)}")
  end
end
