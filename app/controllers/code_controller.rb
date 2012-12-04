class CodeController < ApplicationController
  include CodeHelper

  def share
    @code = Code.new
    @snippet = Snippet.new
  end

  def show
    begin 
      @code = Code.find(params[:id])
      @snippet = Snippet.where(:code_id => @code[:id]).last
      @comments = Comment.where(:code_id => @code[:id])
    rescue ActiveRecord::RecordNotFound
    end
  end

  def new
    if params[:code][:password] == "" || params[:code][:password] == nil
      render :action => :share, :code => params[:code], :snippet => params[:snippet]
      return
    end
    @code = get_code(params[:code])
    if @code.save
      @snippet = get_snippet(params[:snippet], @code[:id])
    else
      render :action => :share, :code => params[:code], :snippet => params[:snippet]
      return
    end
    if @snippet.save
      redirect_to "/code/show/#{@code[:id]}"
    else
      render :action => :share, :code => params[:code], :snippet => params[:snippet]
    end
  end

  def versions
    begin
      @code = Code.find(params[:id])
      @snippets = Snippet.where(:code_id => @code[:id])
    rescue ActiveRecord::RecordNotFound
    end
  end

  def show_version
    begin
      @code = Code.find(params[:code_id])
      @snippet = Snippet.where(:code_id => @code[:id], :version => params[:id])[0]
      @comments = Comment.where(:code_id => @code[:id])
    rescue ActiveRecord::RecordNotFound
    end
    render :show
  end

  def edit
    @snippet = Snippet.where(:code_id=>params[:id]).last
  end

  def edit_commit
    pwd = Code.find(params[:snippet][:code_id]).password
    if not validate(params[:code][:password], pwd)
      redirect_to "/code/show/#{params[:snippet][:code_id]}"
      return
    end
    @snippet = Snippet.new
    @snippet = get_snippet(params[:snippet], params[:snippet][:code_id], params[:snippet][:version].to_i + 1)
    @snippet.save
    redirect_to "/code/show/#{@snippet[:code_id]}"
  end

end
