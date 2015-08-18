if defined? BetterErrors
  local_path = "/Users/yonggang/Sites/Rails/Network"

  BetterErrors.editor = proc { |full_path, line|
    full_path = full_path.sub(Rails.root.to_s, local_path)
    "subl://open?url=file://#{full_path}&line=#{line}"
  }
end