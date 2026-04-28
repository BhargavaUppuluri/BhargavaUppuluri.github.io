# frozen_string_literal: true

# Post-processes generated HTML to replace auto-generated social icon tooltip titles.
SOCIAL_TITLE_REPLACEMENTS = {
  'title="Linkedin username"' => 'title="LinkedIn"',
  'title="Scholar userid"'    => 'title="Google Scholar"',
  'title="Github username"'   => 'title="GitHub"',
  "title='Linkedin username'" => "title='LinkedIn'",
  "title='Scholar userid'"    => "title='Google Scholar'",
  "title='Github username'"   => "title='GitHub'",
}.freeze

Jekyll::Hooks.register :pages, :post_render do |page|
  next unless page.output_ext == '.html'

  SOCIAL_TITLE_REPLACEMENTS.each do |old, replacement|
    page.output = page.output.gsub(old, replacement)
  end
end

Jekyll::Hooks.register :documents, :post_render do |doc|
  next unless doc.output_ext == '.html'

  SOCIAL_TITLE_REPLACEMENTS.each do |old, replacement|
    doc.output = doc.output.gsub(old, replacement)
  end
end
