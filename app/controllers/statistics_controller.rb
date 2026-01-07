class StatisticsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @total_problems = Problem.where(visible: true).count
    @solved_problems = Problem.where(visible: true).select { |p| p.submissions.where(correct: true).count > 0 }.count
    @total_submissions = Submission.count
    @correct_submissions = Submission.where(correct: true).count
    
    @category_stats = Problem.where(visible: true).group(:category).count.map do |category, count|
      solves = Submission.joins(:problem).where(problems: { category: category }, correct: true).distinct.count(:problem_id)
      {
        name: category,
        total: count,
        solved: solves,
        percent: count > 0 ? (solves.to_f / count * 100).round(1) : 0
      }
    end

    @top_problems = Problem.where(visible: true).map do |p|
      {
        name: p.name,
        solves: p.submissions.where(correct: true).count
      }
    end.sort_by { |p| -p[:solves] }.first(10)
  end
end
