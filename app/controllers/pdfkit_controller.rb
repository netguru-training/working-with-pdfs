class PdfkitController < ApplicationController
  def generate_manual
    kit = PDFKit.new('<b>Manual PDF</b>', page_size: 'Letter')

    respond_to do |format|
      format.html
      format.pdf do
        pdf = PrawnReport.new(products)
        send_data kit.to_pdf, filename: 'report.pdf', type: 'application/pdf'
      end
    end
  end
end
