// Gruntfile.js configuration
module.exports = function(grunt) {
	"use strict";

	grunt.registerTask('default', ['svg2png']);

	grunt.initConfig({
		svg2png: {
			all: {
				files: [
					{ src: ['*.svg'], dest: 'dist/' }
				]
			}
		}
	});

	grunt.loadNpmTasks('grunt-svg2png');
};
