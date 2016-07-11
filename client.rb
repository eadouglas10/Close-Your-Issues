require 'uri'
require 'pry'
require 'net/http'

def fetch
  url = URI("https:/api.github.com/users/#{github_username}/events")

  http = Net::HTTP.new(url.host, url.port)

  http.use_ssl = true
#http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  req = Net::HTTP::Get.new(url)
  req["Authorization"] = "token"
  response = http.request(req)
  body = response.read_body

  payload = JSON.parse(body)
end

class GithubEvents
  def initialize(github_username)
    @github_username = github_username

  end
end

class GithubReader

  def initialize(repo_name)
    @repo_name = repo_name
  end

  def create_repo_now


chris_events = GithubEvents.new("clai88").fetch

binding.pry
