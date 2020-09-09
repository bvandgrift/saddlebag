require "saddlebag/engine"

module Saddlebag
  class << self
    def webpacker
      @webpacker ||= ::Webpacker::Instance.new(
        root_path: Saddlebag::Engine.root,
        config_path: Saddlebag::Engine.root.join('config', 'webpacker.yml')
      )
    end
  end
end
