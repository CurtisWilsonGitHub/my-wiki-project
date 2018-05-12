module ApplicationHelper
    def markdown(text)
        @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
        @markdown.render(text)
    end
end
