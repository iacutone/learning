defmodule LearningWeb.GameLive do
  use LearningWeb, :live_view

  alias Learning.Games

  # Questions organized by grade level
  @kindergarten_questions [
    %{
      id: 1, type: :reading,
      passage: "The cat sat on the mat. The cat is fat.",
      question: "Where did the cat sit?",
      options: ["On the bed", "On the mat", "On the chair", "On the floor"],
      answer: "On the mat",
      hint: "Look at the first sentence!"
    },
    %{
      id: 2, type: :reading,
      passage: "I see a red apple. The apple is big.",
      question: "What color is the apple?",
      options: ["Blue", "Green", "Red", "Yellow"],
      answer: "Red",
      hint: "What color word do you see?"
    },
    %{
      id: 3, type: :math,
      question: "What is 2 + 1?",
      options: ["2", "3", "4", "5"],
      answer: "3",
      hint: "Hold up 2 fingers, then 1 more!"
    },
    %{
      id: 4, type: :math,
      question: "What is 3 + 2?",
      options: ["4", "5", "6", "7"],
      answer: "5",
      hint: "Count: 3... then 2 more!"
    },
    %{
      id: 5, type: :math,
      question: "How many legs does a dog have?",
      options: ["2", "3", "4", "5"],
      answer: "4",
      hint: "Think about a puppy walking!"
    },
    %{
      id: 6, type: :vocabulary,
      question: "Which animal says 'moo'?",
      options: ["Dog", "Cat", "Cow", "Bird"],
      answer: "Cow",
      hint: "This animal lives on a farm and gives us milk!"
    },
    %{
      id: 7, type: :vocabulary,
      question: "What color is the sky on a sunny day?",
      options: ["Red", "Blue", "Green", "Black"],
      answer: "Blue",
      hint: "Look up outside on a nice day!"
    },
    %{
      id: 8, type: :vocabulary,
      question: "Which one is a fruit?",
      options: ["Carrot", "Apple", "Bread", "Cheese"],
      answer: "Apple",
      hint: "It's red and grows on trees!"
    },
    %{
      id: 9, type: :math,
      question: "What comes after 5?",
      options: ["4", "5", "6", "7"],
      answer: "6",
      hint: "Count: 1, 2, 3, 4, 5, ..."
    },
    %{
      id: 10, type: :reading,
      passage: "The dog runs fast. The dog is happy.",
      question: "How does the dog feel?",
      options: ["Sad", "Happy", "Angry", "Sleepy"],
      answer: "Happy",
      hint: "Look at the second sentence!"
    }
  ]

  @first_grade_questions [
    %{
      id: 1, type: :reading,
      passage: "The little brown dog ran across the green grass. He was chasing a red ball that his owner had thrown.",
      question: "What color was the ball?",
      options: ["Blue", "Red", "Green", "Yellow"],
      answer: "Red",
      hint: "Look for the color word near 'ball'."
    },
    %{
      id: 2, type: :reading,
      passage: "Sara loves to read books. Every night before bed, she reads for thirty minutes.",
      question: "When does Sara read?",
      options: ["In the morning", "At lunch", "Before bed", "After school"],
      answer: "Before bed",
      hint: "Look for the time word in the story."
    },
    %{
      id: 3, type: :math,
      question: "What is 7 + 5?",
      options: ["10", "11", "12", "13"],
      answer: "12",
      hint: "Try counting on your fingers starting from 7."
    },
    %{
      id: 4, type: :math,
      question: "What is 9 - 4?",
      options: ["3", "4", "5", "6"],
      answer: "5",
      hint: "Start at 9 and count backwards 4 times."
    },
    %{
      id: 5, type: :math,
      question: "Which number comes next? 2, 4, 6, 8, __",
      options: ["9", "10", "11", "12"],
      answer: "10",
      hint: "Count by 2s!"
    },
    %{
      id: 6, type: :vocabulary,
      question: "What does 'big' mean?",
      options: ["Small", "Large", "Fast", "Slow"],
      answer: "Large",
      hint: "An elephant is big!"
    },
    %{
      id: 7, type: :vocabulary,
      question: "Which word is the opposite of 'hot'?",
      options: ["Warm", "Cold", "Wet", "Dry"],
      answer: "Cold",
      hint: "Ice cream is the opposite of hot soup!"
    },
    %{
      id: 8, type: :reading,
      passage: "Tom went to the store with his mom. They bought milk, bread, and eggs.",
      question: "Who did Tom go to the store with?",
      options: ["His dad", "His friend", "His mom", "His sister"],
      answer: "His mom",
      hint: "Read the first sentence carefully."
    },
    %{
      id: 9, type: :math,
      question: "Emma has 3 apples. Her mom gives her 4 more. How many apples does Emma have?",
      options: ["5", "6", "7", "8"],
      answer: "7",
      hint: "Add the apples together: 3 + 4"
    },
    %{
      id: 10, type: :vocabulary,
      question: "What do we call a baby dog?",
      options: ["Kitten", "Puppy", "Calf", "Chick"],
      answer: "Puppy",
      hint: "It rhymes with 'guppy'!"
    }
  ]

  @second_grade_questions [
    %{
      id: 1, type: :reading,
      passage: "The butterfly landed on the flower. Its wings were orange and black. It drank nectar from the flower before flying away to find another one.",
      question: "What did the butterfly drink?",
      options: ["Water", "Juice", "Nectar", "Milk"],
      answer: "Nectar",
      hint: "What do butterflies get from flowers?"
    },
    %{
      id: 2, type: :reading,
      passage: "Ben wanted to build a treehouse. He gathered wood, nails, and a hammer. His dad helped him measure and cut the boards. After two weekends of work, the treehouse was finished!",
      question: "How long did it take to build the treehouse?",
      options: ["One day", "One weekend", "Two weekends", "One month"],
      answer: "Two weekends",
      hint: "Look for the time mentioned near the end."
    },
    %{
      id: 3, type: :math,
      question: "What is 15 - 8?",
      options: ["5", "6", "7", "8"],
      answer: "7",
      hint: "Start at 15 and count backwards 8 times."
    },
    %{
      id: 4, type: :math,
      question: "What is 4 × 3?",
      options: ["7", "10", "12", "14"],
      answer: "12",
      hint: "Think of 3 groups of 4, or 4 + 4 + 4."
    },
    %{
      id: 5, type: :math,
      question: "Emma has 3 bags with 5 apples in each bag. How many apples does she have in all?",
      options: ["8", "12", "15", "18"],
      answer: "15",
      hint: "Multiply: 3 bags × 5 apples"
    },
    %{
      id: 6, type: :vocabulary,
      question: "What does 'enormous' mean?",
      options: ["Very small", "Very big", "Very fast", "Very slow"],
      answer: "Very big",
      hint: "Think of an elephant - they are enormous!"
    },
    %{
      id: 7, type: :vocabulary,
      question: "Which word is the opposite of 'happy'?",
      options: ["Glad", "Sad", "Mad", "Excited"],
      answer: "Sad",
      hint: "When you're not happy, you might feel..."
    },
    %{
      id: 8, type: :vocabulary,
      question: "What does 'sprint' mean?",
      options: ["Walk slowly", "Run very fast", "Jump high", "Sit down"],
      answer: "Run very fast",
      hint: "Runners sprint in a race!"
    },
    %{
      id: 9, type: :math,
      question: "What is 24 + 18?",
      options: ["32", "38", "42", "44"],
      answer: "42",
      hint: "Add the ones first (4+8=12), then the tens!"
    },
    %{
      id: 10, type: :reading,
      passage: "The library was quiet. Maya found a book about dinosaurs and sat in her favorite corner. She read for an hour before her mom came to pick her up.",
      question: "Where was Maya?",
      options: ["At school", "At the library", "At home", "At the park"],
      answer: "At the library",
      hint: "Where do you find lots of books?"
    }
  ]

  @answer_colors ["answer-red", "answer-blue", "answer-green", "answer-purple"]

  def mount(_params, _session, socket) do
    current_user = socket.assigns[:current_user]
    stats = if current_user, do: Games.get_user_stats(current_user.id), else: nil

    {:ok,
     assign(socket,
       grade: nil,
       game_started: false,
       questions: [],
       current_index: 0,
       score: 0,
       total_answered: 0,
       selected_answer: nil,
       show_result: false,
       game_over: false,
       show_hint: false,
       streak: 0,
       best_streak: 0,
       start_time: nil,
       result_saved: false,
       user_stats: stats
     )}
  end

  def handle_event("select_grade", %{"grade" => grade}, socket) do
    {:noreply, assign(socket, grade: grade)}
  end

  def handle_event("start_game", _params, socket) do
    questions = get_questions_for_grade(socket.assigns.grade)
    shuffled = Enum.shuffle(questions)

    {:noreply,
     assign(socket,
       game_started: true,
       questions: shuffled,
       current_index: 0,
       score: 0,
       total_answered: 0,
       selected_answer: nil,
       show_result: false,
       game_over: false,
       show_hint: false,
       streak: 0,
       best_streak: 0,
       start_time: System.monotonic_time(:second),
       result_saved: false
     )}
  end

  def handle_event("select_answer", %{"answer" => answer}, socket) do
    current_question = Enum.at(socket.assigns.questions, socket.assigns.current_index)
    is_correct = answer == current_question.answer
    new_score = if is_correct, do: socket.assigns.score + 1, else: socket.assigns.score
    new_streak = if is_correct, do: socket.assigns.streak + 1, else: 0
    best_streak = max(new_streak, socket.assigns.best_streak)

    {:noreply,
     assign(socket,
       selected_answer: answer,
       show_result: true,
       score: new_score,
       total_answered: socket.assigns.total_answered + 1,
       streak: new_streak,
       best_streak: best_streak,
       show_hint: false
     )}
  end

  def handle_event("next_question", _params, socket) do
    next_index = socket.assigns.current_index + 1
    if next_index >= length(socket.assigns.questions) do
      socket = save_game_result(socket)
      {:noreply, assign(socket, game_over: true)}
    else
      {:noreply, assign(socket, current_index: next_index, selected_answer: nil, show_result: false, show_hint: false)}
    end
  end

  def handle_event("show_hint", _params, socket), do: {:noreply, assign(socket, show_hint: true)}

  def handle_event("restart_game", _params, socket) do
    current_user = socket.assigns[:current_user]
    stats = if current_user, do: Games.get_user_stats(current_user.id), else: nil

    {:noreply,
     assign(socket,
       grade: nil,
       game_started: false,
       questions: [],
       current_index: 0,
       score: 0,
       total_answered: 0,
       selected_answer: nil,
       show_result: false,
       game_over: false,
       show_hint: false,
       streak: 0,
       best_streak: 0,
       start_time: nil,
       result_saved: false,
       user_stats: stats
     )}
  end

  def handle_event("change_grade", _params, socket) do
    {:noreply, assign(socket, grade: nil, game_started: false)}
  end

  defp get_questions_for_grade("kindergarten"), do: @kindergarten_questions
  defp get_questions_for_grade("first"), do: @first_grade_questions
  defp get_questions_for_grade("second"), do: @second_grade_questions
  defp get_questions_for_grade(_), do: @kindergarten_questions

  defp save_game_result(socket) do
    current_user = socket.assigns[:current_user]
    if current_user && !socket.assigns.result_saved do
      time_taken = System.monotonic_time(:second) - socket.assigns.start_time
      attrs = %{user_id: current_user.id, score: socket.assigns.score, total_questions: socket.assigns.total_answered,
        best_streak: socket.assigns.best_streak, time_taken_seconds: time_taken}
      case Games.create_game_result(attrs) do
        {:ok, _} -> assign(socket, result_saved: true, user_stats: Games.get_user_stats(current_user.id))
        {:error, _} -> socket
      end
    else
      socket
    end
  end

  defp current_question(assigns), do: Enum.at(assigns.questions, assigns.current_index)
  defp question_type_label(:reading), do: "📖 Reading"
  defp question_type_label(:math), do: "🔢 Math"
  defp question_type_label(:vocabulary), do: "📝 Words"
  defp badge_class(:reading), do: "badge badge-blue"
  defp badge_class(:math), do: "badge badge-orange"
  defp badge_class(:vocabulary), do: "badge badge-purple"

  defp grade_label("kindergarten"), do: "Kindergarten"
  defp grade_label("first"), do: "1st Grade"
  defp grade_label("second"), do: "2nd Grade"
  defp grade_label(_), do: ""

  defp get_encouragement(score, total) do
    pct = if total > 0, do: score / total * 100, else: 0
    cond do
      pct >= 90 -> {"🌟 SUPER STAR! 🌟", "You're amazing!"}
      pct >= 70 -> {"🎉 AWESOME JOB!", "Milo is so proud!"}
      pct >= 50 -> {"👍 GOOD TRY!", "Keep practicing!"}
      true -> {"💪 NICE EFFORT!", "You're learning!"}
    end
  end

  defp streak_message(streak) when streak >= 5, do: "🔥 #{streak} in a row! WOW!"
  defp streak_message(streak) when streak >= 3, do: "⭐ #{streak} in a row!"
  defp streak_message(_), do: nil

  defp milo_says(:correct), do: Enum.random(["YAY!", "AWESOME!", "YOU GOT IT!", "AMAZING!", "WOO HOO!"])
  defp milo_says(:incorrect), do: Enum.random(["Oops!", "Almost!", "Try again next time!", "Good try!"])

  defp answer_class(option, question, selected, show_result, idx) do
    base = Enum.at(@answer_colors, idx)
    cond do
      !show_result -> base
      option == question.answer -> "answer-correct"
      option == selected && option != question.answer -> "answer-wrong"
      true -> "answer-faded"
    end
  end

  def render(assigns) do
    ~H"""
    <div class="main-container">
      <%= if !@game_started do %>
        <!-- Grade Selection Screen -->
        <div class="text-center">
          <div class="bounce-slow" style="font-size: 5rem; display: inline-block;">🐵</div>
          <h1 class="title title-red">Pick Your Grade!</h1>
          <p class="subtitle" style="margin-bottom: 30px;">Milo will give you questions just right for you!</p>

          <div style="display: flex; flex-direction: column; gap: 15px; max-width: 350px; margin: 0 auto;">
            <button
              phx-click="select_grade"
              phx-value-grade="kindergarten"
              class={"grade-btn #{if @grade == "kindergarten", do: "grade-btn-selected", else: "grade-btn-unselected"}"}
            >
              <span style="font-size: 2rem;">🎒</span>
              <span>Kindergarten</span>
            </button>

            <button
              phx-click="select_grade"
              phx-value-grade="first"
              class={"grade-btn #{if @grade == "first", do: "grade-btn-selected", else: "grade-btn-unselected"}"}
            >
              <span style="font-size: 2rem;">📚</span>
              <span>1st Grade</span>
            </button>

            <button
              phx-click="select_grade"
              phx-value-grade="second"
              class={"grade-btn #{if @grade == "second", do: "grade-btn-selected", else: "grade-btn-unselected"}"}
            >
              <span style="font-size: 2rem;">🎓</span>
              <span>2nd Grade</span>
            </button>
          </div>

          <%= if @grade do %>
            <div style="margin-top: 30px;">
              <button phx-click="start_game" class="btn btn-green">
                LET'S GO! 🚀
              </button>
            </div>
          <% else %>
            <p style="margin-top: 30px; color: #888; font-weight: 600;">
              👆 Pick a grade to start!
            </p>
          <% end %>
        </div>

      <% else %>
        <!-- Quiz Header -->
        <div class="quiz-header">
          <div class="quiz-header-pill">
            <span style="font-size: 2rem;">🐵</span>
            <span class="quiz-header-text">Milo's Quiz!</span>
            <span class="grade-badge"><%= grade_label(@grade) %></span>
          </div>
        </div>

        <%= if @game_over do %>
          <!-- Game Over -->
          <div class="card text-center">
            <div class="bounce-slow" style="font-size: 5rem; display: inline-block;">🐵</div>
            <% {title, subtitle} = get_encouragement(@score, @total_answered) %>
            <h2 class="title title-green"><%= title %></h2>
            <p class="subtitle"><%= subtitle %></p>

            <div class="score-box">
              <div class="score-number"><%= @score %> / <%= @total_answered %></div>
              <div class="score-label">Stars Earned! ⭐</div>
            </div>

            <%= if @best_streak > 0 do %>
              <p style="font-size: 1.2rem; font-weight: 700; color: #FF9F43; margin-bottom: 20px;">
                🔥 Best streak: <%= @best_streak %> in a row!
              </p>
            <% end %>

            <%= if @current_user && @result_saved do %>
              <div class="info-box info-green">
                <strong>✓ Score saved!</strong>
                <%= if @user_stats do %>
                  <div class="stats-grid">
                    <div class="stat-box">
                      <div class="stat-number stat-number-blue"><%= @user_stats.games_played %></div>
                      <div class="stat-label">Games</div>
                    </div>
                    <div class="stat-box">
                      <div class="stat-number stat-number-green"><%= @user_stats.best_score %></div>
                      <div class="stat-label">Best Score</div>
                    </div>
                  </div>
                <% end %>
              </div>
            <% else %>
              <%= if !@current_user do %>
                <div class="info-box info-blue">
                  <strong><a href="/users/register" style="color: #FF6B6B;">Join the fun</a> to save scores! 🏆</strong>
                </div>
              <% end %>
            <% end %>

            <div style="display: flex; gap: 15px; justify-content: center; flex-wrap: wrap;">
              <button phx-click="restart_game" class="btn btn-green">PLAY AGAIN! 🎮</button>
              <button phx-click="change_grade" class="btn btn-orange" style="font-size: 1.2rem; padding: 14px 28px;">Change Grade</button>
            </div>
          </div>

        <% else %>
          <!-- Progress -->
          <div class="header-bar">
            <span class="header-pill">Question <%= @current_index + 1 %> of <%= length(@questions) %></span>
            <span class="header-score">⭐ <%= @score %></span>
          </div>

          <div class="progress-container">
            <div class="progress-bar" style={"width: #{(@current_index + 1) / length(@questions) * 100}%"}>
              🐵
            </div>
          </div>

          <!-- Streak -->
          <%= if streak_message(@streak) do %>
            <div class="text-center">
              <span class="streak-banner"><%= streak_message(@streak) %></span>
            </div>
          <% end %>

          <!-- Question Card -->
          <div class="card">
            <% question = current_question(assigns) %>

            <span class={badge_class(question.type)}><%= question_type_label(question.type) %></span>

            <%= if Map.has_key?(question, :passage) do %>
              <div class="passage-box"><%= question.passage %></div>
            <% end %>

            <div class="question-text"><%= question.question %></div>

            <!-- Answers -->
            <div>
              <%= for {option, idx} <- Enum.with_index(question.options) do %>
                <button
                  phx-click="select_answer"
                  phx-value-answer={option}
                  disabled={@show_result}
                  class={"answer-btn #{answer_class(option, question, @selected_answer, @show_result, idx)}"}
                >
                  <span><%= option %></span>
                  <%= if @show_result && option == question.answer do %>
                    <span style="font-size: 1.5rem;">✓</span>
                  <% end %>
                  <%= if @show_result && option == @selected_answer && option != question.answer do %>
                    <span style="font-size: 1.5rem;">✗</span>
                  <% end %>
                </button>
              <% end %>
            </div>

            <!-- Hint -->
            <%= if !@show_result && !@show_hint do %>
              <button phx-click="show_hint" class="hint-btn">💡 Milo's Hint</button>
            <% end %>

            <%= if @show_hint && !@show_result do %>
              <div class="hint-box">
                <span style="font-size: 1.5rem;">🐵</span> <%= question.hint %>
              </div>
            <% end %>

            <!-- Result -->
            <%= if @show_result do %>
              <div class={"result-box #{if @selected_answer == question.answer, do: "result-correct", else: "result-wrong"}"}>
                <div style="font-size: 3.5rem;">🐵</div>
                <%= if @selected_answer == question.answer do %>
                  <div class="result-text"><%= milo_says(:correct) %></div>
                <% else %>
                  <div class="result-text"><%= milo_says(:incorrect) %></div>
                  <p style="font-weight: 700; margin-top: 8px;">The answer is: <u><%= question.answer %></u></p>
                <% end %>
              </div>
            <% end %>
          </div>

          <!-- Next Button -->
          <%= if @show_result do %>
            <div class="text-center" style="margin-top: 20px;">
              <button phx-click="next_question" class="btn btn-green">
                <%= if @current_index + 1 >= length(@questions), do: "SEE MY SCORE! 🏆", else: "NEXT! →" %>
              </button>
            </div>
          <% end %>
        <% end %>
      <% end %>
    </div>
    """
  end
end
