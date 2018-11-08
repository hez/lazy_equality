defmodule LazyEquality do
  @moduledoc """
  Documentation for LazyEquality.
  """

 def check_map(checking, expected) when is_map(checking) and is_map(expected) do
    expected
    |> Map.keys()
    |> Enum.all?(&check_value(Map.get(checking, &1), Map.get(expected, &1)))
  end

  def check_map(_, _), do: false

  def check_list(checking, expected) when is_list(checking) and is_list(expected) do
    Enum.all?(expected, fn value ->
      Enum.any?(checking, &check_value(&1, value))
    end)
  end

  def check_list(_, _), do: false

  def check_value(check, expected) when is_list(expected), do: check_list(check, expected)
  def check_value(check, expected) when is_map(expected), do: check_map(check, expected)
  def check_value(check, expected) when check == expected, do: true
  def check_value(_check, _expected), do: false
end
