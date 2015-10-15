class FolderRequirer

  attr_reader :folder_path, :file_names

  def initialize(args = {})
    @folder_path = args[:folder_path]
    @file_names = args[:file_names]
    require_file_names
  end

  def require_file_names
    file_names.each do |file_name|
      file_to_require = ["classes", folder_path, file_name].compact.join("/")
      require_relative file_to_require
    end
  end

end