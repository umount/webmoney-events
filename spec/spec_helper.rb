$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'rake'
require 'config'

require 'webmoney_events'

Config.load_and_set_settings(
  File.expand_path('../../config/settings.yml', __FILE__),
  File.expand_path('../../config/settings.local.yml', __FILE__)
)
