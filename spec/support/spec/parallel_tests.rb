# frozen_string_literal: true

if ENV['PARALLEL_TEST_GROUPS']
  require 'fileutils'
  spec_dir = File.dirname(__FILE__)
  fixtures_dir = File.join(spec_dir, '..', '..', 'fixtures')
  module_dir = File.join(fixtures_dir, 'modules')
  FileUtils.mkdir_p(module_dir)
  module_path = File.expand_path(File.join(spec_dir, '..', '..', '..'))
  module_name = 'cis_security_hardening'
  target_symlink = File.join(module_dir, module_name)

  File.symlink(module_path, target_symlink) unless File.symlink?(target_symlink)
end
