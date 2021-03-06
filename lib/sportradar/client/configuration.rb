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
    attr_writer :access_level
    attr_writer :api_keys
    attr_writer :base_uri
    attr_writer :filepath

    def api_keys
      {
        'mlb' => ENV['SPORTRADAR_API_KEY_MLB'],
        'nba' => ENV['SPORTRADAR_API_KEY_NBA'],
        'nfl' => ENV['SPORTRADAR_API_KEY_NFL'],
        'nhl' => ENV['SPORTRADAR_API_KEY_NHL'],
      }
    end

    def access_levels
      {
        'mlb' => ENV['SPORTRADAR_ACCESS_LEVEL_MLB'] || 'p',
        'nba' => ENV['SPORTRADAR_ACCESS_LEVEL_NBA'] || 'p',
        'nfl' => ENV['SPORTRADAR_ACCESS_LEVEL_NFL'] || 'p',
        'nhl' => ENV['SPORTRADAR_ACCESS_LEVEL_NHL'] || 'o',
      }
    end

    def api_version
      {
        'mlb' => ENV['SPORTRADAR_API_VERSION_MLB'] || '5',
        'nba' => ENV['SPORTRADAR_API_VERSION_NBA'] || '3',
        'nfl' => ENV['SPORTRADAR_API_VERSION_NFL'] || '1',
        'nhl' => ENV['SPORTRADAR_API_VERSION_NHL'] || '4',
      }
    end

    def base_uri
      @base_uri ||= URI('https://api.sportradar.us')
    end

    def http
      Net::HTTP.new(base_uri.host, base_uri.port).tap do |http|
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      end
    end

    def filepath
      @filepath ||= ENV['SPORTRADAR_FILE_PATH']
    end
  end
end
