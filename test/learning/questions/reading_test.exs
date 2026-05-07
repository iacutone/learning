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

    test "comprehension questions have passages" do
      comprehension_questions = Reading.kindergarten() |> Enum.filter(&(&1.type == "comprehension"))
      
      for question <- comprehension_questions do
        assert Map.has_key?(question, :passage)
        assert is_binary(question.passage)
        assert String.length(question.passage) > 0
      end
    end

    test "non-comprehension questions don't require passages" do
      non_comprehension = Reading.kindergarten() |> Enum.filter(&(&1.type != "comprehension"))
      
      for question <- non_comprehension do
        # These question types may or may not have passages
        assert question.type in ["rhyming", "phonics", "description"]
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

    test "has different question types" do
      questions = Reading.kindergarten()
      types = questions |> Enum.map(&(&1.type)) |> Enum.uniq()
      
      assert "comprehension" in types
      assert "rhyming" in types
      assert "phonics" in types
      assert "description" in types
    end
  end

  describe "first_grade/0" do
    test "returns a list of questions" do
      questions = Reading.first_grade()
      assert is_list(questions)
      assert length(questions) == 12
    end

    test "comprehension questions have passages" do
      comprehension_questions = Reading.first_grade() |> Enum.filter(&(&1.type == "comprehension"))
      
      for question <- comprehension_questions do
        assert Map.has_key?(question, :passage)
        assert is_binary(question.passage)
      end
    end

    test "answer is one of the options" do
      for question <- Reading.first_grade() do
        assert question.answer in question.options
      end
    end

    test "has different question types" do
      questions = Reading.first_grade()
      types = questions |> Enum.map(&(&1.type)) |> Enum.uniq()
      
      assert "comprehension" in types
      assert "rhyming" in types
      assert "phonics" in types
      assert "description" in types
    end
  end

  describe "second_grade/0" do
    test "returns a list of questions" do
      questions = Reading.second_grade()
      assert is_list(questions)
      assert length(questions) == 11
    end

    test "comprehension questions have passages" do
      comprehension_questions = Reading.second_grade() |> Enum.filter(&(&1.type == "comprehension"))
      
      for question <- comprehension_questions do
        assert Map.has_key?(question, :passage)
        assert is_binary(question.passage)
      end
    end

    test "answer is one of the options" do
      for question <- Reading.second_grade() do
        assert question.answer in question.options
      end
    end

    test "second grade comprehension passages are longer than kindergarten" do
      k_comprehension = Reading.kindergarten() |> Enum.filter(&(&1.type == "comprehension"))
      s_comprehension = Reading.second_grade() |> Enum.filter(&(&1.type == "comprehension"))
      
      if length(k_comprehension) > 0 && length(s_comprehension) > 0 do
        k_avg = k_comprehension |> Enum.map(&String.length(&1.passage)) |> Enum.sum() |> div(length(k_comprehension))
        s_avg = s_comprehension |> Enum.map(&String.length(&1.passage)) |> Enum.sum() |> div(length(s_comprehension))
        assert s_avg > k_avg
      end
    end

    test "has different question types" do
      questions = Reading.second_grade()
      types = questions |> Enum.map(&(&1.type)) |> Enum.uniq()
      
      assert "comprehension" in types
      assert "rhyming" in types
      assert "phonics" in types
      assert "description" in types
    end
  end
end
