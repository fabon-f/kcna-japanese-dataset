require "kcna"
require "json"

since_date = Date.parse(ARGV[1])

def save_path(id)
  File.expand_path("#{id.downcase}.json", File.expand_path(ARGV[0], Dir.pwd))
end

def save_article(kcna, id)
  path = save_path(id)
  if File.exist?(path)
    true
  else
    article = kcna.get_article(id)
    File.write(path, JSON.dump(article.to_h))
    false
  end
end

kcna = KCNA.new

kcna.set_language(KCNA::JA)

index = 0
flag = true

while flag
  articles = kcna.get_article_list(index, to_date: since_date)
  break if articles.empty?

  articles.each do |article|
    puts "#{article.id} #{article.date} #{article.main_title}"
    if save_article(kcna, article.id) && index >= 40
      flag = false
      break
    end
  end

  index += articles.size
  puts index
  sleep 1
end
