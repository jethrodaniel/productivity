// babel config.
//
// See https://babeljs.io/docs/en/configuration

module.exports = function(api) {
  api.cache(true);
  return {
    presets: ['babel-preset-expo'],
    plugins: ["@babel/plugin-proposal-class-properties"]
  };
};
