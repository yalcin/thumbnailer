unless defined? RAILS_ROOT
  conf_file = "#{File.dirname($0)}/thumbnailer.yml"
  begin
    config = YAML.load_file(conf_file)
  rescue
    raise "Please create and set thumbnailer.yml"
  end

else
  conf_file = "#{RAILS_ROOT}/config/thumbnailer.yml"
  begin
    config = YAML.load_file(conf_file)
  rescue
    raise "Please create and set config/thumbnailer.yml file"
  end
end

FLICKR_KEY = config['flickr_key']
FLICKR_SECRET = config['flickr_secret']
WEBSNAPR_KEY = config['websnapr_key']

