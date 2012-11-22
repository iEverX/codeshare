class CodeController < ApplicationController
  include CodeHelper

  def share
    @code = Code.new
  end

  def show
    begin 
      @code = Code.find(params[:id])
      @snippet = Snippet.where(:code_id => @code[:id]).last
    rescue ActiveRecord::RecordNotFound
    end
  end

  def new
    if params[:code][:password] != params[:cf][:cf] then
      render :action => :share, :code => params[:code]
      return
    end
    @code = get_code(params[:code])
    if @code.save!
      @snippet = get_snippet(params[:snippet], @code)
    else
      redirect_to "/code/share"
      return
    end
    if @snippet.save!
      redirect_to "/code/show/#{@code[:id]}"
    else
      redirect_to "/code/share"
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
    rescue ActiveRecord::RecordNotFound
    end
    puts "*******************************************" 
    puts params[:code_id]
    puts "*******************************************" 
    render :show
  end

  def edit
  end

  def delete
  end

  def test
    @codes = Code.all
  end

end
