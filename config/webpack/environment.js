const { environment } = require('@rails/webpacker');
const webpack = require('webpack');
const path = require('path');

/**
 * Constant string-path that leads to the root of the project.
 *
 * @type {string}
 * @constant
 */
const PATH_TO_ROOT = path.resolve(__dirname, '..', '..');

environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery'
  // Popper: ['popper.js', 'default']
}));

/** @type {ConfigList} */
const environmentLoaders = environment.loaders;

// remove unneeded loaders
environmentLoaders.delete('babel');

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
  resolve: {
    alias: {
      '@src': path.resolve(PATH_TO_ROOT, 'app/webpacker/src'),
      '@pack': path.resolve(PATH_TO_ROOT, 'app/webpacker/pack'),
      '@styles': path.resolve(PATH_TO_ROOT, 'app/webpacker/styles')
    }
  },
  optimization: {
    noEmitOnErrors: true
  }
});

module.exports = environment;
