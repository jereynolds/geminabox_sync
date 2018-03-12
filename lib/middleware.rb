module GeminaboxSync
  class Middleware
    def initialize(app)
      @app = app
      @store = Geminabox.store
    end

    def call(env)
      if fetching?(env) || uploading?(env)
        @store.sync_from_remote
      end

      response = @app.call(env)

      if uploading?(env)
        @store.sync_to_remote
      end

      response
    end

    private

    def fetching?(env)
    end

    def uploading?(env)
    end
  end
end
