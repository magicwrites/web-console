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
                src: '**/*.coffee'
                dest: 'javascript/'
                ext: '.js'
        less:
            compile:
                src: 'less/**/*.less'
                dest: 'css/compiled.css'
        protractor:
            options:
                configFile: 'node_modules/protractor/referenceConf.js'
                keepAlive: true
                noColor: false
            tests:
                options:
                    configFile: '../protractor_conf.js'
    
    grunt.initConfig configuration

    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-protractor-runner'

    grunt.file.setBase 'front/'

    grunt.registerTask 'default', ['less', 'coffee', 'watch']
    grunt.registerTask 'e2e', ['protractor'] 