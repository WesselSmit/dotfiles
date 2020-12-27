const path = require('path')

module.exports = {
    entry: path.join(__dirname, '/src/scripts/index.ts'), // points to your apps .js/.ts entry file(s)
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
        rules: [
            { // typescript support
                test: /\.ts$/,
                use: 'ts-loader',
                include: [path.resolve(__dirname, 'src/scripts')]
            },
            
            // styling files are imported in webpack's entry file(s)
            { // less support
                test: /\.less$/, 
                use: [ 
                    'style-loader',
                    'css-loader', 
                    'less-loader'
                ],
                include: [path.resolve(__dirname, 'src/styles')]
            }
        ]
    },
    plugins: [],
    devtool: 'source-map'
}
