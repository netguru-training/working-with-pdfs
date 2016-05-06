class WickedPdfController < ApplicationController
  def generate
    @products = products
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "report", layout: "pdf.html.haml"
      end
    end
  end

  private

  def products
    [
      Product.new(1, 'Product name', 9.99),
      Product.new(2, 'Product2 name', 19.99),
      Product.new(3, 'Product4 name', 12.23),
    ]
  end
end
