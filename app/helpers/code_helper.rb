module CodeHelper

  require 'digest/md5'

  def encrypt(text, salt=nil)
    salt = (('0'..'9').to_a + ('a'..'z').to_a).shuffle[0..7].join if salt == nil
    enc = Digest::MD5.hexdigest(text)
    salt + enc
  end

  def validate(text, encrypted)
    salt = encrypted[0..7]
    encrypt(text, salt) == encrypted
  end

  def get_code(params)
    code = Code.new
    code[:author] = params[:author]
    code[:email] = params[:email]
    code[:page] = params[:page]
    code[:password] = encrypt(params[:password])
    code
  end

  def get_snippet(params, code, version=1)
    snippet = Snippet.new
    snippet[:code_id] = code[:id]
    snippet[:description] = params[:description]
    snippet[:name] = params[:name]
    snippet[:source] = params[:source]
    snippet[:version] = version

    postfix = /[^.]+$/.match(snippet[:name])
    if postfix then
      postfix = postfix[0]
    else
      return Snippet.new
    end
    snippet[:language] = case postfix
    when "py" then "python"
    when "rb" then "ruby"
    when "c" then "c"
    when "cpp", "cc" then "cpp"
    when "yaml" then "yaml"
    when "pl" then "perl"
    when "cs" then "c#"
    when "java" then "java"
    else "text"
    end

    puts "*********   get_snippet   ***************"
    puts snippet[:language]
    puts "*********   get_snippet   *************************"
    snippet
  end

end
