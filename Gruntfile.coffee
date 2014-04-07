'use strict'

module.exports = (grunt) ->

    configuration =
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
                    configFile: '../tests/protractor.js'
        shell:
            bower:
                command: 'bower install'
                    
                
    
    grunt.initConfig configuration

    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-protractor-runner'
    grunt.loadNpmTasks 'grunt-shell'

    grunt.file.setBase 'front/'

    grunt.registerTask 'test', ['protractor']
    grunt.registerTask 'setup', ['shell', 'less', 'coffee']
    grunt.registerTask 'default', ['setup', 'watch']