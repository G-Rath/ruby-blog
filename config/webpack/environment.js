const { environment } = require('@rails/webpacker');

/** @type {ConfigList} */
const environmentLoaders = environment.loaders;

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

module.exports = environment;
