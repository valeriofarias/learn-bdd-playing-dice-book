require 'rubygems'
require 'rdiscount'
require "uv"

desc 'Create HTML files'
task :html => :merge do
  LANGUAGES.each do |language|
    if File.exists?("output/#{language}/full_book.markdown")
      output = File.new("output/#{language}/full_book.markdown").read
      output = RDiscount.new(output).to_html

      File.open("output/#{language}/index.html", 'w') do |f|
        html_template = File.new("layout/pdf_template.#{language}.html").read
        html_template.gsub!("#body", output)
        html_template.gsub! /<pre><code>.*?<\/code><\/pre>/m do |code|
          code = code.gsub('<pre><code>', '').gsub('</code></pre>', '').gsub('&lt;', '<').gsub('&gt;', '>').gsub('&amp;', '&')
          Uv.parse(code, "xhtml", "ruby", false, "mac_classic")
        end
        f.puts html_template
      end
    else
      puts "You haven't made the merge of book's files. Before generate the html or pdf run rake merge_[pt/en]"
    end
  end
end
