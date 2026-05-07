defmodule Learning.Questions.Reading do
  @moduledoc "Reading comprehension questions organized by grade level with various question types"

  def kindergarten do
    comprehension_questions() ++ rhyming_questions() ++ phonics_questions() ++ description_questions()
  end

  def first_grade do
    first_grade_comprehension() ++ first_grade_rhyming() ++ first_grade_phonics() ++ first_grade_description()
  end

  def second_grade do
    second_grade_comprehension() ++ second_grade_rhyming() ++ second_grade_phonics() ++ second_grade_description()
  end

  # Comprehension Questions (existing)
  defp comprehension_questions do
    [
      %{id: 1, type: "comprehension", passage: "The cat sat on the mat. The cat is fat.", question: "Where did the cat sit?", options: ["On the bed", "On the mat", "On the chair", "On the floor"], answer: "On the mat", hint: "Look at the first sentence!"},
      %{id: 2, type: "comprehension", passage: "I see a red apple. The apple is big.", question: "What color is the apple?", options: ["Blue", "Green", "Red", "Yellow"], answer: "Red", hint: "What color word do you see?"},
      %{id: 3, type: "comprehension", passage: "The dog runs fast. The dog is happy.", question: "How does the dog feel?", options: ["Sad", "Happy", "Angry", "Sleepy"], answer: "Happy", hint: "Look at the second sentence!"},
      %{id: 4, type: "comprehension", passage: "The sun is hot. The sun is yellow.", question: "What color is the sun?", options: ["Red", "Blue", "Yellow", "Green"], answer: "Yellow", hint: "Read the second sentence!"},
      %{id: 5, type: "comprehension", passage: "I have a pet fish. My fish is blue.", question: "What pet do I have?", options: ["A dog", "A cat", "A fish", "A bird"], answer: "A fish", hint: "What animal is mentioned?"}
    ]
  end

  # Rhyming Questions
  defp rhyming_questions do
    [
      %{id: 6, type: "rhyming", question: "Which word rhymes with 'cat'?", options: ["dog", "hat", "fish", "bird"], answer: "hat", hint: "Think about words that end with the same sound as 'cat'."},
      %{id: 7, type: "rhyming", question: "Which word rhymes with 'sun'?", options: ["moon", "run", "star", "sky"], answer: "run", hint: "Listen for the ending sound in 'sun'."},
      %{id: 8, type: "rhyming", question: "Which word rhymes with 'ball'?", options: ["bat", "call", "game", "toy"], answer: "call", hint: "What word sounds like 'ball' at the end?"},
      %{id: 9, type: "rhyming", question: "Which word rhymes with 'tree'?", options: ["leaf", "bee", "bark", "wood"], answer: "bee", hint: "Think about the 'ee' sound."},
      %{id: 10, type: "rhyming", question: "Which word rhymes with 'book'?", options: ["read", "look", "page", "story"], answer: "look", hint: "Listen for the 'ook' sound."}
    ]
  end

  # Phonics/Fill-in-the-blank Questions
  defp phonics_questions do
    [
      %{id: 11, type: "phonics", question: "Fill in the missing letter: c_t", options: ["a", "e", "i", "o"], answer: "a", hint: "What letter makes the word 'cat'?"},
      %{id: 12, type: "phonics", question: "Fill in the missing letter: d_g", options: ["a", "e", "i", "o"], answer: "o", hint: "What letter makes the word 'dog'?"},
      %{id: 13, type: "phonics", question: "Fill in the missing letter: b_d", options: ["a", "e", "i", "u"], answer: "e", hint: "What letter makes the word 'bed'?"},
      %{id: 14, type: "phonics", question: "Fill in the missing letter: f_sh", options: ["a", "e", "i", "o"], answer: "i", hint: "What letter makes the word 'fish'?"},
      %{id: 15, type: "phonics", question: "Fill in the missing letter: s_n", options: ["a", "e", "i", "u"], answer: "u", hint: "What letter makes the word 'sun'?"}
    ]
  end

  # Description Questions
  defp description_questions do
    [
      %{id: 16, type: "description", question: "I am yellow and bright. I shine in the sky during the day. What am I?", options: ["Moon", "Star", "Sun", "Cloud"], answer: "Sun", hint: "What is yellow and shines during the day?"},
      %{id: 17, type: "description", question: "I am small and furry. I say 'meow' and like to play with yarn. What am I?", options: ["Dog", "Cat", "Bird", "Fish"], answer: "Cat", hint: "What animal says 'meow'?"},
      %{id: 18, type: "description", question: "I am red and round. I grow on trees and you can eat me. What am I?", options: ["Orange", "Banana", "Apple", "Grape"], answer: "Apple", hint: "What red fruit grows on trees?"},
      %{id: 19, type: "description", question: "I have four legs and bark. I wag my tail when I'm happy. What am I?", options: ["Cat", "Horse", "Dog", "Cow"], answer: "Dog", hint: "What animal barks and wags its tail?"},
      %{id: 20, type: "description", question: "I am white and cold. I fall from the sky in winter. What am I?", options: ["Rain", "Snow", "Hail", "Wind"], answer: "Snow", hint: "What is white and falls in winter?"}
    ]
  end

  # First Grade Questions
  defp first_grade_comprehension do
    [
      %{id: 21, type: "comprehension", passage: "The little brown dog ran across the green grass. He was chasing a red ball that his owner had thrown.", question: "What color was the ball?", options: ["Blue", "Red", "Green", "Yellow"], answer: "Red", hint: "Look for the color word near 'ball'."},
      %{id: 22, type: "comprehension", passage: "Sara loves to read books. Every night before bed, she reads for thirty minutes.", question: "When does Sara read?", options: ["In the morning", "At lunch", "Before bed", "After school"], answer: "Before bed", hint: "Look for the time word in the story."},
      %{id: 23, type: "comprehension", passage: "Tom went to the store with his mom. They bought milk, bread, and eggs.", question: "Who did Tom go to the store with?", options: ["His dad", "His friend", "His mom", "His sister"], answer: "His mom", hint: "Read the first sentence carefully."}
    ]
  end

  defp first_grade_rhyming do
    [
      %{id: 24, type: "rhyming", question: "Which word rhymes with 'night'?", options: ["day", "light", "dark", "moon"], answer: "light", hint: "Think about words that end with 'ight'."},
      %{id: 25, type: "rhyming", question: "Which word rhymes with 'play'?", options: ["game", "day", "fun", "toy"], answer: "day", hint: "Listen for the 'ay' sound."},
      %{id: 26, type: "rhyming", question: "Which word rhymes with 'house'?", options: ["home", "mouse", "door", "room"], answer: "mouse", hint: "What word sounds like 'house'?"}
    ]
  end

  defp first_grade_phonics do
    [
      %{id: 27, type: "phonics", question: "Fill in the missing letters: tr__", options: ["ee", "ai", "oa", "ie"], answer: "ee", hint: "What letters make the word 'tree'?"},
      %{id: 28, type: "phonics", question: "Fill in the missing letters: fl__er", options: ["ow", "ay", "ee", "oo"], answer: "ow", hint: "What letters make the word 'flower'?"},
      %{id: 29, type: "phonics", question: "Fill in the missing letters: br__d", options: ["ea", "ai", "oo", "ie"], answer: "ea", hint: "What letters make the word 'bread'?"}
    ]
  end

  defp first_grade_description do
    [
      %{id: 30, type: "description", question: "I am a place where you can borrow books. I am quiet and have many shelves. What am I?", options: ["School", "Store", "Library", "Home"], answer: "Library", hint: "Where do you borrow books?"},
      %{id: 31, type: "description", question: "I am a person who helps sick people feel better. I work in a hospital. What am I?", options: ["Teacher", "Doctor", "Cook", "Driver"], answer: "Doctor", hint: "Who helps sick people?"},
      %{id: 32, type: "description", question: "I am a season when leaves fall and it gets cooler. What am I?", options: ["Spring", "Summer", "Fall", "Winter"], answer: "Fall", hint: "When do leaves fall from trees?"}
    ]
  end

  # Second Grade Questions
  defp second_grade_comprehension do
    [
      %{id: 33, type: "comprehension", passage: "The butterfly landed on the flower. Its wings were orange and black. It drank nectar from the flower before flying away to find another one.", question: "What did the butterfly drink?", options: ["Water", "Juice", "Nectar", "Milk"], answer: "Nectar", hint: "What do butterflies get from flowers?"},
      %{id: 34, type: "comprehension", passage: "Ben wanted to build a treehouse. He gathered wood, nails, and a hammer. His dad helped him measure and cut the boards. After two weekends of work, the treehouse was finished!", question: "How long did it take to build the treehouse?", options: ["One day", "One weekend", "Two weekends", "One month"], answer: "Two weekends", hint: "Look for the time mentioned near the end."}
    ]
  end

  defp second_grade_rhyming do
    [
      %{id: 35, type: "rhyming", question: "Which word rhymes with 'bright'?", options: ["dark", "light", "sun", "day"], answer: "light", hint: "Think about words ending in 'ight'."},
      %{id: 36, type: "rhyming", question: "Which word rhymes with 'ground'?", options: ["dirt", "sound", "earth", "floor"], answer: "sound", hint: "Listen for the 'ound' ending."},
      %{id: 37, type: "rhyming", question: "Which word rhymes with 'flower'?", options: ["plant", "power", "bloom", "petal"], answer: "power", hint: "What word sounds like 'flower'?"}
    ]
  end

  defp second_grade_phonics do
    [
      %{id: 38, type: "phonics", question: "Fill in the missing letters: thr__gh", options: ["ou", "ow", "oo", "oa"], answer: "ou", hint: "What letters make the word 'through'?"},
      %{id: 39, type: "phonics", question: "Fill in the missing letters: beau__ful", options: ["ti", "ty", "te", "ta"], answer: "ti", hint: "What letters make the word 'beautiful'?"},
      %{id: 40, type: "phonics", question: "Fill in the missing letters: diff__ent", options: ["er", "ar", "or", "ir"], answer: "er", hint: "What letters make the word 'different'?"}
    ]
  end

  defp second_grade_description do
    [
      %{id: 41, type: "description", question: "I am a large body of water surrounded by land. Ships and boats travel on me. What am I?", options: ["River", "Lake", "Ocean", "Pond"], answer: "Ocean", hint: "What large body of water do ships travel on?"},
      %{id: 42, type: "description", question: "I am a scientist who studies space, stars, and planets. What am I?", options: ["Biologist", "Astronomer", "Chemist", "Geologist"], answer: "Astronomer", hint: "Who studies stars and planets?"},
      %{id: 43, type: "description", question: "I am a story that is not real but teaches a lesson. I often have talking animals. What am I?", options: ["Biography", "Fable", "Dictionary", "Recipe"], answer: "Fable", hint: "What type of story has talking animals and teaches lessons?"}
    ]
  end
end
