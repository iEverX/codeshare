class HomeController < ApplicationController
  def index
    snippets = Snippet.select("code_id, max(id)").order('id desc').group(:code_id).limit(10)
    # snippets = 
    # snippets = ActiveRecord::Base.connection.execute('select distinct(code_id), id from snippets order by id desc limit 10;')

    puts "+++++++++++++", snippets

    @latest = []
    snippets.each do |snippet| 
      @latest.append Snippet.where(:code_id=>snippet[:code_id]).order('id desc').last
    end

    code_comment = Hash.new(0)
    Comment.all.each do |comment|
      code_comment[comment[:code_id]] += 1
    end
    code_comment = code_comment.sort { |x ,y| ((y[1] <=> x[1]) << 1) + (y[0] <=> x[0]) }
    @hottest = []
    code_comment.each { |k, v| @hottest.append([Snippet.where(:code_id=>k).first, v])}
  end

  def list
    # snippets = Snippet.order('created_at desc').select('code_id').uniq
    snippets = Snippet.select("code_id, max(created_at)").order("created_at desc").group(:code_id)

    @codes = []
    snippets.each do |snippet|
      code = []
      code.append(Snippet.where(:code_id=>snippet[:code_id]).last)
      code.append(Code.where(:id=>snippet[:code_id]).first)
      @codes.append(code)
    end

    puts "kkkkkkkkkkkkkkkkkkkkkkkk", @codes, "DDDDDDDDDDDDDDDDDDDDDDDDDDDDd"
    puts @codes[0][0][:description]

  end

  def show
    id = params[:id]
    redirect_to "/code/show/#{id}" if id
  end

  def about
  end
end