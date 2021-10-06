require 'uri'
require 'net/http'

expectedOutput = [Integer, Integer, String, String]
actualOutput = []
Given("Access URI") do
  uri = URI("https://jsonplaceholder.cypress.io/posts")
  res = Net::HTTP.get_response(uri) #hit uri
  data = JSON.parse(res.body) #diubah/diparsing ke bentuk json

  actualOutput.push(data[0]['userId'].class) #ngambil tipe data fari field userID, id, title, body lalu dipush ke actual output
  actualOutput.push(data[0]['id'].class)
  actualOutput.push(data[0]['title'].class)
  actualOutput.push(data[0]['body'].class)
end

Then("Compare") do #membandingkan expected (userID, id) dengan actualOutput
  expect(actualOutput).to eq(expectedOutput)
end
