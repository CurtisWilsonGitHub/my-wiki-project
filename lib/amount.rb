module Amount
    def self.default
        #amount of membership in pennies
        1000
    end

    def self.dollars
      self.default / 100
    end
end
