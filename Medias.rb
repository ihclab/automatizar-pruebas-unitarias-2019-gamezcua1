class Medias
    def self.mediaAritmetica vals
        (vals.reduce(:+)) / vals.length.to_f
    end
    
    def self.mediaGeometrica vals
        sum = 1.0
        vals.each { |val| sum*=val.to_f }
        sum**(1 / vals.length.to_f)
    end
    
    def self.mediaArmonica vals
        sum = 0
        vals.each { |val| sum += 1/val.to_f }
        vals.length / sum
    end
    
    private

    def self.raizEnesima x, n

    end
    
end