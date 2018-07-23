defmodule SupervisedFlow.Consumer do
  use GenStage

  def start_link(_param) do
    IO.puts "starting link consumer"
    GenStage.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(:ok) do
    IO.puts "starting worker consumer"
    {:consumer, :the_state_does_not_matter}
  end

  def handle_events(events, _from, state) do
    Process.sleep(5000)
    Enum.each(events, fn(event) ->
      IO.inspect event
    end)

    # We are a consumer, so we would never emit items.
    {:noreply, [], state}
  end

  def terminate(reason, stats) do
    IO.puts "consumer terminated because of #{inspect reason}"
      inspect stats
    :ok
  end

end

