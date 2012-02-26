require 'spec_helper'

describe Yahoo::Placemaker do

  it "determines we're talking about Columbus, Ohio" do
    VCR.use_cassette('columbus ohio') do
      response = Yahoo::Placemaker.extract "columbus ohio"
      response.document.administrative_scope.name.should == "Columbus, OH, US"
    end
  end

  it "returns an administrative scope of 'United States' when given a string of text w/ two US locations" do
      VCR.use_cassette('columbus ohio miami florida') do
      response = Yahoo::Placemaker.extract "columbus ohio miami florida"
      response.document.administrative_scope.name.should == "United States"
    end
  end

  it "contains only one item in reference_list when given 'Atlanta Georgia'" do
    VCR.use_cassette('atlanta_georgia') do
        response = Yahoo::Placemaker.extract "Atlanta Georgia"
        response.document.references.size.should == 1
    end
  end

  it "doesn't return any ancestors for 'France'" do
    VCR.use_cassette('france') do
      response = Yahoo::Placemaker.extract "France"
      response.document.local_scopes.first.ancestors.should == Array.new
    end
  end

  it "doesn't return any places for 'foobar'" do
    VCR.use_cassette('foobar') do
        response = Yahoo::Placemaker.extract "foobar"
        response.document.geographic_scope.should == nil
    end
  end

end