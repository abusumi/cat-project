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
        'custom-orange': '#e07f34',
        'default': '#8b4513',
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