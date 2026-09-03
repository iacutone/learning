defmodule Learning.Questions.MathTest do
  use ExUnit.Case, async: true

  alias Learning.Questions.Math

  describe "kindergarten/0" do
    test "returns a list of questions" do
      questions = Math.kindergarten()
      assert is_list(questions)
      assert length(questions) == 20
    end

    test "each question has required fields" do
      for question <- Math.kindergarten() do
        assert Map.has_key?(question, :id)
        assert Map.has_key?(question, :type)
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

    test "has multiple question types" do
      types = Math.kindergarten() |> Enum.map(& &1.type) |> Enum.uniq()
      assert length(types) > 1
    end

    test "covers skip counting" do
      types = Math.kindergarten() |> Enum.map(& &1.type)
      assert "skip_counting" in types
    end

    test "covers geometry" do
      types = Math.kindergarten() |> Enum.map(& &1.type)
      assert "geometry" in types
    end
  end

  describe "first_grade/0" do
    test "returns a list of questions" do
      questions = Math.first_grade()
      assert is_list(questions)
      assert length(questions) == 20
    end

    test "each question has required fields" do
      for question <- Math.first_grade() do
        assert Map.has_key?(question, :id)
        assert Map.has_key?(question, :type)
        assert Map.has_key?(question, :question)
        assert Map.has_key?(question, :options)
        assert Map.has_key?(question, :answer)
        assert Map.has_key?(question, :hint)
      end
    end

    test "each question has 4 options" do
      for question <- Math.first_grade() do
        assert length(question.options) == 4
      end
    end

    test "answer is one of the options" do
      for question <- Math.first_grade() do
        assert question.answer in question.options
      end
    end

    test "covers place value questions" do
      types = Math.first_grade() |> Enum.map(& &1.type)
      assert "place_value" in types
    end

    test "covers word problems" do
      types = Math.first_grade() |> Enum.map(& &1.type)
      assert "word_problem" in types
    end

    test "covers geometry" do
      types = Math.first_grade() |> Enum.map(& &1.type)
      assert "geometry" in types
    end

    test "covers time questions" do
      types = Math.first_grade() |> Enum.map(& &1.type)
      assert "time" in types
    end
  end

  describe "second_grade/0" do
    test "returns a list of questions" do
      questions = Math.second_grade()
      assert is_list(questions)
      assert length(questions) == 20
    end

    test "each question has required fields" do
      for question <- Math.second_grade() do
        assert Map.has_key?(question, :id)
        assert Map.has_key?(question, :type)
        assert Map.has_key?(question, :question)
        assert Map.has_key?(question, :options)
        assert Map.has_key?(question, :answer)
        assert Map.has_key?(question, :hint)
      end
    end

    test "each question has 4 options" do
      for question <- Math.second_grade() do
        assert length(question.options) == 4
      end
    end

    test "answer is one of the options" do
      for question <- Math.second_grade() do
        assert question.answer in question.options
      end
    end

    test "covers equal groups instead of formal multiplication" do
      types = Math.second_grade() |> Enum.map(& &1.type)
      assert "equal_groups" in types
    end

    test "covers place value within 1000" do
      types = Math.second_grade() |> Enum.map(& &1.type)
      assert "place_value" in types
    end

    test "covers money" do
      types = Math.second_grade() |> Enum.map(& &1.type)
      assert "money" in types
    end
  end
end
