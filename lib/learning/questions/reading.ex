defmodule Learning.Questions.Reading do
  @moduledoc "Reading questions organized by grade level, modeled after Star Reading/Star Early Literacy assessments"

  def kindergarten do
    [
      # Letter names & sounds (Star Early Literacy core skill)
      %{id: 1, type: "letter_sounds", question: "What sound does the letter 'B' make?", options: ["/b/ like 'ball'", "/d/ like 'dog'", "/p/ like 'pet'", "/m/ like 'map'"], answer: "/b/ like 'ball'", hint: "Think of a word that starts with B!"},
      %{id: 2, type: "letter_sounds", question: "What sound does the letter 'S' make?", options: ["/z/ like 'zip'", "/sh/ like 'ship'", "/s/ like 'sun'", "/c/ like 'cat'"], answer: "/s/ like 'sun'", hint: "What sound does 'sun' start with?"},
      %{id: 3, type: "letter_sounds", question: "What letter makes the sound at the start of 'fish'?", options: ["B", "F", "V", "P"], answer: "F", hint: "Say 'fish' slowly. What sound do you hear first?"},
      %{id: 4, type: "letter_sounds", question: "What letter makes the sound at the start of 'moon'?", options: ["N", "W", "M", "B"], answer: "M", hint: "Say 'moon' slowly. What sound do you hear first?"},
      %{id: 5, type: "letter_sounds", question: "Which word starts with the same sound as 'cat'?", options: ["dog", "car", "hat", "map"], answer: "car", hint: "What sound does 'cat' start with? Which other word starts the same way?"},
      # Print concepts (Star Early Literacy — word vs. letter, left-to-right)
      %{id: 6, type: "print_concepts", question: "How many words are in this sentence? 'The cat ran.'", options: ["2", "3", "4", "5"], answer: "3", hint: "Count the spaces between words."},
      %{id: 7, type: "print_concepts", question: "Which of these is a letter?", options: ["cat", "run", "A", "the"], answer: "A", hint: "A letter is a single symbol like A, B, or C."},
      %{id: 8, type: "print_concepts", question: "Which of these is a word?", options: ["A", "B", "cat", "M"], answer: "cat", hint: "A word is made of letters put together to mean something."},
      # Phonological awareness — rhyming
      %{id: 9, type: "rhyming", question: "Which word rhymes with 'cat'?", options: ["dog", "hat", "fish", "bird"], answer: "hat", hint: "Think about words that end with the same sound as 'cat'."},
      %{id: 10, type: "rhyming", question: "Which word rhymes with 'sun'?", options: ["moon", "run", "star", "sky"], answer: "run", hint: "Listen for the ending sound in 'sun'."},
      %{id: 11, type: "rhyming", question: "Which word rhymes with 'hop'?", options: ["run", "jump", "stop", "fall"], answer: "stop", hint: "Listen for the 'op' sound."},
      # Phonics — beginning letter/sound to word
      %{id: 12, type: "phonics", question: "Fill in the missing letter: c_t", options: ["a", "e", "i", "o"], answer: "a", hint: "What letter makes the word 'cat'?"},
      %{id: 13, type: "phonics", question: "Fill in the missing letter: d_g", options: ["a", "e", "i", "o"], answer: "o", hint: "What letter makes the word 'dog'?"},
      %{id: 14, type: "phonics", question: "Fill in the missing letter: b_d", options: ["a", "e", "i", "u"], answer: "e", hint: "What letter makes the word 'bed'?"},
      %{id: 15, type: "phonics", question: "Fill in the missing letter: s_n", options: ["a", "e", "i", "u"], answer: "u", hint: "What letter makes the word 'sun'?"},
      # Sentence completion — simple vocabulary
      %{id: 16, type: "sentence_completion", question: "The dog likes to ___.", options: ["run", "blue", "six", "from"], answer: "run", hint: "What is something a dog can do?"},
      %{id: 17, type: "sentence_completion", question: "She put on her ___ before going outside.", options: ["coat", "lamp", "funny", "never"], answer: "coat", hint: "What do you wear when it is cold?"},
      # Short comprehension
      %{id: 18, type: "comprehension", passage: "The cat sat on the mat. The cat is fat.", question: "Where did the cat sit?", options: ["On the bed", "On the mat", "On the chair", "On the floor"], answer: "On the mat", hint: "Look at the first sentence!"},
      %{id: 19, type: "comprehension", passage: "The dog runs fast. The dog is happy.", question: "How does the dog feel?", options: ["Sad", "Happy", "Angry", "Sleepy"], answer: "Happy", hint: "Look at the second sentence!"},
      %{id: 20, type: "comprehension", passage: "The bird can fly. The bird is in the tree.", question: "Where is the bird?", options: ["In the sky", "In the tree", "On the ground", "In a cage"], answer: "In the tree", hint: "Look at the second sentence!"}
    ]
  end

  def first_grade do
    [
      # Sentence completion — vocabulary in context (Star Reading style)
      %{id: 1, type: "sentence_completion", question: "The puppy was ___ because he had not eaten all day.", options: ["hungry", "purple", "above", "slowly"], answer: "hungry", hint: "How do you feel when you have not eaten?"},
      %{id: 2, type: "sentence_completion", question: "She ___ her hands before eating dinner.", options: ["washed", "tall", "never", "blue"], answer: "washed", hint: "What do you do to your hands to make them clean?"},
      %{id: 3, type: "sentence_completion", question: "The boy was ___ when he heard a loud noise.", options: ["startled", "purple", "below", "often"], answer: "startled", hint: "How do you feel when something surprises you suddenly?"},
      %{id: 4, type: "sentence_completion", question: "Mom asked me to ___ my toys before bed.", options: ["put away", "on top", "orange", "flew"], answer: "put away", hint: "What do you do to tidy up your room?"},
      %{id: 5, type: "sentence_completion", question: "The flower ___ in the warm sunshine.", options: ["bloomed", "cold", "seven", "away"], answer: "bloomed", hint: "What does a flower do when it opens up?"},
      %{id: 6, type: "sentence_completion", question: "Jake felt ___ after finishing the hard puzzle.", options: ["proud", "under", "green", "never"], answer: "proud", hint: "How do you feel when you do something hard?"},
      %{id: 7, type: "sentence_completion", question: "The kitten ___ up onto the warm blanket.", options: ["curled", "beside", "yellow", "soon"], answer: "curled", hint: "How does a cat settle down to rest?"},
      %{id: 8, type: "sentence_completion", question: "It was ___ outside, so we wore our winter coats.", options: ["freezing", "round", "after", "jump"], answer: "freezing", hint: "What word means very, very cold?"},
      # Rhyming
      %{id: 9, type: "rhyming", question: "Which word rhymes with 'night'?", options: ["day", "light", "dark", "moon"], answer: "light", hint: "Think about words that end with 'ight'."},
      %{id: 10, type: "rhyming", question: "Which word rhymes with 'house'?", options: ["home", "mouse", "door", "room"], answer: "mouse", hint: "What word sounds like 'house'?"},
      # Phonics
      %{id: 11, type: "phonics", question: "Fill in the missing letters: tr__", options: ["ee", "ai", "oa", "ie"], answer: "ee", hint: "What letters make the word 'tree'?"},
      %{id: 12, type: "phonics", question: "Fill in the missing letters: fl__er", options: ["ow", "ay", "ee", "oo"], answer: "ow", hint: "What letters make the word 'flower'?"},
      %{id: 13, type: "phonics", question: "Fill in the missing letters: br__d", options: ["ea", "ai", "oo", "ie"], answer: "ea", hint: "What letters make the word 'bread'?"},
      # Comprehension
      %{id: 14, type: "comprehension", passage: "Mia found a small turtle in the garden. She gave it water and lettuce. Then she set it free near the pond.", question: "What did Mia do after giving the turtle food and water?", options: ["She kept it inside", "She set it free", "She put it in a box", "She gave it to a friend"], answer: "She set it free", hint: "Read the last sentence."},
      %{id: 15, type: "comprehension", passage: "Sam's dog Biscuit loves to play fetch. Every morning Sam throws a ball. Biscuit runs as fast as he can to get it.", question: "When does Sam throw the ball?", options: ["At night", "After school", "Every morning", "On weekends"], answer: "Every morning", hint: "Look for the time word in the passage."},
      %{id: 16, type: "comprehension", passage: "Lily planted seeds in a pot. She put the pot by the sunny window. She watered it every day. After two weeks, a green sprout appeared.", question: "Why did Lily put the pot by the window?", options: ["To keep it warm", "So it would get sunlight", "So she could see it", "To keep it away from pets"], answer: "So it would get sunlight", hint: "Plants need something from the sun to grow."},
      %{id: 17, type: "comprehension", passage: "Dad made soup for dinner. He chopped carrots and celery. He added noodles and chicken. The kitchen smelled wonderful.", question: "What did Dad put in the soup?", options: ["Rice and beef", "Carrots, celery, noodles, and chicken", "Potatoes and corn", "Tomatoes and pasta"], answer: "Carrots, celery, noodles, and chicken", hint: "Look for all the ingredients listed."},
      %{id: 18, type: "comprehension", passage: "The class went to the fire station. A firefighter showed them the big red truck. She put on her heavy coat and helmet. Everyone got to ring the bell.", question: "What did everyone get to do?", options: ["Ride the truck", "Wear the helmet", "Ring the bell", "Drive the truck"], answer: "Ring the bell", hint: "Read the last sentence."},
      %{id: 19, type: "comprehension", passage: "It was a cold winter day. Snow covered the ground. The children built a snowman in the yard.", question: "What did the children build?", options: ["A sandcastle", "A snowman", "A treehouse", "A fort"], answer: "A snowman", hint: "What did they make in the snow?"},
      %{id: 20, type: "comprehension", passage: "Rosa was nervous about her first day at a new school. But her teacher smiled and gave her a seat next to a friendly girl named Jada. By lunch, Rosa felt much better.", question: "Why did Rosa feel better by lunch?", options: ["She found her old friends", "She went home early", "Her teacher and Jada were friendly", "She ate her favorite food"], answer: "Her teacher and Jada were friendly", hint: "What happened to change Rosa's feelings?"}
    ]
  end

  def second_grade do
    [
      # Sentence completion — richer vocabulary in context
      %{id: 1, type: "sentence_completion", question: "The scientist made a ___ discovery that surprised everyone.", options: ["remarkable", "quietly", "beside", "oval"], answer: "remarkable", hint: "What word means very impressive or amazing?"},
      %{id: 2, type: "sentence_completion", question: "She spoke so ___ that no one at the back could hear her.", options: ["quietly", "fast", "bright", "heavy"], answer: "quietly", hint: "What does a person do with their voice when it is hard to hear them?"},
      %{id: 3, type: "sentence_completion", question: "The children were ___ about the field trip to the science museum.", options: ["enthusiastic", "below", "purple", "slow"], answer: "enthusiastic", hint: "What word means very excited and eager?"},
      %{id: 4, type: "sentence_completion", question: "After the long hike, the explorers were ___ and needed rest.", options: ["exhausted", "cheerful", "orange", "beside"], answer: "exhausted", hint: "How do you feel after doing something very tiring?"},
      # Main idea
      %{id: 5, type: "main_idea", passage: "Dogs make great pets. They can be trained to follow commands. They love to play and keep you company. Many dogs are also used to help people who are blind or have other disabilities.", question: "What is the main idea of this passage?", options: ["Dogs need a lot of training", "Dogs are useful working animals", "Dogs make great pets", "Dogs like to play outside"], answer: "Dogs make great pets", hint: "What big idea do all the sentences support?"},
      %{id: 6, type: "main_idea", passage: "Bees are very important insects. They pollinate flowers, fruits, and vegetables. Without bees, many of our foods would not grow. Scientists are working hard to protect bee populations.", question: "What is the main idea of this passage?", options: ["Bees are dangerous insects", "Bees are important and need to be protected", "Scientists study bees in labs", "Bees make honey for people"], answer: "Bees are important and need to be protected", hint: "What is the overall message all the sentences are building toward?"},
      # Inference
      %{id: 7, type: "inference", passage: "Maya came inside with wet hair and mud on her boots. She was smiling and carrying a big red umbrella.", question: "What can you infer about what Maya was doing?", options: ["She was cooking dinner", "She was playing outside in the rain", "She was watching television", "She was reading a book"], answer: "She was playing outside in the rain", hint: "Use the clues — wet hair, mud, umbrella — to figure out what Maya was doing."},
      %{id: 8, type: "inference", passage: "Carlos looked at his plate and pushed it away. He said he was not hungry. Later, Mom noticed he felt warm and had him lie down.", question: "What can you infer about Carlos?", options: ["Carlos is bored", "Carlos does not like the food", "Carlos is probably sick", "Carlos ate too much already"], answer: "Carlos is probably sick", hint: "What do not eating and feeling warm usually mean?"},
      # Author's purpose
      %{id: 9, type: "authors_purpose", passage: "Always look both ways before crossing the street. Hold an adult's hand in parking lots. Never talk to strangers.", question: "What is the author's purpose in writing this?", options: ["To entertain with a fun story", "To describe what streets look like", "To inform and give safety advice", "To explain how cars work"], answer: "To inform and give safety advice", hint: "Is the author telling a story, describing something, or giving you important information?"},
      %{id: 10, type: "authors_purpose", passage: "The silly dragon sneezed so hard that he blew his own castle down! His friends the elves laughed and laughed.", question: "What is the author's purpose?", options: ["To give safety tips about dragons", "To entertain readers with a funny story", "To explain how castles are built", "To persuade readers to like dragons"], answer: "To entertain readers with a funny story", hint: "Is this passage trying to inform you, persuade you, or make you laugh?"},
      # Vocabulary in context
      %{id: 11, type: "vocabulary", passage: "The ancient ruins had stood for thousands of years. Explorers from around the world came to study them.", question: "What does the word 'ancient' most likely mean?", options: ["Very new", "Very old", "Very large", "Very far away"], answer: "Very old", hint: "What kind of things have stood for thousands of years?"},
      # Comprehension — longer passages
      %{id: 12, type: "comprehension", passage: "The butterfly landed on the flower. Its wings were orange and black. It drank nectar from the flower before flying to find another one.", question: "What did the butterfly drink?", options: ["Water", "Juice", "Nectar", "Dew"], answer: "Nectar", hint: "What do butterflies get from flowers?"},
      %{id: 13, type: "comprehension", passage: "Scientists discovered a new type of frog in the rainforest. It was bright blue and very small. They named it the Sapphire Frog because of its color.", question: "Why was it named the Sapphire Frog?", options: ["Because it was tiny", "Because of its color", "Because it lived in trees", "Because scientists found it"], answer: "Because of its color", hint: "What does a sapphire look like?"},
      %{id: 14, type: "comprehension", passage: "The old lighthouse stood tall on the rocky cliff. For over a hundred years, its bright light guided ships safely past the dangerous rocks. When the lighthouse was finally turned off, the sailors were sad to see it go.", question: "What did the lighthouse do for sailors?", options: ["Gave them food", "Guided them safely past rocks", "Warned them about storms", "Helped them find fish"], answer: "Guided them safely past rocks", hint: "What did the bright light do for ships?"},
      %{id: 15, type: "comprehension", passage: "Every fall, millions of monarch butterflies travel from Canada all the way to Mexico. This journey is called migration. It can take up to two months. Scientists are still learning how monarchs find their way.", question: "What is migration?", options: ["When butterflies lay eggs", "When butterflies travel to a new place", "When butterflies change color", "When butterflies stop flying"], answer: "When butterflies travel to a new place", hint: "Look for the sentence that explains what migration means."},
      %{id: 16, type: "comprehension", passage: "Maria's grandmother taught her how to make tamales. They spent all Saturday cooking together. Maria loved learning her family's recipe.", question: "How did Maria learn to make tamales?", options: ["She watched a video", "She read a book", "Her grandmother taught her", "Her mom showed her"], answer: "Her grandmother taught her", hint: "Who was cooking with Maria?"}
    ]
  end
end
