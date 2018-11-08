defmodule LazyEqualityTest do
  use ExUnit.Case
  doctest LazyEquality

  test "greets the world" do
    assert LazyEquality.hello() == :world
  end
end
