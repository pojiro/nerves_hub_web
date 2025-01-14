defmodule NervesHubWebCore.Workers.DeleteFirmware do
  use Oban.Worker,
    max_attempts: 5,
    queue: :delete_firmware

  @uploader Application.fetch_env!(:nerves_hub_web_core, :firmware_upload)

  @impl true
  def perform(%Oban.Job{args: args}), do: @uploader.delete_file(args)
end
