#!/usr/bin/env ruby

require 'minitest/autorun'

class ExpenseReportTest < Minitest::Test
  def test_brute_force_returns_correct_value
    test_input = [1721, 979, 366, 299, 675, 1456]
    assert value_finder(test_input) == 514579
  end

  def test_permutation_returns_correct_value_for_two
    test_input = [1721, 979, 366, 299, 675, 1456]
    assert find_2020_sum_value(test_input, 2) == 514579
  end

  def test_permutation_returns_correct_value_for_three
    test_input = [1721, 979, 366, 299, 675, 1456]
    assert find_2020_sum_value(test_input, 3) == 241861950
  end
end

def value_finder(expense_report_input)
  twenty_twenty_together = []
  expense_report_input.each do |x|
    expense_report_input.each do |y|
      if x + y == 2020
        twenty_twenty_together << x
        twenty_twenty_together << y
      end
    end
    if twenty_twenty_together.length > 0
      break
    end
  end
  puts twenty_twenty_together.inject(:*)
  return twenty_twenty_together.inject(:*)
end

def find_2020_sum_value(expense_report_input, number_count)
  # .permutation returns all possible permutations of an arry of the size "number_count"
  # the block passed in then finds the permutation that sums to the value of "2020"
  # when that block breaks it will return the permuation array which has ".inject(:*)" called on it
  # the result of inject returns the product of the array permuation that sums to 2020
  sum = expense_report_input.permutation(number_count) { |perm| break perm if perm.sum == 2020 }.inject(:*)
  puts sum
  sum
end

expense_report_input = [
  1597,
  1857,
  1703,
  1956,
  1809,
  1683,
  1629,
  230,
  1699,
  1875,
  1564,
  1700,
  1911,
  1776,
  1955,
  1585,
  1858,
  1725,
  1813,
  1568,
  1962,
  1535,
  487,
  1621,
  1620,
  1573,
  1918,
  1794,
  2003,
  1957,
  1840,
  1936,
  285,
  1630,
  1753,
  1649,
  1951,
  1968,
  1916,
  1694,
  1593,
  1980,
  1806,
  1779,
  1637,
  1674,
  1842,
  1659,
  1553,
  1846,
  1677,
  1944,
  1811,
  1645,
  1784,
  1791,
  1988,
  1864,
  1596,
  1773,
  1132,
  1715,
  1938,
  1901,
  1617,
  1892,
  1708,
  1788,
  1765,
  1684,
  1595,
  1971,
  1798,
  1543,
  507,
  1772,
  1757,
  1950,
  1844,
  1898,
  1671,
  1602,
  1599,
  1524,
  2005,
  1855,
  1624,
  1884,
  1990,
  1604,
  1873,
  1736,
  1747,
  1900,
  1534,
  1713,
  1690,
  1525,
  1838,
  587,
  74,
  1979,
  1635,
  1896,
  1580,
  1727,
  1994,
  1940,
  1819,
  1758,
  1852,
  1639,
  1754,
  1559,
  1919,
  1879,
  1874,
  1921,
  1575,
  1693,
  1710,
  1949,
  1719,
  1933,
  1673,
  1909,
  1989,
  1897,
  909,
  1889,
  1641,
  1658,
  1530,
  1541,
  1952,
  1627,
  1839,
  1803,
  833,
  1527,
  1756,
  2009,
  1605,
  1548,
  1660,
  1966,
  1770,
  1552,
  1939,
  1726,
  382,
  1665,
  1960,
  1733,
  1983,
  1544,
  1974,
  1985,
  1625,
  609,
  1931,
  1749,
  1975,
  1562,
  1563,
  1922,
  2008,
  2010,
  1704,
  1545,
  1636,
  1762,
  1841,
  1717,
  622,
  2007,
  1670,
  1771,
  1910,
  1978,
  1615,
  1805,
  1999,
  1643,
  1748,
  1531,
  1539,
  1787,
  1722,
  1111,
  1774,
  1540,
  1607,
  1902,
  1991,
  1763,
  1691,
  1812,
  1783,
  1579
]

value_finder(expense_report_input)
find_2020_sum_value(expense_report_input, 2)
find_2020_sum_value(expense_report_input, 3)