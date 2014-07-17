require "geohex/gen/version"
require 'optparse'
require 'geo_hex'


module Geohex
  module Gen
    class Process

      def self.gh_to_ll gh
        zone = GeoHex.decode(gh)
        [zone.lat, zone.lon]
      end

      def self.convert_gh gh, level
        lat, lon = self.gh_to_ll gh
        GeoHex.encode(lat, lon, level)
      end

      def self.process
        opt = OptionParser.new
        opts={}
        opt.on('-a LAT', Float, "Latitude. If used, must have longitude also") { |v| opts[:a]=v }
        opt.on('-o LON', Float, "Longitude. If used, must have latitude also") { |v| opts[:o]=v }
        opt.on('-g GH', String, "Specify center geohex directly") { |v| opts[:g]=v }
        opt.on('-r [RING]', Integer, "Number of rings around center") { |v| opts[:r]=v }

        opt.parse!(ARGV)
        centergh = opts[:g]
        ring     = opts[:r] ? opts[:r] : nil

        if !centergh
          lat = opts[:a]
          lon = opts[:o]
          centergh = GeoHex.encode(lat, lon, 10).code if lat and lon
        end


        if centergh
          gh_lat, gh_lon = self.gh_to_ll centergh
          puts ""
          puts "Center GH is #{centergh}, located at #{gh_lat}, #{gh_lon}"
          puts ""
          puts "This location is included in"
          puts ""
          puts "GH4: #{self.convert_gh centergh, 4}"
          puts "GH5: #{self.convert_gh centergh, 5}"
          puts "GH6: #{self.convert_gh centergh, 6}"

          if ring
            puts ""
            puts "Center #{centergh}, Ring(s) #{ring}:"
            puts GeoHex.decode(centergh).neighbours(ring)
            puts ""
          end
        end
      end
    end
  end
end
