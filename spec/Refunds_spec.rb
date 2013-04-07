require 'hay'

describe Hay::Refunds do
  it "create refund" do
    Hay::Refunds.create('0E7LU4yW34Hj8amyLsxUzQ', 'ch_VaF08F5DVvvoPImxh9cq9g')
  end

  it "show charge" do
    Hay::Refunds.list('0E7LU4yW34Hj8amyLsxUzQ', 'ch_VaF08F5DVvvoPImxh9cq9g')
  end
end