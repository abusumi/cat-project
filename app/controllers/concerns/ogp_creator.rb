class OgpCreator
  require 'mini_magick'  
  BASE_IMAGE_PATH = './app/assets/images/ogp2.png'
  FONT = './app/assets/fonts/ZenMaruGothic-Medium.ttf'
  FONT_SIZE_LARGE = 80  # 猫の名前用
  FONT_SIZE_SMALL = 60  # 飼い主情報用
  FONT_COLOR = 'black'
  ACCENT_COLOR = '#e07f34'  # オレンジ色のアクセントカラー

  MAX_NAME_LENGTH = 6  # 最大7文字まで表示（それ以上は「…」にする）

  def self.build(cat_name, user_name)
    image = MiniMagick::Image.open(BASE_IMAGE_PATH)

    # 文字数制限を適用
    cat_name = truncate_text(cat_name, MAX_NAME_LENGTH)

    image.combine_options do |config|
      config.font FONT
      
      # 猫の名前（右上に配置）
      config.pointsize FONT_SIZE_LARGE
      config.fill FONT_COLOR
      config.gravity 'Center'  # 中央配置
      config.draw "text 280,-130 '#{cat_name}'"
      
      # 「ちゃん」の位置
      config.fill ACCENT_COLOR
      config.pointsize FONT_SIZE_SMALL
      config.gravity 'NorthEast'
      config.draw "text 80,330 'ちゃん'"
    end

    # 飼い主情報（右下に配置）
    image.combine_options do |config|
      config.font FONT
      config.pointsize FONT_SIZE_LARGE
      
      # ユーザー名
      config.fill FONT_COLOR
      config.gravity 'Center'
      config.draw "text -190,205 '#{user_name}'"
      
      # 「さんのペット」
      config.fill ACCENT_COLOR
      config.pointsize FONT_SIZE_SMALL
      config.gravity 'SouthEast'
      config.draw "text 60,80 'さんのペット'"
    end

    image
  end

  # **7文字以上の場合に「…」で切り詰める**
  def self.truncate_text(text, max_length)
    text.length > max_length ? text[0...max_length] + '…' : text
  end
end
