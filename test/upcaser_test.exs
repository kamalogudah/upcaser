defmodule UpcaserTest do
  use ExUnit.Case
  doctest Upcaser

  test "greets the world" do
    assert Upcaser.hello() == :world
  end

  # We'll need the ability to start the service
  test "starting the service" do
    # I want to return a 2-tuple so I can pattern match on whether or not it was
    # started successfully
    assert {:ok, upcaser_pid} = Upcaser.start()
    # We can also ensure that the second element in our 2-tuple is a pid:
    assert is_pid(upcaser_pid)
  end
end
