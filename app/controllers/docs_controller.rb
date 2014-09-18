class DocsController < ApplicationController
  def index
    @text = parse_markdown "#{Rails.root}/doc/#{params[:doc_file]}.md"
  end
end
