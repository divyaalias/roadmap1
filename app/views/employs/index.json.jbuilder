json.array!(@employs) do |employ|
  json.extract! employ, :id, :first_name, :last_name, :role, :email, :dob, :designation
  json.url employ_url(employ, format: :json)
end
