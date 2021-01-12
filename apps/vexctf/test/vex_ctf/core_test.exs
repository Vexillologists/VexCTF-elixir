defmodule VexCTF.CoreTest do
  use ExUnit.Case
  doctest VexCTF.Core

  test "greets the world" do
    assert VexCTF.Core.hello() == :world
  end
end
