defmodule Learning.Questions.ReadingTest do
  use ExUnit.Case, async: true

  alias Learning.Questions.Reading

  describe "kindergarten/0" do
    test "returns a list of questions" do
      questions = Reading.kindergarten()
      assert is_list(questions)
      assert length(questions) == 20
    end

    test "each question has required fields" do
      for question <- Reading.kindergarten() do
        assert Map.has_key?(question, :id)
        assert Map.has_key?(question, :type)
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

    test "comprehension questions have passages" do
      comprehension = Reading.kindergarten() |> Enum.filter(&(&1.type == "comprehension"))

      assert length(comprehension) > 0

      for question <- comprehension do
        assert Map.has_key?(question, :passage)
        assert is_binary(question.passage)
        assert String.length(question.passage) > 0
      end
    end

    test "non-comprehension questions do not have passages" do
      non_comprehension = Reading.kindergarten() |> Enum.reject(&(&1.type == "comprehension"))

      for question <- non_comprehension do
        refute Map.has_key?(question, :passage)
      end
    end

    test "covers letter sounds (Star Early Literacy)" do
      types = Reading.kindergarten() |> Enum.map(& &1.type)
      assert "letter_sounds" in types
    end

    test "covers print concepts" do
      types = Reading.kindergarten() |> Enum.map(& &1.type)
      assert "print_concepts" in types
    end

    test "covers rhyming and phonics" do
      types = Reading.kindergarten() |> Enum.map(& &1.type)
      assert "rhyming" in types
      assert "phonics" in types
    end

    test "has multiple question types" do
      types = Reading.kindergarten() |> Enum.map(& &1.type) |> Enum.uniq()
      assert length(types) > 1
    end
  end

  describe "first_grade/0" do
    test "returns a list of questions" do
      questions = Reading.first_grade()
      assert is_list(questions)
      assert length(questions) == 20
    end

    test "each question has required fields" do
      for question <- Reading.first_grade() do
        assert Map.has_key?(question, :id)
        assert Map.has_key?(question, :type)
        assert Map.has_key?(question, :question)
        assert Map.has_key?(question, :options)
        assert Map.has_key?(question, :answer)
        assert Map.has_key?(question, :hint)
      end
    end

    test "each question has 4 options" do
      for question <- Reading.first_grade() do
        assert length(question.options) == 4
      end
    end

    test "answer is one of the options" do
      for question <- Reading.first_grade() do
        assert question.answer in question.options
      end
    end

    test "comprehension questions have passages" do
      comprehension = Reading.first_grade() |> Enum.filter(&(&1.type == "comprehension"))

      assert length(comprehension) > 0

      for question <- comprehension do
        assert Map.has_key?(question, :passage)
        assert is_binary(question.passage)
      end
    end

    test "has sentence_completion questions" do
      types = Reading.first_grade() |> Enum.map(& &1.type)
      assert "sentence_completion" in types
    end
  end

  describe "second_grade/0" do
    test "returns a list of questions" do
      questions = Reading.second_grade()
      assert is_list(questions)
      assert length(questions) == 16
    end

    test "each question has required fields" do
      for question <- Reading.second_grade() do
        assert Map.has_key?(question, :id)
        assert Map.has_key?(question, :type)
        assert Map.has_key?(question, :question)
        assert Map.has_key?(question, :options)
        assert Map.has_key?(question, :answer)
        assert Map.has_key?(question, :hint)
      end
    end

    test "each question has 4 options" do
      for question <- Reading.second_grade() do
        assert length(question.options) == 4
      end
    end

    test "answer is one of the options" do
      for question <- Reading.second_grade() do
        assert question.answer in question.options
      end
    end

    test "covers main idea questions" do
      types = Reading.second_grade() |> Enum.map(& &1.type)
      assert "main_idea" in types
    end

    test "covers inference questions" do
      types = Reading.second_grade() |> Enum.map(& &1.type)
      assert "inference" in types
    end

    test "covers author's purpose questions" do
      types = Reading.second_grade() |> Enum.map(& &1.type)
      assert "authors_purpose" in types
    end

    test "second grade comprehension passages are longer than kindergarten on average" do
      k_comprehension = Reading.kindergarten() |> Enum.filter(&(&1.type == "comprehension"))
      s_comprehension = Reading.second_grade() |> Enum.filter(&(&1.type == "comprehension"))

      k_avg = k_comprehension |> Enum.map(&String.length(&1.passage)) |> Enum.sum() |> div(length(k_comprehension))
      s_avg = s_comprehension |> Enum.map(&String.length(&1.passage)) |> Enum.sum() |> div(length(s_comprehension))

      assert s_avg > k_avg
    end
  end
end
