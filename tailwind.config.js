module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
  ],
  theme: {
    extend: {
      colors: {
        primary: '#E17B34',
      },
      fontFamily: {
        'zen': ['ZenMaruGothic', 'sans-serif'], // ここに追加
        'lilita': ['Lilita One', 'system-ui'],
      },
    },
  },
  plugins: [
    require("daisyui"),
  ],
  daisyui: {
    darkTheme: false,
  },
}