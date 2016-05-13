class PdfController < ApplicationController
  def read
    path = Rails.root.join('public', 'testpdf.pdf')
    @pdf_contents = PdfReader.read(path)
  end
end
