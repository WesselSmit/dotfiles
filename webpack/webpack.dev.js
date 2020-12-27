const path = require('path')

module.exports = {
    entry: path.join(__dirname, '/src/scripts'),
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'bundle.js'
    },
    mode: 'development',
    watch: true,
    watchOptions: {
        ignored: /node_modules/
    },
    module: {
        rules: []
    },
    plugins: []
}
