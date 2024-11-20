class ApiConstraints
  attr_accessor :version, :default

  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  def mathches?(request)
    @default || request.headers['Accept'].include?("application/vnd.marketplace.v#{@version}")
  end
end
