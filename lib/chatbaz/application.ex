defmodule Chatbaz.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Chatbaz.Repo,
      # Start the Telemetry supervisor
      ChatbazWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Chatbaz.PubSub},
      # Start the Endpoint (http/https)
      ChatbazWeb.Endpoint,
      ChatbazWeb.Presence,
      # Start a worker by calling: Chatbaz.Worker.start_link(arg)
      # {Chatbaz.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Chatbaz.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ChatbazWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
