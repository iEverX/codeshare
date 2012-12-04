class HomeController < ApplicationController
  def index
    # @latest = Code.order('updated_at desc').limit(10)
    # @latest = Code.order('updated_at desc').limit(10).join()
    # @latest = Code.where(:id=>10).joins(:snippets)
    # @latest = Code.where(:id=>10).joins('JOIN snippets ON snippets.code_id = codes.id')
    # # @snip = Snippet.where(:code_id=>10)
    @latest = Snippet.order('updated_at desc').limit(10)


    snippets = Snippet.order('updated_at desc').select(:code_id).uniq.limit(10)
    @latest = []
    snippets.each do |snippet| 
      @latest.append Snippet.where(:code_id=>snippet[:code_id]).order('id desc').first
    end

    # comments = Comment.where(:code_id=>10).count
    comments = Comment.count(:code_id)

    code_comment = Hash.new(0)
    Comment.all.each do |comment|
      code_comment[comment[:code_id]] += 1
    end
    code_comment = code_comment.sort { |x ,y| ((y[1] <=> x[1]) << 1) + (y[0] <=> x[0]) }
    @hottest = []
    code_comment.each { |k, v| @hottest.append( [Snippet.where(:code_id=>k).first, v] )}

    puts "++++++++++++++++++++++++++++++++"
    code_comment
    puts "++++++++++++++++++++++++++++++++"

  end

  def show
    id = params[:id]
    redirect_to "/code/show/#{id}" if id
  end

  def about
  end
end