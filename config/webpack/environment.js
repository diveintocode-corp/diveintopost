const { environment } = require('@rails/webpacker')

module.exports = environment
environment.loaders.get('sass').use.push('import-glob-loader')
