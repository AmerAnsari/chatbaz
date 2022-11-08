defmodule Chatbaz.Repo do
  use Ecto.Repo,
    otp_app: :chatbaz,
    adapter: Ecto.Adapters.Postgres
end
