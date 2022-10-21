# File: spec/cat_facts_spec.rb

require 'cat_facts'
require 'net/http'

describe CatFacts do
  it 'returns a cat fact from an API call' do
    fake_requester_dbl = double :requester
    expect(fake_requester_dbl).to receive(:get_cat_fact)
      .with(URI("https://catfact.ninja/fact"))
      .and_return('{"fact":"Cat bites are more likely to become infected than dog bites.","length":60}')
    cat_facts = CatFacts.new(fake_requester_dbl)
    expect(cat_facts.provide).to eq "Cat fact: Cat bites are more likely to become infected than dog bites."
  end
end