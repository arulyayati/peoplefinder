require 'webmock/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed

  WebMock.disable_net_connect!(allow_localhost: true)

  config.before(:each) do
    stub_request(:get, "https://api.geckoboard.com/").
      with(headers: { 'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Authorization'=>'Basic ZjU5YzVmMTI5YmU4MTNjMzA0ZGVkYzk3OTc5MmMwOTE6', 'User-Agent'=>'Geckoboard-Ruby/0.3.0' }).
      to_return(status: 200, body: "", headers: {})
  end

end
