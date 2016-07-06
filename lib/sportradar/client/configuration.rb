module Sportradar
  class << self
    attr_accessor :configuration

    def configure
      if block_given?
        yield configuration
      end

      configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end
  end

  class Configuration
    attr_reader :http
    attr_writer :base_uri

    def base_uri
      @base_uri ||= URI('https://api.sportradar.us')
    end

    def http
      Net::HTTP.new(base_uri.host, base_uri.port).tap do |http|
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      end
    end
  end
end
