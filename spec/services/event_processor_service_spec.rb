require 'spec_helper'
require 'rails_helper'

RSpec.describe 'EventProcessorService' do
  context "when a valid payload is received" do
    let!(:payload) {
            {
                action: "opened",
                issue: {
                  url: "https://api.github.com/repos/baxterthehacker/public-repo/issues/2",
                  label_url: "https://api.github.com/repos/baxterthehacker/public-repo/issues/2/labels{/name}",
                  comments_url: "https://api.github.com/repos/baxterthehacker/public-repo/issues/2/comments",
                  events_url: "https://api.github.com/repos/baxterthehacker/public-repo/issues/2/events",
                  html_url: "https://github.com/baxterthehacker/public-repo/issues/2",
                  id: 73464126,
                  number: 2,
                  }
            }
    }
    it 'persists event' do
      expect { EventProcessorService.new(payload).call }.
          to change { Event.count }.by 1
    end
  end

  context "when a valid payload is received" do
    let!(:invalid_payload) {
      {
          action2: "opened",
          issue2: {
              url: "https://api.github.com/repos/baxterthehacker/public-repo/issues/2",
              label_url: "https://api.github.com/repos/baxterthehacker/public-repo/issues/2/labels{/name}",
              comments_url: "https://api.github.com/repos/baxterthehacker/public-repo/issues/2/comments",
              events_url: "https://api.github.com/repos/baxterthehacker/public-repo/issues/2/events",
              html_url: "https://github.com/baxterthehacker/public-repo/issues/2",
              id: 73464126,
              number: 2,
          }
      }
    }
    it 'raises Exception' do
      expect { EventProcessorService.new(invalid_payload).call }.
            to raise_exception(EventProcessorService::InvalidPayloadError)
    end
  end
end