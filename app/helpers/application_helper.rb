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
      keywords: "猫,キャットフード,給与量,2種類のキャットフード",
      canonical: "catfood-mate.com",
      separator: "|",
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: "website",
        url: "https://catfood-mate.com",
        image: request.path.include?("cats") ? ogp_image_url(cat.id) : image_url("ogp.png"),
        local: "ja-JP"
      },
      twitter: {
        card: "summary_large_image",
        site: "CatFoodMat45083",
        image: request.path.include?("cats") ? ogp_image_url(cat.id) : image_url("ogp.png")
      }
    }
  end
end
