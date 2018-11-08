defmodule LazyEqualityTest do
  use ExUnit.Case
  doctest LazyEquality

  import LazyEquality

  test "simple initial test" do
    thing = %{foo: "bar", collection: [%{first: "value", ignored: "value"}]}
    testable = %{foo: "bar", collection: [%{first: "value"}]}
    assert check_value(thing, testable)
  end
end
