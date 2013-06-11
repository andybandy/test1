module.exports = (grunt) ->
  pkg = require './package.json'

  modules = [
    'components/jquery/jquery.js'
    'components/underscore/underscore.js'
    'components/backbone/backbone.js'
    'temp/app.js'
    'temp/models/app.js'
    'temp/views/app_view.js'
  ]

  grunt.initConfig
    pkg: pkg

    coffee:
      compile:
        files: [
          expand: true
          dest: 'temp/'
          cwd: 'src'
          src: '**/*.coffee'
          ext: '.js'
        ]

    concat:
      options:
        separator: ';'
        banner: '''
        /*!
         * <%= pkg.name %> <%= pkg.version %>
         *
         * ^___^
         */
        '''

      all:
        files: [
          dest: 'build/<%= pkg.name %>.js'
          src: modules
        ]

    uglify:
      options:
        mangle: true
        compress: true
        banner: '''
        /*!
         * <%= pkg.name %> <%= pkg.version %>
         *
         * ^___^ Mini
         */
        '''
      all:
        files:
          'build/<%= pkg.name %>.min.js': ['build/<%= pkg.name %>.js']

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-concat')
  grunt.loadNpmTasks('grunt-contrib-uglify')

  grunt.registerTask 'default', [
    'coffee:compile'
    'concat:all'
    'uglify:all'
  ]
