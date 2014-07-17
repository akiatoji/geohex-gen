require "geohex/gen/version"
require 'optparse'
require 'geo_hex'


module Geohex
  module Gen
    class Process
      def self.process
        opt = OptionParser.new
        opts={}
        opt.on('-g GH') {|v| opts[:g]=v}
        opt.on('-r [RING]', Integer) {|v| opts[:r]=v}

        opt.parse!(ARGV)
        gh = opts[:g]
        ring = opts[:r] ? opts[:r] : 1

        puts GeoHex.decode(gh).neighbours(ring)
      end
    end
  end
end
