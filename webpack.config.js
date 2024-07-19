// webpack.config.js
const path = require('path');

module.exports = {
  entry: './firebase_config.js',
  output: {
    filename: 'firebase_bundle.js',
    path: path.resolve(__dirname, 'web'),
  },
  mode: 'production',
};
