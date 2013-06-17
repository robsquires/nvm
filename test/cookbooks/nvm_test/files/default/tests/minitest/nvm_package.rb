require File.expand_path('../support/helpers', __FILE__)

describe_recipe "nvm_test::nvm_package" do
  include Helpers::CookbookTest

  it "should have correctly installed #{node['nvm']['nvm_package_test']['package']}" do
    assert_sh "/bin/bash --login -c '#{node['nvm']['nvm_package_test']['package']}' 2>&1"
  end
end