require 'spec_helper'

describe 'recipe[raspi::base]' do
  before do
    stub_command('which sudo').and_return(false)
  end

  let(:boot_options) do
    %w(a=b c=d e=f g=h=m)
  end

  cached(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
      node.set['raspi']['timezone'] = 'foo/bar'
      node.set['raspi']['boot_options'] = boot_options
    end.converge('recipe[raspi::base]')
  end

  context '#include_recipe' do
    %w(sudo openssh).each do |recipe|
      it "##{recipe}" do
        expect(chef_run).to include_recipe(recipe)
      end
    end
  end

  it 'adds ubuntu user in sudoer list' do
    expect(chef_run).to install_sudo('ubuntu').with(
      user: 'ubuntu',
      nopasswd: true
    )
  end

  it 'updates hostname' do
    expect(chef_run).to create_file('/etc/hostname').with(
      content: "#{chef_run.node.name}\n",
      mode: 0644,
      owner: 'root',
      group: 'root'
    )
  end

  it 'updates /etc/hosts entry' do
    expect(chef_run).to create_file('/etc/hosts').with(
      mode: 0644,
      owner: 'root',
      group: 'root'
    )
  end

  it 'sets localtime to bay area time' do
    expect(chef_run).to create_remote_file('/etc/localtime').with(
      source: 'file:///usr/share/zoneinfo/foo/bar',
      mode: 0644,
      owner: 'root',
      group: 'root'
    )
  end

  it 'configures pi for hdmi hotplug' do
    expect(chef_run).to create_file('/boot/firmware/config.txt').with(
      mode: 0755,
      owner: 'root',
      group: 'root',
      content: boot_options.join("\n") + "\n"
    )
  end

  it 'installs utility packages' do
    expect(chef_run).to install_package('utilities').with(
      package_name: %w(
        sysstat
        screen
        vim
        htop
        strace
        traceroute
      )
    )
  end
end
