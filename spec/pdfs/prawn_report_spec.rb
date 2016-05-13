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
  let(:text_analysis) { PDF::Inspector::Text.analyze(subject) }

  it "has one page" do
    page_analysis = PDF::Inspector::Page.analyze(subject)
    expect(page_analysis.pages.size).to eq 1
  end

  it "includes product names" do
    expect(text_analysis.strings).to include 'Product name', 'Product2 name', 'Product4 name'
  end

  it "includes product prices" do
    expect(text_analysis.strings).to include '9.99', '19.99', '12.23'
  end

  it "includes headers" do
    expect(text_analysis.strings).to include 'Lorem ipsum', 'Duis vel'
  end
end
