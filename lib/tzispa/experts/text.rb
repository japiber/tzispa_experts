require 'redcarpet'

module Tzispa
  module Helpers
    module Text

      def mime_formatter(text, mime)
        case mime
        when 'text/x-markdown'
          Redcarpet::Markdown.new(Redcarpet::Render::HTML.new).render(text) if text
        else
          text
        end
      end

    end
  end
end
