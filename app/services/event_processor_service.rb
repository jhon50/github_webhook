class EventProcessorService
  class InvalidPayloadError < StandardError; end
  def initialize(payload)
    raise InvalidPayloadError unless valid_payload?(payload)
    @payload = payload
  end

  def call
    persist_event
  end

  def persist_event
    Event.create(
      issue_id: @payload.dig(:issue).dig(:number),
      action: @payload.dig(:action),
      json_body: @payload
    )
  end

  private

  def valid_payload?(payload)
    default_payload_keys.all? {|s| payload.key? s} && payload.present?
  end

  def default_payload_keys
    [
      :action,
      :issue
    ]
  end
end