defmodule VexCTF.WebTest do
  use ExUnit.Case
  doctest VexCTF.Web

  test "greets the world" do
    assert VexCTF.Web.hello() == :world
  end
end
