class EventsController < ActionController::Base
  include GithubWebhook::Processor

  def index
    @events = Event.where(issue_id: params[:issue_id])
    render 'index.json'
  end

  def create
    EventProcessorService.new(params).call
  end

  private

  def webhook_secret(payload)
    ENV['GITHUB_WEBHOOK_SECRET']
  end
end