require 'thread'
require 'rubyweekly_scrapper'
require 'concurrent'

# @issues = RubyweeklyScrapper.scrap_index("https://rubyweekly.com/issues")

# # @array = [] # or use Concurrent:: Array.new
# @array = Concurrent:: Array.new

# # class Mutex; attr_accessor :owner; end

# # mutex Mutex.new

# @mapped = @issues.map do |issue|
#   Thread.new do 
#     RubyweeklyScrapper.scrap_issue(issue.url)
#   end
# end

# @mapped.each { |thread| thread.join }




# # @mapped = Concurrent::Array.new mutex = Mutex.new @issues.map do
# #   Thread.new do
# #     1000.times do |i| # Add user-level synchonization mutex.synchronize do
# #       array << i 
# #     end 
# #   end 
# # end 

# # @mapped.each do |thread| 
# #   thread.join
# # end 

# # puts array.size 42 / 63


# Concurrent::Array.new mutex = Mutex.new 100.times.map { Thread.new { 1000.times { |i| # Add user-level synchonization mutex.synchronize { array << i } } } }.each { |thread| thread.join } puts array.size 42 / 63


# from = Date.new(2016, 1, 1)
# to = Date.today
 
# transactions = Concurrent::Array.new
# threads = Concurrent::Array.new
 
# sliced_array = (from..to).to_a.each_slice(30).to_a

# sliced_array.map do |dates|
#   threads << Thread.new do
#     v = get_transactions(dates.min, dates.max)
#     transactions += v
#   end
# end
 
# threads.each(&:join)


@issues = RubyweeklyScrapper.scrap_index("https://rubyweekly.com/issues")


# from = Date.new(2016, 1, 1)
# to = Date.today
 
transactions = Concurrent::Array.new
threads = Concurrent::Array.new
 
# sliced_array = (from..to).to_a.each_slice(30).to_a
sliced_array = @issues.each_slice(30).to_a

sliced_array.map do |issue|
  threads << Thread.new do
    # v = get_transactions(dates.min, dates.max)
    v = RubyweeklyScrapper.scrap_issue(issue.url)
    transactions += v
  end
end
 
@result = threads.each(&:join)
