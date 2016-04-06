require 'spec_helper'
describe 'eyaml' do

describe 'eyaml', :type => :class do
    context 'with defaults for all parameters' do
      it { should contain_class('eyaml') }
    end

    context "install package" do
      let (:params) {{ :package_ensure => 'present', :package_name => 'hiera-eyaml', :package_provider => 'gem' }}
      it { should contain_package('eyaml').with(
        'ensure' => 'present',
        'name' => 'hiera-eyaml',
        'provider' => 'gem'
       ) }
    end

    context "eyaml config directory" do
      let (:params) {{ :config_dir_ensure => 'directory', :config_dir => '/etc/eyaml', :config_dir_owner => 'root', :config_dir_group => 'root', :config_dir_mode => '0644' }}
      it {should contain_file('eyaml_config_dir').with(
        'ensure' => 'directory',
        'path' => '/etc/eyaml',
        'owner' => 'root',
        'group' => 'root',
        'mode' => '0644'
      ) }
    end

    context "eyaml config file creation" do
      let (:params) {{ :manage_eyaml_config => 'true', :config_ensure => 'file', :config_path => '/etc/yaml/config.yaml', :config_owner => 'root', :config_group => 'root', :config_mode => '0644'  }}
      it {should contain_file('eyaml_config').with(
        'ensure' => 'file',
        'path' => '/etc/yaml/config.yaml',
        'owner' => 'root',
        'group' => 'root',
        'mode' => '0644'
      ) }
    end

    context "eyaml keys directory" do
      let (:params) {{ :keys_dir_ensure => 'directory', :keys_dir => '/etc/yaml/keys', :keys_dir_owner => 'root', :keys_dir_group => 'root', :keys_dir_mode => '0500'  }}
      it {should contain_file('eyaml_keys_dir').with(
        'ensure' => 'directory',
        'path' => '/etc/yaml/keys',
        'owner' => 'root',
        'group' => 'root',
        'mode' => '0500'
      ) }
    end

    context "eyaml exec createkeys" do
      let (:params) {{ :manage_keys => 'true' }}
      it { should have_exec_resource_count(1) }
    end

    context "eyaml public key permission" do
      let (:params) {{ :public_key_path => '/etc/puppet/keys/public_key.pkcs7.pem', :keys_dir_owner => 'root', :keys_dir_group => 'root', :public_key_mode => '0644'  }}
      it {should contain_file('eyaml_publickey').with(
        'ensure' => 'file',
        'path' => '/etc/puppet/keys/public_key.pkcs7.pem',
        'owner' => 'root',
        'group' => 'root',
        'mode' => '0644'
      ) }
    end

    context "eyaml private key permission" do
      let (:params) {{ :private_key_path => '/etc/puppet/keys/private_key.pkcs7.pem', :keys_dir_owner => 'root', :keys_dir_group => 'root', :private_key_mode => '0500'  }}
      it {should contain_file('eyaml_privatekey').with(
        'ensure' => 'file',
        'path' => '/etc/puppet/keys/private_key.pkcs7.pem',
        'owner' => 'root',
        'group' => 'root',
        'mode' => '0500'
      ) }
    end

    context 'with defaults for all parameters' do
      it { should contain_class('eyaml') }
    end
  end
end
