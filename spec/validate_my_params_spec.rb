RSpec.describe ValidateMyParams do
	class Sut
		include ValidateMyParams

		def a_method(data)
			validate_args(data) do
				validate :name, type: String, required: true
				validate :age, type: Integer, required: false
			end
		end
	end

  it "has a version number" do
    expect(ValidateMyParams::VERSION).not_to be nil
  end

	it "raises exception when parameter is required but not provided" do
		sut = Sut.new
		expect { sut.a_method(age: 38) }.to raise_error(ValidateMyParams::MissingParam)
  end
	
	it "raises exception when parameter type is different than the expected" do
		sut = Sut.new
		expect { sut.a_method(name: 15) }.to raise_error(ValidateMyParams::InvalidParam)
  end
	
	it "does not raise exception when parameters are valid" do
		sut = Sut.new
		expect { sut.a_method(name: 'John', age: 38) }.not_to raise_error
  end
	
	it "does not raise exceptions for parameters that have no rules" do
		sut = Sut.new
		expect { sut.a_method(name: 'John', age: 38, country: 'GB') }.not_to raise_error
  end
end
