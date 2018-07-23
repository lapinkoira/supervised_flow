defmodule SupervisedFlow.Flow do

  use Flow

  def start_link(_param) do
    consumer_spec = {SupervisedFlow.Consumer, []}
    specs = [{consumer_spec, []}]

    stream = File.stream!("file.txt")

    stream
    |> Flow.from_enumerable()
    |> Flow.into_specs(specs)
  end
end
