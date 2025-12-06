defmodule Learning.Questions.WordsTest do
  use ExUnit.Case, async: true

  alias Learning.Questions.Words

  describe "kindergarten/0" do
    test "returns a list of questions" do
      questions = Words.kindergarten()
      assert is_list(questions)
      assert length(questions) == 15
    end

    test "each question has required fields" do
      for question <- Words.kindergarten() do
        assert Map.has_key?(question, :id)
        assert Map.has_key?(question, :question)
        assert Map.has_key?(question, :options)
        assert Map.has_key?(question, :answer)
        assert Map.has_key?(question, :hint)
      end
    end

    test "vocabulary questions do not have passages" do
      for question <- Words.kindergarten() do
        refute Map.has_key?(question, :passage)
      end
    end

    test "each question has 4 options" do
      for question <- Words.kindergarten() do
        assert length(question.options) == 4
      end
    end

    test "answer is one of the options" do
      for question <- Words.kindergarten() do
        assert question.answer in question.options
      end
    end
  end

  describe "first_grade/0" do
    test "returns a list of questions" do
      questions = Words.first_grade()
      assert is_list(questions)
      assert length(questions) == 15
    end

    test "each question has required fields" do
      for question <- Words.first_grade() do
        assert Map.has_key?(question, :id)
        assert Map.has_key?(question, :question)
        assert Map.has_key?(question, :options)
        assert Map.has_key?(question, :answer)
        assert Map.has_key?(question, :hint)
      end
    end

    test "answer is one of the options" do
      for question <- Words.first_grade() do
        assert question.answer in question.options
      end
    end
  end

  describe "second_grade/0" do
    test "returns a list of questions" do
      questions = Words.second_grade()
      assert is_list(questions)
      assert length(questions) == 15
    end

    test "each question has required fields" do
      for question <- Words.second_grade() do
        assert Map.has_key?(question, :id)
        assert Map.has_key?(question, :question)
        assert Map.has_key?(question, :options)
        assert Map.has_key?(question, :answer)
        assert Map.has_key?(question, :hint)
      end
    end

    test "answer is one of the options" do
      for question <- Words.second_grade() do
        assert question.answer in question.options
      end
    end
  end
end
