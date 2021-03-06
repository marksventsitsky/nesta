require 'test_helper'
require_relative '../../../../lib/nesta/commands'

describe 'nesta theme:enable' do
  include TemporaryFiles

  before do
    FileUtils.mkdir_p(File.join(project_root, 'config'))
    File.open(File.join(project_root, 'config', 'config.yml'), 'w').close
  end

  after do
    remove_temp_directory
  end

  it 'enables the theme' do
    Dir.chdir(project_root) do
      Nesta::Commands::Theme::Enable.new('theme-name').execute
      assert_match /^theme: theme-name/, File.read('config/config.yml')
    end
  end
end
