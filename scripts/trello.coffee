module.exports = (robot) ->
  robot.hear /^ToDo (.*)/i, (msg) ->
    title = "#{msg.match[1]}"

    Trello = require("node-trello")
    t = new Trello(process.env.HUBOT_TRELLO_KEY, process.env.HUBOT_TRELLO_TOKEN)
    t.post "/1/cards", {name: title, idList: process.env.HUBOT_TRELLO_LIST}, (err, data) ->
      if err
        msg.send "ERROR"
        return
      msg.send "「#{title}」 をTrelloに保存しました"
