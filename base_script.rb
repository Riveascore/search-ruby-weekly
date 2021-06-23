require 'rubyweekly_scrapper'
require 'concurrent'

@issues = RubyweeklyScrapper.scrap_index("https://rubyweekly.com/issues")
@issues2 = Concurrent::Array.new(@issues)


# @pool = pool || Concurrent::FixedThreadPool.new(20)
# @exceptions = Concurrent::Array.new

# @futures = array.map do | element |
#   Concurrent::Future.execute({ executor: @pool }) do
#     yield(element)
#   end.rescue do | exception |
#     @exceptions << exception
#   end
# end

@issues2 = @issues.map do |issue|
  RubyweeklyScrapper.scrap_issue(issue.url)
end


# @futures = @issues2.map do | issue |
#   Concurrent::Future.execute({ executor: @pool }) do
#     yield(issue)
#   end.rescue do | exception |
#     @exceptions << exception
#   end
# end


