require 'open-uri'
class Project < ApplicationRecord
  belongs_to :category

  validates :url, presence: true
  validates :category, presence: true

  after_create :update_project_info 
  def update_project_info
    begin
      #split "https://github.com/playframework/playframework" to "playframework/playframework" and call Github repos API

      response = JSON.parse(open("https://api.github.com/repos/#{self.url.split("/").last(2).join("/")}").read)
      stars = response["stargazers_count"]
      forks = response["forks_count"]
      last_update = response["updated_at"]
      self.update(stars: stars, forks: forks, last_update: last_update)      
    rescue Exception 
      p 'error loading project infos'
    end 

    # Forks can be read from this url https://github.com/playframework/playframework/network/members, we just need to parse and extract the html to get the fork urls
  end
end
