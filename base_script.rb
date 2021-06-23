require 'rubyweekly_scrapper'

@issues = RubyweeklyScrapper.scrap_index("https://rubyweekly.com/issues")

@scrap_issues = @issues.map do |issue|
  RubyweeklyScrapper.scrap_issue(issue.url)
end
