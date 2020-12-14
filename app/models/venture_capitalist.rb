class VentureCapitalist

    attr_accessor :name, :total_worth

    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        VentureCapitalist.all.select {|capitalist| capitalist.total_worth  > 1000000000}
    end

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def portfolio
        self.funding_rounds.map(&:startup).uniq
    end

    def biggest_investment
        max_investment = 0.0
        return_round = nil
        self.funding_rounds.each do |round|
            if round.investment > max_investment
                max_investment = round.investment
                return_round = round
            end
        end
        return_round
    end

    def invested(domain)
        total_invested = 0.0
        FundingRound.all.select {|round| round.startup.domain == domain}.each do |round|
            if round.venture_capitalist == self
                total_invested += round.investment
            end
        end
        total_invested
    end

end
