require 'rails_helper'

describe ApiConstraints do
  let(:api_constraint_v1) { ApiConstraints.new(version: 1) }
  let(:api_constraint_v2) { ApiConstraints.new(version: 2, default: true) }

  describe 'matches?' do
    it "returns true when the versions mathches the 'Accept' header" do
      request = double(host: 'api.lvh.me', headers: {
                         'Accept' => 'application/vnd.marketplace.v1'
                       })
      expect(api_constraint_v1.mathches?(request)).to be_truthy
    end
    it "returns the default version 'default' option is specified" do
      request = double(host: 'api.lvh.me')

      expect(api_constraint_v2.mathches?(request)).to be_truthy
    end
  end
end
