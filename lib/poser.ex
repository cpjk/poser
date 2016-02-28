defmodule Poser do
  def main(args) do
    args
    |> Command.parse
  end
end
