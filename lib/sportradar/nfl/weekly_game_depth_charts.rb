module Sportradar
  module Nfl
    class WeeklyGameDepthCharts < Sportradar::Nfl::WeeklySchedule
      def self.perform(year: nil, interval_type: nil, week: 1)
        new(year: year, interval_type: interval_type, week: week).perform
      end

      def perform
        games.each do |game|
          GameDepthChart.new(week: week,
                             year: year,
                             away_team_abbreviation: game['away'],
                             home_team_abbreviation: game['home']).save
        end

        nil
      end
    end
  end
end
