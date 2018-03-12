module GeminaboxSync
  class Middleware
    IGNORE_GET_PATHS = [
      '/favicon.ico',
      '/jquery.js',
      '/master.css',
      '/master.js',
      '/upload',
    ]

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
      return false unless method_is?('get', env)
      return false if IGNORE_GET_PATHS.include?(env['PATH_INFO'].downcase)
      true
    end

    def uploading?(env)
      return false unless method_is?('post', env) || method_is?('delete', env)
      true
    end

    def method_is?(method, env)
      env['REQUEST_METHOD'].downcase.eql?(method.downcase) ? true : false
    end
  end
end
