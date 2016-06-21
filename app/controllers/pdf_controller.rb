class PdfController < ApplicationController
  def read
    path = Rails.root.join('public', 'testpdf.pdf')
    @pdf_contents = PdfReader.read(path)
  end

  def fill
    path = Rails.root.join('public', 'testformpdf.pdf')
    filled_pdf_path = FillPdf.new(path, firstname: 'Test').call
    send_file filled_pdf_path
  end
end
