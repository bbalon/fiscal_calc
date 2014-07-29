require 'test_helper'

class FiscalCalcTest < ActiveSupport::TestCase
  test "Fiscal end" do
    assert_equal Date.new(2014,6,27), Date.new(2014,1,1).fiscal_end
    assert_equal Date.new(2014,6,27), Date.new(2014,6,27).fiscal_end
  end

  test "Weeks in fiscal year" do
    assert_equal 52, Date.new(2014,1,1).weeks_in_fiscal_year
    assert_equal 52, Date.new(2014,6,27).weeks_in_fiscal_year
    assert_equal 52, Date.new(2013,6,29).weeks_in_fiscal_year
    assert_equal 53, Date.new(2014,7,1).weeks_in_fiscal_year
  end

  test "Fiscal month" do
    assert_equal 1, Date.new(2014,7,1).fiscal_month
    assert_equal 2, Date.new(2014,8,1).fiscal_month
  end

  test "Fiscal month end" do
    assert_equal Date.new(2014,7,25), Date.new(2014,7,1).fiscal_month_end
    assert_equal Date.new(2014,7,25), Date.new(2014,6,28).fiscal_month_end
    assert_equal Date.new(2014,6,27), Date.new(2014,6,27).fiscal_month_end
    assert_equal Date.new(2014,6,27), Date.new(2014,6,26).fiscal_month_end
  end

end
