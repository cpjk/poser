defmodule Command do
  def parse(["new" | rest]), do: _new(rest)
  def parse(["resolve" | rest]), do: _resolve_question(rest)

  defp _new(["project" | rest]), do: _new_project(rest)
  defp _new(["question" | rest]), do: _new_question(rest)

  defp _resolve_question(_args) do
    # prompt for details
  end

  defp _new_question(_args) do
    project = IO.gets("Project? ") |> String.strip
    name = IO.gets("Name? ") |> String.strip
    text = IO.gets("Text? ") |> String.strip

    question = %Question{name: name, project: project, text: text}
    QuestionOps.save question
  end

  defp _new_project(_args) do
    name = IO.gets "Name? "
  end
end
