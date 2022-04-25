require 'date'
require 'yaml'

SSN_PATTER = /^(?<gender>[12]) (?<year>\d{2}) (?<month>0[1-9]|1[0-2]) (?<zip>\d{2}) \d{3} \d{3} (?<key>\d{2})$/

def french_ssn_info(ssn)
  match_data = ssn.match(SSN_PATTER)

  if match_data && valid_key?(ssn, match_data[:key])
    gender = match_data[:gender] == "1" ? "man" : "woman"
    month = Date::MONTHNAMES[match_data[:month].to_i]
    year = "19#{match_data[:year]}"
    departament = YAML.load_file('data/french_departments.yml')[match_data[:zip]]
    return "a #{gender}, born in #{month}, #{year} in #{departament}."
    # "a man, born in December, 1984 in Seine-Maritime."
  else
    return "Unvalid French SSN"
  end
end

def valid_key?(ssn, key)
  (97 - ssn.gsub(" ","")[0..12].to_i) % 97 == key.to_i
end
