module ApplicationHelper

  def show_code(code, language)
    t = CodeRay.scan(code, language).div(:tab_width=>4)
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

end


