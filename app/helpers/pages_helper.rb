module PagesHelper

  def generate_certificate(name, acre_verbiage, parcel)
     pdf = Prawn::Document.new(:template => "#{Rails.root}/app/assets/images/certificate_template.pdf")
      pdf.fill_color "FFFFFF"
      pdf.bounding_box([-2,180], :width=>300, :height=>50) do
        text = "THIS CERTIFIES THAT #{acre_verbiage.upcase} OF THE AMAZON"
        pdf.text text, :size => 11, :leading => 0, :align => :center, :style=>:bold
      end
      pdf.bounding_box([-2,168], :width=>300, :height=>50) do
        text = "RAINFOREST AT THE COORDINATES BELOW"
        pdf.text text, :size => 11, :leading => 0, :align => :center, :style=>:bold
      end
      pdf.bounding_box([-2,154], :width=>300, :height=>50) do
        text = "HAS BEEN NAMED"
        pdf.text text, :size => 11, :leading => 0, :align => :center, :style=>:bold
      end
      pdf.bounding_box([-2,110], :width=>300, :height=>250) do
        pdf.text name, :size => 16, :leading => 0, :align => :center, :style=>:bold#, :style=> :italic
      end
      pdf.bounding_box([40,72], :width=>220, :height=>250) do
        pdf.text "In support of conservation and ecological protection of this precious region", :size => 11, :leading => 0, :align => :center
      end
      pdf.bounding_box([-2,15], :width=>300, :height=>250) do
        pdf.text "Region: #{parcel.title}", :size => 10, :leading => 0, :align => :center
      end
      pdf.bounding_box([-2,0], :width=>300, :height=>250) do
        pdf.text "Cordinates: #{parcel.latitude}, #{parcel.longitude}", :size => 10, :leading => 0, :align => :center
      end
      pdf.bounding_box([-2,-20], :width=>300, :height=>250) do
        pdf.text "The Amazon Aid Foundation is a 501(c)(3) nonprofit organization.", :size => 6, :leading => 0, :align => :center
      end
    return pdf
  end

end
