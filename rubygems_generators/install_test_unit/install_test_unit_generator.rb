class InstallTestUnitGenerator < RubiGen::Base

  default_options :author => nil
  
  attr_reader :gem_name, :module_name

  def initialize(runtime_args, runtime_options = {})
    super
    @destination_root = File.expand_path(destination_root)
    @gem_name = base_name
    @module_name  = @gem_name.camelcase
    extract_options
  end

  def manifest
    record do |m|
      # Ensure appropriate folder(s) exists
      m.directory 'test'

      m.template "test/test_helper.rb",    "test/test_helper.rb"
      m.template "test/test.rb",           "test/test_#{gem_name}.rb"
    end
  end

  protected
    def banner
      <<-EOS
Creates a ...

USAGE: #{$0} #{spec.name} name
EOS
    end

    def add_options!(opts)
      # opts.separator ''
      # opts.separator 'Options:'
      # For each option below, place the default
      # at the top of the file next to "default_options"
      # opts.on("-a", "--author=\"Your Name\"", String,
      #         "Some comment about this option",
      #         "Default: none") { |options[:author]| }
      # opts.on("-v", "--version", "Show the #{File.basename($0)} version number and quit.")
    end

    def extract_options
      # for each option, extract it into a local variable (and create an "attr_reader :author" at the top)
      # Templates can access these value via the attr_reader-generated methods, but not the
      # raw instance variable value.
      # @author = options[:author]
    end
end