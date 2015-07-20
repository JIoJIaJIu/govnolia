MAKE.decl('Arch', {
    blocksLevelsRegexp: /^.+?\.blocks/,
    bundlesLevelsRegexp: /^.+?\.bundles/,
    getLibraries: function () {
        return {
            'bem-core': {
                type: 'git',
                url: 'git@github.com:bem/bem-core.git',
                treeish: 'v2.6.0'
            }
        };
    }
});

MAKE.decl('BundleNode', {
    getTechs: function () {
        return [
            'bemjson.js',
            'bemdecl.js',
            'deps.js',
            'bemhtml.js',
            'js',
            'css',
            'html'
        ];
    }
});