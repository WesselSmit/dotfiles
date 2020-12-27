const path = require('path')

module.exports = {
    entry: path.join(__dirname, '/src/scripts'),
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'bundle.js'
    },
    mode: 'production',
    module: {
        rules: [
            {
                test: /\.ts$/,
                use: 'ts-loader',
                include: [path.resolve(__dirname, 'src/scripts')]
            }
        ]
    },
    plugins: []
}
