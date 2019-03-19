class Medias
    def self.mediaAritmetica vals
        ((vals.reduce(:+)).to_f / vals.length.to_f).round(4)
    end

    def self.mediaGeometrica vals
        (raizEnesima vals.reduce(:*).to_f, vals.length.to_f).round(4)
    end

    def self.mediaArmonica vals
    end

    private

    def self.raizEnesima x, n
        x.to_f ** (1 / n.to_f)
    end

end
