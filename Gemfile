source 'http://rubygems.org'
gem 'dbi','>=0.4.5'
gem 'mysql'
gem 'dbd-mysql'

gem 'rhoconnect', '5.4.0'

gemfile_path = File.join(File.dirname(__FILE__), ".rcgemfile")
begin
  eval(IO.read(gemfile_path))
rescue Exception => e
  puts "ERROR: Couldn't read RhoConnect .rcgemfile"
  exit 1
end

# Add your application specific gems after this line ...
