module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
  ],
  theme: {
    extend: {
      fontFamily: {
        'zen': ['Zen Kaku Gothic New', 'sans-serif'],
        'lilita': ['Lilita One', 'system-ui'],
      },
    }, // 新しい設定を追加する場合はここに書く 
  },
  plugins: [
    require("daisyui"), // プラグインの設定を追加
  ],
  daisyui: {
    darkTheme: false, // ダークモードの設定
  },
}