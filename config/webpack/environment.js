const { environment } = require('@rails/webpacker');

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

module.exports = environment;
