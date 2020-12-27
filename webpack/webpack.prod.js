const path = require('path')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')

module.exports = {
    entry: path.join(__dirname, '/src/scripts/index.ts'), // points to your apps .js/.ts entry file(s)
    output: {
        path: path.resolve(__dirname, 'dist'),
        filename: 'bundle.js'
    },
    mode: 'production',
    module: {
        rules: [
            { // typescript support
                test: /\.ts$/,
                use: 'ts-loader',
                include: [path.resolve(__dirname, 'src/scripts')]
            },
            
            // styling files are imported in webpack's entry file(s)
            { // less support
                test: /\.less$/, // .less files are imported in webpack's entry file(s)
                use: [ 
                    MiniCssExtractPlugin.loader,
                    'css-loader', 
                    'less-loader'
                ],
                include: [path.resolve(__dirname, 'src/styles')]
            }
        ]
    },
    plugins: [
        new MiniCssExtractPlugin()
    ]
}
