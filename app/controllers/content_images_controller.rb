class ContentImagesController < Spree::BaseController

  def create
    if Spree::Editor::Config[:current_editor] == "CKEditor"
      @content_image = ContentImage.new(:attachment => params[:upload])
    else
      #debugger
      @content_image = ContentImage.new(params[:upload])
    end
    @content_image.save!

    render :text => @content_image.attachment.url
  end
end
