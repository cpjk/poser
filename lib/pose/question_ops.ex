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

  defp load_questions do
    # load questions from stored json text files
    # returns a list of Questions
  end

  defp file_path(question = %Question{}) do
    question.name
  end
end
