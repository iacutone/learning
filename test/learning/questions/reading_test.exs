defmodule Learning.Questions.ReadingTest do
  use ExUnit.Case, async: true

  alias Learning.Questions.Reading

  describe "kindergarten/0" do
    test "returns a list of questions" do
      questions = Reading.kindergarten()
      assert is_list(questions)
      assert length(questions) == 15
    end

    test "each question has required fields including passage" do
      for question <- Reading.kindergarten() do
        assert Map.has_key?(question, :id)
        assert Map.has_key?(question, :passage)
        assert Map.has_key?(question, :question)
        assert Map.has_key?(question, :options)
        assert Map.has_key?(question, :answer)
        assert Map.has_key?(question, :hint)
      end
    end

    test "each question has 4 options" do
      for question <- Reading.kindergarten() do
        assert length(question.options) == 4
      end
    end

    test "answer is one of the options" do
      for question <- Reading.kindergarten() do
        assert question.answer in question.options
      end
    end

    test "passages are non-empty strings" do
      for question <- Reading.kindergarten() do
        assert is_binary(question.passage)
        assert String.length(question.passage) > 0
      end
    end
  end

  describe "first_grade/0" do
    test "returns a list of questions" do
      questions = Reading.first_grade()
      assert is_list(questions)
      assert length(questions) == 15
    end

    test "each question has passage" do
      for question <- Reading.first_grade() do
        assert Map.has_key?(question, :passage)
        assert is_binary(question.passage)
      end
    end

    test "answer is one of the options" do
      for question <- Reading.first_grade() do
        assert question.answer in question.options
      end
    end
  end

  describe "second_grade/0" do
    test "returns a list of questions" do
      questions = Reading.second_grade()
      assert is_list(questions)
      assert length(questions) == 15
    end

    test "each question has passage" do
      for question <- Reading.second_grade() do
        assert Map.has_key?(question, :passage)
        assert is_binary(question.passage)
      end
    end

    test "answer is one of the options" do
      for question <- Reading.second_grade() do
        assert question.answer in question.options
      end
    end

    test "second grade passages are longer than kindergarten" do
      k_avg = Reading.kindergarten() |> Enum.map(&String.length(&1.passage)) |> Enum.sum() |> div(15)
      s_avg = Reading.second_grade() |> Enum.map(&String.length(&1.passage)) |> Enum.sum() |> div(15)
      assert s_avg > k_avg
    end
  end
end
