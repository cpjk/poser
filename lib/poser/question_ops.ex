defmodule QuestionOps do
  def new(args) do
    # create a new question with some text
  end

  def search(name) do
    # look for the question with the given name
  end

  def resolve(args) do
    # resolve the question
  end

  def save(question) do
    with {:ok, json} <- Poison.encode(question),
      do: File.write(file_path(question), json)
  end

  def load_questions do
    {:ok, file_names} = File.ls(question_dir)

    file_names
    |> Enum.map(fn(file_name) ->
      (file_name |> load_json |> json_to_question)
    end)
  end

  defp load_json(file_name) do
    with {:ok, json} <- File.read(Path.join(question_dir, file_name)), do: json
  end

  defp json_to_question(json) do
    with {:ok, question} <- Poison.decode!(json, as: %Question{}), do: question
  end

  defp file_path(question = %Question{}) do
    # replace groups of spaces and hyphens with single underscores
    filename = question.name
    |> String.replace(~r/[\s-]/, "_")
    |> String.replace(~r/_+/, "_")

    Path.join([question_dir, filename])
  end

  defp question_dir do
    Path.join([System.user_home, ".poser/questions"])
  end
end
