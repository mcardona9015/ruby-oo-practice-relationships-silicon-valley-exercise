class Startup

    attr_reader :founder, :domain
    attr_accessor :name

    @@all = []

    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain
        @@all << self
    end

   def self.all
        @@all
   end

   def pivot(new_domain, new_name)
        self.domain = new_domain
        self.name = new_name
   end

   def self.find_by_founder(founder_name)
       self.all.find {|startup| startup.founder == founder_name}
   end

   def self.domains
       self.all.map(&:domain)
   end

   def sign_contract(venture_capitalist, investment_type, investment_amount)
       FundingRound.new(self, venture_capitalist, investment_type, investment_amount.to_f)
   end

   def num_funding_rounds
       FundingRound.all.select {|round| round.startup == self}.length
   end

   def total_funds
        total = 0.0
        FundingRound.all.each do |round|
            if round.startup == self
                total += round.investment
            end
        end
        total
   end

   def investors
       FundingRound.all.select {|round| round.startup == self}.map(&:venture_capitalist).uniq
   end

   def big_investors
       self.investors.select {|investor| VentureCapitalist.tres_commas_club.any?{|rich| rich == investor}}
   end

   private

   def domain=(new_domain)
    @domain = new_domain
   end



end
