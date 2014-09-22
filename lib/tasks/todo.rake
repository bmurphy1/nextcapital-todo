namespace :todo do
  desc 'Generate html API documentation from markdown.'
  task :md_to_html do
    write_html = lambda do |src, target = nil| 
      file = src + '.md'
      html_file = target ? target : src + '.html'
    
      lines = GitHub::Markup.render(file, File.read(file)).split("\n")
    
      lines.each do |line| 
        if line.match(/\/public\/([^\s]+)\.md/)
          line.gsub!(/\/public\//, '')
          line.gsub!(/\.md/, '.html')
        end
      end
    
      html = [
        '<html>',
          '<head>',
            '<link rel="stylesheet" href="/css/github-markdown.css">',
            '<link rel="stylesheet" href="/css/style.css">',
          '</head>',
          '<body>',
            '<div class="markdown-body">',
              lines.join.html_safe,
            '</div>',
          '</body>',
        '</html>'
      ].join('')
    
      File.open(html_file, 'w') { |f| f.write(html) }
    end
    
    write_html.call('README', 'public/index.html')
    ['public/session', 'public/user', 'public/todo' ].each do |f|
      write_html.call(f)
    end
  end
end
