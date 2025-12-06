defmodule LearningWeb.ProfileLive do
  use LearningWeb, :live_view

  alias Learning.Games

  def mount(_params, _session, socket) do
    user = socket.assigns.current_user
    stats = Games.get_user_stats(user.id)
    results = Games.list_user_results(user.id)

    {:ok,
     assign(socket,
       stats: stats,
       results: results,
       page_title: "My Progress"
     )}
  end

  defp format_date(datetime) do
    Calendar.strftime(datetime, "%b %d, %Y")
  end

  defp format_time(seconds) when is_nil(seconds), do: "-"
  defp format_time(seconds) do
    minutes = div(seconds, 60)
    secs = rem(seconds, 60)
    if minutes > 0, do: "#{minutes}m #{secs}s", else: "#{secs}s"
  end

  defp score_percentage(score, total) when total > 0, do: round(score / total * 100)
  defp score_percentage(_, _), do: 0

  defp score_class(pct) when pct >= 90, do: "score-excellent"
  defp score_class(pct) when pct >= 70, do: "score-good"
  defp score_class(pct) when pct >= 50, do: "score-okay"
  defp score_class(_), do: "score-needs-work"

  def render(assigns) do
    ~H"""
    <div class="main-container">
      <div class="text-center" style="margin-bottom: 30px;">
        <div class="bounce-slow" style="font-size: 4rem; display: inline-block;">🐵</div>
        <h1 class="title title-red">My Progress</h1>
        <p class="subtitle">Keep up the great work!</p>
      </div>

      <!-- Stats Overview -->
      <div class="card" style="margin-bottom: 20px;">
        <h2 style="font-size: 1.5rem; font-weight: 800; color: #FF6B6B; margin-bottom: 20px; text-align: center;">
          📊 My Stats
        </h2>
        
        <div class="stats-grid" style="grid-template-columns: repeat(2, 1fr); gap: 15px;">
          <div class="stat-box" style="background: #E8F4FD; padding: 20px; border-radius: 16px;">
            <div class="stat-number stat-number-blue" style="font-size: 2.5rem;"><%= @stats.games_played %></div>
            <div class="stat-label" style="font-size: 1rem;">Games Played</div>
          </div>
          <div class="stat-box" style="background: #D5F5E3; padding: 20px; border-radius: 16px;">
            <div class="stat-number stat-number-green" style="font-size: 2.5rem;"><%= @stats.best_score || 0 %></div>
            <div class="stat-label" style="font-size: 1rem;">Best Score</div>
          </div>
          <div class="stat-box" style="background: #FFF3E0; padding: 20px; border-radius: 16px;">
            <div style="font-size: 2.5rem; font-weight: 900; color: #FF9F43;"><%= @stats.best_streak || 0 %></div>
            <div class="stat-label" style="font-size: 1rem;">🔥 Best Streak</div>
          </div>
          <div class="stat-box" style="background: #F3E5F5; padding: 20px; border-radius: 16px;">
            <div style="font-size: 2.5rem; font-weight: 900; color: #A66DD4;"><%= @stats.total_questions_answered %></div>
            <div class="stat-label" style="font-size: 1rem;">Questions Answered</div>
          </div>
        </div>

        <%= if @stats.average_score do %>
          <div style="margin-top: 20px; text-align: center; padding: 15px; background: #FFD93D; border-radius: 12px;">
            <span style="font-weight: 800; color: #E85555;">⭐ Average Score: <%= @stats.average_score %> points per game</span>
          </div>
        <% end %>
      </div>

      <!-- Game History -->
      <div class="card">
        <h2 style="font-size: 1.5rem; font-weight: 800; color: #FF6B6B; margin-bottom: 20px; text-align: center;">
          📜 Game History
        </h2>

        <%= if Enum.empty?(@results) do %>
          <div style="text-align: center; padding: 40px 20px;">
            <div style="font-size: 3rem; margin-bottom: 15px;">🎮</div>
            <p style="font-size: 1.2rem; font-weight: 700; color: #888;">No games played yet!</p>
            <p style="color: #aaa; margin-bottom: 20px;">Play your first game to see your progress here.</p>
            <a href="/game" class="btn btn-green" style="font-size: 1.2rem; padding: 14px 28px;">Play Now! 🚀</a>
          </div>
        <% else %>
          <div style="display: flex; flex-direction: column; gap: 12px;">
            <%= for result <- @results do %>
              <% pct = score_percentage(result.score, result.total_questions) %>
              <div class={"result-row #{score_class(pct)}"} style="display: flex; align-items: center; justify-content: space-between; padding: 15px; background: #f8f9fa; border-radius: 12px;">
                <div>
                  <div style="font-weight: 800; font-size: 1.1rem; color: #333;">
                    <%= result.score %>/<%= result.total_questions %> 
                    <span class={"score-text #{score_class(pct)}"}>(<%= pct %>%)</span>
                  </div>
                  <div style="font-size: 0.85rem; color: #888;">
                    <%= format_date(result.inserted_at) %> • <%= format_time(result.time_taken_seconds) %>
                  </div>
                </div>
                <div style="text-align: right;">
                  <%= if result.best_streak && result.best_streak > 0 do %>
                    <div style="font-weight: 700; color: #FF9F43;">🔥 <%= result.best_streak %></div>
                  <% end %>
                </div>
              </div>
            <% end %>
          </div>
        <% end %>
      </div>

      <!-- Action Buttons -->
      <div style="text-align: center; margin-top: 30px; display: flex; gap: 15px; justify-content: center; flex-wrap: wrap;">
        <a href="/game" class="btn btn-green">Play Again! 🎮</a>
        <a href="/users/settings" class="btn btn-purple">⚙️ Settings</a>
      </div>
    </div>
    """
  end
end
