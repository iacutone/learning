defmodule Learning.Questions.MathTest do
  use ExUnit.Case, async: true

  alias Learning.Questions.Math

  describe "kindergarten/0" do
    test "returns a list of questions" do
      questions = Math.kindergarten()
      assert is_list(questions)
      assert length(questions) == 15
    end

    test "each question has required fields" do
      for question <- Math.kindergarten() do
        assert Map.has_key?(question, :id)
        assert Map.has_key?(question, :question)
        assert Map.has_key?(question, :options)
        assert Map.has_key?(question, :answer)
        assert Map.has_key?(question, :hint)
      end
    end

    test "each question has 4 options" do
      for question <- Math.kindergarten() do
        assert length(question.options) == 4
      end
    end

    test "answer is one of the options" do
      for question <- Math.kindergarten() do
        assert question.answer in question.options
      end
    end
  end

  describe "first_grade/0" do
    test "returns a list of questions" do
      questions = Math.first_grade()
      assert is_list(questions)
      assert length(questions) == 15
    end

    test "each question has required fields" do
      for question <- Math.first_grade() do
        assert Map.has_key?(question, :id)
        assert Map.has_key?(question, :question)
        assert Map.has_key?(question, :options)
        assert Map.has_key?(question, :answer)
        assert Map.has_key?(question, :hint)
      end
    end

    test "answer is one of the options" do
      for question <- Math.first_grade() do
        assert question.answer in question.options
      end
    end
  end

  describe "second_grade/0" do
    test "returns a list of questions" do
      questions = Math.second_grade()
      assert is_list(questions)
      assert length(questions) == 15
    end

    test "each question has required fields" do
      for question <- Math.second_grade() do
        assert Map.has_key?(question, :id)
        assert Map.has_key?(question, :question)
        assert Map.has_key?(question, :options)
        assert Map.has_key?(question, :answer)
        assert Map.has_key?(question, :hint)
      end
    end

    test "answer is one of the options" do
      for question <- Math.second_grade() do
        assert question.answer in question.options
      end
    end
  end
end
