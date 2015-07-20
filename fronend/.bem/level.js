exports.getTechs = function () {
    var techs = {
        'bemjson.js': 'v2',
        'bemdecl.js': 'v2/bemdecl.js',
        'deps.js': 'v2/deps.js',
        'bemhtml.js': '../../bem-core/.bem/techs/bemhtml.js',
        'js': 'v2/js',
        'css': 'v2/css',
        'html': '../../bem-core/.bem/techs/html.js'
    };

    return techs;
};

exports.getConfig = function () {
    return {
        bundleBuildLevels: this.resolvePaths([
            '../../bem-core/common.blocks',
            '../../bem-core/desktop.blocks',
            '../../common.blocks',
            '../../desktop.blocks'
        ])
    };
};