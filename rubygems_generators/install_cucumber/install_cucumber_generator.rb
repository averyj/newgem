require 'rbconfig'

# This generator bootstraps a Rails project for use with Cucumber
class InstallCucumberGenerator < RubiGen::Base
  DEFAULT_SHEBANG = File.join(Config::CONFIG['bindir'],
                              Config::CONFIG['ruby_install_name'])

  attr_reader :project_name
  
  def initialize(runtime_args, runtime_options = {})
    super
    @project_name = File.basename(File.expand_path(destination_root))
  end

  def manifest
    record do |m|
      script_options     = { :chmod => 0755, :shebang => options[:shebang] == DEFAULT_SHEBANG ? nil : options[:shebang] }

      m.directory 'features/steps'
      m.file      'features/development.feature', 'features/development.feature'
      m.file      'features/steps/common.rb', 'features/steps/common.rb'
      m.template  'features/steps/env.rb.erb', 'features/steps/env.rb'
    end
  end

protected

  def banner
    "Usage: #{$0} cucumber"
  end

end