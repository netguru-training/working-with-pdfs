require "rails_helper"

RSpec.describe WickedPdfController, type: :controller do
  render_views

  describe "GET #generate_to_file" do
    before(:each) do
      get :generate_to_file
    end

    it "responds successfully with an HTTP 200 status code" do
      expect(response).to redirect_to root_path
    end

    context "renders pdf" do
      let(:pdf) { PDF::Reader.new(Rails.root.join('tmp', "wicked_report.pdf")) }

      it "has one page" do
        expect(pdf.pages.size).to eq(1)
      end

      it "includes product names" do
        expect(pdf.page(1).text).to include 'Product name', 'Product2 name', 'Product4 name'
      end

      it "includes product prices" do
        expect(pdf.page(1).text).to include '9.99', '19.99', '12.23'
      end

      it "includes headers" do
        expect(pdf.page(1).text).to include 'Lorem ipsum', 'Duis vel'
      end
    end
  end
end
