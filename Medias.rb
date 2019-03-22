class Medias
    def self.mediaAritmetica vals
      if vals == nil
        return 0
      end
      ((vals.reduce(:+)).to_f / vals.length.to_f).round(4)
    end

    def self.mediaGeometrica vals
      if vals == nil
        return 0
      end
      (raizEnesima vals.reduce(:*).to_f, vals.length.to_f).round(4)
    end

    def self.mediaArmonica vals
      raise NotImplementedError, "Método no implementado"
    end

    private

    def self.raizEnesima x, n
      x.to_f ** (1 / n.to_f)
    end

end
