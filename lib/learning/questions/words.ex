defmodule Learning.Questions.Words do
  @moduledoc "Vocabulary/Words questions organized by grade level"

  def kindergarten do
    [
      %{id: 1, question: "Which animal says 'moo'?", options: ["Dog", "Cat", "Cow", "Bird"], answer: "Cow", hint: "This animal lives on a farm and gives us milk!"},
      %{id: 2, question: "What color is the sky on a sunny day?", options: ["Red", "Blue", "Green", "Black"], answer: "Blue", hint: "Look up outside on a nice day!"},
      %{id: 3, question: "Which one is a fruit?", options: ["Carrot", "Apple", "Bread", "Cheese"], answer: "Apple", hint: "It's red and grows on trees!"},
      %{id: 4, question: "What do you wear on your feet?", options: ["Hat", "Gloves", "Shoes", "Scarf"], answer: "Shoes", hint: "You put them on before you walk outside!"},
      %{id: 5, question: "Which animal can fly?", options: ["Dog", "Fish", "Bird", "Cat"], answer: "Bird", hint: "It has wings and feathers!"},
      %{id: 6, question: "What do you use to eat soup?", options: ["Fork", "Knife", "Spoon", "Plate"], answer: "Spoon", hint: "It's round and holds liquid!"},
      %{id: 7, question: "Which one is a vegetable?", options: ["Banana", "Carrot", "Apple", "Orange"], answer: "Carrot", hint: "It's orange and rabbits love it!"},
      %{id: 8, question: "What animal says 'woof'?", options: ["Cat", "Dog", "Cow", "Pig"], answer: "Dog", hint: "It's a popular pet that loves to play fetch!"},
      %{id: 9, question: "What do you sleep in at night?", options: ["Chair", "Table", "Bed", "Couch"], answer: "Bed", hint: "It has pillows and blankets!"},
      %{id: 10, question: "Which one is round?", options: ["Book", "Ball", "Box", "Ruler"], answer: "Ball", hint: "You can roll it and bounce it!"},
      %{id: 11, question: "What do you drink from?", options: ["Plate", "Bowl", "Cup", "Pan"], answer: "Cup", hint: "You hold it and sip from it!"},
      %{id: 12, question: "Which animal lives in water?", options: ["Bird", "Dog", "Fish", "Cat"], answer: "Fish", hint: "It swims and has fins!"},
      %{id: 13, question: "What color is grass?", options: ["Blue", "Red", "Green", "Yellow"], answer: "Green", hint: "Look at a lawn or park!"},
      %{id: 14, question: "What do you use to write?", options: ["Pencil", "Spoon", "Cup", "Shoe"], answer: "Pencil", hint: "It's long and thin with a point!"},
      %{id: 15, question: "Which one is cold?", options: ["Fire", "Sun", "Ice", "Oven"], answer: "Ice", hint: "It's frozen water!"}
    ]
  end

  def first_grade do
    [
      %{id: 1, question: "What does 'big' mean?", options: ["Small", "Large", "Fast", "Slow"], answer: "Large", hint: "An elephant is big!"},
      %{id: 2, question: "Which word is the opposite of 'hot'?", options: ["Warm", "Cold", "Wet", "Dry"], answer: "Cold", hint: "Ice cream is the opposite of hot soup!"},
      %{id: 3, question: "What do we call a baby dog?", options: ["Kitten", "Puppy", "Calf", "Chick"], answer: "Puppy", hint: "It rhymes with 'guppy'!"},
      %{id: 4, question: "Which word means 'happy'?", options: ["Sad", "Angry", "Glad", "Tired"], answer: "Glad", hint: "When you smile, you feel..."},
      %{id: 5, question: "What is the opposite of 'up'?", options: ["Left", "Right", "Down", "Over"], answer: "Down", hint: "If you go up, then you come..."},
      %{id: 6, question: "What do we call a baby cat?", options: ["Puppy", "Kitten", "Cub", "Foal"], answer: "Kitten", hint: "It starts with the letter K!"},
      %{id: 7, question: "Which word means 'fast'?", options: ["Slow", "Quick", "Heavy", "Light"], answer: "Quick", hint: "A rabbit is very..."},
      %{id: 8, question: "What is the opposite of 'day'?", options: ["Morning", "Evening", "Night", "Afternoon"], answer: "Night", hint: "When the sun goes down, it becomes..."},
      %{id: 9, question: "Which word means 'small'?", options: ["Big", "Huge", "Tiny", "Giant"], answer: "Tiny", hint: "An ant is very..."},
      %{id: 10, question: "What do we call a baby cow?", options: ["Lamb", "Calf", "Foal", "Kid"], answer: "Calf", hint: "It starts with the letter C!"},
      %{id: 11, question: "Which word is the opposite of 'old'?", options: ["Ancient", "New", "Broken", "Used"], answer: "New", hint: "A brand new toy is the opposite of an old toy!"},
      %{id: 12, question: "What does 'loud' mean?", options: ["Quiet", "Noisy", "Soft", "Silent"], answer: "Noisy", hint: "Thunder is very loud!"},
      %{id: 13, question: "Which word means 'pretty'?", options: ["Ugly", "Beautiful", "Plain", "Dull"], answer: "Beautiful", hint: "A rainbow is very..."},
      %{id: 14, question: "What is the opposite of 'wet'?", options: ["Damp", "Moist", "Dry", "Soaked"], answer: "Dry", hint: "After you use a towel, you become..."},
      %{id: 15, question: "Which word means 'scared'?", options: ["Brave", "Afraid", "Happy", "Calm"], answer: "Afraid", hint: "When you see something scary, you feel..."}
    ]
  end

  def second_grade do
    [
      %{id: 1, question: "What does 'enormous' mean?", options: ["Very small", "Very big", "Very fast", "Very slow"], answer: "Very big", hint: "Think of an elephant - they are enormous!"},
      %{id: 2, question: "Which word is the opposite of 'happy'?", options: ["Glad", "Sad", "Mad", "Excited"], answer: "Sad", hint: "When you're not happy, you might feel..."},
      %{id: 3, question: "What does 'sprint' mean?", options: ["Walk slowly", "Run very fast", "Jump high", "Sit down"], answer: "Run very fast", hint: "Runners sprint in a race!"},
      %{id: 4, question: "Which word means 'to look at'?", options: ["Listen", "Observe", "Taste", "Touch"], answer: "Observe", hint: "Scientists observe things carefully!"},
      %{id: 5, question: "What does 'ancient' mean?", options: ["Very new", "Very old", "Very big", "Very small"], answer: "Very old", hint: "Dinosaurs lived in ancient times!"},
      %{id: 6, question: "Which word means 'brave'?", options: ["Scared", "Courageous", "Shy", "Weak"], answer: "Courageous", hint: "Firefighters are very courageous!"},
      %{id: 7, question: "What does 'delicious' mean?", options: ["Tastes bad", "Tastes good", "Looks nice", "Smells bad"], answer: "Tastes good", hint: "Your favorite food is delicious!"},
      %{id: 8, question: "Which word is the opposite of 'difficult'?", options: ["Hard", "Easy", "Tricky", "Tough"], answer: "Easy", hint: "If something isn't hard, it's..."},
      %{id: 9, question: "What does 'exhausted' mean?", options: ["Very happy", "Very tired", "Very hungry", "Very cold"], answer: "Very tired", hint: "After running a long race, you feel exhausted!"},
      %{id: 10, question: "Which word means 'to fix'?", options: ["Break", "Repair", "Destroy", "Damage"], answer: "Repair", hint: "A mechanic repairs cars!"},
      %{id: 11, question: "What does 'furious' mean?", options: ["Very happy", "Very sad", "Very angry", "Very scared"], answer: "Very angry", hint: "When someone is really mad, they are furious!"},
      %{id: 12, question: "Which word means 'to begin'?", options: ["End", "Stop", "Start", "Finish"], answer: "Start", hint: "The opposite of finish is..."},
      %{id: 13, question: "What does 'brilliant' mean?", options: ["Dull", "Very smart", "Boring", "Slow"], answer: "Very smart", hint: "A genius is brilliant!"},
      %{id: 14, question: "Which word is the opposite of 'generous'?", options: ["Kind", "Selfish", "Giving", "Helpful"], answer: "Selfish", hint: "Someone who doesn't share is..."},
      %{id: 15, question: "What does 'peculiar' mean?", options: ["Normal", "Strange", "Common", "Regular"], answer: "Strange", hint: "Something unusual or odd is peculiar!"}
    ]
  end
end
