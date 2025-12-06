defmodule Learning.Questions.Math do
  @moduledoc "Math questions organized by grade level"

  def kindergarten do
    [
      %{id: 1, question: "What is 1 + 1?", options: ["1", "2", "3", "4"], answer: "2", hint: "Hold up 1 finger, then 1 more!"},
      %{id: 2, question: "What is 2 + 1?", options: ["2", "3", "4", "5"], answer: "3", hint: "Hold up 2 fingers, then 1 more!"},
      %{id: 3, question: "What is 3 + 2?", options: ["4", "5", "6", "7"], answer: "5", hint: "Count: 3... then 2 more!"},
      %{id: 4, question: "What is 2 + 2?", options: ["2", "3", "4", "5"], answer: "4", hint: "Two plus two equals..."},
      %{id: 5, question: "What is 4 + 1?", options: ["4", "5", "6", "7"], answer: "5", hint: "Start at 4, add 1 more!"},
      %{id: 6, question: "How many legs does a dog have?", options: ["2", "3", "4", "5"], answer: "4", hint: "Think about a puppy walking!"},
      %{id: 7, question: "What comes after 5?", options: ["4", "5", "6", "7"], answer: "6", hint: "Count: 1, 2, 3, 4, 5, ..."},
      %{id: 8, question: "What comes before 3?", options: ["1", "2", "4", "5"], answer: "2", hint: "Count backwards from 3!"},
      %{id: 9, question: "How many fingers on one hand?", options: ["3", "4", "5", "6"], answer: "5", hint: "Look at your hand!"},
      %{id: 10, question: "What is 1 + 2?", options: ["2", "3", "4", "5"], answer: "3", hint: "One plus two equals..."},
      %{id: 11, question: "What is 3 + 3?", options: ["5", "6", "7", "8"], answer: "6", hint: "Three plus three!"},
      %{id: 12, question: "What is 5 - 1?", options: ["3", "4", "5", "6"], answer: "4", hint: "Take 1 away from 5!"},
      %{id: 13, question: "What is 4 - 2?", options: ["1", "2", "3", "4"], answer: "2", hint: "Four minus two!"},
      %{id: 14, question: "How many wheels on a bicycle?", options: ["1", "2", "3", "4"], answer: "2", hint: "Think about riding a bike!"},
      %{id: 15, question: "What is 2 + 3?", options: ["4", "5", "6", "7"], answer: "5", hint: "Two plus three equals..."}
    ]
  end

  def first_grade do
    [
      %{id: 1, question: "What is 7 + 5?", options: ["10", "11", "12", "13"], answer: "12", hint: "Try counting on your fingers starting from 7."},
      %{id: 2, question: "What is 9 - 4?", options: ["3", "4", "5", "6"], answer: "5", hint: "Start at 9 and count backwards 4 times."},
      %{id: 3, question: "Which number comes next? 2, 4, 6, 8, __", options: ["9", "10", "11", "12"], answer: "10", hint: "Count by 2s!"},
      %{id: 4, question: "Emma has 3 apples. Her mom gives her 4 more. How many apples does Emma have?", options: ["5", "6", "7", "8"], answer: "7", hint: "Add the apples together: 3 + 4"},
      %{id: 5, question: "What is 8 + 6?", options: ["12", "13", "14", "15"], answer: "14", hint: "8 + 6 = 8 + 2 + 4 = 10 + 4"},
      %{id: 6, question: "What is 15 - 7?", options: ["6", "7", "8", "9"], answer: "8", hint: "Count backwards from 15!"},
      %{id: 7, question: "What is 6 + 6?", options: ["10", "11", "12", "13"], answer: "12", hint: "Double 6!"},
      %{id: 8, question: "Tom has 10 stickers. He gives 3 to his friend. How many does he have left?", options: ["5", "6", "7", "8"], answer: "7", hint: "10 - 3 = ?"},
      %{id: 9, question: "What is 11 - 5?", options: ["4", "5", "6", "7"], answer: "6", hint: "Start at 11, count back 5!"},
      %{id: 10, question: "Which number comes next? 5, 10, 15, 20, __", options: ["22", "23", "24", "25"], answer: "25", hint: "Count by 5s!"},
      %{id: 11, question: "What is 9 + 8?", options: ["15", "16", "17", "18"], answer: "17", hint: "9 + 8 = 9 + 1 + 7 = 10 + 7"},
      %{id: 12, question: "What is 14 - 6?", options: ["6", "7", "8", "9"], answer: "8", hint: "14 minus 6!"},
      %{id: 13, question: "Sara has 5 red balloons and 7 blue balloons. How many balloons in all?", options: ["10", "11", "12", "13"], answer: "12", hint: "5 + 7 = ?"},
      %{id: 14, question: "What is 7 + 7?", options: ["12", "13", "14", "15"], answer: "14", hint: "Double 7!"},
      %{id: 15, question: "What is 16 - 9?", options: ["5", "6", "7", "8"], answer: "7", hint: "16 - 9 = 16 - 10 + 1"}
    ]
  end

  def second_grade do
    [
      %{id: 1, question: "What is 15 - 8?", options: ["5", "6", "7", "8"], answer: "7", hint: "Start at 15 and count backwards 8 times."},
      %{id: 2, question: "What is 4 × 3?", options: ["7", "10", "12", "14"], answer: "12", hint: "Think of 3 groups of 4, or 4 + 4 + 4."},
      %{id: 3, question: "Emma has 3 bags with 5 apples in each bag. How many apples does she have in all?", options: ["8", "12", "15", "18"], answer: "15", hint: "Multiply: 3 bags × 5 apples"},
      %{id: 4, question: "What is 24 + 18?", options: ["32", "38", "42", "44"], answer: "42", hint: "Add the ones first (4+8=12), then the tens!"},
      %{id: 5, question: "What is 5 × 5?", options: ["20", "25", "30", "35"], answer: "25", hint: "5 times 5!"},
      %{id: 6, question: "What is 36 - 19?", options: ["15", "16", "17", "18"], answer: "17", hint: "36 - 19 = 36 - 20 + 1"},
      %{id: 7, question: "What is 6 × 4?", options: ["20", "22", "24", "26"], answer: "24", hint: "6 groups of 4!"},
      %{id: 8, question: "What is 45 + 27?", options: ["62", "67", "72", "77"], answer: "72", hint: "Add ones: 5+7=12, add tens: 40+20=60, total: 72"},
      %{id: 9, question: "What is 7 × 3?", options: ["18", "19", "20", "21"], answer: "21", hint: "7 + 7 + 7 = ?"},
      %{id: 10, question: "What is 50 - 23?", options: ["23", "25", "27", "29"], answer: "27", hint: "50 - 23 = 50 - 20 - 3"},
      %{id: 11, question: "What is 8 × 2?", options: ["14", "15", "16", "17"], answer: "16", hint: "Double 8!"},
      %{id: 12, question: "There are 4 rows of desks with 6 desks in each row. How many desks?", options: ["20", "22", "24", "26"], answer: "24", hint: "4 × 6 = ?"},
      %{id: 13, question: "What is 63 - 28?", options: ["33", "34", "35", "36"], answer: "35", hint: "63 - 28 = 63 - 30 + 2"},
      %{id: 14, question: "What is 9 × 4?", options: ["32", "34", "36", "38"], answer: "36", hint: "9 × 4 = 10 × 4 - 4"},
      %{id: 15, question: "What is 38 + 45?", options: ["73", "78", "83", "88"], answer: "83", hint: "Add ones: 8+5=13, add tens: 30+40=70, total: 83"}
    ]
  end
end
