require "webpacker/helper"

module Saddlebag
  module ApplicationHelper
    include ::Webpacker::Helper

    def current_webpacker_instance
      Saddlebag.webpacker
    end
  end
end