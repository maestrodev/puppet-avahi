require 'rake/clean'
require 'puppet-lint/tasks/puppet-lint'

CLEAN.include('spec/fixtures/manifests/', 'spec/fixtures/modules/', 'doc', 'pkg')

require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet_blacksmith/rake_tasks'

task :default => [:clean, :spec]
