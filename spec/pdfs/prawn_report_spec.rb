require "rails_helper"

RSpec.describe PrawnReport do

  let(:products) do
    [
      Product.new(1, 'Product name', 9.99),
      Product.new(2, 'Product2 name', 19.99),
      Product.new(3, 'Product4 name', 12.23),
    ]
  end
  subject { PrawnReport.new(products).render }

  it "has one page" do
    page_analysis = PDF::Inspector::Page.analyze(subject)
    expect(page_analysis.pages.size).to eq 1
  end
end
