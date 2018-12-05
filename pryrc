# -*- mode: ruby -*-

# Initialize pry

# Changing default colors used by CodeRay
# See: https://stackoverflow.com/questions/7798795/how-to-adjust-pry-colors

CodeRay.scan("example", :ruby).term # just to load necessary files

MY_TOKEN_COLORS = {
  :string => "\e[1;32m" # Make strings bright green
}

module CodeRay
  module Encoders
    class Terminal < Encoder
      # override old colors
      MY_TOKEN_COLORS.each_pair do |key, value|
        TOKEN_COLORS[key] = value
      end
    end
  end
end
