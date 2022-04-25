require_relative "../french_ssn"

describe "#french_ssn_info" do
  it "should return 'unvalid ssn' if unvalid ssn is provided" do
    actual = french_ssn_info("")
    expected = "Unvalid French SSN"
    expect(actual).to eq(expected)
  end

  it "should return the correct phrase when propor ssn is passed" do
    actual = french_ssn_info("1 84 12 76 451 089 46")
    expected = "a man, born in December, 1984 in Seine-Maritime."
    expect(actual).to eq(expected)
  end
end
