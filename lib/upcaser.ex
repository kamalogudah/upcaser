defmodule Upcaser do
  @moduledoc """
  Documentation for Upcaser.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Upcaser.hello()
      :world

  """
  def hello do
    :world
  end

  def start do
    pid = spawn(Upcaser, :loop, [])
    {:ok, pid}
  end

  def loop do
    :ok
  end
end
