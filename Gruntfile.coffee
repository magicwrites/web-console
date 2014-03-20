'use strict'

module.exports = (grunt) ->

    configuration =
        pkg: grunt.file.readJSON 'package.json'
        watch:
            less:
                files: 'less/**/*.less'
                tasks: ['less']
            coffee:
                files: 'coffeescript/**/*.coffee'
                tasks: ['coffee']
        coffee:
            compile:
                expand: true,
                cwd: 'coffeescript/'
                src: '**/*.coffee',
                dest: 'javascript/',
                ext: '.js'
        less:
            compile:
                src: 'less/**/*.less',
                dest: 'css/compiled.css'
    
    grunt.initConfig configuration

    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    grunt.file.setBase 'front/'

    grunt.registerTask 'default', ['less', 'coffee', 'watch']