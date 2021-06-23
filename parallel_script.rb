require 'byebug'
require 'pry'
require 'pry-byebug'

require 'thread'
require 'rubyweekly_scrapper'
require 'concurrent'

# Get all weeks
@issues = RubyweeklyScrapper.scrap_index("https://rubyweekly.com/issues")

# Set up concurrent arrays
@scrapped_issues = Concurrent::Array.new
@threads = Concurrent::Array.new
 
# Convert to slices for @threads working on 10 urls at once
sliced_array = @issues.each_slice(10).to_a

sliced_array.map do |array_slice|
  @threads << Thread.new do |;v|
    v = array_slice.map do |issue|
      RubyweeklyScrapper.scrap_issue(issue.url)
    end
    @scrapped_issues += v
  end
end
 
# Call all @threads
@threads.each(&:join)

# Call
# @scrapped_issues.flatten


rspec_issues = @scrapped_issues.flatten.select { |x| x.description.match('rspec') }
