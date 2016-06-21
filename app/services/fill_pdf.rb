class FillPdf
  def initialize(input_file_path, options = {})
    @file_path = input_file_path
    @options = options
  end

  def call
    pdftk.fill_form @file_path, tmp_file_path, @options
    tmp_file_path
  end

  private

  def tmp_file_path
    @tmp_file_path ||= Rails.root.join('tmp', SecureRandom.hex(4))
  end

  def pdftk
    @pdftk ||= PdfForms.new('/usr/local/bin/pdftk')
  end
end
