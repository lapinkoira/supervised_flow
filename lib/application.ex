defmodule SupervisedFlow.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      %{
        id: SupervisedFlow.Flow,
        start: {SupervisedFlow.Flow, :start_link, [[]]}
      }
    ]
    opts = [strategy: :one_for_one, name: SupervisedFlow.Supervisor]
    Supervisor.start_link(children, opts)
  end

end
