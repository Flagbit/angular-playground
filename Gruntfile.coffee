module.exports = (grunt) ->

  grunt.initConfig
    pkg: grunt.file.readJSON "package.json"
    src_path: "src"
    assets_path: "public/assets"
    concat:
      dist:
        src: [
          "<%= src_path %>/app/app.js"
          "<%= src_path %>/app/controllers/*.js"
          "<%= src_path %>/app/config/*.js"
          "<%= src_path %>/app/services/*.js"
          "<%= src_path %>/app/widgets/*.js"
          "<%= src_path %>/app/directives/*.js"
          "<%= src_path %>/app/filters/*.js"
        ]
        dest: "<%= assets_path %>/app.js"
    coffee:
      compile:
        files:
          "<%= assets_path %>/app.js": [
            "<%= src_path %>/app/app.coffee"
            "<%= src_path %>/app/controllers/*.coffee"
            "<%= src_path %>/app/config/*.coffee"
            "<%= src_path %>/app/services/*.coffee"
            "<%= src_path %>/app/widgets/*.coffee"
            "<%= src_path %>/app/directives/*.coffee"
            "<%= src_path %>/app/filters/*.coffee"
          ]
    sass:
      options:
        sourceMap: true
        includePaths: [
          "<%= src_path %>/sass"
        ]
      dist:
        files:
          "<%= assets_path %>/app.css": "<%= src_path %>/sass/application.sass"
    copy:
      views:
        files: [
          {expand: true, cwd: "<%= src_path %>/app/views/", src: ["**"], dest: "<%= assets_path %>/app/views"}
        ]
    autoprefixer:
      single_file:
        src: "<%= assets_path %>/css/<%= pkg.name %>.css"
        dest: "<%= assets_path %>/css/<%= pkg.name %>.prefixed.css"
    uglify:
      options:
        mangle: false
      target:
        files:
          "<%= assets_path %>/js/<%= pkg.name %>.min.js": ["<%= assets_path %>/js/<%= pkg.name %>.js"]
    cssmin:
      target:
        files: [
          expand: true
          cwd: "<%= assets_path %>/css"
          src: ["*.prefixed.css", "!*.min.css"]
          dest: "<%= assets_path %>/css"
          ext: ".min.css"
        ]
  
  grunt.loadNpmTasks "grunt-sass"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-cssmin"
  grunt.loadNpmTasks "grunt-autoprefixer"

  grunt.registerTask "default", ["coffee","sass","copy"]
