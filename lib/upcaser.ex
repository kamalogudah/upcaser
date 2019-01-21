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
    receive do
      {from, ref, {:upcase, str}} -> send(from, {:ok, ref, String.upcase(str)})
    end

    loop
  end

  def upcase(server_pid, str) do
    # We'll make a reference
    ref = make_ref()
    send(server_pid, {self(), ref, {:upcase, str}})

    receive do
      # Here we're 'pinning' the ref variable - we're saying we only match where
      # the second element in the tuple matches a given variable. Without the
      # pin(^), this would rebind the `ref` variable.
      {:ok, ^ref, str} -> {:ok, str}
    end
  end
end
