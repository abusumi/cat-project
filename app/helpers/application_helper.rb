module ApplicationHelper
  def safe_external_url(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil? ? url : "#"
  rescue URI::InvalidURIError
    "#"
  end

  def default_meta_tags
    {
      site: "Cat Food Mate",
      title: "キャットフードの給与量を簡単に計算してくれるサービス",
      reverse: true,
      charset: "utf-8",
      description: "Cat Food Mateでは「キャットフード・体重」を入力すると1日の給与量を算出してくれます。",
      keywords: "猫,キャットフード,給与量,2種類のキャットフード,ペット,キャット",
      canonical: "catfood-mate.com",
      separator: "|",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: "catfood-mate.com",
        image: image_url("ogp.png"),
        locale: "ja-JP"
      },
      twitter: {
        card: "summary_large_image", # Twitterで表示する場合は大きいカードにする
        site: "CatFoodMat45083",
        image: image_url("ogp.png")
      }
    }.tap do |meta_tags|
      if @cat
        meta_tags[:og][:image] = "#{request.base_url}/ogp2/#{@cat.id}.png"
        meta_tags[:twitter][:image] = "#{request.base_url}/ogp2/#{@cat.id}.png"
      end
    end
  end
end
