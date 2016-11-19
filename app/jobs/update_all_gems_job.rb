class UpdateAllGemsJob < ApplicationJob
  queue_as :default

  def perform
    LaserGem.all.each do
      sleep(1)
      gemloader = GemLoader.new
      gemloader.create_or_update_spec(gem_name)
      gitloader = GitLoader.new
      gitloader.update_or_create_git(gem_name)
      laser_gem = LaserGem.find_by(name: gem_name)
      Ranking.new(laser_gem).total_rank_calc
      Ranking.new(laser_gem).download_rank_string_calc
      Ranking.new(laser_gem).download_rank_percent_calc
    end
  end
end