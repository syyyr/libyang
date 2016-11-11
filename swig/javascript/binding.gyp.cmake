{
	'targets': [{
		'target_name': 'libyang',
		'sources': [
			@libyang_LIB_SRCS_GYP@
			'src/libyang_javascriptJAVASCRIPT_wrap.cxx' ],
		'include_dirs': [@libyang_LIB_INCLUDE_DIRS_GYP@],
		'libraries': ['-lpcre',],
		'conditions': [
			[ 'OS!="win"', {
				'include_dirs': [ 'config/win' ],
				'cflags+': [ '-std=c++11' ],
				'cflags_c+': [ '-std=c++11' ],
				'cflags_cc+': [ '-std=c++11' ],
			}],
		],
		'cflags!': [ '-O2' ],
		'cflags+': [ '-O3' ],
		'cflags_cc!': [ '-O2' ],
		'cflags_cc+': [ '-O3' ],
		'cflags_c!': [ '-O2' ],
		'cflags_c+': [ '-O3' ],
		'variables': {
			"arch%": "<!(node -e 'console.log(process.arch)')"
		},
		'cflags_cc!': [ '-fno-rtti', '-fno-exceptions' ],
		'cflags!': [ '-fno-exceptions' ],
		'conditions' : [
			[ 'arch=="x64"',
				{ 'defines' : [ 'X86PLAT=ON' ], },
			],
			[ 'arch=="ia32"',
				{ 'defines' : [ 'X86PLAT=ON'], },
			],
			[ 'arch=="arm"',
				{ 'defines' : [ 'ARMPLAT=ON'], },
			],
			],
		'defines' : [ 'SWIG',
			'SWIGJAVASCRIPT',
			'BUILDING_NODE_EXTENSION=1',
		]
	}]
}
