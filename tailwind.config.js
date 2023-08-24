/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./static/src/**/*.{html,js}",
    "./templates/**/*.{html,js}"
  ],
  theme: {
    extend: {
      colors: {
        // custom colors
        darkBlue: 'rgb(30,58,138)',

      }
    },
  },
  plugins: [],
}

