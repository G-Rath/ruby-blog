const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
}));

/** @type {ConfigList} */
const environmentLoaders = environment.loaders;

// remove unneeded loaders
environmentLoaders.delete('babel');
environmentLoaders.delete('sass');
environmentLoaders.delete('moduleSass');

// add the typescript loader
environmentLoaders.append(
  'typescript',
  {
    test: /\.tsx?$/,
    loader: 'awesome-typescript-loader',
    options: {
      configFileName: './tsconfig.json'
    }
  }
);

// ensure we don't emit on error
environment.config.merge({
  optimization: {
    noEmitOnErrors: true
  }
});

module.exports = environment;
