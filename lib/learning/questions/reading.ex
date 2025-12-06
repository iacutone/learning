defmodule Learning.Questions.Reading do
  @moduledoc "Reading comprehension questions organized by grade level"

  def kindergarten do
    [
      %{id: 1, passage: "The cat sat on the mat. The cat is fat.", question: "Where did the cat sit?", options: ["On the bed", "On the mat", "On the chair", "On the floor"], answer: "On the mat", hint: "Look at the first sentence!"},
      %{id: 2, passage: "I see a red apple. The apple is big.", question: "What color is the apple?", options: ["Blue", "Green", "Red", "Yellow"], answer: "Red", hint: "What color word do you see?"},
      %{id: 3, passage: "The dog runs fast. The dog is happy.", question: "How does the dog feel?", options: ["Sad", "Happy", "Angry", "Sleepy"], answer: "Happy", hint: "Look at the second sentence!"},
      %{id: 4, passage: "The sun is hot. The sun is yellow.", question: "What color is the sun?", options: ["Red", "Blue", "Yellow", "Green"], answer: "Yellow", hint: "Read the second sentence!"},
      %{id: 5, passage: "I have a pet fish. My fish is blue.", question: "What pet do I have?", options: ["A dog", "A cat", "A fish", "A bird"], answer: "A fish", hint: "What animal is mentioned?"},
      %{id: 6, passage: "Mom made a cake. The cake is for my birthday.", question: "Who made the cake?", options: ["Dad", "Mom", "Sister", "Brother"], answer: "Mom", hint: "Who is cooking?"},
      %{id: 7, passage: "The bird can fly. The bird is in the tree.", question: "Where is the bird?", options: ["In the sky", "In the tree", "On the ground", "In a cage"], answer: "In the tree", hint: "Look at the second sentence!"},
      %{id: 8, passage: "I like to play. I play with my ball.", question: "What do I play with?", options: ["A doll", "A car", "A ball", "A book"], answer: "A ball", hint: "What toy is mentioned?"},
      %{id: 9, passage: "The frog can jump. The frog is green.", question: "What can the frog do?", options: ["Swim", "Fly", "Jump", "Run"], answer: "Jump", hint: "Read the first sentence!"},
      %{id: 10, passage: "It is raining. I need my umbrella.", question: "What do I need?", options: ["A hat", "An umbrella", "Sunglasses", "A coat"], answer: "An umbrella", hint: "What helps in the rain?"},
      %{id: 11, passage: "The baby is sleeping. The baby is in the crib.", question: "What is the baby doing?", options: ["Eating", "Playing", "Sleeping", "Crying"], answer: "Sleeping", hint: "Read the first sentence!"},
      %{id: 12, passage: "I eat breakfast in the morning. I have eggs and toast.", question: "When do I eat breakfast?", options: ["At night", "In the morning", "At lunch", "In the evening"], answer: "In the morning", hint: "When is breakfast time?"},
      %{id: 13, passage: "The flower is pretty. The flower is pink.", question: "What color is the flower?", options: ["Red", "Pink", "Blue", "White"], answer: "Pink", hint: "Look for the color word!"},
      %{id: 14, passage: "Dad reads a book. The book is about animals.", question: "What is the book about?", options: ["Cars", "Animals", "Food", "Sports"], answer: "Animals", hint: "Read the second sentence!"},
      %{id: 15, passage: "I brush my teeth. I brush them every day.", question: "How often do I brush my teeth?", options: ["Sometimes", "Never", "Every day", "Once a week"], answer: "Every day", hint: "Look at the second sentence!"}
    ]
  end

  def first_grade do
    [
      %{id: 1, passage: "The little brown dog ran across the green grass. He was chasing a red ball that his owner had thrown.", question: "What color was the ball?", options: ["Blue", "Red", "Green", "Yellow"], answer: "Red", hint: "Look for the color word near 'ball'."},
      %{id: 2, passage: "Sara loves to read books. Every night before bed, she reads for thirty minutes.", question: "When does Sara read?", options: ["In the morning", "At lunch", "Before bed", "After school"], answer: "Before bed", hint: "Look for the time word in the story."},
      %{id: 3, passage: "Tom went to the store with his mom. They bought milk, bread, and eggs.", question: "Who did Tom go to the store with?", options: ["His dad", "His friend", "His mom", "His sister"], answer: "His mom", hint: "Read the first sentence carefully."},
      %{id: 4, passage: "The rabbit hopped into the garden. It ate some carrots and lettuce.", question: "What did the rabbit eat?", options: ["Apples", "Carrots and lettuce", "Grass", "Flowers"], answer: "Carrots and lettuce", hint: "What vegetables are mentioned?"},
      %{id: 5, passage: "Jenny got a new bike for her birthday. It was purple with white wheels.", question: "What color was Jenny's bike?", options: ["Red", "Blue", "Purple", "Green"], answer: "Purple", hint: "Look for the color in the second sentence."},
      %{id: 6, passage: "The class went on a field trip to the zoo. They saw lions, elephants, and monkeys.", question: "Where did the class go?", options: ["The park", "The zoo", "The museum", "The beach"], answer: "The zoo", hint: "Where do you see lions and elephants?"},
      %{id: 7, passage: "It was a cold winter day. Snow covered the ground. The children built a snowman.", question: "What season was it?", options: ["Spring", "Summer", "Fall", "Winter"], answer: "Winter", hint: "When does it snow?"},
      %{id: 8, passage: "Max has a pet turtle named Shelly. He feeds Shelly every morning.", question: "What is the turtle's name?", options: ["Max", "Shelly", "Turtle", "Pet"], answer: "Shelly", hint: "Look for the name after 'named'."},
      %{id: 9, passage: "The baker made fresh bread. The whole shop smelled wonderful.", question: "What did the baker make?", options: ["Cake", "Cookies", "Bread", "Pie"], answer: "Bread", hint: "Read the first sentence!"},
      %{id: 10, passage: "Anna planted seeds in her garden. She watered them every day. Soon, flowers began to grow.", question: "What grew in the garden?", options: ["Trees", "Vegetables", "Flowers", "Grass"], answer: "Flowers", hint: "What appeared at the end?"},
      %{id: 11, passage: "The firefighters rushed to the burning building. They used a big hose to put out the fire.", question: "What did the firefighters use?", options: ["A bucket", "A hose", "A ladder", "Water bottles"], answer: "A hose", hint: "What tool did they use?"},
      %{id: 12, passage: "Grandma knits sweaters for the family. She uses colorful yarn.", question: "What does Grandma make?", options: ["Hats", "Socks", "Sweaters", "Blankets"], answer: "Sweaters", hint: "Read the first sentence!"},
      %{id: 13, passage: "The airplane flew high in the sky. It was going to a faraway city.", question: "Where was the airplane?", options: ["On the ground", "In the water", "In the sky", "In a garage"], answer: "In the sky", hint: "Where do airplanes fly?"},
      %{id: 14, passage: "Ben lost his favorite toy at the park. He looked everywhere but couldn't find it.", question: "Where did Ben lose his toy?", options: ["At school", "At home", "At the park", "At the store"], answer: "At the park", hint: "Where was Ben when he lost it?"},
      %{id: 15, passage: "The doctor helped the sick boy feel better. She gave him medicine.", question: "Who helped the boy?", options: ["A nurse", "A teacher", "A doctor", "His mom"], answer: "A doctor", hint: "Who gave the medicine?"}
    ]
  end

  def second_grade do
    [
      %{id: 1, passage: "The butterfly landed on the flower. Its wings were orange and black. It drank nectar from the flower before flying away to find another one.", question: "What did the butterfly drink?", options: ["Water", "Juice", "Nectar", "Milk"], answer: "Nectar", hint: "What do butterflies get from flowers?"},
      %{id: 2, passage: "Ben wanted to build a treehouse. He gathered wood, nails, and a hammer. His dad helped him measure and cut the boards. After two weekends of work, the treehouse was finished!", question: "How long did it take to build the treehouse?", options: ["One day", "One weekend", "Two weekends", "One month"], answer: "Two weekends", hint: "Look for the time mentioned near the end."},
      %{id: 3, passage: "The library was quiet. Maya found a book about dinosaurs and sat in her favorite corner. She read for an hour before her mom came to pick her up.", question: "Where was Maya?", options: ["At school", "At the library", "At home", "At the park"], answer: "At the library", hint: "Where do you find lots of books?"},
      %{id: 4, passage: "The storm came suddenly. Lightning flashed across the sky and thunder rumbled loudly. The family stayed inside until the rain stopped.", question: "What did the family do during the storm?", options: ["Went outside", "Stayed inside", "Went to the store", "Played in the rain"], answer: "Stayed inside", hint: "What's safe to do in a storm?"},
      %{id: 5, passage: "Maria's grandmother taught her how to make tamales. They spent all Saturday cooking together. Maria loved learning her family's special recipe.", question: "Who taught Maria to cook?", options: ["Her mother", "Her father", "Her grandmother", "Her sister"], answer: "Her grandmother", hint: "Who was cooking with Maria?"},
      %{id: 6, passage: "The astronaut floated in space. She looked down at Earth and saw blue oceans and green land. It was the most beautiful sight she had ever seen.", question: "What colors did the astronaut see on Earth?", options: ["Red and yellow", "Blue and green", "Black and white", "Orange and purple"], answer: "Blue and green", hint: "What colors are oceans and land?"},
      %{id: 7, passage: "Jake's soccer team practiced every Tuesday and Thursday. Their big game was on Saturday. Jake scored two goals and his team won!", question: "How many goals did Jake score?", options: ["One", "Two", "Three", "Four"], answer: "Two", hint: "Look for the number near 'goals'."},
      %{id: 8, passage: "The penguin waddled across the ice. It was looking for fish to eat. When it found the water, it dove in and swam very fast.", question: "What was the penguin looking for?", options: ["Its family", "A place to sleep", "Fish to eat", "Other penguins"], answer: "Fish to eat", hint: "What do penguins eat?"},
      %{id: 9, passage: "Lily planted a seed in a small pot. She put it by the sunny window and watered it carefully. After three weeks, a tiny green sprout appeared.", question: "How long until the sprout appeared?", options: ["One week", "Two weeks", "Three weeks", "Four weeks"], answer: "Three weeks", hint: "Look for the time mentioned."},
      %{id: 10, passage: "The old castle stood on top of the hill. It had tall towers and a deep moat around it. Long ago, a king and queen lived there.", question: "Where was the castle?", options: ["By the ocean", "In a valley", "On top of a hill", "In a forest"], answer: "On top of a hill", hint: "Read the first sentence!"},
      %{id: 11, passage: "The chef prepared a special meal for the restaurant. He used fresh vegetables from the garden and herbs he grew himself. Everyone said it was delicious.", question: "Where did the vegetables come from?", options: ["The store", "The garden", "A farm", "A truck"], answer: "The garden", hint: "Where did the chef get the vegetables?"},
      %{id: 12, passage: "Emma's dog, Buddy, loves to play fetch. Every afternoon, they go to the park together. Buddy can catch the ball in mid-air!", question: "What can Buddy do?", options: ["Swim", "Catch the ball in mid-air", "Do tricks", "Run very fast"], answer: "Catch the ball in mid-air", hint: "What special skill does Buddy have?"},
      %{id: 13, passage: "The train traveled through the mountains. Passengers looked out the windows at the beautiful scenery. The journey took six hours.", question: "How long was the train journey?", options: ["Two hours", "Four hours", "Six hours", "Eight hours"], answer: "Six hours", hint: "Look for the number of hours."},
      %{id: 14, passage: "Scientists discovered a new type of frog in the rainforest. It was bright blue and very small. They named it the Sapphire Frog.", question: "What color was the new frog?", options: ["Green", "Red", "Blue", "Yellow"], answer: "Blue", hint: "What color is a sapphire?"},
      %{id: 15, passage: "The art class made clay sculptures. Some students made animals, others made bowls. After the clay dried, they painted their creations with bright colors.", question: "What did the class make?", options: ["Paintings", "Clay sculptures", "Paper crafts", "Drawings"], answer: "Clay sculptures", hint: "What material did they use?"}
    ]
  end
end
