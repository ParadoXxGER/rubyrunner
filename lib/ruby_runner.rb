require 'byebug'
require 'listen'

class RubyRunner

  Dir.glob(File.join('modules', '**', '*.rb')).each do|file|
    module_name = file.gsub('modules/', '').gsub('.rb', '').capitalize

    puts "INFO: Including: #{module_name}"
    load file

  end

  def self.reload
    load './lib/ruby_runner.rb'
  end

  listener = Listen.to('modules', only: /\.rb$/) do |modified, added|

    if modified
      begin
        load modified.first
        puts "Live reloaded: #{modified}"
      rescue

      end
    end

    if added
      begin
        load added.first
        puts "Live reloaded a new file: #{modified}"
      rescue
      end
    end


  end

  listener.start

  puts " ### Rubyrunner: a extendable and interactive ruby shell ### "

end