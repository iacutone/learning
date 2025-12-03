defmodule Learning.Repo do
  use Ecto.Repo,
    otp_app: :learning,
    adapter: Ecto.Adapters.SQLite3
end
