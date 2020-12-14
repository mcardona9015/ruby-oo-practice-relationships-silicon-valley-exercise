require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

allbirds = Startup.new("Allbirds", "Tim Brown", "allbirds.com")
chime = Startup.new("Chime", "Chris Britt", "chime.com")
venture_capitalist1 = VentureCapitalist.new("John", 2000000000.00)
venture_capitalist2 = VentureCapitalist.new("Steve", 10000000.00)
funding_round1 = FundingRound.new(allbirds, venture_capitalist1, "test", 1000000.00)
funding_round2 = FundingRound.new(allbirds, venture_capitalist2, "test", 500000.00)
funding_round3 = FundingRound.new(chime, venture_capitalist1, "test", 250000.00)
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

binding.pry
0 #leave this here to ensure binding.pry isn't the last line