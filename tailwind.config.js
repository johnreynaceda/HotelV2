const defaultTheme = require('tailwindcss/defaultTheme')
const colors = require('tailwindcss/colors')

module.exports = {
  presets: [
    require('./vendor/wireui/wireui/tailwind.config.js', './vendor/filament/**/*.blade.php'),
  ],
  content: [
    './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
    './vendor/laravel/jetstream/**/*.blade.php',
    './storage/framework/views/*.php',
    './resources/views/**/*.blade.php',
    './vendor/wireui/wireui/resources/**/*.blade.php',
    './vendor/wireui/wireui/ts/**/*.ts',
    './vendor/wireui/wireui/src/View/**/*.php',
  ],

  theme: {
    extend: {
      fontFamily: {
        sans: ['DM Sans', ...defaultTheme.fontFamily.sans],
        alkatra: ['Alkatra', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        danger: colors.rose,
        primary: colors.gray,
        success: colors.green,
        warning: colors.yellow,
        dlogo: '#009EF5',
      },
    },
  },

  plugins: [require('@tailwindcss/forms'), require('@tailwindcss/typography')],
}
