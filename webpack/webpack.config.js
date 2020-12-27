const path = require('path')

module.exports = {
    entry: path.join(__dirname, '/src/scripts/index.js'),
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'bundle.js'
    },
    mode: 'production',
    module: {
        rules: []
    },
    plugins: []
}
