Date.class_eval do
  def fiscal_end
    year = Date.new(self.year, 6, 30) < self ? self.year+1 : self.year
    d = Date.new(year, 6, 30)
    Date.commercial(d.year, (d.cwday == 1 ? -1 : 0)+d.cweek, 5)
  end

  def fiscal_month_end
    array_short = [4,4,5,4,4,5,4,4,5,4,4,5]
    array_long = [4,4,5,4,4,5,4,5,5,4,4,5]
    month = fiscal_month - 1
    patern = weeks_in_fiscal_year == 52 ? array_short[0..month] : array_long[0..month]
    w = patern.inject(:+)
    date = (self - 1.year).fiscal_end + w.weeks
    if self > date
      m = (month + 1).modulo(12)
      date = date + (weeks_in_fiscal_year == 52 ? array_short[m] : array_long[m]).weeks
    end
    date
  end

  def weeks_in_fiscal_year
    ((self.fiscal_end - (self - 1.year).fiscal_end) / 7).to_i
  end

  def fiscal_month
    (self.month + 5).modulo(12) + 1
  end

end
