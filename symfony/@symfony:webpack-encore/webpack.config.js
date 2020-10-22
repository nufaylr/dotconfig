// webpack.config.js
var Encore = require("@symfony/webpack-encore");

Encore
  // the project directory where all compiled assets will be stored
  .setOutputPath("public/dist/")
  // the public path used by the web server to access the previous directory
  .setPublicPath("/dist")
  .addEntry("app", "./assets/app.js")
  .disableSingleRuntimeChunk()
  // allow sass/scss files to be processed
  .enableSassLoader(function() {}, {
    resolveUrlLoader: false
  })
  .enableReactPreset()
  // .autoProvidejQuery()
  .enableSourceMaps(!Encore.isProduction())
  .enablePostCssLoader()
  // empty the outputPath dir before each build
  .cleanupOutputBeforeBuild()
  .enableVersioning()
  // show OS notifications when builds finish/fail
  .enableBuildNotifications()
  .addLoader({
    test: /\.(js|jsx)$/,
    loader: "eslint-loader",
    exclude: [/node_modules/],
    enforce: "pre",
    options: {
      configFile: "./.eslintrc",
      emitWarning: true,
      fix: true
    }
  });

// export the final configuration
module.exports = Encore.getWebpackConfig();
