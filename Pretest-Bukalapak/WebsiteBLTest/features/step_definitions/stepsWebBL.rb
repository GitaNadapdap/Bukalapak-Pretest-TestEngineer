require 'selenium-webdriver'
require 'rubygems'
require 'rspec'

driver = Selenium::WebDriver.for :chrome
link = "https://www.bukalapak.com/"
email = "gita.nddp@gmail.com"
namaLengkap = "Gita Nadapdap"
password = "qwerty030"
Given("I am access Bukalapak site") do
  driver.navigate.to link
end

When("I go to register page") do
  driver.find_element(:xpath, '//*[@id="vm__white-header-dweb"]/section/header/div[3]/div/div/div[2]/div/a[1]/p').click
  driver.find_element(:xpath, '/html/body/main/div/div[2]/section/div[1]/div[1]/div/input').send_keys email
  driver.find_element(:xpath, '/html/body/main/div/div[2]/section/div[2]/button').click
  sleep(5)
  driver.find_element(:xpath, '//*[@id="TFAJS-1633529406947"]/section/div/div[2]/div/div[2]/div/div/div/div/button[1]').click
  sleep(5)
  driver.find_element(:xpath, '/html/body/main/section/div/div[1]/div/input').send_keys namaLengkap
  driver.find_element(:xpath, '/html/body/main/section/div/div[2]/div/input').send_keys password
  driver.find_element(:xpath, '/html/body/main/section/div/button').click
  sleep(2)
end 

Then("Compare url") do
  url = driver.current_url
  puts url
  expect(url).to eq("https://accounts.bukalapak.com/register?comeback=https%3A%2F%2Fwww.bukalapak.com%2F&from=nav_header")
end

When("I go to login page") do
  driver.find_element(:xpath, '//*[@id="vm__white-header-dweb"]/section/header/div[3]/div/div/div[2]/div/a[2]/p').click
  driver.find_element(:xpath, '//*[@id="user_identity_textfield"]').send_keys email
  sleep(2)
  driver.find_element(:xpath, '//*[@id="submit_button"]').click
  sleep(2)

end
Then ("Input true password") do
  driver.find_element(:xpath, '//*[@id="input-password"]').send_keys password
  driver.find_element(:xpath, '//*[@id="btn-login"]').click
  sleep(3)
end

Then("Compare after login") do
  url = driver.current_url
  puts url
  expect(url).to eq("https://www.bukalapak.com/?flash=you_login#")
end
  
Then("Go to search") do
  driver.find_element(:xpath, '//*[@id="v-omnisearch__input"]').send_keys 'earphone jbl c100si original'
  driver.find_element(:xpath, '//*[@id="v-omnisearch"]/button').click
end

Then("I add to cart") do
  driver.find_element(:xpath, '//*[@id="product-explorer-container"]/div/div[1]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[2]').click
  driver.find_element(:xpath, '//*[@id="section-main-product"]/div[2]/div[5]/div/button[2]').click
end

Then("Compare after search") do
  url = driver.current_url
  expect(url) == ("https://www.bukalapak.com/products?from=omnisearch&from_keyword_history=false&search%5Bkeywords%5D=earphone%20jbl%20c100si%20original&search_source=omnisearch_keyword&source=navbar")
end

Then("Compare after cart") do
  url = driver.current_url
  puts url
  expect(url).to eq("https://www.bukalapak.com/p/handphone/headset-earphone/1n6xija-jual-headset-handsfree-earphone-jbl-c100si-original?from=list-product&pos=1&keyword=earphone%20jbl%20c100si%20original&funnel=omnisearch&product_owner=normal_seller&cf=1&ssa=1&sort_origin=relevansi&search_sort_default=true&promoted=1")
end