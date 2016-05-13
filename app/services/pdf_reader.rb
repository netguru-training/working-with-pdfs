class PdfReader
  def self.read(path)
    reader = PDF::Reader.new(path)
    OpenStruct.new(
      version: reader.pdf_version,
      producer: reader.info[:Producer],
      creation_date: reader.info[:CreationDate],
      page_count: reader.page_count
    )
  end
end
