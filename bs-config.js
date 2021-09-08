'use strict';

/* snippetOptions params get rid 
   of document.write errors */

module.exports = {
	port: 8086,
	injectChanges: true,
	watchOptions: {
		ignored: ['node_modules', '.git'],
	},
	snippetOptions: {
		rule: {
			match: /<\/head>/u,
			fn(snippet, match) {
				const {
					groups: { src },
				} = /src='(?<src>[^']+)'/u.exec(snippet);

				return `<script src="${src}" async></script>${match}`;
			},
		},
	},
};
