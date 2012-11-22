module ApplicationHelper

  def show_code(code, language)
    t = CodeRay.scan(code, language).div(:tab_width=>4, :line_numbers=>:table)
    t.html_safe
  end

  def markdown(text)
    options = {
      :autolink => true,
      :space_after_headers => true,
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :hard_wrap => true,
      :strikethrough => true
    }
    markdown = Redcarpet::Markdown.new(HtmlWithCodeRay, options)
    markdown.render(text).html_safe
  end

  class HtmlWithCodeRay < Redcarpet::Render::HTML
    def block_code(code, language)
      CodeRay.scan(code, language).div(:tab_width=>2)
    end
  end

  def gravatar_for email, options = {}
    options = {:alt => 'avatar', :class => 'avatar', :size => 80}.merge! options
    id = Digest::MD5::hexdigest email.strip.downcase
    url = 'http://www.gravatar.com/avatar/' + id + '.jpg?s=' + options[:size].to_s
    options.delete :size
    image_tag url, options
end

end


