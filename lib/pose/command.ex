defmodule Command do
  def parse(["new" | rest]), do: _new(rest)
  def parse(["resolve" | rest]), do: _resolve_question(rest)

  def _new(["project" | rest]), do: _new_project(rest)
  def _new(["question" | rest]), do: _new_question(rest)

  defp _resolve_question(args) do
    # prompt for details
  end

  defp _new_question(args) do
    # prompt for details
  end

  defp _new_project(args) do
    # prompt for details
  end
end
