unless defined? Rails
  conf_file = File.join(File.dirname($0),"thumbnailer.yml")
  begin
    config = YAML.load_file(conf_file)
  rescue
    raise "Please create and set thumbnailer.yml"
  end

else
  conf_file = File.join("config", "thumbnailer.yml")
  begin
    config = YAML.load_file(conf_file)
  rescue
    raise "Please create and set #{conf_file} file"
  end
end

FLICKR_KEY = config['flickr_key']
FLICKR_SECRET = config['flickr_secret']
WEBSNAPR_KEY = config['websnapr_key']

