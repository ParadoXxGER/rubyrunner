class FileUtils

  def self.help
    "Usage: current_time"
  end

  def self.rename_matching_files(_pattern, _rename)
    byebug
    "#{_pattern + _rename}"
  end

  def self.time
    Time.now
  end

end



