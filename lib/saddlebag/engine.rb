module Saddlebag
  class Engine < ::Rails::Engine
    isolate_namespace Saddlebag

    initializer "webpacker.proxy" do |app|
      insert_middleware = begin
        Saddlebag.webpacker.config.dev_server.present?
      rescue
        nil
      end
      next unless insert_middleware

      app.middleware.insert_before(
        0, Webpacker::DevServerProxy, # "Webpacker::DevServerProxy" if Rails version < 5
        ssl_verify_none: true,
        webpacker: Saddlebag.webpacker
      )

      # use packs from saddlebag via Rack static
      # file service?
      config.app_middleware.use(
        Rack::Static,
        # note! this varies from the webpacker/engine documentation
        urls: ["/saddlebag-packs"], root: Saddlebag::Engine.root.join("public")
      )
    end
  end
end
