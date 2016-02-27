defmodule Command do
  def parse(["new" | rest]), do: Question.new(rest)
  def parse(["resolve" | rest]), do: Question.resolve(rest)
end
