require 'active_support/core_ext/string'
require 'active_support/inflector'

require 'addressable/uri'
require 'addressable/template'

require 'dotenv'
require 'net/https'
require 'oj'

require 'sportradar/version'

require 'sportradar/client/api_request'
require 'sportradar/client/daily_api_request'
require 'sportradar/client/client'
require 'sportradar/client/configuration'

require 'sportradar/mlb/daily_boxscore'
require 'sportradar/mlb/daily_schedule'
require 'sportradar/mlb/daily_game_summary'
require 'sportradar/mlb/daily_summary'
require 'sportradar/mlb/game_summary'
require 'sportradar/mlb/play_by_play'
require 'sportradar/mlb/daily_play_by_play'

require 'sportradar/mlb/league_schedule'

require 'sportradar/mlb/team_rosters'
require 'sportradar/mlb/venues'

Dotenv.load
