defmodule Learning.Questions.Math do
  @moduledoc "Math questions organized by grade level, aligned with Star Math assessments"

  def kindergarten do
    [
      # Counting & Cardinality — count to 100, count objects, write numerals
      %{id: 1, type: "counting", question: "What number comes after 7?", options: ["6", "7", "8", "9"], answer: "8", hint: "Count forward from 7."},
      %{id: 2, type: "counting", question: "What number comes before 5?", options: ["3", "4", "6", "7"], answer: "4", hint: "Count backwards from 5."},
      %{id: 3, type: "counting", question: "What number is missing? 1, 2, 3, __, 5", options: ["1", "4", "6", "7"], answer: "4", hint: "Count forward: 1, 2, 3, ..."},
      %{id: 4, type: "counting", question: "Which group has more? ● ● ● or ● ● ● ● ●", options: ["The group of 3", "The group of 5", "They are equal", "Can't tell"], answer: "The group of 5", hint: "Count each group carefully."},
      %{id: 5, type: "counting", question: "What number comes after 19?", options: ["18", "20", "21", "10"], answer: "20", hint: "Count forward from 19."},
      # Skip counting by 10s
      %{id: 6, type: "skip_counting", question: "What comes next? 10, 20, 30, __", options: ["31", "35", "40", "50"], answer: "40", hint: "Count by 10s!"},
      %{id: 7, type: "skip_counting", question: "What comes next? 2, 4, 6, 8, __", options: ["9", "10", "11", "12"], answer: "10", hint: "Count by 2s!"},
      # Addition within 10 — number bonds, decomposing
      %{id: 8, type: "addition", question: "What is 3 + 2?", options: ["4", "5", "6", "7"], answer: "5", hint: "Count on from 3: 4, 5."},
      %{id: 9, type: "addition", question: "What is 4 + 4?", options: ["6", "7", "8", "9"], answer: "8", hint: "Double 4!"},
      %{id: 10, type: "addition", question: "There are 3 cats and 2 dogs. How many animals in all?", options: ["4", "5", "6", "7"], answer: "5", hint: "Add the cats and dogs: 3 + 2."},
      %{id: 11, type: "addition", question: "5 + __ = 7", options: ["1", "2", "3", "4"], answer: "2", hint: "What do you add to 5 to get 7?"},
      # Subtraction within 10
      %{id: 12, type: "subtraction", question: "What is 5 - 2?", options: ["2", "3", "4", "5"], answer: "3", hint: "Start at 5 and count back 2."},
      %{id: 13, type: "subtraction", question: "6 - __ = 4", options: ["1", "2", "3", "4"], answer: "2", hint: "What do you take away from 6 to get 4?"},
      # Comparing & ordering
      %{id: 14, type: "compare", question: "Which number is greater: 8 or 5?", options: ["5", "8", "They are equal", "Can't tell"], answer: "8", hint: "Think about which is farther along when you count."},
      %{id: 15, type: "compare", question: "Which number is less: 3 or 7?", options: ["3", "7", "They are equal", "Can't tell"], answer: "3", hint: "Which comes first when you count?"},
      # Shapes & geometry
      %{id: 16, type: "geometry", question: "How many sides does a triangle have?", options: ["2", "3", "4", "5"], answer: "3", hint: "Tri- means three!"},
      %{id: 17, type: "geometry", question: "Which shape is round with no corners?", options: ["Square", "Triangle", "Circle", "Rectangle"], answer: "Circle", hint: "Think about a coin or a wheel."},
      %{id: 18, type: "geometry", question: "How many corners does a square have?", options: ["2", "3", "4", "5"], answer: "4", hint: "Count the corners on a square piece of paper."},
      # Measurement
      %{id: 19, type: "measurement", question: "Which is longer — a school bus or a pencil?", options: ["Pencil", "School bus", "They are the same", "Can't tell"], answer: "School bus", hint: "Think about how big each one is."},
      # Ordinal numbers
      %{id: 20, type: "ordinal", question: "In a line of 5 children, Sam is after the 2nd person. What position is Sam in?", options: ["1st", "2nd", "3rd", "4th"], answer: "3rd", hint: "Count: 1st, 2nd, then who is next?"}
    ]
  end

  def first_grade do
    [
      # Addition & Subtraction within 20
      %{id: 1, type: "addition", question: "What is 7 + 5?", options: ["10", "11", "12", "13"], answer: "12", hint: "Count on from 7: 8, 9, 10, 11, 12."},
      %{id: 2, type: "subtraction", question: "What is 13 - 5?", options: ["6", "7", "8", "9"], answer: "8", hint: "Start at 13 and count back 5."},
      %{id: 3, type: "addition", question: "What is 9 + 6?", options: ["13", "14", "15", "16"], answer: "15", hint: "Make 10 first: 9 + 1 = 10, then add 5 more."},
      %{id: 4, type: "subtraction", question: "What is 16 - 7?", options: ["7", "8", "9", "10"], answer: "9", hint: "Think: 7 + ? = 16."},
      %{id: 5, type: "addition", question: "What is 8 + 8?", options: ["14", "15", "16", "17"], answer: "16", hint: "Double 8!"},
      # Place value (tens and ones)
      %{id: 6, type: "place_value", question: "How many tens are in the number 34?", options: ["1", "2", "3", "4"], answer: "3", hint: "The tens digit is the first number: 3 tens and 4 ones."},
      %{id: 7, type: "place_value", question: "What is the value of the digit 2 in 25?", options: ["2", "5", "20", "52"], answer: "20", hint: "The 2 is in the tens place, so it means 2 tens = 20."},
      %{id: 8, type: "place_value", question: "Which number has 4 tens and 7 ones?", options: ["74", "47", "407", "470"], answer: "47", hint: "4 tens = 40, plus 7 ones = 47."},
      %{id: 9, type: "place_value", question: "What is 10 more than 36?", options: ["37", "46", "56", "26"], answer: "46", hint: "Adding 10 changes only the tens digit."},
      # Comparing numbers
      %{id: 10, type: "compare", question: "Which number is greater: 52 or 45?", options: ["45", "52", "They are equal", "Can't tell"], answer: "52", hint: "Compare the tens digit first."},
      %{id: 11, type: "compare", question: "Which symbol makes this true? 38 __ 83", options: [">", "<", "=", "+"], answer: "<", hint: "38 is less than 83."},
      # Number line
      %{id: 12, type: "number_line", question: "On a number line from 0 to 20, what number is halfway between 10 and 20?", options: ["12", "14", "15", "16"], answer: "15", hint: "Count from 10 to 20 and find the middle."},
      # Skip counting
      %{id: 13, type: "skip_counting", question: "What comes next? 5, 10, 15, 20, __", options: ["22", "23", "24", "25"], answer: "25", hint: "Count by 5s!"},
      # Word problems
      %{id: 14, type: "word_problem", question: "Emma has 8 crayons. She gives 3 to a friend. How many does she have left?", options: ["4", "5", "6", "7"], answer: "5", hint: "She started with 8 and gave away 3: 8 - 3 = ?"},
      %{id: 15, type: "word_problem", question: "There are 6 birds on a fence. 4 more land. How many birds are there now?", options: ["8", "9", "10", "11"], answer: "10", hint: "Add the birds together: 6 + 4."},
      # Geometry
      %{id: 16, type: "geometry", question: "How many sides does a rectangle have?", options: ["2", "3", "4", "5"], answer: "4", hint: "Count the sides of a door or a book."},
      %{id: 17, type: "geometry", question: "Which shape has 3 sides and 3 corners?", options: ["Circle", "Square", "Triangle", "Rectangle"], answer: "Triangle", hint: "Tri- means three!"},
      # Measurement
      %{id: 18, type: "measurement", question: "You use a ruler to measure ___.", options: ["weight", "time", "length", "temperature"], answer: "length", hint: "What does a ruler tell you about an object?"},
      # Telling time
      %{id: 19, type: "time", question: "If the short hand points to 3 and the long hand points to 12, what time is it?", options: ["12:03", "3:00", "3:12", "12:30"], answer: "3:00", hint: "The short hand shows the hour, the long hand on 12 means exactly on the hour."},
      %{id: 20, type: "time", question: "How many minutes are in 1 hour?", options: ["12", "30", "60", "100"], answer: "60", hint: "There are 60 minutes in an hour."}
    ]
  end

  def second_grade do
    [
      # Addition & subtraction within 100
      %{id: 1, type: "addition", question: "What is 24 + 38?", options: ["52", "62", "72", "82"], answer: "62", hint: "Add the ones first (4 + 8 = 12), carry the 1, then add the tens."},
      %{id: 2, type: "subtraction", question: "What is 73 - 28?", options: ["35", "45", "55", "65"], answer: "45", hint: "Try 73 - 30 = 43, then add 2 back: 45."},
      %{id: 3, type: "addition", question: "What is 56 + 35?", options: ["81", "91", "101", "111"], answer: "91", hint: "Add ones: 6 + 5 = 11, carry 1, then 50 + 30 + 10 = 91."},
      %{id: 4, type: "subtraction", question: "What is 82 - 47?", options: ["25", "35", "45", "55"], answer: "35", hint: "Try 82 - 50 = 32, then add 3 back: 35."},
      # Place value within 1000
      %{id: 5, type: "place_value", question: "What is the value of the 5 in 352?", options: ["5", "50", "500", "5000"], answer: "50", hint: "The 5 is in the tens place: 5 × 10 = 50."},
      %{id: 6, type: "place_value", question: "Which number has 3 hundreds, 4 tens, and 2 ones?", options: ["234", "324", "342", "432"], answer: "342", hint: "3 hundreds = 300, 4 tens = 40, 2 ones = 2."},
      %{id: 7, type: "place_value", question: "What is 100 more than 456?", options: ["446", "457", "556", "566"], answer: "556", hint: "Adding 100 changes only the hundreds digit."},
      # Expanded form
      %{id: 8, type: "place_value", question: "Which shows 247 in expanded form?", options: ["200 + 40 + 7", "200 + 47", "20 + 4 + 7", "2 + 4 + 7"], answer: "200 + 40 + 7", hint: "Break each digit into its place value."},
      # Comparing numbers to 1000
      %{id: 9, type: "compare", question: "Which number is greatest: 487, 478, or 874?", options: ["487", "478", "874", "They are equal"], answer: "874", hint: "Compare the hundreds digit first."},
      # Skip counting
      %{id: 10, type: "skip_counting", question: "What comes next? 100, 200, 300, 400, __", options: ["410", "450", "490", "500"], answer: "500", hint: "Count by 100s!"},
      %{id: 11, type: "skip_counting", question: "What comes next? 5, 10, 15, 20, 25, __", options: ["26", "28", "30", "35"], answer: "30", hint: "Count by 5s!"},
      # Equal groups (Star Math 2nd grade — not formal multiplication notation)
      %{id: 12, type: "equal_groups", question: "There are 3 bags with 4 apples in each bag. How many apples are there in all?", options: ["7", "10", "12", "14"], answer: "12", hint: "Add equal groups: 4 + 4 + 4 = ?"},
      %{id: 13, type: "equal_groups", question: "There are 5 groups of 2 stars. How many stars in all?", options: ["7", "8", "10", "12"], answer: "10", hint: "Count by 2s, five times: 2, 4, 6, 8, 10."},
      # Word problems (two-step)
      %{id: 14, type: "word_problem", question: "A jar has 85 marbles. 36 are taken out. How many are left?", options: ["39", "49", "59", "69"], answer: "49", hint: "85 - 36 = ?"},
      %{id: 15, type: "word_problem", question: "There are 4 rows of 6 chairs. How many chairs in all?", options: ["20", "22", "24", "26"], answer: "24", hint: "Add 4 equal groups of 6: 6 + 6 + 6 + 6."},
      # Geometry
      %{id: 16, type: "geometry", question: "How many faces does a cube have?", options: ["4", "5", "6", "8"], answer: "6", hint: "Think of a dice — top, bottom, front, back, left, right."},
      # Measurement
      %{id: 17, type: "measurement", question: "Which tool measures how heavy something is?", options: ["Ruler", "Scale", "Thermometer", "Clock"], answer: "Scale", hint: "You stand on one to find your weight."},
      # Money
      %{id: 18, type: "money", question: "You have 1 quarter and 1 dime. How many cents do you have?", options: ["30¢", "35¢", "40¢", "45¢"], answer: "35¢", hint: "A quarter = 25¢, a dime = 10¢. Add them together."},
      # Time
      %{id: 19, type: "time", question: "How many minutes is half an hour?", options: ["15", "30", "45", "60"], answer: "30", hint: "Half of 60 minutes is..."},
      # Even and odd
      %{id: 20, type: "number_sense", question: "Which of these numbers is even?", options: ["13", "17", "22", "35"], answer: "22", hint: "Even numbers can be split into equal pairs with nothing left over."}
    ]
  end
end
