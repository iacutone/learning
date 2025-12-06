defmodule LearningWeb.GameLive do
  use LearningWeb, :live_view

  alias Learning.Games
  alias Learning.Questions.{Math, Reading, Words}

  @answer_colors ["answer-red", "answer-blue", "answer-green", "answer-purple"]

  def mount(_params, _session, socket) do
    current_user = socket.assigns[:current_user]
    stats = if current_user, do: Games.get_user_stats(current_user.id), else: nil

    {:ok,
     assign(socket,
       grade: nil,
       subject: nil,
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

  def handle_event("select_subject", %{"subject" => subject}, socket) do
    {:noreply, assign(socket, subject: subject)}
  end

  def handle_event("start_game", _params, socket) do
    questions = get_questions(socket.assigns.grade, socket.assigns.subject)
    shuffled = Enum.shuffle(questions) |> Enum.take(10)

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
    {:noreply, assign(socket, grade: nil, subject: nil, game_started: false, questions: [], current_index: 0, score: 0, total_answered: 0, selected_answer: nil, show_result: false, game_over: false, show_hint: false, streak: 0, best_streak: 0, start_time: nil, result_saved: false, user_stats: stats)}
  end

  def handle_event("change_grade", _params, socket), do: {:noreply, assign(socket, grade: nil, subject: nil, game_started: false)}
  def handle_event("change_subject", _params, socket), do: {:noreply, assign(socket, subject: nil, game_started: false)}

  defp get_questions(grade, "math"), do: get_math_questions(grade)
  defp get_questions(grade, "reading"), do: get_reading_questions(grade)
  defp get_questions(grade, "words"), do: get_words_questions(grade)
  defp get_questions(grade, _), do: get_math_questions(grade)

  defp get_math_questions("kindergarten"), do: Math.kindergarten()
  defp get_math_questions("first"), do: Math.first_grade()
  defp get_math_questions("second"), do: Math.second_grade()
  defp get_math_questions(_), do: Math.kindergarten()

  defp get_reading_questions("kindergarten"), do: Reading.kindergarten()
  defp get_reading_questions("first"), do: Reading.first_grade()
  defp get_reading_questions("second"), do: Reading.second_grade()
  defp get_reading_questions(_), do: Reading.kindergarten()

  defp get_words_questions("kindergarten"), do: Words.kindergarten()
  defp get_words_questions("first"), do: Words.first_grade()
  defp get_words_questions("second"), do: Words.second_grade()
  defp get_words_questions(_), do: Words.kindergarten()


  defp save_game_result(socket) do
    current_user = socket.assigns[:current_user]
    if current_user && !socket.assigns.result_saved do
      time_taken = System.monotonic_time(:second) - socket.assigns.start_time
      attrs = %{user_id: current_user.id, score: socket.assigns.score, total_questions: socket.assigns.total_answered, best_streak: socket.assigns.best_streak, time_taken_seconds: time_taken}
      case Games.create_game_result(attrs) do
        {:ok, _} -> assign(socket, result_saved: true, user_stats: Games.get_user_stats(current_user.id))
        {:error, _} -> socket
      end
    else
      socket
    end
  end

  defp current_question(assigns), do: Enum.at(assigns.questions, assigns.current_index)
  defp subject_label("math"), do: "🔢 Math"
  defp subject_label("reading"), do: "📖 Reading"
  defp subject_label("words"), do: "📝 Words"
  defp subject_label(_), do: ""
  defp subject_badge_class("math"), do: "badge badge-orange"
  defp subject_badge_class("reading"), do: "badge badge-blue"
  defp subject_badge_class("words"), do: "badge badge-purple"
  defp subject_badge_class(_), do: "badge"
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
        <%= if @grade == nil do %>
          <div class="text-center">
            <div class="bounce-slow" style="font-size: 5rem; display: inline-block;">🐵</div>
            <h1 class="title title-red">Pick Your Grade!</h1>
            <p class="subtitle" style="margin-bottom: 30px;">Milo will give you questions just right for you!</p>
            <div style="display: flex; flex-direction: column; gap: 15px; max-width: 350px; margin: 0 auto;">
              <button phx-click="select_grade" phx-value-grade="kindergarten" class="grade-btn grade-btn-unselected"><span style="font-size: 2rem;">🎒</span><span>Kindergarten</span></button>
              <button phx-click="select_grade" phx-value-grade="first" class="grade-btn grade-btn-unselected"><span style="font-size: 2rem;">📚</span><span>1st Grade</span></button>
              <button phx-click="select_grade" phx-value-grade="second" class="grade-btn grade-btn-unselected"><span style="font-size: 2rem;">🎓</span><span>2nd Grade</span></button>
            </div>
          </div>
        <% else %>
          <div class="text-center">
            <div class="bounce-slow" style="font-size: 5rem; display: inline-block;">🐵</div>
            <h1 class="title title-red">Pick a Subject!</h1>
            <p class="subtitle" style="margin-bottom: 10px;"><span class="grade-badge"><%= grade_label(@grade) %></span></p>
            <p class="subtitle" style="margin-bottom: 30px;">What do you want to practice?</p>
            <div style="display: flex; flex-direction: column; gap: 15px; max-width: 350px; margin: 0 auto;">
              <button phx-click="select_subject" phx-value-subject="math" class={"grade-btn #{if @subject == "math", do: "grade-btn-selected", else: "grade-btn-unselected"}"}><span style="font-size: 2rem;">🔢</span><span>Math</span></button>
              <button phx-click="select_subject" phx-value-subject="reading" class={"grade-btn #{if @subject == "reading", do: "grade-btn-selected", else: "grade-btn-unselected"}"}><span style="font-size: 2rem;">📖</span><span>Reading</span></button>
              <button phx-click="select_subject" phx-value-subject="words" class={"grade-btn #{if @subject == "words", do: "grade-btn-selected", else: "grade-btn-unselected"}"}><span style="font-size: 2rem;">📝</span><span>Words</span></button>
            </div>
            <%= if @subject do %>
              <div style="margin-top: 30px;"><button phx-click="start_game" class="btn btn-green">LET'S GO! 🚀</button></div>
            <% else %>
              <p style="margin-top: 30px; color: #888; font-weight: 600;">👆 Pick a subject to start!</p>
            <% end %>
            <div style="margin-top: 20px;"><button phx-click="change_grade" style="background: none; border: none; color: #888; font-weight: 600; cursor: pointer; text-decoration: underline;">← Change Grade</button></div>
          </div>
        <% end %>
      <% else %>
        <div class="quiz-header"><div class="quiz-header-pill"><span style="font-size: 2rem;">🐵</span><span class="quiz-header-text"><%= subject_label(@subject) %></span><span class="grade-badge"><%= grade_label(@grade) %></span></div></div>
        <%= if @game_over do %>
          <div class="card text-center">
            <div class="bounce-slow" style="font-size: 5rem; display: inline-block;">🐵</div>
            <% {title, subtitle} = get_encouragement(@score, @total_answered) %>
            <h2 class="title title-green"><%= title %></h2>
            <p class="subtitle"><%= subtitle %></p>
            <div class="score-box"><div class="score-number"><%= @score %> / <%= @total_answered %></div><div class="score-label">Stars Earned! ⭐</div></div>
            <%= if @best_streak > 0 do %><p style="font-size: 1.2rem; font-weight: 700; color: #FF9F43; margin-bottom: 20px;">🔥 Best streak: <%= @best_streak %> in a row!</p><% end %>
            <%= if @current_user && @result_saved do %>
              <div class="info-box info-green"><strong>✓ Score saved!</strong><%= if @user_stats do %><div class="stats-grid"><div class="stat-box"><div class="stat-number stat-number-blue"><%= @user_stats.games_played %></div><div class="stat-label">Games</div></div><div class="stat-box"><div class="stat-number stat-number-green"><%= @user_stats.best_score %></div><div class="stat-label">Best Score</div></div></div><% end %></div>
            <% else %><%= if !@current_user do %><div class="info-box info-blue"><strong><a href="/users/register" style="color: #FF6B6B;">Join the fun</a> to save scores! 🏆</strong></div><% end %><% end %>
            <div style="display: flex; gap: 15px; justify-content: center; flex-wrap: wrap;"><button phx-click="restart_game" class="btn btn-green">PLAY AGAIN! 🎮</button><button phx-click="change_subject" class="btn btn-orange" style="font-size: 1.2rem; padding: 14px 28px;">Change Subject</button></div>
          </div>
        <% else %>
          <div class="header-bar"><span class="header-pill">Question <%= @current_index + 1 %> of <%= length(@questions) %></span><span class="header-score">⭐ <%= @score %></span></div>
          <div class="progress-container"><div class="progress-bar" style={"width: #{(@current_index + 1) / length(@questions) * 100}%"}>🐵</div></div>
          <%= if streak_message(@streak) do %><div class="text-center"><span class="streak-banner"><%= streak_message(@streak) %></span></div><% end %>
          <div class="card">
            <% question = current_question(assigns) %>
            <span class={subject_badge_class(@subject)}><%= subject_label(@subject) %></span>
            <%= if Map.has_key?(question, :passage) do %><div class="passage-box"><%= question.passage %></div><% end %>
            <div class="question-text"><%= question.question %></div>
            <div><%= for {option, idx} <- Enum.with_index(question.options) do %><button phx-click="select_answer" phx-value-answer={option} disabled={@show_result} class={"answer-btn #{answer_class(option, question, @selected_answer, @show_result, idx)}"}><span><%= option %></span><%= if @show_result && option == question.answer do %><span style="font-size: 1.5rem;">✓</span><% end %><%= if @show_result && option == @selected_answer && option != question.answer do %><span style="font-size: 1.5rem;">✗</span><% end %></button><% end %></div>
            <%= if !@show_result && !@show_hint do %><button phx-click="show_hint" class="hint-btn">💡 Milo's Hint</button><% end %>
            <%= if @show_hint && !@show_result do %><div class="hint-box"><span style="font-size: 1.5rem;">🐵</span> <%= question.hint %></div><% end %>
            <%= if @show_result do %><div class={"result-box #{if @selected_answer == question.answer, do: "result-correct", else: "result-wrong"}"}><div style="font-size: 3.5rem;">🐵</div><%= if @selected_answer == question.answer do %><div class="result-text"><%= milo_says(:correct) %></div><% else %><div class="result-text"><%= milo_says(:incorrect) %></div><p style="font-weight: 700; margin-top: 8px;">The answer is: <u><%= question.answer %></u></p><% end %></div><% end %>
          </div>
          <%= if @show_result do %><div class="text-center" style="margin-top: 20px;"><button phx-click="next_question" class="btn btn-green"><%= if @current_index + 1 >= length(@questions), do: "SEE MY SCORE! 🏆", else: "NEXT! →" %></button></div><% end %>
        <% end %>
      <% end %>
    </div>
    """
  end
end
