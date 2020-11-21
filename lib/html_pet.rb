require 'nokogiri'

class NewHtml
  def new_html(content, bypass_html, file_name = 'index.html')  
    markup = content.gsub!(/[<>]/, '') if bypass_html == false
    markup = content unless bypass_html == false

    f = File.new("#{Dir.pwd}/#{file_name}", "w+")
    f.puts "<!DOCTYPE html>"
    f.puts "  <head>"
    f.puts "    <meta charset='utf-8'>"
    f.puts "    <title>Tamagotchi</title>"
    f.puts "  </head>"
    f.puts "  <body>"
    f.puts "    <script>"
    f.puts "      setInterval(()=>{ window.location.reload() }, 3000)"
    f.puts "    </script>"
    f.puts "    #{markup}"
    f.puts "  </body>"
    f.puts "</html>"
    f.close
  end

  def update_html(content, file_name = 'index.html')
    doc = File.open(file_name) { |f| Nokogiri::HTML(f) }
    doc.at('body') << content

    file = File.open(file_name, 'w+')
    file.puts doc
    file.close
  end

  def open_in_browser(file = 'index.html')
    system("xdg-open #{Dir.pwd}/#{file}")
  end
end