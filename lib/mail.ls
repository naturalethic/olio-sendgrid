require! \sendgrid

mailer = sendgrid olio.config.mail.user, olio.config.mail.pass
promisify-all mailer

olio.config.mail          ?= {}
olio.config.mail.disabled ?= false
olio.config.mail.from     ?= 'olio@example.com'
olio.config.mail.fromname ?= 'Olio App'

module.exports = (options) ->*
  return if olio.config.mail?disabled
  yield mailer.send-async olio.config.mail{from, fromname} <<< options
