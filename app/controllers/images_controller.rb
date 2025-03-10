class ImagesController < ApplicationController
  def ogp
    cat = Cat.find(params[:cat_id])
    user = cat.user
    image = OgpCreator.build(cat.name, user.name).tempfile.open.read
    send_data image, type: "image/png", disposition: "inline"
  end

  private

  def ogp_params
    params.permit(:text)
  end
end
