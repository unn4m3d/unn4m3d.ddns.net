require 'digest/sha2'

module ApplicationHelper
  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
       autolink: true,
       no_intra_emphasis: true,
       fenced_code_blocks: true,
       lax_html_blocks: true,
       strikethrough: true,
       superscript: true,
       space_after_headers: true
   }
   Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  def gen_api_token(name)
    Digest::SHA2.new(512) << name+Time.now.stftime("%c")+Random.rand(0xFFFFFFFFFFFF)
  end
end
