# rally = require 'rally'
# rallyMongo = require 'rally-mongodb'
express = require 'express'
fs = require 'fs'

# model = rally.model
# 
# rally.store rallyMongo,
#   server: 'mongodb://localhost/rally-letters'
#   init: (err, done) ->
#     model.get 'letters', (err, letters) ->
#       return if letters
#       colors = ['red', 'yellow', 'blue', 'orange', 'green']
#       letters = {}
#       for row in [0..4]
#         for col in [0..25]
#           letters[row * col] =
#             color: colors[row]
#             value: String.fromCharCode 65 + col
#             x: col * 24
#             y: row * 36
#       model.set 'letters', letters, done

# TODO Pass in Socket.IO configuration params

app = express.createServer()

app.get '/', (req, res) ->
  fs.readFile 'client.js', 'utf8', (err, script) ->
    fs.readFile 'style.css', 'utf8', (err, style) ->
      #script = model.html() + script
      res.send """
      <!DOCTYPE html>
      <title>Letters game</title>
      <style>#{style}</style>
      <link href=http://fonts.googleapis.com/css?family=Anton&v1 rel=stylesheet>
      <div id=back>
        <div id=page>
          <p id=info>
          <div id=board></div>
        </div>
      </div>
      <script>#{script}</script>
      """

app.listen 3000
